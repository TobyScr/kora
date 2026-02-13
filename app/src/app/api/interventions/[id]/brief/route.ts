import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet, xanoMetaPost, XANO_BRIEF_TABLE_ID } from "@/lib/xano";

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
    // Build the Metadata API body with proper types
    const metaBody: Record<string, unknown> = {
      intervention_id: parseInt(id, 10),
    };

    // Text fields — only include if non-empty
    const textFields = ["client", "location", "expected_deliverables", "problem_definition", "high_level_objective"];
    for (const field of textFields) {
      if (body[field] && body[field] !== "") {
        metaBody[field] = body[field];
      }
    }

    // Number fields — parse to int, only include if > 0
    const numFields = ["budget_min", "budget_max", "timeline_min", "timeline_max"];
    for (const field of numFields) {
      if (body[field] && body[field] !== "" && body[field] !== "0") {
        metaBody[field] = parseInt(body[field], 10);
      }
    }

    // Enum fields — only include if non-empty
    if (body.budget_currency) metaBody.budget_currency = body.budget_currency;
    if (body.timeline_unit) metaBody.timeline_unit = body.timeline_unit;

    // Array fields — parse from JSON string if needed
    const arrayFields = ["ta_profile", "dos", "donts"];
    for (const field of arrayFields) {
      if (body[field]) {
        const parsed = typeof body[field] === "string" ? JSON.parse(body[field]) : body[field];
        if (Array.isArray(parsed) && parsed.length > 0) {
          metaBody[field] = parsed;
        }
      }
    }

    const data = await xanoMetaPost(XANO_BRIEF_TABLE_ID, metaBody);

    return NextResponse.json(data);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to create brief";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
