import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPostJson } from "@/lib/xano";

export async function POST(
  _request: NextRequest,
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

  try {
    const data = await xanoPostJson(
      `/api:8e-lJ9lG/projects/${id}/brief/confirm`,
      { intervention_id: parseInt(id, 10) },
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to confirm brief";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
