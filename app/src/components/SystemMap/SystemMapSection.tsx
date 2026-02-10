"use client";

import { useState, useEffect, useRef } from "react";
import { createPortal } from "react-dom";
import { SystemMapCard } from "./SystemMapCard";
import { SystemMapSkeleton } from "./SystemMapSkeleton";
import { GeneratingCardSkeleton } from "./GeneratingCardSkeleton";
import { EditChallengeModal } from "./EditChallengeModal";
import { DeleteChallengeModal } from "./DeleteChallengeModal";
import { AddChallengeModal } from "./AddChallengeModal";
import { useToast } from "../Toast";
import type { Challenge, ChallengeColor, SystemMapState } from "./types";

type SystemMapSectionProps = {
  onConfirm?: () => void;
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

// Simulated AI-generated challenge content
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

// Sample challenge data
const SAMPLE_CHALLENGES: Challenge[] = [
  {
    id: "1",
    number: 1,
    title: "Algorithmic amplification of emotionally charged content",
    description:
      "Platform algorithms disproportionately surface content that triggers strong emotional responses, making extremist messaging more visible to vulnerable youth who are seeking validation and identity.",
    color: "teal",
  },
  {
    id: "2",
    number: 2,
    title: "Identity repair through group belonging",
    description:
      "Young men experiencing loneliness, rejection, or economic frustration find community in manosphere spaces that reframe personal grievances as collective male struggles against societal change.",
    color: "cyan",
  },
  {
    id: "3",
    number: 3,
    title: "Erosion of trust in mainstream institutions",
    description:
      "Distrust of traditional media, educational institutions, and government creates an information vacuum that is filled by alternative influencers who position themselves as truth-tellers.",
    color: "blue",
  },
  {
    id: "4",
    number: 4,
    title: "Gamification of misogynistic engagement",
    description:
      "Manosphere communities use gamified elements like ranking systems, achievement badges, and competitive dynamics to encourage deeper engagement with harmful ideologies.",
    color: "indigo",
  },
  {
    id: "5",
    number: 5,
    title: "Economic anxiety as a radicalisation gateway",
    description:
      "Financial instability and perceived lack of opportunity create fertile ground for recruitment, as groups offer both material support and a sense of purpose to struggling young men.",
    color: "violet",
  },
  {
    id: "6",
    number: 6,
    title: "Peer pressure and social proof dynamics",
    description:
      "The visibility of peers engaging with manosphere content creates normalisation effects, where harmful views become seen as common and acceptable within social circles.",
    color: "amber",
  },
  {
    id: "7",
    number: 7,
    title: "Absence of compelling counter-narratives",
    description:
      "Current counter-messaging efforts lack the emotional resonance and production quality of manosphere content, failing to compete for attention in the same digital spaces.",
    color: "rose",
  },
  {
    id: "8",
    number: 8,
    title: "Cross-platform recruitment funnels",
    description:
      "Recruitment operates across multiple platforms, with initial contact on mainstream sites like TikTok and YouTube funnelling users to more extreme content on encrypted or less-moderated platforms.",
    color: "emerald",
  },
];

const LOADING_DELAY_MS = 2000;

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
  onConfirm,
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

  // Simulate loading
  useEffect(() => {
    const timer = setTimeout(() => {
      setChallenges(SAMPLE_CHALLENGES);
      setMapState("loaded");
    }, LOADING_DELAY_MS);

    return () => clearTimeout(timer);
  }, []);

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

  // AI generation progress simulation
  useEffect(() => {
    if (!generatingCard) return;

    const startTime = Date.now();
    const interval = setInterval(() => {
      const elapsed = Date.now() - startTime;
      const progress = Math.min(Math.round((elapsed / GENERATION_DURATION_MS) * 100), 100);

      setGeneratingCard((prev) => prev ? { ...prev, progress } : null);

      if (progress >= 100) {
        clearInterval(interval);

        // Pick AI content
        const aiContent = AI_CHALLENGES[aiCounterRef.current % AI_CHALLENGES.length];
        aiCounterRef.current += 1;

        // Replace skeleton with real challenge
        const newChallenge: Challenge = {
          id: generatingCard.id,
          number: generatingCard.number,
          title: aiContent.title,
          description: aiContent.description,
          color: generatingCard.color,
        };

        setChallenges((prev) => [...prev, newChallenge]);
        setGeneratingCard(null);
        showToast("Challenge saved successfully");
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

  const handleSelectEntryPoint = (id: string) => {
    if (isConfirmed) return;
    setSelectedEntryPoint(id === selectedEntryPoint ? null : id);
  };

  const handleConfirm = () => {
    if (!selectedEntryPoint) return;
    setIsConfirmed(true);
    onConfirm?.();
  };

  // Edit handlers
  const handleEditSave = (updatedChallenge: Challenge) => {
    setChallenges((prev) =>
      prev.map((c) => (c.id === updatedChallenge.id ? updatedChallenge : c))
    );
    showToast("Challenge saved successfully");
  };

  // Delete handlers
  const handleDeleteConfirm = () => {
    if (!deletingChallenge) return;

    // If the deleted challenge was the selected entry point, clear selection
    if (selectedEntryPoint === deletingChallenge.id) {
      setSelectedEntryPoint(null);
    }

    // Remove the challenge and re-number remaining ones sequentially
    setChallenges((prev) => {
      const filtered = prev.filter((c) => c.id !== deletingChallenge.id);
      return filtered.map((c, index) => ({
        ...c,
        number: index + 1,
      }));
    });

    showToast("Challenge deleted successfully");
  };

  // Manual add handler
  const handleManualAdd = (title: string, description: string) => {
    const nextNumber = challenges.length + (generatingCard ? 2 : 1);
    const newChallenge: Challenge = {
      id: `manual-${Date.now()}`,
      number: nextNumber,
      title,
      description,
      color: getColorForIndex(nextNumber - 1),
    };
    setChallenges((prev) => [...prev, newChallenge]);
    showToast("Challenge saved successfully");
  };

  // AI generation handler
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
