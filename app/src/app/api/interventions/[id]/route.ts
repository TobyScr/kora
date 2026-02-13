import { NextRequest, NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet } from "@/lib/xano";
import type { Client, Project, Intervention } from "@/lib/types/intervention";

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
    // 1. Get the intervention
    const interventionData = await xanoGet(
      `/api:IfptASG9/intervention/${id}`,
      token
    );
    const intervention = interventionData as unknown as Intervention;

    // 2. Get the project to get its name and client_id
    const projectData = await xanoGet(
      `/api:cMcL2J0F/project/${intervention.project_id}`,
      token
    );
    const project = projectData as unknown as Project;

    // 3. Get all clients to find the client name
    const clientsData = await xanoGet("/api:6_YOPuL5/client", token);
    const clients = clientsData as unknown as Client[];
    const client = clients.find((c) => c.id === project.client_id);

    // 4. Enrich and return
    const enriched: Intervention = {
      ...intervention,
      project_name: project.name,
      client_name: client?.name,
    };

    return NextResponse.json(enriched);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to fetch intervention";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
