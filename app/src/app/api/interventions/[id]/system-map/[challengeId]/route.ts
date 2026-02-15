import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPatchJson, xanoDeleteJson } from "@/lib/xano";

export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ id: string; challengeId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id, challengeId } = await params;
  const body = await request.json();

  try {
    const data = await xanoPatchJson(
      `/api:5Y7Ik5Qs/projects/${id}/system-map/${challengeId}`,
      body,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to update system map challenge";

    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}

export async function DELETE(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string; challengeId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id, challengeId } = await params;

  try {
    const data = await xanoDeleteJson(
      `/api:5Y7Ik5Qs/projects/${id}/system-map/${challengeId}`,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to delete system map challenge";

    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}
