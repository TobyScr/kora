"use client";

import { useState, useEffect, useCallback } from "react";
import { TabBar } from "../TabBar/TabBar";
import { ResearchAccordion } from "./ResearchAccordion";
import { FileUploadZone } from "./FileUploadZone";
import { InsightItem } from "./InsightItem";
import { InsightsEmptyState } from "./InsightsEmptyState";
import { InsightsReadyState } from "./InsightsReadyState";
import { InsightsGeneratingState } from "./InsightsGeneratingState";
import { EditInsightModal } from "./EditInsightModal";
import { DeleteInsightModal } from "./DeleteInsightModal";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPatch, apiDelete } from "@/lib/api";
import { xanoInsightToFrontend, frontendInsightToXanoCreate, frontendInsightToXanoPatch } from "@/lib/transforms/research";
import type { XanoResearchInsight } from "@/lib/types/research";
import type { Intervention } from "@/lib/types/intervention";
import type {
  ResearchTab,
  ResearchFile,
  ResearchLink,
  Insight,
  InsightsState,
  InsightColor,
} from "./types";

type ResearchInsightsSectionProps = {
  interventionId: number;
  onConfirm?: () => void;
  onLoadConfirmed?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
};

// Colors cycle for mock-generated insights
const INSIGHT_COLORS: InsightColor[] = ["teal", "cyan", "blue", "indigo"];

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

const TextIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect
      x="2"
      y="2"
      width="12"
      height="12"
      rx="2"
      stroke="currentColor"
      strokeWidth="1.2"
    />
    <line
      x1="5"
      y1="5"
      x2="11"
      y2="5"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
    />
    <line
      x1="5"
      y1="8"
      x2="11"
      y2="8"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
    />
    <line
      x1="5"
      y1="11"
      x2="9"
      y2="11"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
    />
  </svg>
);

const UploadIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 10V4m0 0L5 7m3-3l3 3"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M3 11v2a1 1 0 001 1h8a1 1 0 001-1v-2"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
    />
  </svg>
);

const LinkIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M6.5 9.5l3-3M7 12l-1.5 1.5a2.121 2.121 0 01-3-3L4 9m5-5l1.5-1.5a2.121 2.121 0 013 3L12 7"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const CopyIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect
      x="5"
      y="5"
      width="9"
      height="9"
      rx="1.5"
      stroke="currentColor"
      strokeWidth="1.2"
    />
    <path
      d="M11 5V3.5A1.5 1.5 0 009.5 2h-6A1.5 1.5 0 002 3.5v6A1.5 1.5 0 003.5 11H5"
      stroke="currentColor"
      strokeWidth="1.2"
    />
  </svg>
);

const DownloadIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 2v8m0 0l3-3m-3 3L5 7"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M3 12v1.5a1.5 1.5 0 001.5 1.5h7a1.5 1.5 0 001.5-1.5V12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

const RefreshIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M13.5 8a5.5 5.5 0 01-9.9 3.3M2.5 8a5.5 5.5 0 019.9-3.3"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
    <path
      d="M13.5 3v5h-5M2.5 13V8h5"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const LightbulbIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 1a5 5 0 00-2 9.58V12a1 1 0 001 1h2a1 1 0 001-1v-1.42A5 5 0 008 1z"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M6 14h4"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
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

const TrashIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 4h10M6 4V3a1 1 0 011-1h2a1 1 0 011 1v1m2 0v9a1 1 0 01-1 1H5a1 1 0 01-1-1V4h8z"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const TABS = [
  { id: "existing", label: "Existing Research" },
  { id: "deepresearch", label: "DeepResearch" },
  { id: "insights", label: "Insights" },
];

// Sample generated prompt
const SAMPLE_PROMPT = `Background of the Brief
I am designing a campaign that aims to Prevent Young Men's Drift into the Manosphere as a growing number of adolescent and young adult men (ages 14\u201425) are being drawn into the manosphere \u2014 an online ecosystem of influencers and communities that promote misogynistic, anti-feminist, or hyper-masculine ideologies. These spaces often reframe grievances around loneliness, rejection, economic frustration, and male identity into antagonism toward women, social progress, or institutions.

Problem Validation and Rapid Evidence Assessment
\u2022 A deeper understanding of why manosphere messages stick
\u2022 Narrative and emotional drivers behind engagement`;

