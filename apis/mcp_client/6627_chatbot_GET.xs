// A frontend chatbot, paste the api URL into your browser to launch the chatbot.
query chatbot verb=GET {
  api_group = "MCP Client"

  input {
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    // Update this URL to your API group base url which contains the Chatbot & Auth endpoints.
    var $api_group_base_url {
      value = "https://xfqo-eeay-ik0t.p7.xano.io/api:jwozKqfW:dev"
    }
  
    // Contains the Frontend Code that the browser will render.
    util.template_engine {
      value = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>MCP Chatbot</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Google Fonts (Optional - for nicer typography) -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
            <style>
                html, body {
                    height: 100%;
                    margin: 0;
                    font-family: 'Inter', sans-serif; /* Optional: Nicer font */
                    background-color: #f8f9fa; /* Light background for the whole page */
                }
        
                body {
                    display: flex;
                    flex-direction: column;
                }
        
                /* Main container for the entire app */
                .app-container {
                    display: flex;
                    flex-direction: column;
                    height: 100%;
                    width: 100%;
                    overflow: hidden; /* Prevent body scrollbars */
                }
        
                /* Header Styling */
                .app-header {
                    background-color: #ffffff;
                    padding: 0.75rem 1.5rem;
                    border-bottom: 1px solid #dee2e6;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-shrink: 0; /* Prevent header from shrinking */
                }
                .app-header h1 {
                    font-size: 1.5rem;
                    margin-bottom: 0;
                    font-weight: 700;
                }
                #user-info {
                    font-size: 0.9em;
                    color: #495057;
                }
                 #logout-button {
                     margin-left: 15px;
                     font-size: 0.85em;
                 }
        
                /* Login Section Styling */
                #login-section {
                    flex-grow: 1; /* Takes up space before login */
                    display: flex; /* Use flex to center the card */
                    align-items: center; /* Vertical centering */
                    justify-content: center; /* Horizontal centering */
                    padding: 20px;
                }
                #login-section .card {
                    max-width: 450px; /* Limit login card width */
                    width: 100%;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                    border: none;
                }
        
                /* Chat Section Styling */
                #chat-section {
                    flex-grow: 1; /* Takes remaining vertical space */
                    display: flex;
                    flex-direction: column;
                    overflow: hidden; /* Important: contains scrolling */
                    background-color: #ffffff; /* White background for chat area */
                    display: none; /* Hide initially */
                }
        
                .chat-messages {
                    flex-grow: 1; /* Allows this area to expand and scroll */
                    overflow-y: auto; /* Enable vertical scrolling */
                    padding: 20px;
                    display: flex; /* Use flex column for messages */
                    flex-direction: column;
                    gap: 12px; /* Spacing between messages */
                }
        
                .message {
                    padding: 10px 15px;
                    border-radius: 18px; /* More rounded corners */
                    max-width: 75%; /* Limit message width */
                    word-wrap: break-word;
                    line-height: 1.4;
                    box-shadow: 0 1px 2px rgba(0,0,0,0.05); /* Subtle shadow */
                }
        
                .message.user {
                    background-color: #007bff;
                    color: white;
                    align-self: flex-end;
                    border-bottom-right-radius: 5px; /* Slightly different shape */
                    margin-left: auto; /* Ensure right alignment */
                }
        
                .message.assistant {
                    background-color: #e9ecef;
                    color: #212529;
                    align-self: flex-start;
                    border-bottom-left-radius: 5px; /* Slightly different shape */
                    margin-right: auto; /* Ensure left alignment */
                }
        
                 /* System messages (like initial greeting or errors) */
                .message.system {
                    background-color: #f8f9fa; /* Very light background */
                    color: #6c757d; /* Muted text color */
                    align-self: center; /* Center align system messages */
                    text-align: center;
                    font-style: italic;
                    font-size: 0.9em;
                    max-width: 90%;
                    border: 1px solid #dee2e6; /* Subtle border */
                     box-shadow: none; /* No shadow for system messages */
                }
        
                /* Tool Info Styling (within assistant messages) */
                .tool-info {
                    margin-top: 10px;
                    padding: 10px;
                    background-color: rgba(0, 0, 0, 0.03); /* Slightly darker background inside message */
                    border-radius: 8px;
                    font-size: 0.85em;
                    font-family: monospace; /* Better for code/JSON */
                    white-space: pre-wrap;
                    word-break: break-all;
                    border: 1px solid rgba(0,0,0,0.05);
                }
                 .tool-info strong {
                     display: block;
                     margin-bottom: 5px;
                     font-weight: 600;
                     font-family: 'Inter', sans-serif; /* Back to normal font for title */
                 }
        
                /* Chat Input Area Styling */
                .chat-input-area {
                    padding: 15px 20px;
                    border-top: 1px solid #dee2e6;
                    background-color: #f8f9fa; /* Slightly different background */
                    flex-shrink: 0; /* Prevent input area from shrinking */
                }
                 .chat-input-area .form-control {
                     border-radius: 20px; /* Rounded input */
                     padding: 10px 15px;
                 }
                 .chat-input-area .btn {
                     border-radius: 20px; /* Rounded button */
                     padding: 10px 20px;
                     font-weight: 500;
                 }
        
                /* Typing Indicator */
                .typing-indicator {
                    align-self: flex-start;
                    font-style: italic;
                    color: #6c757d;
                    font-size: 0.9em;
                    padding: 5px 15px;
                }
        
            </style>
        </head>
        <body>
        
            <div class="app-container">
                <header class="app-header">
                    <h1>MCP Chatbot</h1>
                    <div id="user-info">
                        <!-- User info and logout button will appear here -->
                    </div>
                </header>
        
                <section id="login-section">
                    <div class="card">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="card-title text-center mb-4">Login</h3>
                            <div id="login-error" class="alert alert-danger d-none" role="alert"></div>
                            <form onsubmit="event.preventDefault(); handleLogin();"> <!-- Prevent default form submission -->
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="email" value="testuser@example.com" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" value="password" required>
                                </div>
                                <button id="login-button" type="submit" class="btn btn-primary w-100">Login</button>
                            </form>
                        </div>
                    </div>
                </section>
        
                <section id="chat-section">
                     <div id="chat-messages" class="chat-messages">
                         <!-- Messages will appear here -->
                     </div>
                     <div class="chat-input-area d-flex align-items-center">
                         <input type="text" class="form-control me-2" id="message-input" placeholder="Type your message..." autocomplete="off">
                         <button id="send-button" class="btn btn-primary">Send</button>
                     </div>
                </section>
            </div>
        
            <!-- Bootstrap Bundle JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        
            <script>
                // --- Configuration ---
                const XANO_API_BASE_URL = "{{ $var.api_group_base_url }}";
                const LOGIN_URL = `${XANO_API_BASE_URL}/auth/login`;
                const ME_URL = `${XANO_API_BASE_URL}/auth/me`;
                const CHATBOT_URL = `${XANO_API_BASE_URL}/chatbot`;
        
                // --- Global State ---
                let authToken = localStorage.getItem('authToken') || null;
                let conversationHistory = [];
                const SYSTEM_PROMPT = "You are a helpful chatbot that interacts with the user.";
        
                // --- DOM Elements ---
                const loginSection = document.getElementById('login-section');
                const chatSection = document.getElementById('chat-section');
                const emailInput = document.getElementById('email');
                const passwordInput = document.getElementById('password');
                const loginButton = document.getElementById('login-button');
                const loginErrorDiv = document.getElementById('login-error');
                const userInfoDiv = document.getElementById('user-info');
                const chatMessagesDiv = document.getElementById('chat-messages');
                const messageInput = document.getElementById('message-input');
                const sendButton = document.getElementById('send-button');
        
                // --- Utility Functions ---
                function showLogin() {
                    loginSection.style.display = 'flex'; // Use flex to keep centering
                    chatSection.style.display = 'none';
                    userInfoDiv.innerHTML = ''; // Clear user info in header
                    chatMessagesDiv.innerHTML = ''; // Clear chat
                    conversationHistory = []; // Clear history
                    if (authToken) { // Clear token if we are showing login explicitly
                        authToken = null;
                        localStorage.removeItem('authToken');
                    }
                }
        
                function showChat(userName) {
                     loginSection.style.display = 'none';
                     chatSection.style.display = 'flex'; // Use flex for chat layout
                     // Update header with user info and logout button
                     userInfoDiv.innerHTML = `
                         Logged in as: <strong>${userName}</strong>
                         <button id="logout-button" class="btn btn-sm btn-outline-secondary">Logout</button>
                     `;
                     // Add event listener to the newly created logout button
                     document.getElementById('logout-button').addEventListener('click', handleLogout);
        
                     // Clear previous messages and add initial system message
                     chatMessagesDiv.innerHTML = '';
                     displayMessage({
                         role: 'system',
                         content: 'Hello! I am your chatbot. How can I help you today?'
                    });
                }
        
                function displayMessage(message) {
                    // Remove typing indicator if it exists
                    removeTypingIndicator();
        
                    const messageElement = document.createElement('div');
                    messageElement.classList.add('message', message.role);
        
                    // Sanitize content before setting textContent to prevent potential XSS
                    // (though less critical here as we control the source, it's good practice)
                    const textNode = document.createTextNode(message.content);
                    messageElement.appendChild(textNode);
        
                     // Add tool call info if available (only for assistant messages)
                     if (message.role === 'assistant' && (message.tool_args || message.tool_response)) {
                         const toolInfoDiv = document.createElement('div');
                         toolInfoDiv.classList.add('tool-info');
                         let toolContent = '';
                         if (message.tool_args) {
                              toolContent += `<strong>Tool Args:</strong>\n${JSON.stringify(message.tool_args, null, 2)}`;
                         }
                         if (message.tool_response) {
                              if (message.tool_args) toolContent += '\n\n'; // Add spacing if both are present
                              toolContent += `<strong>Tool Response:</strong>\n${JSON.stringify(message.tool_response, null, 2)}`;
                         }
                         // Use createTextNode for the JSON content as well for consistency
                         toolInfoDiv.appendChild(document.createTextNode(toolContent));
                         // We need to set innerHTML for the <strong> tags though, or parse/reconstruct
                         toolInfoDiv.innerHTML = toolContent.replace(/\n/g, '<br/>'); // Render newlines correctly
                         // Re-add the strong tags properly if needed, or style via CSS selectors
        
                         // Safer approach: Create elements for structure
                         toolInfoDiv.innerHTML = ''; // Clear previous content
                         if (message.tool_args) {
                             const strongArgs = document.createElement('strong');
                             strongArgs.textContent = 'Tool Args:';
                             const preArgs = document.createElement('pre');
                             preArgs.style.margin = '0'; // Reset pre margin
                             preArgs.textContent = JSON.stringify(message.tool_args, null, 2);
                             toolInfoDiv.appendChild(strongArgs);
                             toolInfoDiv.appendChild(preArgs);
                         }
                         if (message.tool_response) {
                             if (message.tool_args) toolInfoDiv.appendChild(document.createElement('br'));
                             const strongResp = document.createElement('strong');
                             strongResp.textContent = 'Tool Response:';
                             const preResp = document.createElement('pre');
                             preResp.style.margin = '0'; // Reset pre margin
                             preResp.textContent = JSON.stringify(message.tool_response, null, 2);
                             toolInfoDiv.appendChild(strongResp);
                             toolInfoDiv.appendChild(preResp);
                         }
        
        
                         messageElement.appendChild(toolInfoDiv);
                     }
        
        
                    chatMessagesDiv.appendChild(messageElement);
                    // Auto-scroll to the latest message
                    scrollToBottom();
                }
        
                function scrollToBottom() {
                    chatMessagesDiv.scrollTop = chatMessagesDiv.scrollHeight;
                }
        
                function showLoginError(message) {
                    loginErrorDiv.textContent = message;
                    loginErrorDiv.classList.remove('d-none');
                }
        
                 function hideLoginError() {
                     loginErrorDiv.classList.add('d-none');
                 }
        
                function addTypingIndicator() {
                    // Remove existing indicator first
                    removeTypingIndicator();
                    const typingDiv = document.createElement('div');
                    typingDiv.classList.add('typing-indicator');
                    typingDiv.id = 'typing-indicator';
                    typingDiv.textContent = 'Assistant is typing...';
                    chatMessagesDiv.appendChild(typingDiv);
                    scrollToBottom(); // Scroll to indicator
                }
        
                function removeTypingIndicator() {
                    const typingDiv = document.getElementById('typing-indicator');
                    if (typingDiv) {
                        typingDiv.remove();
                    }
                }
        
                // --- API Calls ---
        
                async function handleLogin() {
                    hideLoginError();
                    const email = emailInput.value;
                    const password = passwordInput.value;
        
                    if (!email || !password) {
                        showLoginError("Please enter email and password.");
                        return;
                    }
        
                    loginButton.disabled = true;
                    loginButton.textContent = 'Logging in...'; // Provide feedback
        
                    try {
                        const response = await fetch(LOGIN_URL, {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ email, password }),
                        });
                        const data = await response.json();
        
                        if (response.ok) {
                            authToken = data.authToken;
                            localStorage.setItem('authToken', authToken);
                            await fetchUserInfo();
                        } else {
                            const errorMessage = data.message || 'Login failed.';
                            showLoginError(errorMessage);
                        }
                    } catch (error) {
                        console.error('Login Error:', error);
                        showLoginError('An unexpected error occurred during login.');
                    } finally {
                        loginButton.disabled = false;
                        loginButton.textContent = 'Login'; // Restore button text
                    }
                }
        
                async function fetchUserInfo() {
                     if (!authToken) {
                         showLogin();
                         return;
                     }
        
                     try {
                         const response = await fetch(ME_URL, {
                             method: 'GET',
                             headers: { 'Authorization': `Bearer ${authToken}` },
                         });
        
                         if (response.ok) {
                             const user = await response.json();
                             // Use name, fallback to email for display
                             showChat(user.name || user.email || 'User');
                         } else if (response.status === 401) {
                             showLogin();
                             showLoginError("Session expired. Please login again.");
                         } else {
                             console.error('Fetch User Error:', response.status, await response.text());
                              showLoginError("Could not retrieve user information.");
                              showLogin(); // Force login if user info fails
                         }
                     } catch (error) {
                         console.error('Fetch User Error:', error);
                          showLoginError("An error occurred fetching user info.");
                          showLogin(); // Force login on network or other errors
                     }
                }
        
                async function sendMessage() {
                    const userMessage = messageInput.value.trim();
                    if (!userMessage || sendButton.disabled) { // Prevent double sending
                        return;
                    }
        
                    if (!authToken) {
                         showLoginError("Your session has expired. Please login again.");
                         showLogin();
                         return;
                    }
        
                    displayMessage({ role: 'user', content: userMessage });
                    messageInput.value = '';
                    sendButton.disabled = true; // Disable send button immediately
                    messageInput.disabled = true; // Optionally disable input too
                    addTypingIndicator();
        
                    // Add user message to history *before* sending API request
                    conversationHistory.push({ role: 'user', content: userMessage });
        
                    try {
                        const response = await fetch(CHATBOT_URL, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Authorization': `Bearer ${authToken}`,
                            },
                            body: JSON.stringify({
                                user_query: userMessage,
                                // Send a *copy* or limited history if needed
                                conversation: conversationHistory,
                                system_prompt: SYSTEM_PROMPT
                            }),
                        });
        
                        const data = await response.json();
                        removeTypingIndicator(); // Remove before displaying response
        
                        if (response.ok) {
                            const assistantMessage = {
                                role: 'assistant',
                                content: data.assistant,
                                tool_args: data.tool_args, // Include tool info if present
                                tool_response: data.tool_response
                            };
                            conversationHistory.push(assistantMessage); // Add assistant response to history
                            displayMessage(assistantMessage); // Display assistant response
        
                            // Optional History Cap: Keep last N pairs (user + assistant) + 1 system
                            const MAX_HISTORY_PAIRS = 10;
                            if (conversationHistory.length > MAX_HISTORY_PAIRS * 2) {
                                 // Keep the last X messages (make sure it's an even number if pairing matters)
                                 conversationHistory = conversationHistory.slice(-(MAX_HISTORY_PAIRS * 2));
                            }
        
                        } else if (response.status === 401) {
                            authToken = null; // Clear invalid token
                            localStorage.removeItem('authToken');
                            showLogin();
                            showLoginError("Session expired during chat. Please login again.");
                        } else {
                            console.error('Chatbot Error:', response.status, data);
                            displayMessage({ role: 'system', content: `Error: ${data.message || 'Could not get response.'}` });
                            // Remove the last user message from history if the API call failed badly
                            conversationHistory.pop();
                        }
        
                    } catch (error) {
                        console.error('Chatbot Error:', error);
                        removeTypingIndicator();
                        displayMessage({ role: 'system', content: 'An unexpected network error occurred.' });
                         // Remove the last user message from history on network error
                         conversationHistory.pop();
                    } finally {
                         sendButton.disabled = false; // Re-enable send button
                         messageInput.disabled = false; // Re-enable input
                         messageInput.focus(); // Focus input for next message
                    }
                }
        
                function handleLogout() {
                     console.log("Logout requested");
                     showLogin(); // This function now handles clearing state and showing login UI
                }
        
                // --- Event Listeners ---
                // Login form submission handled by form's onsubmit attribute calling handleLogin()
        
                sendButton.addEventListener('click', sendMessage);
                messageInput.addEventListener('keypress', function(event) {
                    if (event.key === 'Enter' && !event.shiftKey) { // Send on Enter, allow Shift+Enter for newline
                        event.preventDefault();
                        sendMessage();
                    }
                });
        
                // --- Initial Check ---
                if (authToken) {
                     fetchUserInfo(); // Try to resume session
                } else {
                     showLogin(); // Show login if no token
                }
        
            </script>
        
        </body>
        </html>
        """
    } as $webpage_output
  
    util.set_header {
      value = "Content-Type: text/html; charset=UTF-8"
      duplicates = "replace"
    }
  }

  response = $webpage_output
}