"use client";

import { useState } from "react";
import { TabBar } from "../TabBar/TabBar";
import { ResearchAccordion } from "./ResearchAccordion";
import { FileUploadZone } from "./FileUploadZone";
import { InsightItem } from "./InsightItem";
import { InsightsEmptyState } from "./InsightsEmptyState";
import { InsightsReadyState } from "./InsightsReadyState";
import { InsightsGeneratingState } from "./InsightsGeneratingState";
import type {
  ResearchTab,
  ResearchFile,
  ResearchLink,
  Insight,
  InsightsState,
} from "./types";

type ResearchInsightsSectionProps = {
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
I am designing a campaign that aims to Prevent Young Men's Drift into the Manosphere as a growing number of adolescent and young adult men (ages 14—25) are being drawn into the manosphere — an online ecosystem of influencers and communities that promote misogynistic, anti-feminist, or hyper-masculine ideologies. These spaces often reframe grievances around loneliness, rejection, economic frustration, and male identity into antagonism toward women, social progress, or institutions.

Problem Validation and Rapid Evidence Assessment
• A deeper understanding of why manosphere messages stick
• Narrative and emotional drivers behind engagement`;

// Sample insights
const SAMPLE_INSIGHTS: Insight[] = [
  {
    id: "1",
    number: 1,
    text: "Recruitment thrives on identity repair, not ideology.",
    isExpanded: false,
  },
  {
    id: "2",
    number: 2,
    text: "Mistrust and fear of surveillance silence healthy discourse",
    isExpanded: false,
  },
  {
    id: "3",
    number: 3,
    text: "Mistrust and fear of surveillance silence healthy discourse",
    isExpanded: false,
  },
  {
    id: "4",
    number: 4,
    text: "Mistrust and fear of surveillance silence healthy discourse",
    isExpanded: false,
  },
  {
    id: "5",
    number: 5,
    text: "Mistrust and fear of surveillance silence healthy discourse",
    isExpanded: false,
  },
  {
    id: "6",
    number: 6,
    text: "Mistrust and fear of surveillance silence healthy discourse",
    isExpanded: false,
  },
  {
    id: "7",
    number: 7,
    text: "Recruitment thrives on identity repair, not ideology.",
    isExpanded: false,
  },
];

export function ResearchInsightsSection({
  onConfirm,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: ResearchInsightsSectionProps) {
  // Local state for uncontrolled mode
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  const [activeTab, setActiveTab] = useState<ResearchTab>("existing");

  // Existing Research state
  const [textFindings, setTextFindings] = useState("");
  const [uploadedFiles, setUploadedFiles] = useState<ResearchFile[]>([]);
  const [links, setLinks] = useState<ResearchLink[]>([{ id: "1", url: "" }]);

  // DeepResearch state
  const [deepResearchFiles, setDeepResearchFiles] = useState<ResearchFile[]>(
    []
  );
  const [copiedPrompt, setCopiedPrompt] = useState(false);

  // Insights state
  const [insights, setInsights] = useState<Insight[]>([]);
  const [insightsState, setInsightsState] = useState<InsightsState>("empty");

  // Check if any research has been added
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

  const handleGenerateInsights = () => {
    setInsightsState("generating");
    // Simulate generation delay
    setTimeout(() => {
      setInsights(SAMPLE_INSIGHTS);
      setInsightsState("generated");
    }, 2000);
  };

  const handleToggleInsightExpand = (id: string) => {
    setInsights(
      insights.map((i) =>
        i.id === id ? { ...i, isExpanded: !i.isExpanded } : i
      )
    );
  };

  const handleRegenerate = () => {
    setInsightsState("generating");
    setTimeout(() => {
      setInsights(SAMPLE_INSIGHTS);
      setInsightsState("generated");
    }, 2000);
  };

  // Determine insights state based on research
  const currentInsightsState = (): InsightsState => {
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
          onClick={onConfirm}
          disabled={currentInsightsState() !== "generated"}
          className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
            currentInsightsState() === "generated"
              ? "text-text-inverse bg-button-solid hover:opacity-90"
              : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
          }`}
        >
          Confirm Research Insights
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
                        <button
                          onClick={handleRegenerate}
                          className="flex items-center gap-1 px-3 py-1.5 text-sm text-text-secondary hover:text-text-primary transition-colors"
                        >
                          <RefreshIcon />
                          Regenerate
                        </button>
                      </div>
                    </div>

                    {/* Insights List */}
                    <div className="border-t border-stroke-default">
                      {insights.map((insight) => (
                        <InsightItem
                          key={insight.id}
                          insight={insight}
                          onToggleExpand={handleToggleInsightExpand}
                        />
                      ))}
                    </div>

                    {/* Add More */}
                    <button className="flex items-center justify-center gap-2 w-full py-3 mt-2 text-sm text-text-primary font-medium border border-stroke-default rounded-lg hover:bg-stroke-soft/30 transition-colors">
                      <PlusIcon />
                      Add more
                    </button>
                  </div>
                )}
              </div>
            )}
          </div>
        </>
      )}
    </div>
  );
}