// Sample insights used by the mock "Generate" button only (N8N integration is a future phase)
const MOCK_GENERATED_INSIGHTS: Omit<Insight, "id" | "number" | "color" | "isExpanded">[] = [
  {
    text: "Recruitment thrives on identity repair, not ideology.",
    description:
      "SKP content now uses Tajik/Uzbek/Russian to meet emotional needs for belonging, dignity, and recognition among socially disconnected youth\u2014especially migrants facing stigma in Russia",
    sources: ["Existing Research", "DeepResearch"],
  },
  {
    text: "Mistrust and fear of surveillance silence healthy discourse",
    description:
      "Young people in Central Asia are hesitant to discuss sensitive topics online due to perceived government monitoring, pushing conversations to encrypted platforms where extremist content thrives unchecked.",
    sources: ["Existing Research"],
  },
  {
    text: "Mistrust and fear of surveillance silence healthy discourse",
    description:
      "Fear of being flagged by authorities creates a chilling effect on open discourse, making it harder to counter extremist narratives in public forums.",
    sources: ["DeepResearch"],
  },
  {
    text: "Mistrust and fear of surveillance silence healthy discourse",
    description:
      "SKP content now uses Tajik/Uzbek/Russian to meet emotional needs for belonging, dignity, and recognition among socially disconnected youth\u2014especially migrants facing stigma in Russia",
    sources: ["Existing Research"],
  },
  {
    text: "Mistrust and fear of surveillance silence healthy discourse",
    description:
      "Platform algorithms amplify emotionally charged content, making extremist messaging more visible to vulnerable youth seeking validation.",
    sources: ["DeepResearch"],
  },
  {
    text: "Mistrust and fear of surveillance silence healthy discourse",
    description:
      "SKP content now uses Tajik/Uzbek/Russian to meet emotional needs for belonging, dignity, and recognition among socially disconnected youth\u2014especially migrants facing stigma in Russia",
    sources: ["Existing Research"],
  },
  {
    text: "Recruitment thrives on identity repair, not ideology.",
    description:
      "Economic frustration and lack of opportunity create fertile ground for extremist recruitment, as groups offer both material support and a sense of purpose.",
    sources: ["Existing Research", "DeepResearch"],
  },
];

