import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPostJson } from "@/lib/xano";

export async function POST(
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
    const data = await xanoPostJson(
      `/api:5Y7Ik5Qs/projects/${id}/system-map/${challengeId}/select`,
      {},
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to select entry point";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
