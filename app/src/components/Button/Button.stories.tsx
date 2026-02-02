import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { Button } from "./Button";

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

const meta = {
  title: "Primitives/Button",
  component: Button,
  tags: ["autodocs"],
  argTypes: {
    variant: { control: "select", options: ["solid", "outline"] },
    size: { control: "select", options: ["sm", "md"] },
  },
} satisfies Meta<typeof Button>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Solid: Story = {
  args: { variant: "solid", children: "Let's start" },
};

export const SolidWithIcon: Story = {
  args: {
    variant: "solid",
    children: "Let's start",
    icon: <ArrowRightIcon />,
  },
};

export const Outline: Story = {
  args: { variant: "outline", children: "25%" },
};

export const Small: Story = {
  args: { variant: "solid", size: "sm", children: "Submit" },
};

export const AllVariants: Story = {
  args: { children: "Button" },
  render: () => (
    <div className="flex items-center gap-4">
      <Button variant="solid">Solid</Button>
      <Button variant="solid" icon={<ArrowRightIcon />}>
        With Icon
      </Button>
      <Button variant="outline">Outline</Button>
      <Button variant="solid" size="sm">
        Small
      </Button>
    </div>
  ),
};
