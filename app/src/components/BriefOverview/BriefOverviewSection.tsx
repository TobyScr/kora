"use client";

import { BriefOverviewCard, type CardState } from "./BriefOverviewCard";

type BriefOverviewSectionProps = {
  state: CardState;
  onStateChange?: (state: CardState) => void;
  showDevToggle?: boolean;
};

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

// Dummy data for filled state
const dummyData = {
  clientName: "FCDO",
  location: "Uzbekistan, Tajikistan, and diaspora",
  budget: "$500,000",
  timeline: "6 Months",
  deliverables: "Integrated campaign with digital and offline content/activations",
  problemDefinition:
    "Vulnerable young Tajiks and Uzbeks, both domestically and in diaspora communities, face increased risk of recruitment by Daesh (ISKP) due to social, emotional, and ideological vulnerabilities, exacerbated by evolving digital recruitment tactics and intensified activity, demanding urgent behavior change to reduce susceptibility.",
  initialObjective:
    "Build resilience among young Tajik and Uzbek populations against ISKP propaganda by diminishing extremist messaging influence through targeted behavior-change strategies addressing underlying social conditions and grievances.",
  taProfile: [
    "Active on platforms like TikTok, YouTube, Instagram, Discord, Reddit",
    "Male-identifying, 14—20",
    "Alienated or disillusioned, Distrusts institutions",
    "Seeking identity, belonging, status",
  ],
  dos: [
    "Use the right platforms: TikTok, Instagram, Discord for testing",
    "Co-create: use participatory storytelling and testing",
    "Safeguard community spaces: moderate interactions, consult mental health professionals",
  ],
  donts: [
    "Directly shame manosphere participants",
    "Rely heavily on traditional authority figures",
  ],
};

// TA Profile checkbox - lavender background
const CheckboxIcon = () => (
  <span className="flex items-center justify-center w-6 h-6 rounded-lg bg-[#eceeff] shrink-0">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
      <rect
        x="2"
        y="2"
        width="12"
        height="12"
        rx="2"
        stroke="#7c7cff"
        strokeWidth="1.5"
      />
    </svg>
  </span>
);

// Do's checkmark - teal background
const CheckIcon = () => (
  <span className="flex items-center justify-center w-6 h-6 rounded-lg bg-[#e1f4ee] shrink-0">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
      <path
        d="M4 8l3 3 5-6"
        stroke="#0d9373"
        strokeWidth="1.5"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  </span>
);

// Don'ts X - tomato background
const XIcon = () => (
  <span className="flex items-center justify-center w-6 h-6 rounded-lg bg-[#fff0e5] shrink-0">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
      <path
        d="M5 5l6 6M11 5l-6 6"
        stroke="#e54d2e"
        strokeWidth="1.5"
        strokeLinecap="round"
      />
    </svg>
  </span>
);

export function BriefOverviewSection({
  state,
  onStateChange,
  showDevToggle = false,
}: BriefOverviewSectionProps) {
  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <button className="flex items-center gap-2 text-text-primary">
          <ChevronIcon isExpanded />
          <span className="text-lg font-medium">Brief Overview</span>
        </button>

        <div className="flex items-center gap-3">
          {/* Dev Toggle */}
          {showDevToggle && (
            <div className="flex items-center gap-1 bg-yellow-100 rounded-full px-2 py-1 text-xs">
              <span className="text-yellow-800 font-medium">State:</span>
              <select
                value={state}
                onChange={(e) => onStateChange?.(e.target.value as CardState)}
                className="bg-transparent text-yellow-800 font-medium outline-none cursor-pointer"
              >
                <option value="loading">Loading</option>
                <option value="empty">Empty</option>
                <option value="filled">Filled</option>
              </select>
            </div>
          )}

          {/* Export PDF - only in filled state */}
          {state === "filled" && (
            <button className="flex items-center gap-2 px-4 py-2 text-sm font-medium text-text-primary border border-stroke-default rounded-full hover:bg-background-surface transition-colors">
              <DownloadIcon />
              Export PDF
            </button>
          )}

          {/* Confirm Button - in empty and filled states */}
          {state !== "loading" && (
            <button className="px-4 py-2 text-sm font-medium text-text-inverse bg-button-solid rounded-full hover:opacity-90 transition-opacity">
              Confirm Brief Overview
            </button>
          )}
        </div>
      </div>

      {/* Cards Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {/* Row 1: Client Name, Location, Budget */}
        <BriefOverviewCard
          type="clientName"
          state={state}
          content={dummyData.clientName}
        />
        <BriefOverviewCard
          type="location"
          state={state}
          content={dummyData.location}
        />
        <BriefOverviewCard
          type="budget"
          state={state}
          content={dummyData.budget}
        />

        {/* Row 2: Timeline, Deliverables (2 columns on lg) */}
        <BriefOverviewCard
          type="timeline"
          state={state}
          content={dummyData.timeline}
          className="lg:col-span-1"
        />
        <BriefOverviewCard
          type="deliverables"
          state={state}
          content={dummyData.deliverables}
          className="lg:col-span-2"
        />

        {/* Row 3: Problem Definition, Initial Objective */}
        <BriefOverviewCard
          type="problemDefinition"
          state={state}
          content={dummyData.problemDefinition}
          className="md:col-span-1 lg:col-span-1"
        />
        <BriefOverviewCard
          type="initialObjective"
          state={state}
          content={dummyData.initialObjective}
          className="md:col-span-1 lg:col-span-2"
        />

        {/* Row 4: TA Profile (full width) */}
        <BriefOverviewCard
          type="taProfile"
          state={state}
          content={
            <ul className="space-y-3">
              {dummyData.taProfile.map((item, i) => (
                <li key={i} className="flex items-center gap-3">
                  <CheckboxIcon />
                  <span className="font-medium tracking-[0.4px]">{item}</span>
                </li>
              ))}
            </ul>
          }
          className="md:col-span-2 lg:col-span-3"
        />

        {/* Row 5: Do's, Don'ts */}
        <BriefOverviewCard
          type="dos"
          state={state}
          content={
            <ul className="space-y-3">
              {dummyData.dos.map((item, i) => (
                <li key={i} className="flex items-center gap-3">
                  <CheckIcon />
                  <span className="font-medium tracking-[0.4px]">{item}</span>
                </li>
              ))}
            </ul>
          }
          className="lg:col-span-1"
        />
        <BriefOverviewCard
          type="donts"
          state={state}
          content={
            <ul className="space-y-3">
              {dummyData.donts.map((item, i) => (
                <li key={i} className="flex items-center gap-3">
                  <XIcon />
                  <span className="font-medium tracking-[0.4px]">{item}</span>
                </li>
              ))}
            </ul>
          }
          className="lg:col-span-2"
        />
      </div>
    </div>
  );
}
