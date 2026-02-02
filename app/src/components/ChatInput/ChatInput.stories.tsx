import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { ChatInput } from "./ChatInput";

const meta = {
  title: "Chat/ChatInput",
  component: ChatInput,
  tags: ["autodocs"],
  parameters: {
    backgrounds: { default: "light" },
  },
  decorators: [
    (Story) => (
      <div className="bg-background-page p-8 flex justify-center">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof ChatInput>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {
  args: {
    placeholder: "Type here",
  },
};

export const CustomPlaceholder: Story = {
  args: {
    placeholder: "Ask Kora anything...",
  },
};
