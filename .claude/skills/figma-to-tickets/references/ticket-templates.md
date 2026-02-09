# Ticket Templates

These templates define the **issue body** content for `gh issue create --body "..."`. Labels, milestones, and assignees are set via CLI flags, not in the body.

---

## Epic Template

```markdown
## Overview
[2-3 sentences describing the feature, its purpose, and who it's for]

## Design Reference
- Figma: [URL(s)]

## Scope
### In Scope
- [Bullet list of what's included]

### Out of Scope
- [Bullet list of what's explicitly excluded]

## User Story
As a [user type], I want to [action] so that [outcome].

## Tickets
- [ ] [Ticket 1 title]
- [ ] [Ticket 2 title]
- [ ] [Ticket 3 title]

## Dependencies
- [Any blockers or prerequisites]

## Open Questions
- [Anything still unresolved after discovery]
```

---

## Feature / Story Ticket Template

```markdown
## Description
[Clear, concise description of what needs to be built. Reference the design. Explain the "why" not just the "what".]

## Design Reference
- Figma: [URL]
- Screen/Component: [Which part of the design this ticket covers]

## Requirements
- [ ] [Specific, implementable requirement]
- [ ] [Another requirement]

## Acceptance Criteria
- [ ] [Given/When/Then or plain language — must be testable]
- [ ] [...]

## Edge Cases & Error States
- **Empty state:** [What to show when there's no data]
- **Error state:** [What to show when something fails]
- **Loading state:** [What to show while loading]
- [Any other edge cases specific to this ticket]

## Technical Notes
- [Implementation hints, suggested approach, relevant existing code]
- [API endpoints needed or available]
- [Data model considerations]

## Dependencies
- [Other tickets or systems this depends on]
```

---

## Bug Fix Ticket Template

(Use when discovery reveals something existing that needs fixing)

```markdown
## Description
[What's wrong and where]

## Steps to Reproduce
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Expected Behaviour
[What should happen]

## Actual Behaviour
[What currently happens]

## Acceptance Criteria
- [ ] [How to verify the fix]

## Technical Notes
- [Root cause if known, suggested fix approach]
```

---

## Technical / Infrastructure Ticket Template

```markdown
## Description
[What technical work is needed and why]

## Requirements
- [ ] [Specific deliverable]

## Acceptance Criteria
- [ ] [How to verify this is done correctly]

## Technical Approach
[Suggested implementation strategy]

## Impact
- [What features/tickets depend on this]
- [What breaks if this isn't done]
```

---

## Writing Good Tickets — Guidelines

### Title
- Start with a verb: "Add", "Implement", "Create", "Update", "Fix"
- Be specific: "Implement user profile card component" not "Profile stuff"
- Keep under 80 characters

### Description
- Lead with **why** this exists, then **what** needs building
- Reference the design — don't make the dev guess
- A developer should be able to start work without asking questions

### Acceptance Criteria
- Every criterion must be **independently testable**
- Use "Given/When/Then" for complex behaviours
- Include both happy path AND edge cases
- If there's a visual design, "matches Figma design" is a valid criterion

### What Makes a Ticket "Development Ready"
A ticket is ready when a developer can:
1. Understand what to build without asking questions
2. Know exactly when they're "done"
3. Identify all edge cases they need to handle
4. Understand where this fits in the broader system
5. Estimate the work with reasonable confidence
