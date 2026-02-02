import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { TabBar } from "./TabBar";

const meta = {
  title: "Content/TabBar",
  component: TabBar,
  tags: ["autodocs"],
  decorators: [
    (Story) => (
      <div className="max-w-[500px] p-4">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof TabBar>;

export default meta;
type Story = StoryObj<typeof meta>;

export const CombMapping: Story = {
  args: {
    tabs: [
      { id: "comb", label: "COM-B Mapping" },
      { id: "personas", label: "Personas" },
    ],
    activeTab: "comb",
  },
};

export const PersonasActive: Story = {
  args: {
    tabs: [
      { id: "comb", label: "COM-B Mapping" },
      { id: "personas", label: "Personas" },
    ],
    activeTab: "personas",
  },
};
