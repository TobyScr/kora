import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { AccordionSection } from "./AccordionSection";

const meta = {
  title: "Content/AccordionSection",
  component: AccordionSection,
  tags: ["autodocs"],
  decorators: [
    (Story) => (
      <div className="max-w-[500px] p-4 space-y-3">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof AccordionSection>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Collapsed: Story = {
  args: {
    title: "Brief Overview",
    isComplete: true,
  },
};

export const Expanded: Story = {
  args: {
    title: "Research Insights",
    isComplete: true,
    defaultExpanded: true,
    children: (
      <div className="text-sm text-text-secondary leading-relaxed">
        <p>Research findings from the discovery phase including audience analysis, market context, and behavioral insights.</p>
      </div>
    ),
  },
};

export const WithExportPdf: Story = {
  args: {
    title: "Brief Overview",
    isComplete: true,
    onExportPdf: () => alert("Export PDF clicked"),
  },
};

export const SectionList: Story = {
  args: { title: "Section" },
  render: () => (
    <div className="space-y-3">
      <AccordionSection title="Brief Overview" isComplete onExportPdf={() => {}} />
      <AccordionSection title="Research Insights" isComplete />
      <AccordionSection title="System Map" isComplete />
      <AccordionSection title="Behavioral Objective" isComplete />
      <AccordionSection title="Assumption Testing" isComplete />
      <AccordionSection title="COM-B & Personas" defaultExpanded>
        <p className="text-sm text-text-secondary">Persona cards will go here.</p>
      </AccordionSection>
    </div>
  ),
};
