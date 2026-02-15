import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";

const XANO_API_BASE = process.env.XANO_API_BASE;

// File upload uses multipart/form-data, not JSON
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

  try {
    const formData = await request.formData();

    // Forward the form data to Xano
    const response = await fetch(
      `${XANO_API_BASE}/api:HWnSNCdS/projects/${id}/assumption-testing/findings/add-file`,
      {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
        },
        body: formData,
      }
    );

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.message || `Upload failed with status ${response.status}`);
    }

    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to upload file";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
