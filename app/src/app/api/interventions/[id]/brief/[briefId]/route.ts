import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet, xanoPatchJson } from "@/lib/xano";

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string; briefId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  const { id, briefId } = await params;
  const body = await request.json();

  try {
    // GET current brief to merge with — Xano requires ALL fields for validation
    const current = await xanoGet(
      `/api:8e-lJ9lG/projects/${id}/brief`,
      token
    ) as Record<string, unknown>;

    // Build the full payload, starting with current values, overriding with incoming changes
    const patchBody: Record<string, unknown> = {
      intervention_id: parseInt(id, 10),
      client: body.client ?? current.client ?? "",
      location: body.location ?? current.location ?? "",
      budget_currency: body.budget_currency ?? current.budget_currency ?? "£",
      budget_min: body.budget_min !== undefined ? parseInt(String(body.budget_min), 10) : (current.budget_min ?? 0),
      budget_max: body.budget_max !== undefined ? parseInt(String(body.budget_max), 10) : (current.budget_max ?? 0),
      timeline_unit: body.timeline_unit ?? current.timeline_unit ?? "Months",
      timeline_min: body.timeline_min !== undefined ? parseInt(String(body.timeline_min), 10) : (current.timeline_min ?? 0),
      timeline_max: body.timeline_max !== undefined ? parseInt(String(body.timeline_max), 10) : (current.timeline_max ?? 0),
      expected_deliverables: body.expected_deliverables ?? current.expected_deliverables ?? "",
      problem_definition: body.problem_definition ?? current.problem_definition ?? "",
      high_level_objective: body.high_level_objective ?? current.high_level_objective ?? "",
      ta_profile: parseArray(body.ta_profile) ?? current.ta_profile ?? [],
      dos: parseArray(body.dos) ?? current.dos ?? [],
      donts: parseArray(body.donts) ?? current.donts ?? [],
    };

    const data = await xanoPatchJson(
      `/api:8e-lJ9lG/projects/${id}/brief/${briefId}`,
      patchBody,
      token
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to update brief";

    // Xano returns "Intervention step confirmed, edition not allowed" when trying to edit after confirmation
    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
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
