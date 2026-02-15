import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPostJson } from "@/lib/xano";

export async function POST(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string; comBId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id, comBId } = await params;

  try {
    const data = await xanoPostJson(
      `/api:2vUWbFCg/projects/${id}/com-b/${comBId}/toggle`,
      {},
      token
    );
    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to toggle COM-B barrier selection";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
