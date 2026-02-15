"use client";

import { useState, useEffect, useRef } from "react";
import { createPortal } from "react-dom";
import { EditQuestionModal } from "./EditQuestionModal";
import { DeleteQuestionModal } from "./DeleteQuestionModal";
import { useToast } from "../Toast";
import { SAMPLE_RESEARCH_QUESTIONS, AI_RESEARCH_QUESTIONS } from "./data";
import type { ResearchQuestion } from "./types";

type ResearchQuestionsTabProps = {
  hasAssumptions: boolean;
  isConfirmed: boolean;
  onSwitchToAssumptions: () => void;
  questions: ResearchQuestion[];
  onQuestionsChange: (questions: ResearchQuestion[]) => void;
};

type QuestionsState = "empty-no-assumptions" | "empty-ready" | "loading" | "loaded";

const LOADING_DELAY_MS = 2000;
const GENERATION_DURATION_MS = 4000;
const PROGRESS_INTERVAL_MS = 100;

// Icons
const BoxIcon = () => (
  <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
    <rect x="8" y="12" width="32" height="24" rx="3" stroke="currentColor" strokeWidth="2" />
    <path d="M8 18h32" stroke="currentColor" strokeWidth="2" />
    <path d="M16 24h16M16 30h10" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
  </svg>
);

const ClipboardIcon = () => (
  <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
    <rect x="12" y="8" width="24" height="32" rx="3" stroke="currentColor" strokeWidth="2" />
    <path d="M18 8h12v4H18V8z" stroke="currentColor" strokeWidth="2" />
    <path d="M18 20h12M18 26h12M18 32h8" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
  </svg>
);

const SearchIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="7" cy="7" r="4.5" stroke="currentColor" strokeWidth="1.5" />
    <path d="M10.5 10.5L14 14" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
  </svg>
);

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

const KebabIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="8" cy="3" r="1.5" fill="currentColor" />
    <circle cx="8" cy="8" r="1.5" fill="currentColor" />
    <circle cx="8" cy="13" r="1.5" fill="currentColor" />
  </svg>
);

