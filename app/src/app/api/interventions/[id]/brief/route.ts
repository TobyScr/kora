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
      `/api:8e-lJ9lG/projects/${id}/brief`,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to fetch brief";
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
      client: body.client || "",
      location: body.location || "",
      budget_currency: body.budget_currency || "£",
      budget_min: body.budget_min ? parseInt(String(body.budget_min), 10) : 0,
      budget_max: body.budget_max ? parseInt(String(body.budget_max), 10) : 0,
      timeline_unit: body.timeline_unit || "Months",
      timeline_min: body.timeline_min ? parseInt(String(body.timeline_min), 10) : 0,
      timeline_max: body.timeline_max ? parseInt(String(body.timeline_max), 10) : 0,
      expected_deliverables: body.expected_deliverables || "",
      problem_definition: body.problem_definition || "",
      high_level_objective: body.high_level_objective || "",
      ta_profile: parseArray(body.ta_profile) || [],
      dos: parseArray(body.dos) || [],
      donts: parseArray(body.donts) || [],
    };

    const data = await xanoPostJson(
      `/api:8e-lJ9lG/projects/${id}/brief`,
      postBody,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to create brief";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}

function parseArray(value: unknown): string[] | undefined {
  if (value === undefined) return undefined;
  if (Array.isArray(value)) return value;
  if (typeof value === "string") {
    try {
      const parsed = JSON.parse(value);
      if (Array.isArray(parsed)) return parsed;
    } catch {
      // not valid JSON, ignore
    }
  }
  return undefined;
}
