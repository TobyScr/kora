import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id } = await params;
  const body = await request.json();
  const { message, sessionId } = body as {
    message: string;
    sessionId: string;
  };

  const n8nBase = process.env.N8N_WEBHOOK_BASE;

  if (!n8nBase) {
    // Mock fallback when N8N is not configured
    const mockStream = new ReadableStream({
      start(controller) {
        controller.enqueue(
          new TextEncoder().encode(
            "Thank you! I've noted that down. What's your next answer?"
          )
        );
        controller.close();
      },
    });

    return new Response(mockStream, {
      headers: { "Content-Type": "text/plain; charset=utf-8" },
    });
  }

  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 60000);

  try {
    const n8nResponse = await fetch(
      `${n8nBase}/webhook/kora_chat_new`,
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          user_input: message,
          chat: sessionId,
          intervention_id: parseInt(id, 10),
          data_source: "dev",
        }),
        signal: controller.signal,
      }
    );

    if (!n8nResponse.ok) {
      return NextResponse.json(
        { error: "N8N request failed" },
        { status: n8nResponse.status }
      );
    }

    if (!n8nResponse.body) {
      return NextResponse.json(
        { error: "No response body from N8N" },
        { status: 502 }
      );
    }

    // Convert NDJSON stream to plain text stream
    const reader = n8nResponse.body.getReader();
    const decoder = new TextDecoder();
    const encoder = new TextEncoder();
    let buffer = "";

    const plainTextStream = new ReadableStream({
      async pull(streamController) {
        try {
          const { done, value } = await reader.read();

          if (done) {
            // Process any remaining buffer
            if (buffer.trim()) {
              for (const line of buffer.split("\n")) {
                const trimmed = line.trim();
                if (!trimmed) continue;
                try {
                  const parsed = JSON.parse(trimmed);
                  if (parsed.type === "item" && parsed.content) {
                    streamController.enqueue(encoder.encode(parsed.content));
                  }
                } catch {
                  // Skip unparseable lines
                }
              }
            }
            streamController.close();
            return;
          }

          buffer += decoder.decode(value, { stream: true });

          // Process complete lines
          const lines = buffer.split("\n");
          // Keep the last (potentially incomplete) line in buffer
          buffer = lines.pop() || "";

          for (const line of lines) {
            const trimmed = line.trim();
            if (!trimmed) continue;
            try {
              const parsed = JSON.parse(trimmed);
              if (parsed.type === "item" && parsed.content) {
                streamController.enqueue(encoder.encode(parsed.content));
              }
            } catch {
              // Skip unparseable lines
            }
          }
        } catch (error) {
          streamController.error(error);
        }
      },
      cancel() {
        reader.cancel();
      },
    });

    return new Response(plainTextStream, {
      headers: { "Content-Type": "text/plain; charset=utf-8" },
    });
  } catch (error) {
    const errorMessage =
      error instanceof Error ? error.message : "Failed to connect to chat service";
    return NextResponse.json({ error: errorMessage }, { status: 500 });
  } finally {
    clearTimeout(timeout);
  }
}
