"use client";

import Image from "next/image";
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
    systemMap: SectionState;
    behaviouralObjective: SectionState;
  };
  onToggleSection?: (section: "briefOverview" | "researchInsights" | "systemMap" | "behaviouralObjective") => void;
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

// Static content for System Map section
const SystemMapContent = () => (
  <div className="space-y-4">
    <p>
      We&apos;re now moving to the System Map, where you can see the wider ecosystem
      around your brief&apos;s problem.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> The System Map identifies the key
      dynamics, challenges, and forces that shape the problem space. It helps you understand
      how different factors connect and where an intervention can have the most impact.
    </div>
    <div>
      <p className="font-medium mb-2">What&apos;s Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>Review and Edit any wording if needed.</li>
        <li>
          Select <span className="font-medium">ONE</span> system dynamic as your primary
          entry point.
        </li>
        <li>
          When you&apos;re ready, select{" "}
          <span className="font-medium">&quot;Confirm Entry Point&quot;</span> to move to the
          next step.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Once you confirm, the System Map will become read-only and can&apos;t be edited
      further.
    </p>
  </div>
);

// Static content for Behavioural Objective section
const BehaviouralObjectiveContent = () => (
  <div className="space-y-4">
    <p>
      Great work! Now let&apos;s define the Behavioural Objective for your campaign.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> The Behavioural Objective defines the
      specific behaviour change you want to achieve. It connects the entry point you selected
      in the System Map to a measurable, actionable goal.
    </div>
    <div>
      <p className="font-medium mb-2">What&apos;s Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>Review the suggested behavioural objective.</li>
        <li>Edit the wording to match your campaign goals.</li>
        <li>
          When you&apos;re ready, select{" "}
          <span className="font-medium">&quot;Confirm Behavioural Objective&quot;</span> to
          move to the next step.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Once you confirm, the Behavioural Objective will become read-only and can&apos;t
      be edited further.
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
        {/* Only show System Map after Research Insights is complete */}
        {sections.researchInsights.status === "complete" && (
          <ProgressPanelSection
            title="System Map"
            status={sections.systemMap.status}
            isExpanded={sections.systemMap.isExpanded}
            content={<SystemMapContent />}
            onToggle={() => onToggleSection?.("systemMap")}
          />
        )}
        {/* Only show Behavioural Objective after System Map is complete */}
        {sections.systemMap.status === "complete" && (
          <ProgressPanelSection
            title="Behavioural Objective"
            status={sections.behaviouralObjective.status}
            isExpanded={sections.behaviouralObjective.isExpanded}
            content={<BehaviouralObjectiveContent />}
            onToggle={() => onToggleSection?.("behaviouralObjective")}
          />
        )}
      </div>
    </div>
  );
}
