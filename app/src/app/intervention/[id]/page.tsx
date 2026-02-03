"use client";

import { useRouter, useParams } from "next/navigation";
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
    <path
      d="M63.6182 70.9207L61.6917 78.145C61.1828 80.0536 63.4546 81.4662 64.9412 80.1654L70.8546 74.9912L90.3696 44.9056C91.5859 43.0305 91.0686 40.5259 89.2089 39.2861C87.3202 38.027 84.7671 38.5499 83.5256 40.4502L63.6182 70.9207Z"
      stroke="var(--text-primary)"
      strokeWidth="2"
    />
    <path
      d="M48.4185 78.8161C48.4185 78.8161 49.323 74.2934 48.8707 69.7706C48.8707 69.7706 55.6549 70.6752 64.7004 62.5342"
      stroke="var(--text-primary)"
      strokeWidth="2"
    />
    <path
      d="M48.4185 79.2698C48.4185 79.2698 18.719 73.541 5 71.1288C5 71.1288 28.5 52.5004 29.8752 18.2106C29.8752 18.2106 50.5 13.5004 74.6506 20.9261C74.6506 20.9261 74.6506 65.7001 48.4185 79.2698Z"
      stroke="var(--text-primary)"
      strokeWidth="2"
      strokeLinejoin="round"
    />
    <path
      d="M4.5 78.5002C4.5 78.5002 15.8613 76.2071 19 73.5002L48.4185 78.8161C48.4185 78.8161 61.233 67.9615 64.2482 63.4387C64.2482 63.4387 55.2724 80.1616 49 84.0002C49 84.0002 14.7864 84.1844 4.5 78.5002Z"
      fill="var(--text-primary)"
    />
    <ellipse cx="68" cy="82.5" rx="8" ry="1.5" fill="var(--text-primary)" />
    <path
      d="M40.5 39.4995C40.5 39.4995 43.5 34 49 36.9579C51.4076 38.2527 53 42.4587 50.5 45.4579C48.0373 48.4123 44.6181 45.527 41.5 47.9578C39.6456 49.4034 38 53.5 38 53.5"
      stroke="var(--text-primary)"
      strokeWidth="2"
      strokeLinecap="round"
    />
    <circle cx="36" cy="57" r="1" fill="var(--text-primary)" />
  </svg>
);

export default function InterventionPage() {
  const router = useRouter();
  const params = useParams();

  const handleStart = () => {
    router.push(`/intervention/${params.id}/brief`);
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
