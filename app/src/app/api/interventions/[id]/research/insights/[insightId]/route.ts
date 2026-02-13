import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPatchJson, xanoDeleteJson } from "@/lib/xano";

export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ id: string; insightId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id, insightId } = await params;
  const body = await request.json();

  try {
    // Xano PATCH supports partial updates natively — only send changed fields
    const data = await xanoPatchJson(
      `/api:AJ25XedL/projects/${id}/research/insights/${insightId}`,
      body,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to update research insight";

    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}

export async function DELETE(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string; insightId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id, insightId } = await params;

  try {
    const data = await xanoDeleteJson(
      `/api:AJ25XedL/projects/${id}/research/insights/${insightId}`,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to delete research insight";

    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}
