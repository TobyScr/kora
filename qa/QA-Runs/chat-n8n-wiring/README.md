## QA Result: PASS (with unexpected findings)

**Feature:** Brief Collection Chat - N8N Backend Wiring
**Mode:** Fast QA (desktop only)
**Date:** 2026-02-13
**Viewport:** 1920x1080

### Fixes Required

None. All core requirements pass.

### Unexpected Findings

1. **AI responses wrapped in quotation marks** - The AI responses from N8N are displayed with literal quotation marks around the entire text (e.g., `"We begin by gaining an initial understanding..."`). This appears to be the N8N workflow returning the response as a quoted JSON string rather than plain text. The frontend should strip these outer quotes, or the N8N workflow should return unquoted text.
   - **Why it matters:** Looks unpolished in the UI; users will see unnecessary quote marks around every AI message.
   - **PM action:** Confirm whether the quotes should be stripped on the frontend or fixed in the N8N workflow output.

2. **First AI response repeats the full introduction** - When the user answers question 1, the AI response repeats the entire introduction ("We begin by gaining an initial understanding of your brief. We'll walk you through 9 initial questions. 1) Who is the client or funder?...") before getting to the follow-up. This suggests the N8N workflow returns the full conversation context rather than just the incremental response.
   - **Why it matters:** Redundant text makes the chat harder to follow. The user already saw the introduction as Kora's first message.
   - **PM action:** Review N8N workflow to ensure only the new AI response text is returned, not the full conversation history.

3. **Streaming behavior not directly observable** - The test instructions mention verifying that responses stream in progressively and that the input shows "Kora is typing..." placeholder while streaming. Due to the speed of Playwright snapshot capture and the response time, the intermediate "streaming" state was not directly observed. The responses appeared fully formed by the time the page snapshot was captured. This does not mean streaming is broken - it may simply be too fast to catch in automated snapshots.
   - **Why it matters:** Cannot confirm streaming UX is working as designed from this test alone.
   - **PM action:** Manual verification recommended to confirm streaming visual feedback works as expected.

### Passed

- **Chat mode displays on fresh intervention** - Navigating to `/intervention/2/brief` correctly shows chat mode with Kora's welcome message and question 1 ("Who is the client or funder?")
- **User can send messages** - Typed "The client is the UK Government" and sent successfully. Message appears in chat history.
- **AI responses appear** - After sending user message, an AI response from Kora appears with follow-up questions.
- **Input re-enables after AI responds** - After each AI response, the text input is active and accepts new input. Send button enables when text is entered.
- **Second message works** - Sent "The core challenge is reducing youth knife crime in London" and received AI response moving to question 3 (initial objective).
- **Chat history maintained** - All messages (welcome, user 1, AI 1, user 2, AI 2) are visible in correct order.
- **Send button disabled when input empty** - Confirmed the Send button is disabled when no text is entered.
- **No "Generate Brief Overview" button** - Confirmed this button has been removed from the chat interface.
- **No console errors** - Zero errors and zero warnings in the browser console throughout the entire test session.
- **Navigation works** - Successfully navigated from intervention list to intervention 2 to the brief page.

### Not Tested

- **Streaming visual feedback** - Could not verify "Kora is typing..." placeholder or progressive text streaming due to snapshot timing. Recommend manual verification.
- **Input disabled during streaming** - Related to above; could not confirm input is disabled while AI is responding.
