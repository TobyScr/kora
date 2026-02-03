import type { Meta, StoryObj } from "@storybook/react";
import { Typography } from "./Typography";

const meta: Meta<typeof Typography> = {
  title: "Design System/Typography",
  component: Typography,
  parameters: {
    layout: "padded",
  },
  argTypes: {
    variant: {
      control: "select",
      options: [
        "h1",
        "h2",
        "h3",
        "h4",
        "subheading-lg",
        "subheading-md",
        "subheading-sm",
        "label-lg",
        "label-md",
        "label-sm",
        "body-lg",
        "body-md",
        "body-sm",
        "body-xs",
      ],
    },
    color: {
      control: "select",
      options: ["primary", "secondary", "tertiary", "inverse"],
    },
  },
};

export default meta;
type Story = StoryObj<typeof Typography>;

const sampleText = "Almost before we knew it, we had left the ground.";

export const Playground: Story = {
  args: {
    variant: "body-md",
    color: "primary",
    children: sampleText,
  },
};

export const AllHeadings: Story = {
  render: () => (
    <div className="flex flex-col gap-6">
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-16 shrink-0">
          <Typography variant="label-sm" color="secondary">
            h1
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 40px
          </Typography>
        </div>
        <Typography variant="h1">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-16 shrink-0">
          <Typography variant="label-sm" color="secondary">
            h2
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 34px
          </Typography>
        </div>
        <Typography variant="h2">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-16 shrink-0">
          <Typography variant="label-sm" color="secondary">
            h3
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 24px
          </Typography>
        </div>
        <Typography variant="h3">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-16 shrink-0">
          <Typography variant="label-sm" color="secondary">
            h4
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Medium 20px
          </Typography>
        </div>
        <Typography variant="h4">{sampleText}</Typography>
      </div>
    </div>
  ),
};

export const AllSubheadings: Story = {
  render: () => (
    <div className="flex flex-col gap-6">
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-32 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Subheading lg
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Bold 18px
          </Typography>
        </div>
        <Typography variant="subheading-lg">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-32 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Subheading md
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Bold 16px
          </Typography>
        </div>
        <Typography variant="subheading-md">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-32 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Subheading sm
          </Typography>
        </div>
        <div className="w-24 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Bold 14px
          </Typography>
        </div>
        <Typography variant="subheading-sm">{sampleText}</Typography>
      </div>
    </div>
  ),
};

export const AllLabels: Story = {
  render: () => (
    <div className="flex flex-col gap-6">
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-24 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Label lg
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Medium 16px
          </Typography>
        </div>
        <Typography variant="label-lg">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-24 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Label md
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Medium 14px
          </Typography>
        </div>
        <Typography variant="label-md">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-24 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Label sm
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Medium 13px
          </Typography>
        </div>
        <Typography variant="label-sm">{sampleText}</Typography>
      </div>
    </div>
  ),
};

export const AllBody: Story = {
  render: () => (
    <div className="flex flex-col gap-6">
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-20 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Body lg
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 18px
          </Typography>
        </div>
        <Typography variant="body-lg">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-20 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Body md
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 16px
          </Typography>
        </div>
        <Typography variant="body-md">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-20 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Body sm
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 14px
          </Typography>
        </div>
        <Typography variant="body-sm">{sampleText}</Typography>
      </div>
      <div className="flex items-baseline gap-4 border-b border-stroke-default pb-4">
        <div className="w-20 shrink-0">
          <Typography variant="label-sm" color="secondary">
            Body xs
          </Typography>
        </div>
        <div className="w-28 shrink-0">
          <Typography variant="body-sm" color="secondary">
            Regular 12px
          </Typography>
        </div>
        <Typography variant="body-xs">{sampleText}</Typography>
      </div>
    </div>
  ),
};

export const ColorVariants: Story = {
  render: () => (
    <div className="flex flex-col gap-4">
      <Typography variant="body-md" color="primary">
        Primary text color
      </Typography>
      <Typography variant="body-md" color="secondary">
        Secondary text color
      </Typography>
      <Typography variant="body-md" color="tertiary">
        Tertiary text color
      </Typography>
      <div className="bg-text-primary p-4 rounded-lg">
        <Typography variant="body-md" color="inverse">
          Inverse text color (on dark background)
        </Typography>
      </div>
    </div>
  ),
};

export const FullScale: Story = {
  render: () => (
    <div className="flex flex-col gap-8">
      <section>
        <Typography variant="subheading-md" className="mb-4">
          Headings
        </Typography>
        <div className="flex flex-col gap-3">
          <Typography variant="h1">Heading 1</Typography>
          <Typography variant="h2">Heading 2</Typography>
          <Typography variant="h3">Heading 3</Typography>
          <Typography variant="h4">Heading 4</Typography>
        </div>
      </section>

      <section>
        <Typography variant="subheading-md" className="mb-4">
          Subheadings
        </Typography>
        <div className="flex flex-col gap-3">
          <Typography variant="subheading-lg">Subheading Large</Typography>
          <Typography variant="subheading-md">Subheading Medium</Typography>
          <Typography variant="subheading-sm">Subheading Small</Typography>
        </div>
      </section>

      <section>
        <Typography variant="subheading-md" className="mb-4">
          Labels
        </Typography>
        <div className="flex flex-col gap-3">
          <Typography variant="label-lg">Label Large</Typography>
          <Typography variant="label-md">Label Medium</Typography>
          <Typography variant="label-sm">Label Small</Typography>
        </div>
      </section>

      <section>
        <Typography variant="subheading-md" className="mb-4">
          Body
        </Typography>
        <div className="flex flex-col gap-3">
          <Typography variant="body-lg">Body Large</Typography>
          <Typography variant="body-md">Body Medium</Typography>
          <Typography variant="body-sm">Body Small</Typography>
          <Typography variant="body-xs">Body Extra Small</Typography>
        </div>
      </section>
    </div>
  ),
};
