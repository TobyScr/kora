"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { createPortal } from "react-dom";
import { BehaviouralObjectiveCard } from "./BehaviouralObjectiveCard";
import { BehaviouralObjectiveSkeleton } from "./BehaviouralObjectiveSkeleton";
import { GeneratingObjectiveSkeleton } from "./GeneratingObjectiveSkeleton";
import { EditObjectiveModal } from "./EditObjectiveModal";
import { DeleteObjectiveModal } from "./DeleteObjectiveModal";
import { AddObjectiveModal } from "./AddObjectiveModal";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPatch, apiDelete } from "@/lib/api";
import { xanoObjectiveToFrontend, frontendObjectiveToXanoCreate, frontendObjectiveToXanoPatch } from "@/lib/transforms/behaviouralObjective";
import type { XanoBehaviouralObjective } from "@/lib/types/behaviouralObjective";
import type { Intervention } from "@/lib/types/intervention";
import type { Objective, ObjectiveColor, BehaviouralObjectiveState } from "./types";

type SelectedChallenge = {
  number: number;
  title: string;
};

type BehaviouralObjectiveSectionProps = {
  interventionId: number;
  onConfirm?: () => void;
  onLoadConfirmed?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
  selectedChallenge?: SelectedChallenge | null;
  onViewEntryPoint?: () => void;
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

// Color palette for objective badges
const COLORS: ObjectiveColor[] = [
  "teal", "cyan", "blue", "indigo", "violet", "amber", "rose", "emerald",
];

function getColorForIndex(index: number): ObjectiveColor {
  return COLORS[index % COLORS.length];
}

// Simulated AI-generated objectives (mock — N8N integration is future)
const AI_OBJECTIVES = [
  "Strengthen peer reporting of harmful recruitment content by bystanders in online gaming and social media spaces",
  "Increase participation in constructive online communities among young men who are at risk of radicalisation through digital platforms",
  "Build resilience against algorithmic manipulation among vulnerable youth by promoting awareness of engagement-driven content tactics",
];

const GENERATION_DURATION_MS = 4000;
const PROGRESS_INTERVAL_MS = 100;

type GeneratingCard = {
  id: string;
  number: number;
  color: ObjectiveColor;
  progress: number;
};

export function BehaviouralObjectiveSection({
  interventionId,
  onConfirm,
  onLoadConfirmed,
  isExpanded: controlledExpanded,
  onToggleExpand,
  selectedChallenge,
  onViewEntryPoint,
}: BehaviouralObjectiveSectionProps) {
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  // Data state
  const [sectionState, setSectionState] = useState<BehaviouralObjectiveState>("loading");
  const [objectives, setObjectives] = useState<Objective[]>([]);
  const [selectedObjective, setSelectedObjective] = useState<string | null>(null);
  const [isConfirmed, setIsConfirmed] = useState(false);

  // Edit/Delete modal state
  const [editingObjective, setEditingObjective] = useState<Objective | null>(null);
  const [deletingObjective, setDeletingObjective] = useState<Objective | null>(null);

  // Add more state
  const [isAddMenuOpen, setIsAddMenuOpen] = useState(false);
  const [showAddModal, setShowAddModal] = useState(false);
  const [generatingCard, setGeneratingCard] = useState<GeneratingCard | null>(null);
  const addMenuRef = useRef<HTMLDivElement>(null);
  const aiCounterRef = useRef(0);

  const { showToast } = useToast();

  // Fetch objectives from API on mount
  const fetchObjectives = useCallback(async () => {
    try {
      setSectionState("loading");
      const response = await apiGet<XanoBehaviouralObjective[]>(
        `/api/interventions/${interventionId}/behavioural-objective`
      );

      if (response && Array.isArray(response)) {
        const transformed = response.map((item, index) =>
          xanoObjectiveToFrontend(item, index)
        );
        setObjectives(transformed);

        // Check if any is already selected
        const selected = response.find((item) => item.is_selected);
        if (selected) {
          setSelectedObjective(selected.id);
        }
      } else {
        setObjectives([]);
      }
    } catch {
      setObjectives([]);
    } finally {
      setSectionState("loaded");
    }
  }, [interventionId]);

  // Check confirmation state via intervention current_step
  const checkConfirmation = useCallback(async () => {
    try {
      const interventionData = await apiGet<Intervention>(
        `/api/interventions/${interventionId}`
      );
      // Behavioural Objective is workflow step 4; after confirm, current_step becomes 5+
      if (interventionData && interventionData.current_step >= 5) {
        setIsConfirmed(true);
        onLoadConfirmed?.();
      }
    } catch {
      // Could not check — leave unconfirmed
    }
  }, [interventionId, onLoadConfirmed]);

  useEffect(() => {
    fetchObjectives();
    checkConfirmation();
  }, [fetchObjectives, checkConfirmation]);

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

        const aiContent = AI_OBJECTIVES[aiCounterRef.current % AI_OBJECTIVES.length];
        aiCounterRef.current += 1;

        (async () => {
          try {
            await apiPost(
              `/api/interventions/${interventionId}/behavioural-objective`,
              frontendObjectiveToXanoCreate({ title: aiContent }, interventionId)
            );
            await fetchObjectives();
            showToast("Objective saved successfully");
          } catch {
            showToast("Failed to save generated objective", "error");
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

  const handleSelect = async (id: string) => {
    if (isConfirmed) return;

    const previousSelection = selectedObjective;
    setSelectedObjective(id === selectedObjective ? null : id);

    if (id !== selectedObjective) {
      try {
        await apiPost(
          `/api/interventions/${interventionId}/behavioural-objective/${id}/select`,
          {}
        );
      } catch {
        setSelectedObjective(previousSelection);
        showToast("Failed to select objective", "error");
      }
    }
  };

  const handleConfirm = async () => {
    if (!selectedObjective) return;

    try {
      await apiPost(
        `/api/interventions/${interventionId}/behavioural-objective/confirm`,
        { intervention_id: interventionId }
      );
      setIsConfirmed(true);
      showToast("Behavioural Objective confirmed successfully");
      onConfirm?.();
    } catch {
      showToast("Failed to confirm behavioural objective", "error");
    }
  };

  // Edit handlers
  const handleEditSave = async (updatedObjective: Objective) => {
    // Optimistic update
    setObjectives((prev) =>
      prev.map((o) => (o.id === updatedObjective.id ? updatedObjective : o))
    );

    try {
      const patchBody = frontendObjectiveToXanoPatch({
        title: updatedObjective.title,
      });

      await apiPatch(
        `/api/interventions/${interventionId}/behavioural-objective/${updatedObjective.id}`,
        patchBody
      );
      showToast("Objective saved successfully");
    } catch {
      showToast("Failed to save objective", "error");
      fetchObjectives();
    }
  };

  // Delete handlers
  const handleDeleteConfirm = async () => {
    if (!deletingObjective) return;

    if (selectedObjective === deletingObjective.id) {
      setSelectedObjective(null);
    }

    const deletingId = deletingObjective.id;
    setObjectives((prev) => {
      const filtered = prev.filter((o) => o.id !== deletingId);
      return filtered.map((o, index) => ({
        ...o,
        number: index + 1,
      }));
    });

    try {
      await apiDelete(
        `/api/interventions/${interventionId}/behavioural-objective/${deletingId}`
      );
      showToast("Objective deleted successfully");
    } catch {
      showToast("Failed to delete objective", "error");
      fetchObjectives();
    }
  };

  // Manual add handler
  const handleManualAdd = async (title: string) => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/behavioural-objective`,
        frontendObjectiveToXanoCreate({ title }, interventionId)
      );
      await fetchObjectives();
      showToast("Objective saved successfully");
    } catch {
      showToast("Failed to add objective", "error");
    }
  };

  // AI generation handler (mock — N8N integration is future)
  const handleGenerateByKora = () => {
    setIsAddMenuOpen(false);
    const nextNumber = objectives.length + 1;
    const newCard: GeneratingCard = {
      id: `ai-${Date.now()}`,
      number: nextNumber,
      color: getColorForIndex(nextNumber - 1),
      progress: 0,
    };
    setGeneratingCard(newCard);
  };

  const isLoaded = sectionState === "loaded";

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className={`flex items-center justify-between ${isExpanded ? "mb-4" : ""}`}>
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">Behavioural Objective</span>
          {isConfirmed && <GreenCheckIcon />}
        </button>

        {isLoaded && !isConfirmed && (
          <button
            onClick={handleConfirm}
            disabled={!selectedObjective}
            className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
              selectedObjective
                ? "text-text-inverse bg-button-solid hover:opacity-90"
                : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
            }`}
          >
            Confirm Behavioral Objective
          </button>
        )}
      </div>

      {isExpanded && (
        <>
          {/* Selected Challenge display */}
          {selectedChallenge && (
            <div className="flex items-center justify-between bg-background-surface border border-stroke-default rounded-[var(--radius-lg)] px-4 py-3 mb-4">
              <div className="flex items-center gap-2 min-w-0">
                <span className="text-sm font-medium text-text-secondary shrink-0">
                  Selected Challenge:
                </span>
                <span className="text-sm font-medium text-text-primary truncate">
                  {selectedChallenge.number}. {selectedChallenge.title}
                </span>
              </div>
              {onViewEntryPoint && (
                <button
                  onClick={onViewEntryPoint}
                  className="text-sm font-medium text-button-solid hover:underline shrink-0 ml-3"
                >
                  View
                </button>
              )}
            </div>
          )}

          {/* Subheader - hidden when confirmed */}
          {isLoaded && !isConfirmed && (
            <div className="mb-4">
              <h3 className="text-sm font-semibold text-text-primary">
                Behavioral Objectives Options
              </h3>
              <p className="text-xs text-text-secondary mt-0.5">
                Choose One
              </p>
            </div>
          )}

          {/* Content */}
          {!isLoaded ? (
            <BehaviouralObjectiveSkeleton />
          ) : (
            <>
              {/* Objective cards grid */}
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
                {objectives.map((objective) => (
                  <BehaviouralObjectiveCard
                    key={objective.id}
                    objective={objective}
                    isSelected={selectedObjective === objective.id}
                    onSelect={handleSelect}
                    isConfirmed={isConfirmed}
                    onEdit={() => setEditingObjective(objective)}
                    onDelete={() => setDeletingObjective(objective)}
                  />
                ))}

                {/* AI generating skeleton card */}
                {generatingCard && (
                  <GeneratingObjectiveSkeleton
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
                  Generating Objective
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

      {/* Edit Objective Modal */}
      <EditObjectiveModal
        isOpen={editingObjective !== null}
        onClose={() => setEditingObjective(null)}
        objective={editingObjective}
        onSave={handleEditSave}
      />

      {/* Delete Objective Modal */}
      <DeleteObjectiveModal
        isOpen={deletingObjective !== null}
        onClose={() => setDeletingObjective(null)}
        onDelete={handleDeleteConfirm}
      />

      {/* Add Objective Modal */}
      <AddObjectiveModal
        isOpen={showAddModal}
        onClose={() => setShowAddModal(false)}
        onAdd={handleManualAdd}
      />
    </div>
  );
}
