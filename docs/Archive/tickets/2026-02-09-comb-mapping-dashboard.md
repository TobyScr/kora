# Implement COM-B Mapping dashboard with barrier tables

## Metadata
- **Labels:** `FE`, `stage-understand`, `has-figma`, `ready-for-dev`
- **Milestone:** 1.7 Com-B & Personas
- **Assignee:** unassigned
- **Blocked by:** none

## Description
Build the COM-B Mapping dashboard — the main view for Step 7 of the Understand phase. This is where users view AI-generated behavioural barriers organised into three COM-B categories (Capability, Opportunity, Motivation). The dashboard follows the same layout pattern as the existing Brief Overview section: collapsible accordion sections in the main content area with a ProgressPanel (Kora helper) on the right.

This ticket covers the dashboard layout, barrier table component, Loading and Default states, recommended barrier highlighting, and ProgressPanel integration. It does NOT include edit/delete/add modals (future ticket) or the selection/confirmation flow (separate ticket).

## Design Reference
- Figma: https://www.figma.com/design/eeycVNYc6KVwk4cscwkPiF/v.2-Kora---Dev.-Design?node-id=549-97432&m=dev
- Screens: `COM-B Statuses` section — Loading state (`549:126366`), Default state (`549:98099`)
- Helper panel message: node `549:133273`

## Requirements
- [ ] Create a new `COMBMappingSection` component under `/src/components/COMBMapping/`
- [ ] The section renders inside the existing `brief/page.tsx` overview layout, below the Research Insights accordion
- [ ] Above the COM-B section, render collapsed `AccordionSection` components for Brief Overview, Research Insights, System Map, Behavioural Objective, and Assumption Testing — all showing green checkmarks (complete state). These already exist as components; reuse `AccordionSection` with `isComplete={true}` and collapsed by default
- [ ] The COM-B section header reads "COM-B & Personas" with a chevron to collapse/expand
- [ ] Inside the section, render a tab bar with two tabs: **"COM-B Mapping"** (active) and **"Personas"** (disabled/greyed out — future ticket)
- [ ] A **"Confirm COM-B Mapping"** button appears to the right of the tabs — disabled by default (enabled in the selection ticket)
- [ ] Below the tabs, render 3 collapsible category accordion panels:
  - **Capability** — with a `C` badge (teal/dark), subtitle: "The knowledge or skills a person needs to perform the behaviour"
  - **Opportunity** — with an `O` badge (orange), subtitle: "The social or physical conditions that make the behavior possible"
  - **Motivation** — with an `M` badge (purple), subtitle: "The thoughts and feelings that drive someone to act (or not act)"
- [ ] Each category contains a **barrier table** with columns: `#`, `Barrier`, `Description`, `Select`, `Actions`
- [ ] Each barrier row displays:
  - Row number
  - Barrier name (text, may wrap to 2 lines)
  - Description (text, may wrap)
  - Select toggle (off by default) — rendered but wired up in the selection/confirmation ticket
  - Actions column with a 3-dot icon button — rendered but non-functional (wired up in a future barriers CRUD ticket)
- [ ] **Recommended barriers** (Kora's top picks) are visually distinguished:
  - Barrier name prefixed with `*` asterisk
  - Barrier name uses highlighted/link styling (underline or colour accent per design)
- [ ] An **"+ Add more"** button appears below each category's table — rendered but non-functional (wired up in a future barriers CRUD ticket)
- [ ] **Loading state:** All 3 categories render with empty placeholder areas (no barrier rows). Use the same skeleton/pulse pattern as `BriefOverviewCard` loading state
- [ ] **Default state:** Categories populated with sample barrier data (3 barriers per category, as shown in Figma). Pre-populate with the sample data from the design
- [ ] Add a **dev toggle** (matching existing `showDevToggle` pattern in `BriefOverviewCard`) to switch between Loading and Default states
- [ ] **ProgressPanel integration:** Add a new "COM-B & Personas" section to the ProgressPanel with status "In progress" and the following Kora messages:
  - Message 1: "Great! You've now reached the last step in the Understand stage, where I'll use your research to map behavioural barriers for your target audience in a COM-B analysis and create associated personas"
  - Message 2 (after barriers appear): "Here are the key barriers of your target audience — analysed according to capability, opportunity, and motivation.\n\n**Purpose:** Prepare the behavioural foundation that will inform persona creation.\n\n**What's Next**\n1. **Select up to three barriers** that you see as most important. **The highlighted barriers are those that Kora recommends** but feel free to select your own.\n2. When you're ready, **select Confirm COM-B Mapping** to move to the next step\n\nNote: Once you confirm, the COM-B Mapping will become read-only and can't be edited further."
- [ ] Update the sidebar to show "COM-B & Personas" as the active (non-locked) subsection, with all preceding sections showing green checkmarks

## Acceptance Criteria
- [ ] Loading state renders 3 empty category panels with skeleton placeholders
- [ ] Default state renders 3 categories each with 3 sample barriers in table format
- [ ] Recommended barriers (items 1 in each category per design) show `*` prefix and highlighted name styling
- [ ] Categories are independently collapsible via chevron
- [ ] Tab bar shows "COM-B Mapping" (active) and "Personas" (disabled)
- [ ] "Confirm COM-B Mapping" button renders but is disabled
- [ ] Dev toggle switches between Loading and Default states
- [ ] ProgressPanel shows "COM-B & Personas" section with correct messages
- [ ] Sidebar shows COM-B & Personas as active, all prior sections with green checkmarks
- [ ] Desktop only (no mobile responsive required)
- [ ] No TypeScript errors, no console errors

## Edge Cases & Error States
- **Empty state:** The Loading state IS the empty state — categories shown but without data
- **Error state:** Not applicable (client-side state, no API calls)
- **Loading state:** Skeleton/pulse animation on barrier placeholder areas

## Technical Notes
- Follow existing patterns: `BriefOverviewSection` for accordion structure, `TabBar` for tabs, `AccordionSection` for collapsible panels, `ProgressPanel` for the helper panel
- State management at page level (`brief/page.tsx`), passed down as props
- Use `CardState` pattern (`loading` | `filled`) for the dev toggle
- Sample barrier data should be defined as a constant (e.g., `SAMPLE_COM_B_DATA`) for easy replacement with real API data later
- Suggested data structure:
  ```typescript
  type Barrier = {
    id: string;
    name: string;
    description: string;
    isRecommended: boolean;
    isSelected: boolean;
  };
  type COMBCategory = {
    id: "capability" | "opportunity" | "motivation";
    label: string;
    badge: string; // "C", "O", "M"
    subtitle: string;
    barriers: Barrier[];
    isExpanded: boolean;
  };
  ```

## Dependencies
- Existing components: `AccordionSection`, `ProgressPanel`, `TabBar`, `Sidebar`, `SubsectionItem`

## Notes
- The barrier table is a custom layout (not a standard HTML `<table>`), matching the Figma grid with flexible column widths
- The `*` prefix on recommended barriers is part of the display text, not a separate icon
- All 5 preceding accordion sections (Brief Overview through Assumption Testing) should render as collapsed with green checkmarks — these represent previously completed steps
