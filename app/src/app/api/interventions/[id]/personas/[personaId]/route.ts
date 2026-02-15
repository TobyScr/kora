import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoPatchJson, xanoDeleteJson } from "@/lib/xano";

export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ id: string; personaId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id, personaId } = await params;
  const body = await request.json();

  try {
    const data = await xanoPatchJson(
      `/api:G9GucROL/projects/${id}/persona/${personaId}`,
      body,
      token
    );
    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to update persona";
    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}

export async function DELETE(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string; personaId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id, personaId } = await params;

  try {
    const data = await xanoDeleteJson(
      `/api:G9GucROL/projects/${id}/persona/${personaId}`,
      token
    );
    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to delete persona";
    const status = message.toLowerCase().includes("confirmed") ? 403 : 500;
    return NextResponse.json({ error: message }, { status });
  }
}
