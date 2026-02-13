## QA Result: PASS

**Issue:** #65 - Connect Research Insights section to Xano Research endpoints
**Mode:** Fast QA (desktop only)
**Date:** 2026-02-13

### Fixes Required
> None. All success criteria passed.

### Unexpected Findings
- **Insight ordering changes after edit:** When an insight is edited and saved, the ordering of insights shifts after a page refresh. The edited insight moved from position 1 to position 7 (last). This may be expected behaviour (e.g. sorted by `updated_at` descending), but could confuse users who expect insights to stay in their original order. PM should confirm whether this is intended.
- **Mock data for Generate Insights:** The generated insights do not reflect the research text that was input. Titles like "Recruitment thrives on identity repair, not ideology" and "Mistrust and fear of surveillance silence healthy discourse" appeared regardless of the research text entered (about public health and social norms). This is acknowledged in the issue as expected ("uses mock data but persists to Xano via POST"), but worth noting for future iterations when real AI generation is connected.
- **Duplicate insight titles:** 5 of the 7 generated insights had the identical title "Mistrust and fear of surveillance silence healthy discourse". This is likely a mock data issue but would be a poor user experience if it occurred with real data.

### Passed
- **Research Insights loads real data from Xano** - After confirming Brief Overview, the Research Insights section became visible and expanded. The Existing Research tab showed input fields (text, file upload, links). The Insights tab initially showed an empty state ("Add some research first!"), which is correct for no existing data.
- **Adding a research insight and refreshing - insight persists** - Entered research text in the Existing Research tab, then clicked "Generate Insights" on the Insights tab. 7 insights were generated and displayed. After full page refresh, all 7 insights were still present with the same titles.
- **Editing a research insight and refreshing - edited value persists** - Clicked "Insight actions" on insight #1, selected "Edit Insight", changed the title to "QA EDITED: Social norms approach is more effective than fear.", clicked Save. Toast showed "Insight saved". After page refresh, the edited text was preserved (appeared as insight #7 due to re-ordering).
- **Deleting a research insight and refreshing - insight is gone** - Clicked "Insight actions" on the edited insight, selected "Delete Insight", confirmed in the deletion dialog. Toast showed "Insight deleted". Count went from 7 to 6. After page refresh, only 6 insights remained and the deleted insight was gone.
- **Confirming Research Insights - section locks, System Map accessible** - Clicked "Confirm Research Insights". The button changed to "Research Insights Confirmed" (disabled). System Map section appeared in the main content area with 8 refined challenges. System Map became clickable in the sidebar (no longer disabled). Toast showed "Research Insights confirmed".
- **Refresh after confirm - confirmed state persists** - After full page refresh, Brief Overview showed "Confirmed", Research Insights showed "Research Insights Confirmed" (disabled), System Map was visible and accessible in the sidebar, and the chat panel showed Research Insights as "Complete" and System Map as "In progress".

### Not Tested
> N/A - All success criteria were tested.
