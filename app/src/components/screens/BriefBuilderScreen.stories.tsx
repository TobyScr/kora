import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { Sidebar } from "../Sidebar/Sidebar";
import { SectionItem } from "../Sidebar/SectionItem";
import { SubsectionItem } from "../Sidebar/SubsectionItem";
import { ChatBubble } from "../ChatBubble/ChatBubble";
import { ChatInput } from "../ChatInput/ChatInput";

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

function BriefBuilderScreen() {
  return (
    <div className="flex h-full bg-background-surface-0">
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

      <main className="flex-1 flex flex-col relative overflow-hidden">
        {/* Chat area */}
        <div className="flex-1 flex flex-col gap-6 items-center overflow-y-auto px-10 pt-16 pb-40">
          <ChatBubble variant="ai">
            <div>
              <p>Thank you!</p>
              <ol className="list-decimal pl-6 mt-2">
                <li>
                  <strong>What&apos;s the available timeline?</strong> (e.g., &quot;campaign is live
                  over 6 months&quot;; &quot;1-4 months&quot;)
                </li>
              </ol>
            </div>
          </ChatBubble>

          <ChatBubble variant="user">6 Months</ChatBubble>

          <ChatBubble variant="ai">
            <div>
              <p>Thank you!</p>
              <ol className="list-decimal pl-6 mt-2" start={9}>
                <li>
                  <strong>What are the expected deliverables</strong> — if you know them at this
                  time? (e.g., &quot;integrated campaign with 1 hero video&quot;)
                </li>
              </ol>
            </div>
          </ChatBubble>

          <ChatBubble variant="user">
            Integrated campaign with digital and offline content/activations
          </ChatBubble>

          <ChatBubble variant="ai">
            <div>
              <p>
                Thank you! I have three short{" "}
                <strong>follow-up questions to clarify or refine</strong> areas that could impact
                later design decisions.
              </p>
              <ol className="list-decimal pl-6 mt-2 space-y-1">
                <li>
                  Are there specific diaspora locations (e.g., Russia, Turkey, EU countries) that
                  should be prioritized for the campaign?
                </li>
                <li>
                  Would you like the behavior-change focus to emphasize prevention, disengagement, or
                  resilience-building?
                </li>
                <li>
                  Should this campaign use local languages (Tajik, Uzbek, Russian) or operate
                  primarily in English?
                </li>
              </ol>
              <p className="mt-2">
                Would you like to answer these to refine the brief before I lock it?
              </p>
            </div>
          </ChatBubble>
        </div>

        {/* Input bar */}
        <div className="absolute bottom-6 left-1/2 -translate-x-1/2">
          <ChatInput placeholder="Type here" />
        </div>
      </main>
    </div>
  );
}

const meta = {
  title: "Screens/BriefBuilderScreen",
  component: BriefBuilderScreen,
  parameters: {
    layout: "fullscreen",
  },
} satisfies Meta<typeof BriefBuilderScreen>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {};
