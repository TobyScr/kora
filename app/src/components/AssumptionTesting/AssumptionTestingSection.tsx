"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { createPortal } from "react-dom";
import { TabBar } from "../TabBar/TabBar";
import { AssumptionCard } from "./AssumptionCard";
import { AssumptionTestingSkeleton } from "./AssumptionTestingSkeleton";
import { GeneratingAssumptionSkeleton } from "./GeneratingAssumptionSkeleton";
import { EditAssumptionModal } from "./EditAssumptionModal";
import { DeleteAssumptionModal } from "./DeleteAssumptionModal";
import { AddAssumptionModal } from "./AddAssumptionModal";
import { ResearchQuestionsTab } from "./ResearchQuestionsTab";
import { FileUploadZone } from "./FileUploadZone";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPatch, apiDelete } from "@/lib/api";
import {
  xanoAssumptionToFrontend,
  frontendAssumptionToXanoCreate,
  frontendAssumptionToXanoPatch,
  xanoQuestionToFrontend,
  frontendQuestionToXanoCreate,
  frontendQuestionToXanoPatch,
  xanoFileToFrontend,
} from "@/lib/transforms/assumptionTesting";
import type { XanoAssumption, XanoResearchQuestion, XanoFindingsResponse } from "@/lib/types/assumptionTesting";
import type { Intervention } from "@/lib/types/intervention";
import type { Assumption, AssumptionColor, ResearchQuestion, UploadedFile, AssumptionTestingState } from "./types";
import { COLORS, getColorForIndex, AI_ASSUMPTIONS, SAMPLE_ASSUMPTIONS, SAMPLE_RESEARCH_QUESTIONS, AI_RESEARCH_QUESTIONS } from "./data";

type AssumptionTestingSectionProps = {
  interventionId: number;
  onConfirm?: () => void;
  onLoadConfirmed?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
};

type ActiveTab = "assumptions" | "research-questions" | "findings";

const TABS = [
  { id: "assumptions", label: "Assumptions" },
  { id: "research-questions", label: "Research Questions" },
  { id: "findings", label: "Findings" },
];

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
    <path d="M8 3v10M3 8h10" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
  </svg>
);

const PenIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path d="M11.5 1.5L14.5 4.5M1 15L1.5 11.5L12 1L15 4L4.5 14.5L1 15Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const SparkleIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path d="M8 1L9.5 6.5L15 8L9.5 9.5L8 15L6.5 9.5L1 8L6.5 6.5L8 1Z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const GreenCheckIcon = () => (
  <span className="flex items-center justify-center w-5 h-5 rounded-full bg-[#2b8652]">
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
      <path d="M3 6l2 2 4-4" stroke="white" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  </span>
);

const LoadingSpinner = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" className="animate-spin">
    <circle cx="8" cy="8" r="6" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeDasharray="28" strokeDashoffset="8" />
  </svg>
);

const TextIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="2" y="2" width="12" height="12" rx="2" stroke="currentColor" strokeWidth="1.2" />
    <line x1="5" y1="5" x2="11" y2="5" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" />
    <line x1="5" y1="8" x2="11" y2="8" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" />
    <line x1="5" y1="11" x2="9" y2="11" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" />
  </svg>
);

const GENERATION_DURATION_MS = 4000;
const PROGRESS_INTERVAL_MS = 100;

type GeneratingCard = {
  id: string;
  number: number;
  color: AssumptionColor;
  progress: number;
};

