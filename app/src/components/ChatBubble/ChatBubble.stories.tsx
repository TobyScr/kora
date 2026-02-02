import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { ChatBubble } from "./ChatBubble";

const meta = {
  title: "Chat/ChatBubble",
  component: ChatBubble,
  tags: ["autodocs"],
  parameters: {
    backgrounds: { default: "light" },
  },
  decorators: [
    (Story) => (
      <div className="flex flex-col gap-6 items-center p-8 max-w-[800px]">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof ChatBubble>;

export default meta;
type Story = StoryObj<typeof meta>;

export const AiMessage: Story = {
  args: {
    variant: "ai",
    children: (
      <p>
        Thank you! I have three short <strong>follow-up questions to clarify or refine</strong> areas
        that could impact later design decisions.
      </p>
    ),
  },
};

export const UserMessage: Story = {
  args: {
    variant: "user",
    children: "6 Months",
  },
};

export const AiWithList: Story = {
  args: {
    variant: "ai",
    children: (
      <div>
        <p>Thank you!</p>
        <ol className="list-decimal pl-6 mt-2 space-y-1">
          <li>
            <strong>What&apos;s the available timeline?</strong> (e.g., &quot;campaign is live over
            6 months&quot;; &quot;1-4 months&quot;)
          </li>
        </ol>
      </div>
    ),
  },
};

export const Conversation: Story = {
  args: { variant: "ai", children: "" },
  render: () => (
    <div className="flex flex-col gap-6 w-full max-w-[700px]">
      <ChatBubble variant="ai">
        <p>
          Thank you! <strong>What&apos;s the available timeline?</strong> (e.g., &quot;campaign is
          live over 6 months&quot;)
        </p>
      </ChatBubble>
      <ChatBubble variant="user">6 Months</ChatBubble>
      <ChatBubble variant="ai">
        <p>
          Thank you! <strong>What are the expected deliverables</strong> — if you know them at this
          time?
        </p>
      </ChatBubble>
      <ChatBubble variant="user">
        Integrated campaign with digital and offline content/activations
      </ChatBubble>
    </div>
  ),
};
