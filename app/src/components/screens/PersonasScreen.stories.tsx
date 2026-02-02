import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { Sidebar } from "../Sidebar/Sidebar";
import { SectionItem } from "../Sidebar/SectionItem";
import { SubsectionItem } from "../Sidebar/SubsectionItem";
import { AccordionSection } from "../AccordionSection/AccordionSection";
import { TabBar } from "../TabBar/TabBar";
import { PersonaCard } from "../PersonaCard/PersonaCard";
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

function PersonasScreen() {
  const personaSections = [
    { id: "demographics", label: "Demographics", color: "red" as const },
    { id: "psychographics", label: "Psychographics", color: "orange" as const },
    { id: "context", label: "Context & Media", color: "purple" as const },
  ];

  return (
    <div className="flex h-full bg-background-page">
      <Sidebar projectName="Rewrite the Rules" projectSubtitle="Project name" progress={25} sections={[]}>
        <div className="border-b border-stroke-default">
          <SectionItem icon={<FileIcon />} label="Understand" isExpanded />
          <SubsectionItem label="Brief Overview" />
          <SubsectionItem label="Research Insights" />
          <SubsectionItem label="System Map" />
          <SubsectionItem label="Behavioural Objective" />
          <SubsectionItem label="Assumption testing" />
          <SubsectionItem label="COM-B & Personas" isActive />
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

      <main className="flex-1 overflow-y-auto px-8 py-6">
        <div className="max-w-[540px] mx-auto space-y-3">
          {/* Completed sections */}
          <AccordionSection title="Brief Overview" isComplete onExportPdf={() => {}} />
          <AccordionSection title="Research Insights" isComplete />
          <AccordionSection title="System Map" isComplete />
          <AccordionSection title="Behavioral Objective" isComplete />
          <AccordionSection title="Assumption Testing" isComplete />

          {/* COM-B & Personas - expanded */}
          <AccordionSection title="COM-B & Personas" defaultExpanded>
            <div className="flex items-center justify-between mb-4">
              <TabBar
                tabs={[
                  { id: "comb", label: "COM-B Mapping" },
                  { id: "personas", label: "Personas" },
                ]}
                activeTab="personas"
              />
              <div className="flex items-center gap-2">
                <Button variant="solid" size="sm">
                  Confirm Personas
                </Button>
                <button className="flex items-center gap-1 text-text-secondary text-xs cursor-pointer hover:text-text-primary">
                  Export PDF
                </button>
              </div>
            </div>

            <PersonaCard
              number={1}
              name="Farid Karimov"
              archetype="The Proud Patriot"
              age={22}
              gender="Male"
              status="Single"
              quote="They call us strangers, but I'm the one building their city. When I stay silent, no one sees me; when I speak with anger, at least they listen."
              onEdit={() => {}}
              sections={personaSections}
            />

            <PersonaCard
              number={2}
              name="Svetlana Morozova"
              archetype="The Proud Patriot"
              age={38}
              gender="Female"
              status="Married"
              quote="I want to protect my children and our community, but I also know that fear and anger won't solve anything. We need to find a way forward together."
              onEdit={() => {}}
              sections={personaSections}
            />

            <PersonaCard
              number={3}
              name="Dmitry Volkov"
              archetype="The Proud Patriot"
              age={22}
              gender="Male"
              status="Single"
              quote="They call us strangers, but I'm the one building their city. When I stay silent, no one sees me; when I speak with anger, at least they listen."
              onEdit={() => {}}
              sections={personaSections}
            />
          </AccordionSection>
        </div>
      </main>
    </div>
  );
}

const meta = {
  title: "Screens/PersonasScreen",
  component: PersonasScreen,
  parameters: {
    layout: "fullscreen",
  },
} satisfies Meta<typeof PersonasScreen>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {};
