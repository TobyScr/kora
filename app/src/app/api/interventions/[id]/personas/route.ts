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
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id } = await params;

  try {
    const data = await xanoGet(
      `/api:G9GucROL/projects/${id}/persona`,
      token
    );
    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to fetch personas";
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
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id } = await params;
  const body = await request.json();

  try {
    const postBody: Record<string, unknown> = {
      intervention_id: parseInt(id, 10),
      // Demographics
      name: body.name || "",
      age: body.age || "",
      gender: body.gender || "",
      quote: body.quote || "",
      location: body.location || "",
      language: body.language || "",
      children: body.children || "",
      employment: body.employment || "",
      education: body.education || "",
      marital_status: body.marital_status || "",
      // Psychographics
      values: body.values || "",
      aspirations: body.aspirations || "",
      life_goals: body.life_goals || "",
      concerns_challenges: body.concerns_challenges || "",
      // Context & Media
      social_influencer_network: body.social_influencer_network || "",
      media_consumption_habits: body.media_consumption_habits || "",
      language_symbols: body.language_symbols || "",
    };

    const data = await xanoPostJson(
      `/api:G9GucROL/projects/${id}/persona`,
      postBody,
      token
    );
    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to create persona";
    const status = message.toLowerCase().includes("confirmed") ? 403
      : message.toLowerCase().includes("maximum") ? 409
      : 500;
    return NextResponse.json({ error: message }, { status });
  }
}
