import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet, xanoMetaPut, XANO_BRIEF_TABLE_ID } from "@/lib/xano";

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
    // First, get the current brief to find its record ID
    const brief = await xanoGet(
      `/api:8e-lJ9lG/projects/${id}/brief`,
      token
    ) as { id?: number } | null;

    if (!brief || !brief.id) {
      return NextResponse.json(
        { error: "No brief found to confirm" },
        { status: 404 }
      );
    }

    // Use Metadata API to set is_confirmed = true
    const data = await xanoMetaPut(
      XANO_BRIEF_TABLE_ID,
      brief.id,
      { is_confirmed: true }
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to confirm brief";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
