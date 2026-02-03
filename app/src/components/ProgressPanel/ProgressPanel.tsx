"use client";

import { ProgressPanelSection } from "./ProgressPanelSection";
import { type StatusType } from "./StatusPill";

type SectionState = {
  status: StatusType;
  isExpanded: boolean;
};

type ProgressPanelProps = {
  sections: {
    briefOverview: SectionState;
    researchInsights: SectionState;
  };
  onToggleSection?: (section: "briefOverview" | "researchInsights") => void;
  onClose?: () => void;
};

// Kora logo component
const KoraLogo = () => (
  <div className="flex items-center gap-4">
    <div className="grid grid-cols-3 gap-[1.67px]">
      <div className="w-[6.67px] h-[6.67px] rounded bg-[#0d2b4c]" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-transparent" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-[#0d2b4c]" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-transparent" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-[#0d2b4c]" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-transparent" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-[#0d2b4c]" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-transparent" />
      <div className="w-[6.67px] h-[6.67px] rounded bg-[#0d2b4c]" />
    </div>
    <span className="text-sm font-medium text-text-primary tracking-wider">KORA</span>
  </div>
);

const CloseIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 4l8 8M12 4l-8 8"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

// Static content for Brief Overview section
const BriefOverviewContent = () => (
  <div className="space-y-4">
    <p>
      Thank you! We've completed all the questions for the brief. I'll now process this
      information and create a compiled Brief Overview.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> This captures your brief so that
      nothing is missed. It gives us a strong foundation to build on for your campaign.
    </div>
    <div>
      <p className="font-medium mb-2">What's Next:</p>
      <ol className="list-decimal list-inside space-y-1">
        <li>Review the canvas and make edits if needed.</li>
        <li>
          When everything looks good, select{" "}
          <span className="font-medium">"Confirm Brief Overview"</span> to move to the
          next step.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Once you confirm, the brief will become read-only and can't be edited
      further.
    </p>
  </div>
);

// Static content for Research Insights section
const ResearchInsightsContent = () => (
  <div className="space-y-4">
    <p>Great! We're now moving to Research Insights.</p>
    <div>
      <span className="font-medium">Purpose:</span> This collects and conducts initial
      research — from which insights are drawn. These insights inform your campaign.
    </div>
    <div>
      <p className="font-medium mb-2">What's Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>
          Upload any <span className="font-medium">Existing Research</span> you may have
          via text, through saved documents, or through external links.
        </li>
        <li>
          If you don't have existing research, copy the prompt provided in the{" "}
          <span className="font-medium">DeepResearch tab</span> and paste it in ChatGPT's
          DeepResearch function. Once the research comes back, upload your findings into
          the <span className="font-medium">Add Findings</span> heading.
        </li>
        <li>
          Once all research is uploaded, select{" "}
          <span className="font-medium">Generate Insights</span> and I will share 3-8 key
          insights to guide your next steps.
        </li>
      </ol>
    </div>
  </div>
);

export function ProgressPanel({ sections, onToggleSection, onClose }: ProgressPanelProps) {
  return (
    <div className="w-[280px] h-full bg-background-surface-0 border-l border-stroke-default flex flex-col">
      {/* Header */}
      <div className="flex items-center justify-between p-2 bg-background-surface border-b border-stroke-default">
        <div className="px-4">
          <KoraLogo />
        </div>
        <button
          onClick={onClose}
          className="flex items-center justify-center w-10 h-10 text-text-secondary hover:text-text-primary transition-colors"
          aria-label="Close panel"
        >
          <CloseIcon />
        </button>
      </div>

      {/* Sections */}
      <div className="flex-1 flex flex-col justify-end overflow-y-auto">
        <ProgressPanelSection
          title="Brief Overview"
          status={sections.briefOverview.status}
          isExpanded={sections.briefOverview.isExpanded}
          content={<BriefOverviewContent />}
          onToggle={() => onToggleSection?.("briefOverview")}
        />
        <ProgressPanelSection
          title="Research Insights"
          status={sections.researchInsights.status}
          isExpanded={sections.researchInsights.isExpanded}
          content={<ResearchInsightsContent />}
          onToggle={() => onToggleSection?.("researchInsights")}
        />
      </div>
    </div>
  );
}
