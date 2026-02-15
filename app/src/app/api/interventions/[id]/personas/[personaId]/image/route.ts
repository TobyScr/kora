import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";

const XANO_API_BASE = process.env.XANO_API_BASE;

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string; personaId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id, personaId } = await params;

  try {
    // Read the incoming form data
    const formData = await request.formData();
    const file = formData.get("content") as File | null;

    if (!file) {
      return NextResponse.json({ error: "No file provided" }, { status: 400 });
    }

    // Forward to Xano as multipart/form-data
    const xanoFormData = new FormData();
    xanoFormData.append("content", file, file.name);

    const response = await fetch(
      `${XANO_API_BASE}/api:G9GucROL/projects/${id}/persona/${personaId}/image`,
      {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          // Do NOT set Content-Type — fetch sets it automatically with boundary for FormData
        },
        body: xanoFormData,
      }
    );

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.message || `Image upload failed with status ${response.status}`);
    }

    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to upload persona image";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
