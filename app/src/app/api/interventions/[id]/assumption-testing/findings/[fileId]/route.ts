import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoDeleteJson } from "@/lib/xano";

export async function DELETE(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string; fileId: string }> }
) {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json({ error: "Not authenticated" }, { status: 401 });
  }

  const { id, fileId } = await params;

  try {
    const data = await xanoDeleteJson(
      `/api:HWnSNCdS/projects/${id}/assumption-testing/delete-file/${fileId}`,
      token
    );
    return NextResponse.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : "Failed to delete file";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
