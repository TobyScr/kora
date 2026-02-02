import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { CircularProgress } from "./CircularProgress";

const meta = {
  title: "Primitives/CircularProgress",
  component: CircularProgress,
  tags: ["autodocs"],
  argTypes: {
    progress: {
      control: { type: "select" },
      options: [0, 25, 50, 75, 100],
    },
  },
} satisfies Meta<typeof CircularProgress>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Zero: Story = { args: { progress: 0 } };
export const TwentyFive: Story = { args: { progress: 25 } };
export const Fifty: Story = { args: { progress: 50 } };
export const SeventyFive: Story = { args: { progress: 75 } };
export const Complete: Story = { args: { progress: 100 } };

export const AllStates: Story = {
  args: { progress: 0 },
  render: () => (
    <div className="flex items-center gap-4">
      <CircularProgress progress={0} />
      <CircularProgress progress={25} />
      <CircularProgress progress={50} />
      <CircularProgress progress={75} />
      <CircularProgress progress={100} />
    </div>
  ),
};
