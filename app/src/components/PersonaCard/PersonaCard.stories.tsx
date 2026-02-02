import type { Meta, StoryObj } from "@storybook/nextjs-vite";
import { PersonaCard } from "./PersonaCard";

const meta = {
  title: "Content/PersonaCard",
  component: PersonaCard,
  tags: ["autodocs"],
  decorators: [
    (Story) => (
      <div className="max-w-[500px] p-4">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof PersonaCard>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {
  args: {
    number: 1,
    name: "Farid Karimov",
    archetype: "The Proud Patriot",
    age: 22,
    gender: "Male",
    status: "Single",
    quote:
      "They call us strangers, but I'm the one building their city. When I stay silent, no one sees me; when I speak with anger, at least they listen.",
    onEdit: () => alert("Edit clicked"),
    sections: [
      {
        id: "demographics",
        label: "Demographics",
        color: "red",
        content: (
          <ul className="list-disc pl-4 space-y-1">
            <li>22 years old, Male, Single</li>
            <li>Construction worker in Moscow</li>
            <li>Originally from Dushanbe, Tajikistan</li>
          </ul>
        ),
      },
      {
        id: "psychographics",
        label: "Psychographics",
        color: "orange",
        content: (
          <ul className="list-disc pl-4 space-y-1">
            <li>Values family honor and community</li>
            <li>Feels isolated in host country</li>
            <li>Seeks belonging through cultural identity</li>
          </ul>
        ),
      },
      {
        id: "context",
        label: "Context & Media",
        color: "purple",
        content: (
          <ul className="list-disc pl-4 space-y-1">
            <li>Active on Telegram and YouTube</li>
            <li>Consumes content in Tajik and Russian</li>
            <li>Uses mobile phone primarily</li>
          </ul>
        ),
      },
    ],
  },
};

export const WithImage: Story = {
  args: {
    ...Default.args,
    imageUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop",
  },
};

export const Minimal: Story = {
  args: {
    number: 2,
    name: "Svetlana Morozova",
    archetype: "The Proud Patriot",
    age: 38,
    gender: "Female",
    status: "Married",
    quote:
      "I want to protect my children and our community, but I also know that fear and anger won't solve anything. We need to find a way forward together.",
    sections: [],
  },
};

export const MultiplePersonas: Story = {
  args: { number: 1, name: "Farid", archetype: "Patriot" },
  render: () => (
    <div className="space-y-4">
      <PersonaCard
        number={1}
        name="Farid Karimov"
        archetype="The Proud Patriot"
        age={22}
        gender="Male"
        status="Single"
        quote="They call us strangers, but I'm the one building their city."
        onEdit={() => {}}
        sections={[
          { id: "demo", label: "Demographics", color: "red" },
          { id: "psycho", label: "Psychographics", color: "orange" },
          { id: "context", label: "Context & Media", color: "purple" },
        ]}
      />
      <PersonaCard
        number={2}
        name="Svetlana Morozova"
        archetype="The Proud Patriot"
        age={38}
        gender="Female"
        status="Married"
        quote="I want to protect my children and our community."
        onEdit={() => {}}
        sections={[
          { id: "demo", label: "Demographics", color: "red" },
          { id: "psycho", label: "Psychographics", color: "orange" },
          { id: "context", label: "Context & Media", color: "purple" },
        ]}
      />
    </div>
  ),
};
