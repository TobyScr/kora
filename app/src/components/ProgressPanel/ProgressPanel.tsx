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
  | "comB"
  | "personas";

type ProgressPanelProps = {
  sections: Record<SectionKey, SectionState>;
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

// Static content for Assumption Testing section
const AssumptionTestingContent = () => (
  <div className="space-y-4">
    <p>
      Now let&apos;s test the assumptions underlying your behavioural objective.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> Assumption Testing identifies what you
      believe to be true about your target audience and context, then creates research questions
      to validate those assumptions. This ensures your intervention is built on evidence, not guesswork.
    </div>
    <div>
      <p className="font-medium mb-2">What&apos;s Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>Review the assumptions generated from your objective.</li>
        <li>Add or edit research questions to test each assumption.</li>
        <li>Upload any existing findings that address these questions.</li>
        <li>
          When ready, select{" "}
          <span className="font-medium">&quot;Confirm Assumptions&quot;</span> to proceed.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Once confirmed, assumptions and research questions become read-only.
    </p>
  </div>
);

// Static content for COM-B section
const ComBContent = () => (
  <div className="space-y-4">
    <p>
      Time to analyse behavioural barriers using the COM-B framework.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> COM-B breaks down behaviour into three
      components: Capability, Opportunity, and Motivation. By identifying which barriers affect
      your target audience, you can design more effective interventions.
    </div>
    <div>
      <p className="font-medium mb-2">What&apos;s Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>Review barriers across all three categories.</li>
        <li>Select up to 3 key barriers to focus on.</li>
        <li>
          When ready, select{" "}
          <span className="font-medium">&quot;Confirm COM-B&quot;</span> to proceed.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Once confirmed, COM-B barriers become read-only.
    </p>
  </div>
);

// Static content for Personas section
const PersonasContent = () => (
  <div className="space-y-4">
    <p>
      Finally, let&apos;s build the personas that represent your target audience.
    </p>
    <div>
      <span className="font-medium">Purpose:</span> Personas are detailed profiles of the
      people your intervention aims to reach. They bring together demographics, psychographics,
      and media context to humanise your audience and guide creative decisions.
    </div>
    <div>
      <p className="font-medium mb-2">What&apos;s Next:</p>
      <ol className="list-decimal list-inside space-y-2">
        <li>Review and edit the persona profiles (up to 3).</li>
        <li>Upload images to bring each persona to life.</li>
        <li>
          When ready, select{" "}
          <span className="font-medium">&quot;Confirm Personas&quot;</span> to complete the
          Understand stage.
        </li>
      </ol>
    </div>
    <p className="text-text-secondary text-xs">
      Note: Confirming personas completes the Understand stage and unlocks the Design stage.
    </p>
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
        {/* Only show Assumption Testing after Behavioural Objective is complete */}
        {sections.behaviouralObjective.status === "complete" && (
          <ProgressPanelSection
            title="Assumption Testing"
            status={sections.assumptionTesting.status}
            isExpanded={sections.assumptionTesting.isExpanded}
            content={<AssumptionTestingContent />}
            onToggle={() => onToggleSection?.("assumptionTesting")}
          />
        )}
        {/* Only show COM-B after Assumption Testing is complete */}
        {sections.assumptionTesting.status === "complete" && (
          <ProgressPanelSection
            title="COM-B"
            status={sections.comB.status}
            isExpanded={sections.comB.isExpanded}
            content={<ComBContent />}
            onToggle={() => onToggleSection?.("comB")}
          />
        )}
        {/* Only show Personas after COM-B is complete */}
        {sections.comB.status === "complete" && (
          <ProgressPanelSection
            title="Personas"
            status={sections.personas.status}
            isExpanded={sections.personas.isExpanded}
            content={<PersonasContent />}
            onToggle={() => onToggleSection?.("personas")}
          />
        )}
      </div>
    </div>
  );
}
