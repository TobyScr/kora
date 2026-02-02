import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { Sidebar } from "./Sidebar";
import { SectionItem } from "./SectionItem";
import { SubsectionItem } from "./SubsectionItem";

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

const meta = {
  title: "Navigation/Sidebar",
  component: Sidebar,
  tags: ["autodocs"],
  parameters: {
    layout: "fullscreen",
  },
  decorators: [
    (Story) => (
      <div className="h-[600px]">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof Sidebar>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {
  args: {
    projectName: "Rewrite the Rules",
    projectSubtitle: "Project name",
    progress: 25,
    sections: [],
  },
  render: (args) => (
    <Sidebar {...args}>
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
      {/* Design - collapsed/locked */}
      <div className="border-b border-stroke-default">
        <SectionItem icon={<LockIcon />} label="Design" isLocked />
      </div>
      {/* Activate - collapsed/locked */}
      <div className="border-b border-stroke-default">
        <SectionItem icon={<LockIcon />} label="Activate" isLocked />
      </div>
      {/* Evaluate - collapsed/locked */}
      <div className="border-b border-stroke-default">
        <SectionItem icon={<LockIcon />} label="Evaluate" isLocked />
      </div>
    </Sidebar>
  ),
};

export const AllUnlocked: Story = {
  args: {
    projectName: "Campaign Alpha",
    projectSubtitle: "Demo project",
    progress: 75,
    sections: [],
  },
  render: (args) => (
    <Sidebar {...args}>
      <div className="border-b border-stroke-default">
        <SectionItem icon={<FileIcon />} label="Understand" isExpanded />
        <SubsectionItem label="Brief Overview" isActive />
        <SubsectionItem label="Research Insights" />
        <SubsectionItem label="System Map" />
      </div>
      <div className="border-b border-stroke-default">
        <SectionItem icon={<FileIcon />} label="Design" isExpanded />
        <SubsectionItem label="Strategy" />
        <SubsectionItem label="Creative Brief" />
      </div>
    </Sidebar>
  ),
};