export function ResearchInsightsSection({
  interventionId,
  onConfirm,
  onLoadConfirmed,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: ResearchInsightsSectionProps) {
  // Local state for uncontrolled mode
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  const [activeTab, setActiveTab] = useState<ResearchTab>("existing");
  const [isLoading, setIsLoading] = useState(true);

  // Existing Research state (local-only, no Xano wiring)
  const [textFindings, setTextFindings] = useState("");
  const [uploadedFiles, setUploadedFiles] = useState<ResearchFile[]>([]);
  const [links, setLinks] = useState<ResearchLink[]>([{ id: "1", url: "" }]);

  // DeepResearch state (local-only)
  const [deepResearchFiles, setDeepResearchFiles] = useState<ResearchFile[]>(
    []
  );
  const [copiedPrompt, setCopiedPrompt] = useState(false);

  // Insights state
  const [insights, setInsights] = useState<Insight[]>([]);
  const [insightsState, setInsightsState] = useState<InsightsState>("empty");
  const [isConfirmed, setIsConfirmed] = useState(false);

  // Modal state
  const [editModalOpen, setEditModalOpen] = useState(false);
  const [deleteModalOpen, setDeleteModalOpen] = useState(false);
  const [selectedInsight, setSelectedInsight] = useState<Insight | null>(null);
  const [insightToDelete, setInsightToDelete] = useState<string | null>(null);

  // Toast
  const { showToast } = useToast();

  // Fetch insights from API on mount
  const fetchInsights = useCallback(async () => {
    try {
      setIsLoading(true);
      const response = await apiGet<XanoResearchInsight[]>(
        `/api/interventions/${interventionId}/research/insights`
      );

      if (response && Array.isArray(response) && response.length > 0) {
        const transformed = response.map((item, index) =>
          xanoInsightToFrontend(item, index)
        );
        setInsights(transformed);
        setInsightsState("generated");
      } else {
        setInsights([]);
        setInsightsState("empty");
      }
    } catch {
      // No insights yet or error — start empty
      setInsights([]);
      setInsightsState("empty");
    } finally {
      setIsLoading(false);
    }
  }, [interventionId]);

  // Check confirmation state via intervention current_step
  const checkConfirmation = useCallback(async () => {
    try {
      const interventionData = await apiGet<Intervention>(
        `/api/interventions/${interventionId}`
      );
      // Research Insights is workflow step 2; after confirm, current_step becomes 3
      if (interventionData && interventionData.current_step >= 3) {
        setIsConfirmed(true);
        onLoadConfirmed?.();
      }
    } catch {
      // Could not check — leave unconfirmed
    }
  }, [interventionId, onLoadConfirmed]);

  useEffect(() => {
    fetchInsights();
    checkConfirmation();
  }, [fetchInsights, checkConfirmation]);

  // Check if any research has been added (local-only tabs)
  const hasResearch =
    textFindings.trim() !== "" ||
    uploadedFiles.length > 0 ||
    links.some((l) => l.url.trim() !== "") ||
    deepResearchFiles.length > 0;

  const handleToggle = () => {
    if (onToggleExpand) {
      onToggleExpand();
    } else {
      setLocalExpanded(!localExpanded);
    }
  };

  const handleCopyPrompt = async () => {
    await navigator.clipboard.writeText(SAMPLE_PROMPT);
    setCopiedPrompt(true);
    setTimeout(() => setCopiedPrompt(false), 2000);
  };

  const handleAddLink = () => {
    setLinks([
      ...links,
      { id: `link-${Date.now()}`, url: "" },
    ]);
  };

  const handleRemoveLink = (id: string) => {
    setLinks(links.filter((l) => l.id !== id));
  };

  const handleLinkChange = (id: string, url: string) => {
    setLinks(links.map((l) => (l.id === id ? { ...l, url } : l)));
  };

  const handleAddResearch = () => {
    setActiveTab("existing");
  };

  // Mock generate — stays as setTimeout with sample data (N8N is a future phase)
  const handleGenerateInsights = () => {
    setInsightsState("generating");
    setTimeout(async () => {
      // Create insights in Xano via POST, then refresh from server
      try {
        for (const mockInsight of MOCK_GENERATED_INSIGHTS) {
          await apiPost(
            `/api/interventions/${interventionId}/research/insights`,
            frontendInsightToXanoCreate(mockInsight, interventionId)
          );
        }
        // Refresh from server to get real IDs
        await fetchInsights();
      } catch {
        // Fallback: show locally with temp IDs
        const tempInsights: Insight[] = MOCK_GENERATED_INSIGHTS.map((m, i) => ({
          ...m,
          id: `temp-${Date.now()}-${i}`,
          number: i + 1,
          color: INSIGHT_COLORS[i % INSIGHT_COLORS.length],
          isExpanded: false,
        }));
        setInsights(tempInsights);
        setInsightsState("generated");
        showToast("Generated locally — could not save to server", "error");
      }
    }, 2000);
  };

  const handleToggleInsightExpand = (id: string) => {
    setInsights(
      insights.map((i) =>
        i.id === id ? { ...i, isExpanded: !i.isExpanded } : i
      )
    );
  };

  // Mock regenerate — stays as setTimeout with sample data (N8N is a future phase)
  const handleRegenerate = () => {
    setInsightsState("generating");
    setTimeout(async () => {
      // Delete all existing insights first, then create new ones
      try {
        for (const existing of insights) {
          try {
            await apiDelete(
              `/api/interventions/${interventionId}/research/insights/${existing.id}`
            );
          } catch {
            // Skip if already deleted or temp ID
          }
        }
        for (const mockInsight of MOCK_GENERATED_INSIGHTS) {
          await apiPost(
            `/api/interventions/${interventionId}/research/insights`,
            frontendInsightToXanoCreate(mockInsight, interventionId)
          );
        }
        await fetchInsights();
      } catch {
        const tempInsights: Insight[] = MOCK_GENERATED_INSIGHTS.map((m, i) => ({
          ...m,
          id: `temp-${Date.now()}-${i}`,
          number: i + 1,
          color: INSIGHT_COLORS[i % INSIGHT_COLORS.length],
          isExpanded: false,
        }));
        setInsights(tempInsights);
        setInsightsState("generated");
        showToast("Regenerated locally — could not save to server", "error");
      }
    }, 2000);
  };

  // Edit insight handlers
  const handleEditInsight = (insight: Insight) => {
    setSelectedInsight(insight);
    setEditModalOpen(true);
  };

  const handleSaveInsight = async (updatedInsight: Insight) => {
    // Optimistic update
    setInsights(
      insights.map((i) => (i.id === updatedInsight.id ? updatedInsight : i))
    );

    try {
      const patchBody = frontendInsightToXanoPatch({
        text: updatedInsight.text,
        description: updatedInsight.description,
        sources: updatedInsight.sources,
      });

      await apiPatch(
        `/api/interventions/${interventionId}/research/insights/${updatedInsight.id}`,
        patchBody
      );
      showToast("Insight saved", "success");
    } catch {
      showToast("Failed to save insight", "error");
      // Re-fetch to restore server state
      fetchInsights();
    }
  };

  // Delete insight handlers
  const handleDeleteInsight = (id: string) => {
    setInsightToDelete(id);
    setDeleteModalOpen(true);
  };

  const handleConfirmDelete = async () => {
    if (!insightToDelete) return;

    // Optimistic update: remove and renumber
    const filteredInsights = insights.filter((i) => i.id !== insightToDelete);
    const renumberedInsights = filteredInsights.map((insight, index) => ({
      ...insight,
      number: index + 1,
    }));
    setInsights(renumberedInsights);

    // If all insights deleted, go back to empty state
    if (renumberedInsights.length === 0) {
      setInsightsState("empty");
    }

    const deletingId = insightToDelete;
    setInsightToDelete(null);

    try {
      await apiDelete(
        `/api/interventions/${interventionId}/research/insights/${deletingId}`
      );
      showToast("Insight deleted", "success");
    } catch {
      showToast("Failed to delete insight", "error");
      // Re-fetch to restore server state
      fetchInsights();
    }
  };

  // Add more insight handler
  const handleAddInsight = async () => {
    try {
      const newInsightBody = frontendInsightToXanoCreate(
        { text: "New insight", description: "", sources: [] },
        interventionId
      );

      await apiPost(
        `/api/interventions/${interventionId}/research/insights`,
        newInsightBody
      );

      // Refresh from server to get real ID
      await fetchInsights();
      showToast("Insight added", "success");
    } catch {
      showToast("Failed to add insight", "error");
    }
  };

  // Confirm handler
  const handleConfirmInsights = async () => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/research/confirm`,
        { intervention_id: interventionId }
      );
      setIsConfirmed(true);
      showToast("Research Insights confirmed", "success");
      onConfirm?.();
    } catch {
      showToast("Failed to confirm research insights", "error");
    }
  };

  // Determine insights state based on research and loading
  const currentInsightsState = (): InsightsState => {
    if (isLoading) return "empty";
    if (insightsState === "generating") return "generating";
    if (insightsState === "generated" && insights.length > 0) return "generated";
    if (hasResearch) return "ready";
    return "empty";
  };

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">Research Insights</span>
        </button>

        <button
          onClick={handleConfirmInsights}
          disabled={currentInsightsState() !== "generated" || isConfirmed}
          className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
            currentInsightsState() === "generated" && !isConfirmed
              ? "text-text-inverse bg-button-solid hover:opacity-90"
              : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
          }`}
        >
          {isConfirmed ? "Research Insights Confirmed" : "Confirm Research Insights"}
        </button>
      </div>

      {isExpanded && (
        <>
          {/* Tab Bar */}
          <TabBar
            tabs={TABS}
            activeTab={activeTab}
            onTabChange={(id) => setActiveTab(id as ResearchTab)}
            className="mb-4"
          />

          {/* Tab Content */}
          <div className="space-y-4">
            {activeTab === "existing" && (
              <>
                {/* Text Form Findings */}
                <ResearchAccordion
                  icon={<TextIcon />}
                  title="Text Form Findings"
                  description="Paste a summary, description, or key findings"
                  badge="Optional"
                  defaultExpanded
                >
                  <textarea
                    value={textFindings}
                    onChange={(e) => setTextFindings(e.target.value)}
                    placeholder="Write your insights or summaries here"
                    className="w-full h-32 px-4 py-3 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20 focus:border-button-solid"
                  />
                </ResearchAccordion>

                {/* Upload Files */}
                <ResearchAccordion
                  icon={<UploadIcon />}
                  title="Upload File(s)"
                  description="Upload a PDF or Word file of your research report"
                  badge="Optional"
                >
                  <FileUploadZone
                    files={uploadedFiles}
                    onFilesChange={setUploadedFiles}
                  />
                </ResearchAccordion>

                {/* Add Links */}
                <ResearchAccordion
                  icon={<LinkIcon />}
                  title="Add link(s)"
                  description="Share links to online documents or research sources"
                  badge="Optional"
                >
                  <div className="space-y-3">
                    {links.map((link) => (
                      <div key={link.id} className="flex items-center gap-2">
                        <input
                          type="url"
                          value={link.url}
                          onChange={(e) =>
                            handleLinkChange(link.id, e.target.value)
                          }
                          placeholder="https://"
                          className="flex-1 px-4 py-2.5 text-sm border border-stroke-default rounded-lg focus:outline-none focus:ring-2 focus:ring-button-solid/20 focus:border-button-solid"
                        />
                        {links.length > 1 && (
                          <button
                            onClick={() => handleRemoveLink(link.id)}
                            className="text-text-tertiary hover:text-text-primary transition-colors p-2"
                          >
                            <TrashIcon />
                          </button>
                        )}
                      </div>
                    ))}
                    <button
                      onClick={handleAddLink}
                      className="flex items-center gap-2 text-sm text-text-primary font-medium hover:text-text-secondary transition-colors"
                    >
                      <PlusIcon />
                      Add more
                    </button>
                  </div>
                </ResearchAccordion>
              </>
            )}

            {activeTab === "deepresearch" && (
              <>
                {/* Copy Prompt */}
                <ResearchAccordion
                  icon={<CopyIcon />}
                  number={1}
                  title="Copy Prompt"
                  description="Copy this prompt into ChatGPT - DeepResearch"
                  defaultExpanded
                >
                  <div className="bg-[#f8fafc] border border-stroke-default rounded-lg p-4">
                    <p className="text-sm text-text-primary whitespace-pre-wrap mb-4">
                      {SAMPLE_PROMPT}
                    </p>
                    <div className="flex justify-end">
                      <button
                        onClick={handleCopyPrompt}
                        className="flex items-center gap-2 px-4 py-2 text-sm font-medium text-text-primary border border-stroke-default rounded-lg hover:bg-stroke-soft/30 transition-colors"
                      >
                        <CopyIcon />
                        {copiedPrompt ? "Copied!" : "Copy to clipboard"}
                      </button>
                    </div>
                  </div>
                </ResearchAccordion>

                {/* Add Findings */}
                <ResearchAccordion
                  icon={<UploadIcon />}
                  number={2}
                  title="Add Findings"
                  description="Upload your DeepResearch results"
                  badge="Optional"
                >
                  <FileUploadZone
                    files={deepResearchFiles}
                    onFilesChange={setDeepResearchFiles}
                  />
                </ResearchAccordion>
              </>
            )}

            {activeTab === "insights" && (
              <div className="border border-stroke-default rounded-xl bg-background-surface-0 overflow-hidden">
                {currentInsightsState() === "empty" && (
                  <InsightsEmptyState onAddResearch={handleAddResearch} />
                )}

                {currentInsightsState() === "ready" && (
                  <InsightsReadyState
                    onGenerateInsights={handleGenerateInsights}
                  />
                )}

                {currentInsightsState() === "generating" && (
                  <InsightsGeneratingState />
                )}

                {currentInsightsState() === "generated" && (
                  <div className="p-4">
                    {/* Generated Insights Header */}
                    <div className="flex items-center justify-between mb-4">
                      <div className="flex items-center gap-2">
                        <span className="flex items-center justify-center w-8 h-8 rounded-lg bg-[#fef3c7] text-[#d97706]">
                          <LightbulbIcon />
                        </span>
                        <span className="font-semibold text-sm text-text-primary">
                          Generated Insights
                        </span>
                      </div>
                      <div className="flex items-center gap-2">
                        <button className="flex items-center gap-1 px-3 py-1.5 text-sm text-text-secondary hover:text-text-primary transition-colors">
                          <DownloadIcon />
                        </button>
                        {!isConfirmed && (
                          <button
                            onClick={handleRegenerate}
                            className="flex items-center gap-1 px-3 py-1.5 text-sm text-text-secondary hover:text-text-primary transition-colors"
                          >
                            <RefreshIcon />
                            Regenerate
                          </button>
                        )}
                      </div>
                    </div>

                    {/* Insights List */}
                    <div className="border-t border-stroke-default">
                      {insights.map((insight) => (
                        <InsightItem
                          key={insight.id}
                          insight={insight}
                          onToggleExpand={handleToggleInsightExpand}
                          onEdit={handleEditInsight}
                          onDelete={handleDeleteInsight}
                          isConfirmed={isConfirmed}
                        />
                      ))}
                    </div>

                    {/* Add More - only when not confirmed */}
                    {!isConfirmed && (
                      <button
                        onClick={handleAddInsight}
                        className="flex items-center justify-center gap-2 w-full py-3 mt-2 text-sm text-text-primary font-medium border border-stroke-default rounded-lg hover:bg-stroke-soft/30 transition-colors"
                      >
                        <PlusIcon />
                        Add more
                      </button>
                    )}
                  </div>
                )}
              </div>
            )}
          </div>
        </>
      )}

      {/* Edit Insight Modal */}
      <EditInsightModal
        isOpen={editModalOpen}
        onClose={() => {
          setEditModalOpen(false);
          setSelectedInsight(null);
        }}
        insight={selectedInsight}
        onSave={handleSaveInsight}
      />

      {/* Delete Insight Modal */}
      <DeleteInsightModal
        isOpen={deleteModalOpen}
        onClose={() => {
          setDeleteModalOpen(false);
          setInsightToDelete(null);
        }}
        onDelete={handleConfirmDelete}
      />
    </div>
  );
}
