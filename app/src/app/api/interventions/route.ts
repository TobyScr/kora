import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet } from "@/lib/xano";
import type { Client, Project, Intervention } from "@/lib/types/intervention";

export async function GET() {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  try {
    // 1. Get all clients
    const clientsData = await xanoGet("/api:6_YOPuL5/client", token);
    const clients = clientsData as unknown as Client[];

    // 2. For each client, get their projects (in parallel)
    const projectsByClient = await Promise.all(
      clients.map(async (client) => {
        const projectsData = await xanoGet(
          `/api:cMcL2J0F/projects?client_id=${client.id}`,
          token
        );
        const projects = projectsData as unknown as Project[];
        return { client, projects };
      })
    );

    // 3. For each project, get interventions (in parallel)
    const allInterventions: Intervention[] = [];

    const interventionPromises = projectsByClient.flatMap(({ client, projects }) =>
      projects.map(async (project) => {
        const interventionsData = await xanoGet(
          `/api:IfptASG9/interventions?project_id=${project.id}`,
          token
        );
        const interventions = interventionsData as unknown as Intervention[];
        return interventions.map((intervention) => ({
          ...intervention,
          project_name: project.name,
          client_name: client.name,
        }));
      })
    );

    const results = await Promise.all(interventionPromises);
    results.forEach((interventions) => allInterventions.push(...interventions));

    return NextResponse.json(allInterventions);
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Failed to fetch interventions";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