export function AssumptionTestingSection({
  interventionId,
  onConfirm,
  onLoadConfirmed,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: AssumptionTestingSectionProps) {
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  const [activeTab, setActiveTab] = useState<ActiveTab>("assumptions");
  const [sectionState, setSectionState] = useState<AssumptionTestingState>("loading");
  const [isConfirmed, setIsConfirmed] = useState(false);

  // Assumptions state
  const [assumptions, setAssumptions] = useState<Assumption[]>([]);
  const [editingAssumption, setEditingAssumption] = useState<Assumption | null>(null);
  const [deletingAssumption, setDeletingAssumption] = useState<Assumption | null>(null);
  const [isAddMenuOpen, setIsAddMenuOpen] = useState(false);
  const [showAddModal, setShowAddModal] = useState(false);
  const [generatingCard, setGeneratingCard] = useState<GeneratingCard | null>(null);
  const addMenuRef = useRef<HTMLDivElement>(null);
  const aiCounterRef = useRef(0);

  // Research questions state
  const [questions, setQuestions] = useState<ResearchQuestion[]>([]);

  // Findings state
  const [textFindings, setTextFindings] = useState("");
  const [uploadedFiles, setUploadedFiles] = useState<UploadedFile[]>([]);

  const { showToast } = useToast();

  // Fetch assumptions from API
  const fetchAssumptions = useCallback(async () => {
    try {
      const response = await apiGet<XanoAssumption[]>(
        `/api/interventions/${interventionId}/assumption-testing/assumptions`
      );
      if (response && Array.isArray(response)) {
        setAssumptions(response.map((item, i) => xanoAssumptionToFrontend(item, i)));
      } else {
        setAssumptions([]);
      }
    } catch {
      setAssumptions([]);
    }
  }, [interventionId]);

  // Fetch research questions from API
  const fetchQuestions = useCallback(async () => {
    try {
      const response = await apiGet<XanoResearchQuestion[]>(
        `/api/interventions/${interventionId}/assumption-testing/research-questions`
      );
      if (response && Array.isArray(response)) {
        setQuestions(response.map((item, i) => xanoQuestionToFrontend(item, i)));
      } else {
        setQuestions([]);
      }
    } catch {
      setQuestions([]);
    }
  }, [interventionId]);

  // Fetch findings from API
  const fetchFindings = useCallback(async () => {
    try {
      const response = await apiGet<XanoFindingsResponse>(
        `/api/interventions/${interventionId}/assumption-testing/findings`
      );
      if (response) {
        // Text findings — single record
        if (response.findings && response.findings.length > 0) {
          setTextFindings(response.findings[0].content || "");
        }
        // File findings
        if (response.file && Array.isArray(response.file)) {
          setUploadedFiles(response.file.map((f) => xanoFileToFrontend(f)));
        }
      }
    } catch {
      // Leave empty
    }
  }, [interventionId]);

  // Check confirmation state
  const checkConfirmation = useCallback(async () => {
    try {
      const interventionData = await apiGet<Intervention>(
        `/api/interventions/${interventionId}`
      );
      // Assumption Testing is workflow step 5; after confirm, current_step becomes 6+
      if (interventionData && interventionData.current_step >= 6) {
        setIsConfirmed(true);
        onLoadConfirmed?.();
      }
    } catch {
      // Could not check
    }
  }, [interventionId, onLoadConfirmed]);

  // Load all data on mount
  useEffect(() => {
    setSectionState("loading");
    Promise.all([fetchAssumptions(), fetchQuestions(), fetchFindings(), checkConfirmation()])
      .finally(() => setSectionState("loaded"));
  }, [fetchAssumptions, fetchQuestions, fetchFindings, checkConfirmation]);

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
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [isAddMenuOpen]);

  // AI generation progress simulation for assumptions
  useEffect(() => {
    if (!generatingCard) return;

    const startTime = Date.now();
    const interval = setInterval(() => {
      const elapsed = Date.now() - startTime;
      const progress = Math.min(Math.round((elapsed / GENERATION_DURATION_MS) * 100), 100);
      setGeneratingCard((prev) => prev ? { ...prev, progress } : null);

      if (progress >= 100) {
        clearInterval(interval);
        const aiContent = AI_ASSUMPTIONS[aiCounterRef.current % AI_ASSUMPTIONS.length];
        aiCounterRef.current += 1;

        (async () => {
          try {
            await apiPost(
              `/api/interventions/${interventionId}/assumption-testing/assumptions`,
              frontendAssumptionToXanoCreate(aiContent, interventionId)
            );
            await fetchAssumptions();
            showToast("Assumption saved successfully");
          } catch {
            showToast("Failed to save generated assumption", "error");
          } finally {
            setGeneratingCard(null);
          }
        })();
      }
    }, PROGRESS_INTERVAL_MS);

    return () => clearInterval(interval);
  }, [generatingCard?.id]); // eslint-disable-line react-hooks/exhaustive-deps

  const handleToggle = () => {
    if (onToggleExpand) onToggleExpand();
    else setLocalExpanded(!localExpanded);
  };

  // --- Assumption CRUD handlers ---
  const handleManualAddAssumption = async (title: string) => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/assumption-testing/assumptions`,
        frontendAssumptionToXanoCreate(title, interventionId)
      );
      await fetchAssumptions();
      showToast("Assumption saved successfully");
    } catch {
      showToast("Failed to add assumption", "error");
    }
  };

  const handleEditAssumption = async (updated: Assumption) => {
    setAssumptions((prev) => prev.map((a) => (a.id === updated.id ? updated : a)));
    try {
      await apiPatch(
        `/api/interventions/${interventionId}/assumption-testing/assumptions/${updated.id}`,
        frontendAssumptionToXanoPatch(updated.title)
      );
      showToast("Assumption saved successfully");
    } catch {
      showToast("Failed to save assumption", "error");
      fetchAssumptions();
    }
  };

  const handleDeleteAssumption = async () => {
    if (!deletingAssumption) return;
    const deletingId = deletingAssumption.id;
    setAssumptions((prev) => {
      const filtered = prev.filter((a) => a.id !== deletingId);
      return filtered.map((a, i) => ({ ...a, number: i + 1 }));
    });

    try {
      await apiDelete(
        `/api/interventions/${interventionId}/assumption-testing/assumptions/${deletingId}`
      );
      showToast("Assumption deleted successfully");
    } catch {
      showToast("Failed to delete assumption", "error");
      fetchAssumptions();
    }
  };

  const handleGenerateAssumption = () => {
    setIsAddMenuOpen(false);
    const nextNumber = assumptions.length + 1;
    setGeneratingCard({
      id: `ai-${Date.now()}`,
      number: nextNumber,
      color: getColorForIndex(nextNumber - 1),
      progress: 0,
    });
  };

  // --- Research Question CRUD handlers ---
  const handleQuestionsChange = async (newQuestions: ResearchQuestion[]) => {
    setQuestions(newQuestions);
  };

  // Wire the ResearchQuestionsTab callbacks to API
  const handleAddQuestion = async (text: string) => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/assumption-testing/research-questions`,
        frontendQuestionToXanoCreate(text, interventionId)
      );
      await fetchQuestions();
    } catch {
      showToast("Failed to add research question", "error");
    }
  };

  const handleEditQuestion = async (updated: ResearchQuestion) => {
    setQuestions((prev) => prev.map((q) => (q.id === updated.id ? updated : q)));
    try {
      await apiPatch(
        `/api/interventions/${interventionId}/assumption-testing/research-questions/${updated.id}`,
        frontendQuestionToXanoPatch(updated.text)
      );
      showToast("Research question saved successfully");
    } catch {
      showToast("Failed to save research question", "error");
      fetchQuestions();
    }
  };

  const handleDeleteQuestion = async (id: string) => {
    setQuestions((prev) => {
      const filtered = prev.filter((q) => q.id !== id);
      return filtered.map((q, i) => ({ ...q, number: i + 1 }));
    });
    try {
      await apiDelete(
        `/api/interventions/${interventionId}/assumption-testing/research-questions/${id}`
      );
      showToast("Research question deleted successfully");
    } catch {
      showToast("Failed to delete research question", "error");
      fetchQuestions();
    }
  };

  // --- Findings handlers ---
  const handleSaveTextFindings = async () => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/assumption-testing/findings`,
        { content: textFindings }
      );
      showToast("Findings saved");
    } catch {
      showToast("Failed to save findings", "error");
    }
  };

  const handleDeleteFile = async (fileId: string) => {
    setUploadedFiles((prev) => prev.filter((f) => f.id !== fileId));
    try {
      await apiDelete(
        `/api/interventions/${interventionId}/assumption-testing/findings/${fileId}`
      );
      showToast("File deleted");
    } catch {
      showToast("Failed to delete file", "error");
      fetchFindings();
    }
  };

  // --- Confirm handler ---
  const handleConfirm = async () => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/assumption-testing/confirm`,
        { intervention_id: interventionId }
      );
      setIsConfirmed(true);
      showToast("Assumption Testing confirmed");
      onConfirm?.();
    } catch {
      showToast("Failed to confirm assumption testing", "error");
    }
  };

  const isLoaded = sectionState === "loaded";
  const hasAssumptions = assumptions.length > 0;

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className={`flex items-center justify-between ${isExpanded ? "mb-4" : ""}`}>
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">Assumption Testing</span>
          {isConfirmed && <GreenCheckIcon />}
        </button>

        {isLoaded && !isConfirmed && (
          <button
            onClick={handleConfirm}
            disabled={!hasAssumptions}
            className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
              hasAssumptions
                ? "text-text-inverse bg-button-solid hover:opacity-90"
                : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
            }`}
          >
            Confirm Assumption Testing
          </button>
        )}
      </div>

      {isExpanded && (
        <>
          {!isLoaded ? (
            <AssumptionTestingSkeleton />
          ) : (
            <>
              {/* Tab Bar */}
              <TabBar
                tabs={TABS}
                activeTab={activeTab}
                onTabChange={(id) => setActiveTab(id as ActiveTab)}
                className="mb-4"
              />

              {/* Assumptions Tab */}
              {activeTab === "assumptions" && (
                <>
                  <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
                    {assumptions.map((assumption) => (
                      <AssumptionCard
                        key={assumption.id}
                        assumption={assumption}
                        isConfirmed={isConfirmed}
                        onEdit={() => setEditingAssumption(assumption)}
                        onDelete={() => setDeletingAssumption(assumption)}
                      />
                    ))}

                    {generatingCard && (
                      <GeneratingAssumptionSkeleton
                        number={generatingCard.number}
                        color={generatingCard.color}
                      />
                    )}
                  </div>

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
                            onClick={() => { setIsAddMenuOpen(false); setShowAddModal(true); }}
                            className="flex items-center gap-3 w-full px-4 py-3 text-sm font-medium text-text-primary hover:bg-gray-50 transition-colors text-left"
                          >
                            <PenIcon />
                            Fill manually
                          </button>
                          <button
                            onClick={handleGenerateAssumption}
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

              {/* Research Questions Tab */}
              {activeTab === "research-questions" && (
                <ResearchQuestionsTab
                  hasAssumptions={hasAssumptions}
                  isConfirmed={isConfirmed}
                  onSwitchToAssumptions={() => setActiveTab("assumptions")}
                  questions={questions}
                  onQuestionsChange={handleQuestionsChange}
                />
              )}

              {/* Findings Tab */}
              {activeTab === "findings" && (
                <div className="space-y-4">
                  {/* Text findings */}
                  <div>
                    <div className="flex items-center gap-2 mb-2">
                      <TextIcon />
                      <span className="text-sm font-semibold text-text-primary">Text Findings</span>
                    </div>
                    <textarea
                      value={textFindings}
                      onChange={(e) => setTextFindings(e.target.value)}
                      onBlur={handleSaveTextFindings}
                      placeholder="Paste your findings text here..."
                      disabled={isConfirmed}
                      className="w-full h-32 px-4 py-3 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20 focus:border-button-solid disabled:bg-gray-50 disabled:cursor-not-allowed"
                    />
                  </div>

                  {/* File upload */}
                  <div>
                    <FileUploadZone
                      files={uploadedFiles}
                      onFilesChange={(newFiles) => {
                        // Only handle removals from this callback — uploads go through the upload handler
                        const removedFiles = uploadedFiles.filter(
                          (f) => !newFiles.find((nf) => nf.id === f.id)
                        );
                        removedFiles.forEach((f) => handleDeleteFile(f.id));
                      }}
                      isConfirmed={isConfirmed}
                    />
                  </div>
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
                <span className="text-sm font-medium text-text-primary">Generating Assumption</span>
                <span className="text-xs font-medium text-text-secondary">{generatingCard.progress}%</span>
              </div>
              <div className="w-full h-1.5 bg-stroke-soft rounded-full overflow-hidden">
                <div className="h-full bg-button-solid rounded-full transition-all duration-100" style={{ width: `${generatingCard.progress}%` }} />
              </div>
            </div>
          </div>,
          document.body
        )}

      {/* Modals */}
      <EditAssumptionModal
        isOpen={editingAssumption !== null}
        onClose={() => setEditingAssumption(null)}
        assumption={editingAssumption}
        onSave={handleEditAssumption}
      />
      <DeleteAssumptionModal
        isOpen={deletingAssumption !== null}
        onClose={() => setDeletingAssumption(null)}
        onDelete={handleDeleteAssumption}
      />
      <AddAssumptionModal
        isOpen={showAddModal}
        onClose={() => setShowAddModal(false)}
        onAdd={handleManualAddAssumption}
      />
    </div>
  );
}
