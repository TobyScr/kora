# Dev Agent — Design Workflow

> **Status:** AUTHORITATIVE
>
> This file defines how the Dev Agent works with designs when building features.
> Read this before starting any UI work.

---

## Design Source of Truth

### Priority Order

| Priority | Source | Purpose |
|----------|--------|---------|
| 1 | **Figma (via MCP)** | Primary design reference |
| 2 | **User story descriptions** | Behavior when no design exists |

---

## Figma Integration

### Every GitHub Issue Must Have a Figma Link

GitHub issues should contain a "Design Reference" section with a Figma URL:

```markdown
## Design Reference
[Screen Name (Figma)](https://www.figma.com/design/FILE_KEY/FILE_NAME?node-id=XX-XXXX&m=dev)
```

### If No Figma Link Exists

**Stop and ask the user.**

Do not:
- Guess the design
- Build based only on text descriptions
- Proceed without visual reference

Instead:
1. Note that the issue is missing a Figma link
2. Ask the user to provide the correct Figma frame
3. Wait for the link before building UI

### Using the Figma MCP

Once you have a Figma URL:

1. **Extract the node ID** from the URL
   - `node-id=57-2845` → `57:2845`

2. **Get the design screenshot:**
   ```
   mcp__figma-dev-mode__get_screenshot(nodeId: "57:2845")
   ```

3. **Get detailed design context** (layout, spacing, colors):
   ```
   mcp__figma-dev-mode__get_design_context(nodeId: "57:2845")
   ```

4. **Analyze the design thoroughly** (see checklist below)

5. **Build to match** the Figma design

### Design Analysis Checklist

When analyzing a Figma design, check ALL of the following — not just structure:

| Category | What to Look For |
|----------|------------------|
| **Layout & Structure** | Grid, columns, positioning, spacing between elements |
| **Content** | Text, icons, images, data displayed |
| **Backgrounds** | Section backgrounds, card backgrounds, container colors |
| **Borders & Dividers** | Border colors, widths, which elements have borders |
| **Shadows** | Drop shadows, inner shadows, elevation |
| **Border Radius** | Rounded corners on containers, buttons, cards |
| **Typography** | Font weights, sizes, colors, letter-spacing |
| **States** | Hover, active, disabled, loading states |

> **Common Mistake:** Focusing only on layout and content while missing visual styling like backgrounds, borders, and shadows. Always check container styling, not just the content inside.

---

## Mobile-First Development

### Figma Designs Are Mobile

All Figma designs are for mobile viewport (390×844). This is intentional.

### Build Order

1. **Build mobile first** — Match Figma exactly
2. **Expand to desktop** — Use your initiative for responsive behavior

### Responsive Guidelines

When adapting mobile designs to desktop:

- Maintain visual hierarchy
- Use appropriate max-widths (don't stretch full-width on large screens)
- Consider multi-column layouts for content that stacks on mobile
- Keep interaction patterns consistent (don't change modals to sidebars arbitrarily)

---

## Checklist Before Building UI

- [ ] GitHub issue has Figma link in "Design Reference" section
- [ ] If no Figma link → **ask user before proceeding**
- [ ] Retrieved design via Figma MCP
- [ ] Analyzed design for ALL visual details (see Design Analysis Checklist above)
- [ ] Building mobile-first (390×844)
- [ ] Have a plan for desktop adaptation

---

## Checklist When Done

- [ ] Mobile matches Figma design
- [ ] Desktop is responsive and usable
- [ ] No TypeScript errors
- [ ] No console errors
- [ ] Dev notes added to GitHub issue
