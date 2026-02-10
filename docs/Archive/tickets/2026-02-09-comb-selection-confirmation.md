# Implement barrier selection and COM-B Mapping confirmation

## Metadata
- **Labels:** `FE`, `stage-understand`, `has-figma`, `ready-for-dev`
- **Milestone:** 1.7 Com-B & Personas
- **Assignee:** unassigned
- **Blocked by:** "Implement COM-B Mapping dashboard with barrier tables"

## Description
Enable users to select up to 3 barriers across all COM-B categories and confirm the COM-B Mapping to lock the section. Selection is done via toggle switches on each barrier row. Users can select any combination of barriers from Capability, Opportunity, and Motivation (no cross-category requirements). Confirming makes the entire COM-B section read-only and unlocks the Personas tab (tab only — Personas content is a future ticket).

This also includes designing and implementing a small "max selection reached" modal that appears when the user tries to toggle a 4th barrier.

## Design Reference
- Figma: https://www.figma.com/design/eeycVNYc6KVwk4cscwkPiF/v.2-Kora---Dev.-Design?node-id=549-97432&m=dev
- Screens: `COM-B Selection and Confirmation` section
- Selection state (barriers toggled on): node `549:150357`
- Confirmed/read-only state: node `549:153611` and `549:98737`
- Post-confirmation Kora message: node `549:133273`

## Requirements

### Selection Logic
- [ ] Each barrier row has a **select toggle** (on/off switch)
- [ ] Users can select barriers from **any** category — all C, all O, one from each, etc.
- [ ] **Maximum of 3 barriers** can be selected at any time across all categories
- [ ] When a user tries to toggle a 4th barrier, show a **"Maximum barriers selected" modal**:
  - Title: "Selection limit reached"
  - Body: "You can select a maximum of 3 barriers. Please deselect an existing barrier before selecting a new one."
  - Single "OK" button to dismiss
  - (This is a new design — no Figma reference exists. Keep it minimal and consistent with existing modal styling.)
- [ ] Users can deselect barriers freely by toggling them off
- [ ] The selected state is visually indicated by the toggle being in the "on" position (filled/coloured)

### Confirm Button
- [ ] The **"Confirm COM-B Mapping"** button in the tab bar area:
  - Is **disabled** when 0 barriers are selected
  - Becomes **enabled** when 1-3 barriers are selected
  - Styled as a solid/primary button when enabled, muted when disabled

### Confirmation Flow
- [ ] Clicking "Confirm COM-B Mapping" triggers:
  1. The entire COM-B Mapping section becomes **read-only**:
     - All select toggles become disabled (retain their on/off visual state but not interactive)
     - The Actions column (3-dot menu) is hidden or disabled on all barrier rows (if wired up by then)
     - The "+ Add more" buttons are hidden (if wired up by then)
     - The "Confirm COM-B Mapping" button is hidden or replaced with a checkmark/confirmed indicator
  2. The **Personas tab** becomes enabled (clickable) in the tab bar — but shows an empty/placeholder state when clicked (content is a future ticket)
  3. A **new message** is added to the ProgressPanel Kora chat:
     - The COM-B & Personas section status updates from "In progress" to "Complete" (or a relevant transition message)
  4. The section is **permanently locked** — no mechanism to revert confirmation

### Read-Only State
- [ ] In confirmed state, barrier names and descriptions are still visible but not editable
- [ ] Selected barriers retain their toggle "on" visual
- [ ] Unselected barriers retain their toggle "off" visual
- [ ] No interactive elements remain in the barrier tables (no hover states on action buttons, no clickable toggles)

## Acceptance Criteria
- [ ] Toggling a barrier's select switch updates it visually and tracks the selection in state
- [ ] Selecting a 4th barrier shows the "Selection limit reached" modal instead of toggling
- [ ] Dismissing the modal does not change any selection state
- [ ] Deselecting a barrier decrements the selection count, allowing another to be selected
- [ ] "Confirm COM-B Mapping" button is disabled with 0 selections
- [ ] "Confirm COM-B Mapping" button is enabled with 1, 2, or 3 selections
- [ ] Clicking Confirm makes all barrier tables read-only (toggles disabled, actions and add buttons hidden where applicable)
- [ ] Personas tab becomes clickable after confirmation
- [ ] ProgressPanel updates with confirmation status
- [ ] Confirmation is permanent — no undo mechanism
- [ ] No TypeScript errors, no console errors

## Edge Cases & Error States
- **Selecting exactly 3:** All other toggles should still render but hitting one shows the limit modal
- **Deselecting after reaching 3:** Toggling off one of the 3 should allow selecting a different one
- **Confirming with 1 barrier:** Valid — minimum is 1, maximum is 3
- **Rapid toggling:** Ensure state updates are synchronous and don't allow race conditions where 4+ end up selected

## Technical Notes
- Selection state is managed at the page level alongside the `COMBCategory` state
- Track `selectedCount` as a derived value from the barrier data (`barriers.filter(b => b.isSelected).length` across all categories)
- The "max selection" modal is a simple informational modal — reuse the base `Modal` component with a single "OK" button
- For the read-only state, add a `isConfirmed` boolean at the COM-B section level. When true:
  - Pass `readOnly={true}` to barrier tables
  - Conditionally hide Actions column and Add buttons
  - Disable toggles via `disabled` prop
- Personas tab: when clicked in confirmed state, render a simple placeholder (e.g., "Personas — coming soon" or an empty state). Do NOT build Personas content.
- Consider adding a `COMBState` type: `"loading" | "default" | "confirmed"` to manage the overall section state

## Dependencies
- COM-B Mapping dashboard ticket must be complete
- Edit/Delete and Add barriers are a separate future ticket and NOT a dependency — this ticket works with the sample data from the dashboard ticket

## Notes
- The "Selection limit reached" modal is new — not in Figma. Design it to match existing modal patterns (same border-radius, padding, button styles, typography). Keep it simple: title, body text, single button.
- Personas tab content is explicitly out of scope. Only the tab becoming clickable is in scope.
- There is no "unconfirm" or "revert" action — confirmation is permanent for regular users.
