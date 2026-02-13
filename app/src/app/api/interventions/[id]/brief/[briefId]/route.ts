import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoMetaPut, XANO_BRIEF_TABLE_ID } from "@/lib/xano";

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

  const { briefId } = await params;
  const body = await request.json();

  try {
    // Build the Metadata API body with proper types
    const metaBody: Record<string, unknown> = {};

    // Text fields — only include if non-empty
    const textFields = ["client", "location", "expected_deliverables", "problem_definition", "high_level_objective"];
    for (const field of textFields) {
      if (body[field] !== undefined && body[field] !== "") {
        metaBody[field] = body[field];
      }
    }

    // Number fields — parse to int
    const numFields = ["budget_min", "budget_max", "timeline_min", "timeline_max"];
    for (const field of numFields) {
      if (body[field] !== undefined && body[field] !== "") {
        metaBody[field] = parseInt(body[field], 10);
      }
    }

    // Enum fields
    if (body.budget_currency) metaBody.budget_currency = body.budget_currency;
    if (body.timeline_unit) metaBody.timeline_unit = body.timeline_unit;

    // Array fields — parse from JSON string if needed
    const arrayFields = ["ta_profile", "dos", "donts"];
    for (const field of arrayFields) {
      if (body[field] !== undefined) {
        const parsed = typeof body[field] === "string" ? JSON.parse(body[field]) : body[field];
        if (Array.isArray(parsed)) {
          metaBody[field] = parsed;
        }
      }
    }

    const data = await xanoMetaPut(
      XANO_BRIEF_TABLE_ID,
      parseInt(briefId, 10),
      metaBody
    );

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to update brief";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