const EditIcon = () => (
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

const TrashIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 4H13M6 4V3C6 2.44772 6.44772 2 7 2H9C9.55228 2 10 2.44772 10 3V4M12 4V13C12 13.5523 11.5523 14 11 14H5C4.44772 14 4 13.5523 4 13V4H12Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M6.66667 7V11M9.33333 7V11"
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

const DownloadIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 2v8m0 0L5 7m3 3l3-3M3 12h10"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const RefreshIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M2 8a6 6 0 0111.46-2.46M14 8A6 6 0 012.54 10.46"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
    <path d="M14 2v4h-4M2 14v-4h4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
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

const SKELETON_COUNT = 7;

function QuestionRow({
  question,
  isConfirmed,
  onEdit,
  onDelete,
}: {
  question: ResearchQuestion;
  isConfirmed: boolean;
  onEdit: () => void;
  onDelete: () => void;
}) {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const menuRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setIsMenuOpen(false);
      }
    };

    if (isMenuOpen) {
      document.addEventListener("mousedown", handleClickOutside);
    }

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [isMenuOpen]);

  return (
    <div className="flex items-start gap-3 py-3 border-b border-stroke-soft last:border-b-0">
      <span className="text-sm font-semibold text-text-secondary shrink-0 w-6 text-right pt-0.5">
        {question.number}.
      </span>
      <span className="flex-1 text-sm text-text-primary leading-relaxed">
        {question.text}
      </span>
      {!isConfirmed && (
        <div className="relative" ref={menuRef}>
          <button
            className="text-text-tertiary hover:text-text-secondary transition-colors p-1 shrink-0 cursor-pointer"
            aria-label="Question actions"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            <KebabIcon />
          </button>

          {isMenuOpen && (
            <div className="absolute right-0 top-full mt-1 w-52 bg-white border border-stroke-default rounded-lg shadow-lg z-10 overflow-hidden">
              <button
                onClick={() => {
                  onEdit();
                  setIsMenuOpen(false);
                }}
                className="flex items-center gap-2 w-full px-3 py-2.5 text-sm font-medium text-text-primary hover:bg-gray-50 transition-colors text-left"
              >
                <EditIcon />
                Edit Question
              </button>
              <button
                onClick={() => {
                  onDelete();
                  setIsMenuOpen(false);
                }}
                className="flex items-center gap-2 w-full px-3 py-2.5 text-sm font-medium text-red-600 hover:bg-gray-50 transition-colors text-left"
              >
                <TrashIcon />
                Delete Question
              </button>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export function ResearchQuestionsTab({
  hasAssumptions,
  isConfirmed,
  onSwitchToAssumptions,
  questions,
  onQuestionsChange,
}: ResearchQuestionsTabProps) {
  const [questionsState, setQuestionsState] = useState<QuestionsState>(
    questions.length > 0 ? "loaded" : hasAssumptions ? "empty-ready" : "empty-no-assumptions"
  );
  const [isHeaderExpanded, setIsHeaderExpanded] = useState(true);
  const [generatingProgress, setGeneratingProgress] = useState<number | null>(null);
  const [generatingQuestion, setGeneratingQuestion] = useState(false);
  const aiCounterRef = useRef(0);

  // Edit/Delete modal state
  const [editingQuestion, setEditingQuestion] = useState<ResearchQuestion | null>(null);
  const [deletingQuestion, setDeletingQuestion] = useState<ResearchQuestion | null>(null);

  const { showToast } = useToast();

  // Update state when assumptions change
  useEffect(() => {
    if (questions.length > 0) {
      setQuestionsState("loaded");
    } else if (hasAssumptions) {
      setQuestionsState("empty-ready");
    } else {
      setQuestionsState("empty-no-assumptions");
    }
  }, [hasAssumptions, questions.length]);

  // Generate questions handler
  const handleGenerate = () => {
    setQuestionsState("loading");
    setGeneratingProgress(0);

    const startTime = Date.now();
    const interval = setInterval(() => {
      const elapsed = Date.now() - startTime;
      const progress = Math.min(Math.round((elapsed / GENERATION_DURATION_MS) * 100), 100);
      setGeneratingProgress(progress);

      if (progress >= 100) {
        clearInterval(interval);
        onQuestionsChange(SAMPLE_RESEARCH_QUESTIONS);
        setQuestionsState("loaded");
        setGeneratingProgress(null);
        showToast("Research questions generated successfully");
      }
    }, PROGRESS_INTERVAL_MS);
  };

  // Regenerate handler
  const handleRegenerate = () => {
    onQuestionsChange([]);
    handleGenerate();
  };

  // Add more handler (AI generates single question)
  const handleAddMore = () => {
    setGeneratingQuestion(true);

    setTimeout(() => {
      const aiContent = AI_RESEARCH_QUESTIONS[aiCounterRef.current % AI_RESEARCH_QUESTIONS.length];
      aiCounterRef.current += 1;

      const nextNumber = questions.length + 1;
      const newQuestion: ResearchQuestion = {
        id: `ai-rq-${Date.now()}`,
        number: nextNumber,
        text: aiContent,
      };

      onQuestionsChange([...questions, newQuestion]);
      setGeneratingQuestion(false);
      showToast("Research question added successfully");
    }, LOADING_DELAY_MS);
  };

  // Edit handler
  const handleEditSave = (updatedQuestion: ResearchQuestion) => {
    onQuestionsChange(
      questions.map((q) => (q.id === updatedQuestion.id ? updatedQuestion : q))
    );
    showToast("Research question saved successfully");
  };

  // Delete handler
  const handleDeleteConfirm = () => {
    if (!deletingQuestion) return;

    const filtered = questions.filter((q) => q.id !== deletingQuestion.id);
    const renumbered = filtered.map((q, index) => ({ ...q, number: index + 1 }));
    onQuestionsChange(renumbered);
    showToast("Research question deleted successfully");
  };

  // Empty state - no assumptions
  if (questionsState === "empty-no-assumptions") {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <div className="text-text-tertiary mb-4">
          <BoxIcon />
        </div>
        <h3 className="text-sm font-semibold text-text-primary mb-1">
          Add some Assumptions first!
        </h3>
        <p className="text-xs text-text-secondary mb-4 max-w-[280px]">
          Research questions are generated based on your assumptions. Add assumptions to get started.
        </p>
        <button
          onClick={onSwitchToAssumptions}
          className="px-4 py-2 text-sm font-medium text-text-inverse bg-button-solid rounded-full hover:opacity-90 transition-all"
        >
          Add assumptions
        </button>
      </div>
    );
  }

  // Empty state - ready to generate
  if (questionsState === "empty-ready") {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <div className="text-text-tertiary mb-4">
          <ClipboardIcon />
        </div>
        <h3 className="text-sm font-semibold text-text-primary mb-1">
          Ready for Research Questions?
        </h3>
        <p className="text-xs text-text-secondary mb-4 max-w-[280px]">
          Generate research questions based on your assumptions to guide your investigation.
        </p>
        <button
          onClick={handleGenerate}
          className="px-4 py-2 text-sm font-medium text-text-inverse bg-button-solid rounded-full hover:opacity-90 transition-all"
        >
          Generate Research Questions
        </button>
      </div>
    );
  }

  // Loading state
  if (questionsState === "loading") {
    return (
      <>
        <div className="mt-4">
          <button
            onClick={() => setIsHeaderExpanded(!isHeaderExpanded)}
            className="flex items-center gap-2 text-text-primary cursor-pointer mb-3"
          >
            <ChevronIcon isExpanded={isHeaderExpanded} />
            <SearchIcon />
            <span className="text-sm font-semibold">Generated Research Questions</span>
          </button>

          {isHeaderExpanded && (
            <div className="space-y-3">
              {Array.from({ length: SKELETON_COUNT }, (_, i) => (
                <div key={i} className="flex items-start gap-3 py-3 border-b border-stroke-soft last:border-b-0">
                  <span className="text-sm font-semibold text-text-tertiary shrink-0 w-6 text-right pt-0.5">
                    {i + 1}.
                  </span>
                  <div className="flex-1 space-y-2 pt-0.5">
                    <div className="h-4 bg-stroke-soft rounded animate-pulse w-full" />
                    <div className="h-4 bg-stroke-soft rounded animate-pulse w-2/3" />
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Progress bar portal */}
        {generatingProgress !== null && typeof window !== "undefined" &&
          createPortal(
            <div className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 flex items-center gap-3 bg-white border border-stroke-default rounded-xl shadow-lg px-5 py-3 min-w-[320px]">
              <LoadingSpinner />
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-sm font-medium text-text-primary">
                    Generating Questions
                  </span>
                  <span className="text-xs font-medium text-text-secondary">
                    {generatingProgress}%
                  </span>
                </div>
                <div className="w-full h-1.5 bg-stroke-soft rounded-full overflow-hidden">
                  <div
                    className="h-full bg-button-solid rounded-full transition-all duration-100"
                    style={{ width: `${generatingProgress}%` }}
                  />
                </div>
              </div>
            </div>,
            document.body
          )}
      </>
    );
  }

  // Loaded state
  return (
    <>
      <div className="mt-4">
        {/* Header row */}
        <div className="flex items-center justify-between mb-3">
          <button
            onClick={() => setIsHeaderExpanded(!isHeaderExpanded)}
            className="flex items-center gap-2 text-text-primary cursor-pointer"
          >
            <ChevronIcon isExpanded={isHeaderExpanded} />
            <SearchIcon />
            <span className="text-sm font-semibold">Generated Research Questions</span>
          </button>

          {!isConfirmed && (
            <div className="flex items-center gap-2">
              <button
                className="flex items-center justify-center w-8 h-8 text-text-tertiary hover:text-text-secondary transition-colors rounded-lg"
                aria-label="Download questions"
              >
                <DownloadIcon />
              </button>
              <button
                onClick={handleRegenerate}
                className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-text-secondary hover:text-text-primary transition-colors"
              >
                <RefreshIcon />
                Regenerate
              </button>
            </div>
          )}
        </div>

        {/* Question list */}
        {isHeaderExpanded && (
          <div>
            {questions.map((question) => (
              <QuestionRow
                key={question.id}
                question={question}
                isConfirmed={isConfirmed}
                onEdit={() => setEditingQuestion(question)}
                onDelete={() => setDeletingQuestion(question)}
              />
            ))}

            {/* Generating skeleton row */}
            {generatingQuestion && (
              <div className="flex items-start gap-3 py-3 border-b border-stroke-soft">
                <span className="text-sm font-semibold text-text-tertiary shrink-0 w-6 text-right pt-0.5">
                  {questions.length + 1}.
                </span>
                <div className="flex-1 space-y-2 pt-0.5">
                  <div className="h-4 bg-stroke-soft rounded animate-pulse w-full" />
                  <div className="h-4 bg-stroke-soft rounded animate-pulse w-2/3" />
                </div>
              </div>
            )}

            {/* Add more button */}
            {!isConfirmed && (
              <button
                onClick={handleAddMore}
                disabled={generatingQuestion}
                className="flex items-center gap-2 mt-3 text-sm font-medium text-text-secondary hover:text-text-primary transition-colors cursor-pointer disabled:opacity-50"
              >
                <SparkleIcon />
                + Add more
              </button>
            )}
          </div>
        )}
      </div>

      {/* Edit Question Modal */}
      <EditQuestionModal
        isOpen={editingQuestion !== null}
        onClose={() => setEditingQuestion(null)}
        question={editingQuestion}
        onSave={handleEditSave}
      />

      {/* Delete Question Modal */}
      <DeleteQuestionModal
        isOpen={deletingQuestion !== null}
        onClose={() => setDeletingQuestion(null)}
        onDelete={handleDeleteConfirm}
      />
    </>
  );
}
