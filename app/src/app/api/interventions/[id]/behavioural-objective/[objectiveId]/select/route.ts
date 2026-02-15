import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPostJson } from "@/lib/xano";

export async function POST(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string; objectiveId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id, objectiveId } = await params;

  try {
    const data = await xanoPostJson(
      `/api:AD_UWhQC/projects/${id}/behavioral-objective-new/${objectiveId}/select`,
      { behavioural_objective_id: objectiveId },
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to select behavioural objective";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
