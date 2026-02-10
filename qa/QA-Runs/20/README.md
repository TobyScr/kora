## QA Result: PASS

**Issue:** #20 - System Map - Entry Point Selection & Confirmation
**Mode:** Fast QA (mobile-first, desktop spot-check)
**Date:** 2026-02-10
**App URL:** http://localhost:3002/intervention/1/brief

### Fixes Required

None.

### Passed

- **Only one entry point can be selected at a time** -- Selected card 1, then card 3; card 1 deselected automatically. Radio button behavior works correctly.
- **"Confirm Entry Point" button is disabled when no entry point is selected** -- Button showed `[disabled]` attribute before any radio was selected.
- **"Confirm Entry Point" button is enabled when an entry point is selected** -- Button became enabled immediately after selecting a radio button.
- **On confirm: section locks to read-only with green checkmark** -- Green checkmark appeared next to "System Map" header. Section showed cards in read-only state with no interactive controls.
- **On confirm: interactive controls (menus, unselected radios, add more, toggle) removed** -- Verified all removed: three-dot "Challenge actions" menus gone, radio buttons gone (except entry point indicator on selected card), "Add more" button gone, "Show Description" toggle gone, "Confirm Entry Point" button gone.
- **On confirm: section collapses** -- Section collapsed immediately after confirmation, showing only the header with green checkmark.
- **On confirm: Behavioural Objective section unlocks in sidebar** -- Sidebar showed "Behavioural Objective" as an enabled button with unfilled circle icon (next active section). "Assumption testing" and "COM-B & Personas" remained locked.
- **Confirmation cannot be undone** -- No undo/edit controls visible in confirmed state. Re-expanding the section shows read-only cards with no way to change selection or revert confirmation.
- **Helper panel updates System Map to "Complete"** -- Helper/Progress panel (right side, desktop) showed System Map with green "Complete" badge. Behavioural Objective showed "In progress" badge with guidance message for next steps.
- **No TypeScript errors** -- `npx tsc --noEmit` completed with zero errors.
- **No console errors** -- Console showed 0 errors and 0 warnings during the entire testing flow.
- **Works on desktop viewport** -- Verified at 1920x1080. Sidebar, main content, and helper panel all rendered correctly. Layout, checkmarks, badges, and read-only state all correct.

### Not Tested

None. All acceptance criteria were tested and passed.
