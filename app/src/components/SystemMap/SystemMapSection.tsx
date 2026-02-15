"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { createPortal } from "react-dom";
import { SystemMapCard } from "./SystemMapCard";
import { SystemMapSkeleton } from "./SystemMapSkeleton";
import { GeneratingCardSkeleton } from "./GeneratingCardSkeleton";
import { EditChallengeModal } from "./EditChallengeModal";
import { DeleteChallengeModal } from "./DeleteChallengeModal";
import { AddChallengeModal } from "./AddChallengeModal";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPatch, apiDelete } from "@/lib/api";
import { xanoChallengeToFrontend, frontendChallengeToXanoCreate, frontendChallengeToXanoPatch } from "@/lib/transforms/systemMap";
import type { XanoSystemMapChallenge } from "@/lib/types/systemMap";
import type { Intervention } from "@/lib/types/intervention";
import type { Challenge, ChallengeColor, SystemMapState } from "./types";

type SystemMapSectionProps = {
  interventionId: number;
  onConfirm?: (entryPoint: { number: number; title: string }) => void;
  onLoadConfirmed?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
};

// Icons
const ChevronIcon = ({ isExpanded }: { isExpanded: boolean }) => (
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    className={`transition-transform ${isExpanded ? "" : "-rotate-90"}`}
  >
    <path
      d="M4 6l4 4 4-4"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const PlusIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 3v10M3 8h10"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

const PenIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M11.5 1.5L14.5 4.5M1 15L1.5 11.5L12 1L15 4L4.5 14.5L1 15Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const SparkleIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 1L9.5 6.5L15 8L9.5 9.5L8 15L6.5 9.5L1 8L6.5 6.5L8 1Z"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const GreenCheckIcon = () => (
  <span className="flex items-center justify-center w-5 h-5 rounded-full bg-[#2b8652]">
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
      <path
        d="M3 6l2 2 4-4"
        stroke="white"
        strokeWidth="1.5"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  </span>
);

const LoadingSpinner = () => (
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    className="animate-spin"
  >
    <circle
      cx="8"
      cy="8"
      r="6"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeDasharray="28"
      strokeDashoffset="8"
    />
  </svg>
);

// Color palette for challenge badges
const COLORS: ChallengeColor[] = [
  "teal", "cyan", "blue", "indigo", "violet", "amber", "rose", "emerald",
];

function getColorForIndex(index: number): ChallengeColor {
  return COLORS[index % COLORS.length];
}

// Simulated AI-generated challenge content (mock — N8N integration is future)
const AI_CHALLENGES = [
  {
    title: "Digital literacy gaps in vulnerable populations",
    description:
      "Lack of critical media literacy skills among young people makes them more susceptible to manipulative content, as they struggle to distinguish between genuine information and strategically crafted propaganda.",
  },
  {
    title: "Monetisation of outrage and division",
    description:
      "Content creators and influencers profit from engagement-driven algorithms that reward provocative and divisive content, creating financial incentives to produce increasingly extreme material.",
  },
  {
    title: "Social isolation as a vulnerability factor",
    description:
      "Increasing rates of social disconnection among young men create a ready audience for online communities that promise belonging, purpose, and a framework for understanding their frustrations.",
  },
];

// Generation simulation timing
const GENERATION_DURATION_MS = 4000;
const PROGRESS_INTERVAL_MS = 100;

type GeneratingCard = {
  id: string;
  number: number;
  color: ChallengeColor;
  progress: number;
};

