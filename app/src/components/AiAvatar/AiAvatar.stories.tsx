import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { AiAvatar } from "./AiAvatar";

const meta = {
  title: "Primitives/AiAvatar",
  component: AiAvatar,
  tags: ["autodocs"],
} satisfies Meta<typeof AiAvatar>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {};

export const Large: Story = {
  args: { size: 40 },
};

export const Small: Story = {
  args: { size: 16 },
};
