import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet, xanoPostJson } from "@/lib/xano";

export async function GET(
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
    const data = await xanoGet(
      `/api:AJ25XedL/projects/${id}/research/insights`,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to fetch research insights";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}

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

  try {
    const postBody: Record<string, unknown> = {
      intervention_id: parseInt(id, 10),
      insight: body.insight || "",
      description: body.description || "",
      source: Array.isArray(body.source) ? body.source : [],
    };

    const data = await xanoPostJson(
      `/api:AJ25XedL/projects/${id}/research/insights`,
      postBody,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to create research insight";

    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}
