import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { Sidebar } from "../Sidebar/Sidebar";
import { SectionItem } from "../Sidebar/SectionItem";
import { SubsectionItem } from "../Sidebar/SubsectionItem";
import { Button } from "../Button/Button";

const FileIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M4 1.5h5.5L13 5v9a1.5 1.5 0 01-1.5 1.5h-7A1.5 1.5 0 013 14V3A1.5 1.5 0 014.5 1.5z" stroke="currentColor" strokeWidth="1.2" />
    <path d="M9.5 1.5V5H13" stroke="currentColor" strokeWidth="1.2" />
  </svg>
);

const LockIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="3" y="7" width="10" height="7" rx="1.5" stroke="currentColor" strokeWidth="1.5" />
    <path d="M5.5 7V5a2.5 2.5 0 015 0v2" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
  </svg>
);

const ArrowRightIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M3 8h10m0 0L9 4m4 4L9 12" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const WelcomeIcon = () => (
  <svg width="100" height="100" viewBox="0 0 100 100" fill="none">
    <rect width="100" height="100" rx="12" fill="#f3f4f6" />
    <path d="M35 45h30M35 55h20" stroke="#0d2b4c" strokeWidth="3" strokeLinecap="round" />
    <circle cx="65" cy="35" r="12" fill="none" stroke="#0d2b4c" strokeWidth="2.5" />
    <text x="62" y="40" fontSize="16" fill="#0d2b4c" fontWeight="bold">?</text>
    <path d="M30 30l-5-8M30 30l8-2" stroke="#0d2b4c" strokeWidth="2" strokeLinecap="round" />
  </svg>
);

function WelcomeScreen() {
  return (
    <div className="flex h-full bg-background-page">
      <Sidebar projectName="Rewrite the Rules" projectSubtitle="Project name" progress={25} sections={[]}>
        <div className="border-b border-stroke-default">
          <SectionItem icon={<FileIcon />} label="Understand" isExpanded />
          <SubsectionItem label="Brief Overview" isActive />
          <SubsectionItem label="Research Insights" isLocked />
          <SubsectionItem label="System Map" isLocked />
          <SubsectionItem label="Behavioural Objective" isLocked />
          <SubsectionItem label="Assumption testing" isLocked />
          <SubsectionItem label="COM-B & Personas" isLocked />
        </div>
        <div className="border-b border-stroke-default">
          <SectionItem icon={<LockIcon />} label="Design" isLocked />
        </div>
        <div className="border-b border-stroke-default">
          <SectionItem icon={<LockIcon />} label="Activate" isLocked />
        </div>
        <div className="border-b border-stroke-default">
          <SectionItem icon={<LockIcon />} label="Evaluate" isLocked />
        </div>
      </Sidebar>

      <main className="flex-1 flex flex-col items-center justify-center">
        <div className="flex flex-col items-center gap-6 max-w-[450px] text-center">
          <WelcomeIcon />
          <div className="flex flex-col gap-2">
            <h2 className="text-xl font-medium text-text-primary leading-[var(--heading-lineheight-h6)] tracking-[var(--letter-spacing-wide-s)]">
              Welcome to your new intervention
            </h2>
            <p className="text-base text-text-primary leading-[var(--body-lineheight-medium)]">
              Kora will walk you through the five stages of building a behaviour-change campaign —
              Understand, Design, Create, Activate, and Evaluate.
            </p>
          </div>
          <Button variant="solid" icon={<ArrowRightIcon />}>
            Let&apos;s start
          </Button>
        </div>
      </main>
    </div>
  );
}

const meta = {
  title: "Screens/WelcomeScreen",
  component: WelcomeScreen,
  parameters: {
    layout: "fullscreen",
  },
} satisfies Meta<typeof WelcomeScreen>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {};
