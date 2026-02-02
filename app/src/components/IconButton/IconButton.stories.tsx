import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { IconButton } from "./IconButton";

const ArrowLeftIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M13 8H3m0 0l4 4M3 8l4-4"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const SidebarIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="1.5" y="2" width="13" height="12" rx="2" stroke="currentColor" strokeWidth="1.5" />
    <line x1="6" y1="2" x2="6" y2="14" stroke="currentColor" strokeWidth="1.5" />
  </svg>
);

const meta = {
  title: "Primitives/IconButton",
  component: IconButton,
  tags: ["autodocs"],
} satisfies Meta<typeof IconButton>;

export default meta;
type Story = StoryObj<typeof meta>;

export const BackArrow: Story = {
  args: {
    icon: <ArrowLeftIcon />,
    label: "Go back",
  },
};

export const SidebarToggle: Story = {
  args: {
    icon: <SidebarIcon />,
    label: "Toggle sidebar",
  },
};

export const Small: Story = {
  args: {
    icon: <ArrowLeftIcon />,
    label: "Go back",
    size: "sm",
  },
};
