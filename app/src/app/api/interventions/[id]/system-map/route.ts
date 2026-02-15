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
      `/api:5Y7Ik5Qs/projects/${id}/system-map`,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to fetch system map challenges";
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
      challenge: body.challenge || "",
      description: body.description || "",
      is_selected: false,
    };

    const data = await xanoPostJson(
      `/api:5Y7Ik5Qs/projects/${id}/system-map`,
      postBody,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to create system map challenge";

    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}
