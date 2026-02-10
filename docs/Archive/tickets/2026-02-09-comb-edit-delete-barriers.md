# Implement Edit & Delete barriers for COM-B Mapping

## Metadata
- **Labels:** `FE`, `stage-understand`, `has-figma`, `ready-for-dev`
- **Milestone:** 1.7 Com-B & Personas
- **Assignee:** unassigned
- **Blocked by:** #34 (Implement COM-B Mapping dashboard with barrier tables)

## Description
Wire up the 3-dot actions menu on each barrier row in the COM-B Mapping section to support Edit and Delete operations. Issue #34 renders the Actions column with a non-functional 3-dot icon — this ticket makes it functional by adding the dropdown menu, Edit Barrier modal, Delete Barrier confirmation modal, and success toasts.

## Design Reference
- Figma: https://www.figma.com/design/eeycVNYc6KVwk4cscwkPiF/v.2-Kora---Dev.-Design?node-id=549-97432&m=dev
- Actions dropdown menu: node `549:137219`
- Edit Barrier modal: node `549:100024`
- Delete Barrier confirmation: node `549:100039`
- Toast (saved): node `549:100034`
- Toast (deleted): node `549:100036`

## Requirements

### Actions Dropdown Menu
- [ ] Clicking the 3-dot icon on a barrier row opens a dropdown menu
- [ ] Menu has two options:
  - **"Edit Barrier"** — pencil/edit icon, standard text colour
  - **"Delete Barrier"** — trash icon, red text
- [ ] Clicking outside the menu or selecting an option closes it
- [ ] Follow the existing kebab menu pattern in `InsightItem.tsx` (useRef click-outside handler, absolute positioning)

### Edit Barrier Modal
- [ ] Selecting "Edit Barrier" opens a modal pre-filled with the barrier's current name and description
- [ ] **Barrier name field:**
  - Pre-filled with current name
  - Maximum 100 characters
  - Character counter displayed (e.g., "40 / 100")
- [ ] **Description field:**
  - Pre-filled with current description
  - No maximum character limit
  - Character counter displayed (shows current count only, e.g., "85")
- [ ] Both fields are **required** — the Save button is disabled when either field is empty
- [ ] Modal header: edit icon + "Edit Barrier" title + close (X) button
- [ ] Modal footer: "Cancel" button and "Save" button (with floppy disk icon per Figma)
- [ ] On Save: update the barrier in state, close modal, show success toast
- [ ] On Cancel / X / click outside: close modal without saving
- [ ] **Recommended barriers:** Editing a recommended barrier's name or description **keeps** the `*` prefix and highlighted styling — the `isRecommended` flag is not changed
- [ ] Follow existing patterns: `EditInsightModal`, `Modal`, `ModalHeader`, `ModalBody`, `ModalFooter`

### Delete Barrier Modal
- [ ] Selecting "Delete Barrier" opens a confirmation modal
- [ ] Modal header: red trash icon + "Delete Barrier" title in red + close (X) button
- [ ] Body text: "Are you sure you want to delete this Barrier? This action cannot be undone."
- [ ] Footer: "Cancel" button and "Delete Barrier" button (red/danger style)
- [ ] On Delete: remove the barrier from state, close modal, show success toast
- [ ] On Cancel / X / click outside: close modal without deleting
- [ ] **Row re-indexing:** After deletion, remaining barriers in the category re-number sequentially (1, 2, 3…) with no gaps
- [ ] Follow existing pattern: `DeleteInsightModal`

### Toast Notifications
- [ ] "Barrier saved successfully" — success type, shown after edit
- [ ] "Barrier deleted successfully" — success type, shown after delete
- [ ] Use existing `useToast()` hook and `showToast()` API (top-right position)

## Acceptance Criteria
- [ ] Clicking 3-dot icon on a barrier row shows the Edit/Delete dropdown menu
- [ ] Clicking outside the menu dismisses it
- [ ] Edit Barrier modal opens with pre-filled data for the selected barrier
- [ ] Barrier name enforces 100 character limit with visible counter
- [ ] Description shows character counter (no max)
- [ ] Save button is disabled when either field is empty
- [ ] Saving updates the barrier in the table and shows success toast
- [ ] Editing a recommended barrier retains its `*` prefix and highlighted styling
- [ ] Delete Barrier confirmation modal shows with red styling
- [ ] Confirming delete removes the barrier and re-indexes row numbers
- [ ] Delete shows success toast
- [ ] Cancel/X/click-outside dismisses both modals without changes
- [ ] Desktop only (no mobile responsive required)
- [ ] No TypeScript errors, no console errors

## Edge Cases & Error States
- **Editing to empty:** Save button disables if user clears a field — prevents empty barrier names or descriptions
- **Editing at character limit:** Typing stops or is truncated at 100 characters for barrier name
- **Deleting the only barrier in a category:** Category should still render with just the table header and "+ Add more" button, no barrier rows
- **Deleting a recommended barrier:** The `*` count for that category decreases; if all recommended barriers are deleted, no barriers show the highlighted style
- **Rapid actions:** Opening Edit on one barrier then quickly clicking Delete on another should not cause state conflicts — only one modal open at a time

## Technical Notes
- The 3-dot icon button is already rendered by #34 but non-functional. This ticket adds `onClick` handling and the dropdown menu
- State management: barrier updates happen at the page level in `brief/page.tsx`. Pass `onEdit` and `onDelete` callbacks down to the barrier table component
- Edit modal: wrap inner form with `key={barrier.id}` to force remount when editing different barriers (matches `EditInsightModal` pattern)
- Delete: filter the barrier out of the category's `barriers` array. Row numbers are derived from array index + 1, so re-indexing is automatic
- The `isRecommended` flag should not be modified by edit or delete operations

## Dependencies
- #34: COM-B Mapping dashboard (provides barrier tables, 3-dot icon, state structure)
- Existing components: `Modal`, `ModalHeader`, `ModalBody`, `ModalFooter`, `Toast`/`useToast`
