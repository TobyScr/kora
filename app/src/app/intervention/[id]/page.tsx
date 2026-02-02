"use client";

import { Sidebar } from "@/components/Sidebar/Sidebar";
import { SectionItem } from "@/components/Sidebar/SectionItem";
import { SubsectionItem } from "@/components/Sidebar/SubsectionItem";
import { Button } from "@/components/Button/Button";

const FileIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 1.5h5.5L13 5v9a1.5 1.5 0 01-1.5 1.5h-7A1.5 1.5 0 013 14V3A1.5 1.5 0 014.5 1.5z"
      stroke="currentColor"
      strokeWidth="1.2"
    />
    <path d="M9.5 1.5V5H13" stroke="currentColor" strokeWidth="1.2" />
  </svg>
);

const LockIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="3" y="7" width="10" height="7" rx="1.5" stroke="currentColor" strokeWidth="1.5" />
    <path
      d="M5.5 7V5a2.5 2.5 0 015 0v2"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

const ArrowRightIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 8h10m0 0L9 4m4 4L9 12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const WelcomeIllustration = () => (
  <svg
    width="100"
    height="100"
    viewBox="0 0 100 100"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
  >
    {/* Document body */}
    <path
      d="M25 15h35l15 15v55a5 5 0 01-5 5H25a5 5 0 01-5-5V20a5 5 0 015-5z"
      stroke="var(--text-primary)"
      strokeWidth="2.5"
      fill="none"
    />
    <path d="M60 15v15h15" stroke="var(--text-primary)" strokeWidth="2.5" fill="none" />
    {/* Lines on document */}
    <path d="M32 45h36M32 55h28M32 65h32" stroke="var(--text-primary)" strokeWidth="2" strokeLinecap="round" opacity="0.4" />
    {/* Question mark circle */}
    <circle cx="72" cy="28" r="16" stroke="var(--text-primary)" strokeWidth="2.5" fill="var(--background-page)" />
    <text
      x="72"
      y="34"
      textAnchor="middle"
      fontSize="20"
      fontWeight="600"
      fill="var(--text-primary)"
      fontFamily="Satoshi, sans-serif"
    >
      ?
    </text>
    {/* Pencil */}
    <path
      d="M78 60l8-8 4 4-8 8H78v-4z"
      stroke="var(--text-primary)"
      strokeWidth="2"
      fill="none"
      strokeLinejoin="round"
    />
    <path d="M84 54l4 4" stroke="var(--text-primary)" strokeWidth="2" />
  </svg>
);

export default function InterventionPage() {
  const handleStart = () => {
    console.log("Start intervention clicked");
  };

  return (
    <div className="flex h-screen bg-background-page">
      {/* Sidebar - visual only */}
      <div className="hidden md:block">
        <Sidebar
          projectName="Rewrite the Rules"
          projectSubtitle="Project name"
          progress={25}
          sections={[]}
        >
          {/* Understand - expanded */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<FileIcon />} label="Understand" isExpanded />
            <SubsectionItem label="Brief Overview" isActive />
            <SubsectionItem label="Research Insights" isLocked />
            <SubsectionItem label="System Map" isLocked />
            <SubsectionItem label="Behavioural Objective" isLocked />
            <SubsectionItem label="Assumption testing" isLocked />
            <SubsectionItem label="COM-B & Personas" isLocked />
          </div>
          {/* Design - locked */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<LockIcon />} label="Design" isLocked />
          </div>
          {/* Activate - locked */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<LockIcon />} label="Activate" isLocked />
          </div>
          {/* Evaluate - locked */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<LockIcon />} label="Evaluate" isLocked />
          </div>
        </Sidebar>
      </div>

      {/* Main content */}
      <main className="flex-1 flex flex-col items-center justify-center px-6">
        <div className="flex flex-col items-center gap-6 max-w-[450px] text-center">
          <WelcomeIllustration />
          <div className="flex flex-col gap-2">
            <h1 className="text-[length:var(--heading-size-h6)] font-medium text-text-primary leading-[var(--heading-lineheight-h6)] tracking-[var(--letter-spacing-wide-s)]">
              Welcome to your new intervention
            </h1>
            <p className="text-[length:var(--body-size-medium)] text-text-primary leading-[var(--body-lineheight-medium)]">
              Kora will walk you through the five stages of building a
              behaviour-change campaign — Understand, Design, Create, Activate,
              and Evaluate.
            </p>
          </div>
          <Button
            variant="solid"
            icon={<ArrowRightIcon />}
            onClick={handleStart}
          >
            Let&apos;s start
          </Button>
        </div>
      </main>
    </div>
  );
}