export function SystemMapSection({
  interventionId,
  onConfirm,
  onLoadConfirmed,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: SystemMapSectionProps) {
  // Local state for uncontrolled mode
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  // Data state
  const [mapState, setMapState] = useState<SystemMapState>("loading");
  const [challenges, setChallenges] = useState<Challenge[]>([]);
  const [selectedEntryPoint, setSelectedEntryPoint] = useState<string | null>(null);
  const [showDescriptions, setShowDescriptions] = useState(false);
  const [isConfirmed, setIsConfirmed] = useState(false);

  // Edit/Delete modal state
  const [editingChallenge, setEditingChallenge] = useState<Challenge | null>(null);
  const [deletingChallenge, setDeletingChallenge] = useState<Challenge | null>(null);

  // Add more state
  const [isAddMenuOpen, setIsAddMenuOpen] = useState(false);
  const [showAddModal, setShowAddModal] = useState(false);
  const [generatingCard, setGeneratingCard] = useState<GeneratingCard | null>(null);
  const addMenuRef = useRef<HTMLDivElement>(null);
  const aiCounterRef = useRef(0);

  const { showToast } = useToast();

  // Fetch challenges from API on mount
  const fetchChallenges = useCallback(async () => {
    try {
      setMapState("loading");
      const response = await apiGet<XanoSystemMapChallenge[]>(
        `/api/interventions/${interventionId}/system-map`
      );

      if (response && Array.isArray(response)) {
        const transformed = response.map((item, index) =>
          xanoChallengeToFrontend(item, index)
        );
        setChallenges(transformed);

        // Check if any is already selected
        const selected = response.find((item) => item.is_selected);
        if (selected) {
          setSelectedEntryPoint(selected.id);
        }
      } else {
        setChallenges([]);
      }
    } catch {
      setChallenges([]);
    } finally {
      setMapState("loaded");
    }
  }, [interventionId]);

  // Check confirmation state via intervention current_step
  const checkConfirmation = useCallback(async () => {
    try {
      const interventionData = await apiGet<Intervention>(
        `/api/interventions/${interventionId}`
      );
      // System Map is workflow step 3; after confirm, current_step becomes 4+
      if (interventionData && interventionData.current_step >= 4) {
        setIsConfirmed(true);
        onLoadConfirmed?.();
      }
    } catch {
      // Could not check — leave unconfirmed
    }
  }, [interventionId, onLoadConfirmed]);

  useEffect(() => {
    fetchChallenges();
    checkConfirmation();
  }, [fetchChallenges, checkConfirmation]);

  // Close add menu on click outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (addMenuRef.current && !addMenuRef.current.contains(event.target as Node)) {
        setIsAddMenuOpen(false);
      }
    };

    if (isAddMenuOpen) {
      document.addEventListener("mousedown", handleClickOutside);
    }

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [isAddMenuOpen]);

  // AI generation progress simulation (mock — N8N integration is future)
  useEffect(() => {
    if (!generatingCard) return;

    const startTime = Date.now();
    const interval = setInterval(() => {
      const elapsed = Date.now() - startTime;
      const progress = Math.min(Math.round((elapsed / GENERATION_DURATION_MS) * 100), 100);

      setGeneratingCard((prev) => prev ? { ...prev, progress } : null);

      if (progress >= 100) {
        clearInterval(interval);

        // Pick AI content and save to Xano
        const aiContent = AI_CHALLENGES[aiCounterRef.current % AI_CHALLENGES.length];
        aiCounterRef.current += 1;

        (async () => {
          try {
            await apiPost(
              `/api/interventions/${interventionId}/system-map`,
              frontendChallengeToXanoCreate(
                { title: aiContent.title, description: aiContent.description },
                interventionId
              )
            );
            await fetchChallenges();
            showToast("Challenge saved successfully");
          } catch {
            showToast("Failed to save generated challenge", "error");
          } finally {
            setGeneratingCard(null);
          }
        })();
      }
    }, PROGRESS_INTERVAL_MS);

    return () => clearInterval(interval);
  }, [generatingCard?.id]); // eslint-disable-line react-hooks/exhaustive-deps

  const handleToggle = () => {
    if (onToggleExpand) {
      onToggleExpand();
    } else {
      setLocalExpanded(!localExpanded);
    }
  };

  const handleSelectEntryPoint = async (id: string) => {
    if (isConfirmed) return;

    // Optimistic update
    const previousSelection = selectedEntryPoint;
    setSelectedEntryPoint(id === selectedEntryPoint ? null : id);

    if (id !== selectedEntryPoint) {
      // Selecting a new entry point
      try {
        await apiPost(
          `/api/interventions/${interventionId}/system-map/${id}/select`,
          {}
        );
      } catch {
        // Revert on error
        setSelectedEntryPoint(previousSelection);
        showToast("Failed to select entry point", "error");
      }
    }
  };

  const handleConfirm = async () => {
    if (!selectedEntryPoint) return;

    try {
      await apiPost(
        `/api/interventions/${interventionId}/system-map/confirm`,
        { intervention_id: interventionId }
      );
      setIsConfirmed(true);
      showToast("System Map confirmed");
      const selected = challenges.find((c) => c.id === selectedEntryPoint);
      if (selected) {
        onConfirm?.({ number: selected.number, title: selected.title });
      }
    } catch {
      showToast("Failed to confirm system map", "error");
    }
  };

  // Edit handlers
  const handleEditSave = async (updatedChallenge: Challenge) => {
    // Optimistic update
    setChallenges((prev) =>
      prev.map((c) => (c.id === updatedChallenge.id ? updatedChallenge : c))
    );

    try {
      const patchBody = frontendChallengeToXanoPatch({
        title: updatedChallenge.title,
        description: updatedChallenge.description,
      });

      await apiPatch(
        `/api/interventions/${interventionId}/system-map/${updatedChallenge.id}`,
        patchBody
      );
      showToast("Challenge saved successfully");
    } catch {
      showToast("Failed to save challenge", "error");
      fetchChallenges();
    }
  };

  // Delete handlers
  const handleDeleteConfirm = async () => {
    if (!deletingChallenge) return;

    // If the deleted challenge was the selected entry point, clear selection
    if (selectedEntryPoint === deletingChallenge.id) {
      setSelectedEntryPoint(null);
    }

    // Optimistic update: remove and re-number
    const deletingId = deletingChallenge.id;
    setChallenges((prev) => {
      const filtered = prev.filter((c) => c.id !== deletingId);
      return filtered.map((c, index) => ({
        ...c,
        number: index + 1,
      }));
    });

    try {
      await apiDelete(
        `/api/interventions/${interventionId}/system-map/${deletingId}`
      );
      showToast("Challenge deleted successfully");
    } catch {
      showToast("Failed to delete challenge", "error");
      fetchChallenges();
    }
  };

  // Manual add handler
  const handleManualAdd = async (title: string, description: string) => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/system-map`,
        frontendChallengeToXanoCreate({ title, description }, interventionId)
      );
      await fetchChallenges();
      showToast("Challenge saved successfully");
    } catch {
      showToast("Failed to add challenge", "error");
    }
  };

  // AI generation handler (mock — N8N integration is future)
  const handleGenerateByKora = () => {
    setIsAddMenuOpen(false);
    const nextNumber = challenges.length + 1;
    const newCard: GeneratingCard = {
      id: `ai-${Date.now()}`,
      number: nextNumber,
      color: getColorForIndex(nextNumber - 1),
      progress: 0,
    };
    setGeneratingCard(newCard);
  };

  const isLoaded = mapState === "loaded";

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className={`flex items-center justify-between ${isExpanded ? "mb-4" : ""}`}>
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">System Map</span>
          {isConfirmed && <GreenCheckIcon />}
        </button>

        {/* Confirm button - hidden when confirmed */}
        {isLoaded && !isConfirmed && (
          <button
            onClick={handleConfirm}
            disabled={!selectedEntryPoint}
            className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
              selectedEntryPoint
                ? "text-text-inverse bg-button-solid hover:opacity-90"
                : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
            }`}
          >
            Confirm Entry Point
          </button>
        )}
      </div>

      {isExpanded && (
        <>
          {/* Subheader with toggle - hidden when confirmed */}
          {isLoaded && !isConfirmed && (
            <div className="flex items-center justify-between mb-4">
              <div>
                <h3 className="text-sm font-semibold text-text-primary">
                  Refined challenges
                </h3>
                <p className="text-xs text-text-secondary mt-0.5">
                  Select one as entry point
                </p>
              </div>

              {/* Show Description toggle */}
              <label className="flex items-center gap-2 cursor-pointer select-none">
                <span className="text-xs font-medium text-text-secondary">
                  Show Description
                </span>
                <button
                  role="switch"
                  aria-checked={showDescriptions}
                  onClick={() => setShowDescriptions(!showDescriptions)}
                  className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors ${
                    showDescriptions ? "bg-button-solid" : "bg-stroke-default"
                  }`}
                >
                  <span
                    className={`inline-block h-3.5 w-3.5 transform rounded-full bg-white transition-transform ${
                      showDescriptions ? "translate-x-4" : "translate-x-0.5"
                    }`}
                  />
                </button>
              </label>
            </div>
          )}

          {/* Content */}
          {!isLoaded ? (
            <SystemMapSkeleton />
          ) : (
            <>
              {/* Challenge cards grid */}
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
                {challenges.map((challenge) => (
                  <SystemMapCard
                    key={challenge.id}
                    challenge={challenge}
                    isEntryPoint={selectedEntryPoint === challenge.id}
                    onSelectEntryPoint={handleSelectEntryPoint}
                    showDescription={showDescriptions}
                    isConfirmed={isConfirmed}
                    onEdit={() => setEditingChallenge(challenge)}
                    onDelete={() => setDeletingChallenge(challenge)}
                  />
                ))}

                {/* AI generating skeleton card */}
                {generatingCard && (
                  <GeneratingCardSkeleton
                    number={generatingCard.number}
                    color={generatingCard.color}
                  />
                )}
              </div>

              {/* + Add more card with dropdown - hidden when confirmed */}
              {!isConfirmed && (
                <div className="relative mt-4" ref={addMenuRef}>
                  <button
                    className="w-full flex items-center justify-center gap-2 py-4 border-2 border-dashed border-stroke-default rounded-[var(--radius-lg)] text-sm font-medium text-text-secondary hover:border-text-tertiary hover:text-text-primary transition-colors cursor-pointer"
                    onClick={() => setIsAddMenuOpen(!isAddMenuOpen)}
                    disabled={!!generatingCard}
                  >
                    <PlusIcon />
                    Add more
                  </button>

                  {/* Dropdown menu */}
                  {isAddMenuOpen && (
                    <div className="absolute left-1/2 -translate-x-1/2 bottom-full mb-2 w-56 bg-white border border-stroke-default rounded-lg shadow-lg z-10 overflow-hidden">
                      <button
                        onClick={() => {
                          setIsAddMenuOpen(false);
                          setShowAddModal(true);
                        }}
                        className="flex items-center gap-3 w-full px-4 py-3 text-sm font-medium text-text-primary hover:bg-gray-50 transition-colors text-left"
                      >
                        <PenIcon />
                        Fill manually
                      </button>
                      <button
                        onClick={handleGenerateByKora}
                        className="flex items-center gap-3 w-full px-4 py-3 text-sm font-medium text-text-primary hover:bg-gray-50 transition-colors text-left"
                      >
                        <SparkleIcon />
                        Generated by Kora
                      </button>
                    </div>
                  )}
                </div>
              )}
            </>
          )}
        </>
      )}

      {/* Progress bar portal for AI generation */}
      {generatingCard && typeof window !== "undefined" &&
        createPortal(
          <div className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 flex items-center gap-3 bg-white border border-stroke-default rounded-xl shadow-lg px-5 py-3 min-w-[320px]">
            <LoadingSpinner />
            <div className="flex-1">
              <div className="flex items-center justify-between mb-1">
                <span className="text-sm font-medium text-text-primary">
                  Generating Challenge
                </span>
                <span className="text-xs font-medium text-text-secondary">
                  {generatingCard.progress}%
                </span>
              </div>
              <div className="w-full h-1.5 bg-stroke-soft rounded-full overflow-hidden">
                <div
                  className="h-full bg-button-solid rounded-full transition-all duration-100"
                  style={{ width: `${generatingCard.progress}%` }}
                />
              </div>
            </div>
          </div>,
          document.body
        )}

      {/* Edit Challenge Modal */}
      <EditChallengeModal
        isOpen={editingChallenge !== null}
        onClose={() => setEditingChallenge(null)}
        challenge={editingChallenge}
        onSave={handleEditSave}
      />

      {/* Delete Challenge Modal */}
      <DeleteChallengeModal
        isOpen={deletingChallenge !== null}
        onClose={() => setDeletingChallenge(null)}
        onDelete={handleDeleteConfirm}
      />

      {/* Add Challenge Modal */}
      <AddChallengeModal
        isOpen={showAddModal}
        onClose={() => setShowAddModal(false)}
        onAdd={handleManualAdd}
      />
    </div>
  );
}
