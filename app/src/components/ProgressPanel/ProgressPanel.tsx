"use client";

import Image from "next/image";
import { ProgressPanelSection } from "./ProgressPanelSection";
import { type StatusType } from "./StatusPill";

type SectionState = {
  status: StatusType;
  isExpanded: boolean;
};

type SectionKey =
  | "briefOverview"
  | "researchInsights"
  | "systemMap"
  | "behaviouralObjective"
  | "assumptionTesting"
  | "combPersonas";

type ProgressPanelProps = {
  sections: {
    briefOverview: SectionState;
    researchInsights: SectionState;
    systemMap?: SectionState;
    behaviouralObjective?: SectionState;
    assumptionTesting?: SectionState;
    combPersonas?: SectionState;
  };
  onToggleSection?: (section: SectionKey) => void;
};

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
          <span className="font-medium">&quot;Confirm Brief Overview&quot;</span> to move to the
          next step.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Once you confirm, the brief will become read-only and can&apos;t be edited
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
          If you don&apos;t have existing research, copy the prompt provided in the{" "}
          <span className="font-medium">DeepResearch tab</span> and paste it in ChatGPT&apos;s
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

// Static content for System Map section
const SystemMapContent = () => (
  <div className="space-y-4">
    <p>Section complete.</p>
  </div>
);

// Static content for Behavioural Objective section
const BehaviouralObjectiveContent = () => (
  <div className="space-y-4">
    <p>Section complete.</p>
  </div>
);

// Static content for Assumption Testing section
const AssumptionTestingContent = () => (
  <div className="space-y-4">
    <p>Section complete.</p>
  </div>
);

// Static content for COM-B & Personas section
const COMBPersonasContent = () => (
  <div className="space-y-4">
    <p>
      Great! You&apos;ve now reached the last step in the Understand stage, where I&apos;ll
      use your research to map behavioural barriers for your target audience in a COM-B
      analysis and create associated personas.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> This maps your audience&apos;s
      behavioural barriers across Capability, Opportunity, and Motivation — helping you
      design interventions that address the right drivers of change.
    </div>
    <div>
      <p className="font-medium mb-2">What's Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>
          Review the <span className="font-medium">COM-B barriers</span> generated from
          your research. Barriers marked with <span className="font-medium">*</span> are
          recommended based on your insights.
        </li>
        <li>
          <span className="font-medium">Select the barriers</span> you want to focus on
          using the toggle switches. You can also add custom barriers.
        </li>
        <li>
          When you&apos;re happy with your selection, select{" "}
          <span className="font-medium">&quot;Confirm COM-B Mapping&quot;</span> to generate
          personas based on the selected barriers.
        </li>
      </ol>
    </div>
  </div>
);

export function ProgressPanel({ sections, onToggleSection }: ProgressPanelProps) {
  return (
    <div className="w-[280px] h-full bg-background-surface-0 border-l border-stroke-default flex flex-col">
      {/* Header */}
      <div className="flex items-center p-4 bg-background-surface border-b border-stroke-default">
        <Image
          src="/brand/Sidebar_Logo.svg"
          alt="Kora"
          width={85}
          height={22}
        />
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
        {/* Only show Research Insights after Brief Overview is complete */}
        {sections.briefOverview.status === "complete" && (
          <ProgressPanelSection
            title="Research Insights"
            status={sections.researchInsights.status}
            isExpanded={sections.researchInsights.isExpanded}
            content={<ResearchInsightsContent />}
            onToggle={() => onToggleSection?.("researchInsights")}
          />
        )}
        {/* Show System Map after Research Insights is complete */}
        {sections.researchInsights.status === "complete" && sections.systemMap && (
          <ProgressPanelSection
            title="System Map"
            status={sections.systemMap.status}
            isExpanded={sections.systemMap.isExpanded}
            content={<SystemMapContent />}
            onToggle={() => onToggleSection?.("systemMap")}
          />
        )}
        {/* Show Behavioural Objective after System Map is complete */}
        {sections.systemMap?.status === "complete" && sections.behaviouralObjective && (
          <ProgressPanelSection
            title="Behavioural Objective"
            status={sections.behaviouralObjective.status}
            isExpanded={sections.behaviouralObjective.isExpanded}
            content={<BehaviouralObjectiveContent />}
            onToggle={() => onToggleSection?.("behaviouralObjective")}
          />
        )}
        {/* Show Assumption Testing after Behavioural Objective is complete */}
        {sections.behaviouralObjective?.status === "complete" && sections.assumptionTesting && (
          <ProgressPanelSection
            title="Assumption Testing"
            status={sections.assumptionTesting.status}
            isExpanded={sections.assumptionTesting.isExpanded}
            content={<AssumptionTestingContent />}
            onToggle={() => onToggleSection?.("assumptionTesting")}
          />
        )}
        {/* Show COM-B & Personas after Assumption Testing is complete */}
        {sections.assumptionTesting?.status === "complete" && sections.combPersonas && (
          <ProgressPanelSection
            title="COM-B & Personas"
            status={sections.combPersonas.status}
            isExpanded={sections.combPersonas.isExpanded}
            content={<COMBPersonasContent />}
            onToggle={() => onToggleSection?.("combPersonas")}
          />
        )}
      </div>
    </div>
  );
}
