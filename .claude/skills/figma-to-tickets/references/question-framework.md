# Discovery Question Framework

Every category below MUST be covered during the discovery phase. Questions should be **specific to the designs provided** — not generic checklists.

## 1. Purpose & Context

- What is this feature/screen for? What problem does it solve?
- Who is the primary user?
- Where does this fit in the broader product? What comes before/after it?
- Is this net-new or a redesign of something existing?

## 2. UX Flow & Navigation

- How does the user arrive at this screen?
- What are all the exit points? (Where can the user go from here?)
- Is there a specific flow order, or can screens be accessed independently?
- Are there any back/cancel/undo behaviours to define?
- What happens on browser back / swipe back?
- Are there any modals, drawers, or overlays implied? What triggers them?

## 3. Error & Empty States

- What does this screen look like with **no data**? (First-time user, empty list, etc.)
- What happens when a **network request fails**?
- What are the **validation rules** for any input fields?
- What does **inline error feedback** look like? (Where, what message, when does it clear?)
- What happens on **timeout**?
- Is there a **retry** mechanism?
- What if the user **doesn't have permission** to see this?

## 4. Loading & Transition States

- What does the **loading state** look like? (Skeleton, spinner, shimmer?)
- Are there **optimistic updates** or does the UI wait for server confirmation?
- Any **animations or transitions** between states?
- What about **partial loading**? (Some data loads faster than others)

## 5. Responsive Behaviour

- The design shows [mobile/desktop/both] — what about the other breakpoints?
- Do any components **reorder, stack, or hide** at different sizes?
- Is there a **minimum supported width**?
- Any **touch-specific** interactions? (Swipe, long press, pull to refresh)
- Any **desktop-specific** interactions? (Hover states, right-click, keyboard shortcuts)

## 6. Data & API

- What **data** is displayed? Where does it come from?
- Are there **API endpoints** that already exist, or do they need to be built?
- What is the **data model/schema** implied by this design?
- How **fresh** does the data need to be? (Real-time, polling, on-demand refresh?)
- Is there **pagination, infinite scroll, or "load more"**?
- What are realistic **data limits**? (Max items, max text length, etc.)
- Is any data **cached**?

## 7. Authentication & Permissions

- Does the user need to be **logged in** to see this?
- Are there **role-based differences** in what's shown? (Admin vs regular user)
- Are any actions **restricted** to certain roles?
- What does the **unauthenticated** experience look like?

## 8. Interactions & Behaviour

- What is **clickable/tappable**? (Not always obvious from static designs)
- Are there **hover states, active states, focus states** for interactive elements?
- Is there **drag and drop**?
- Any **keyboard navigation** requirements? (Tab order, shortcuts)
- Are there **confirmation dialogs** for destructive actions?
- Any **debouncing or throttling** for search/filter inputs?

## 9. Content & Copy

- Is the **copy final** or placeholder? (Especially for headings, labels, CTAs)
- Is there any **dynamic content** that could vary in length? How should overflow be handled? (Truncation, wrapping, tooltip?)
- Is **internationalisation (i18n)** a consideration?
- Are there **character limits** on any inputs?

## 10. Dependencies & Scope Boundaries

- Does this depend on **other features** being built first?
- Is there anything in the design that's **out of scope** for now?
- Are there **third-party integrations** implied? (Payment, maps, auth providers, etc.)
- Any **feature flags** or **A/B testing** considerations?

## 11. Non-Functional Requirements

- Any **performance** expectations? (Load time, animation frame rate)
- **Accessibility** requirements? (WCAG level, screen reader support, contrast ratios)
- **Analytics/tracking** events to fire?
- **SEO** considerations? (If web-based)

## Asking Good Questions

**DO:**
- "I see a search bar on the list screen — should it filter client-side or make API calls? Is there a debounce?"
- "The card shows a status badge — what are all possible statuses and their colours?"
- "There's a delete icon on each row — is there a confirmation step?"

**DON'T:**
- "Are there any edge cases?" (too vague)
- "What about error handling?" (not specific enough)
- "Any other requirements?" (lazy — dig deeper)
