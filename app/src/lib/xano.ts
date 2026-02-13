const XANO_API_BASE = process.env.XANO_API_BASE;

if (!XANO_API_BASE) {
  throw new Error("XANO_API_BASE environment variable is not set");
}

export async function xanoPost(
  path: string,
  body: Record<string, string>,
  token?: string
): Promise<Record<string, unknown>> {
  const headers: Record<string, string> = {
    "Content-Type": "application/x-www-form-urlencoded",
  };

  if (token) {
    headers["Authorization"] = `Bearer ${token}`;
  }

  const response = await fetch(`${XANO_API_BASE}${path}`, {
    method: "POST",
    headers,
    body: new URLSearchParams(body).toString(),
  });

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.message || `Xano request failed with status ${response.status}`);
  }

  return data;
}

export async function xanoGet(
  path: string,
  token?: string
): Promise<Record<string, unknown>> {
  const headers: Record<string, string> = {};

  if (token) {
    headers["Authorization"] = `Bearer ${token}`;
  }

  const response = await fetch(`${XANO_API_BASE}${path}`, {
    method: "GET",
    headers,
  });

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.message || `Xano request failed with status ${response.status}`);
  }

  return data;
}

export async function xanoPatch(
  path: string,
  body: Record<string, string>,
  token?: string
): Promise<Record<string, unknown>> {
  const headers: Record<string, string> = {
    "Content-Type": "application/x-www-form-urlencoded",
  };

  if (token) {
    headers["Authorization"] = `Bearer ${token}`;
  }

  const response = await fetch(`${XANO_API_BASE}${path}`, {
    method: "PATCH",
    headers,
    body: new URLSearchParams(body).toString(),
  });

  const patchData = await response.json();

  if (!response.ok) {
    throw new Error(patchData.message || `Xano request failed with status ${response.status}`);
  }

  return patchData;
}

// --- Metadata API helpers (for tables with broken endpoints) ---

const XANO_META_TOKEN = process.env.XANO_META_TOKEN;
const XANO_WORKSPACE_ID = process.env.XANO_WORKSPACE_ID || "41";
const XANO_BRIEF_TABLE_ID = process.env.XANO_BRIEF_TABLE_ID || "294";

function metaUrl(tableId: string, recordId?: number): string {
  const base = `${XANO_API_BASE}/api:meta/workspace/${XANO_WORKSPACE_ID}/table/${tableId}/content`;
  return recordId ? `${base}/${recordId}` : base;
}

export async function xanoMetaPost(
  tableId: string,
  body: Record<string, unknown>
): Promise<Record<string, unknown>> {
  if (!XANO_META_TOKEN) {
    throw new Error("XANO_META_TOKEN environment variable is not set");
  }

  const response = await fetch(metaUrl(tableId), {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${XANO_META_TOKEN}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  });

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.message || `Xano Meta request failed with status ${response.status}`);
  }

  return data;
}

export async function xanoMetaPut(
  tableId: string,
  recordId: number,
  body: Record<string, unknown>
): Promise<Record<string, unknown>> {
  if (!XANO_META_TOKEN) {
    throw new Error("XANO_META_TOKEN environment variable is not set");
  }

  const response = await fetch(metaUrl(tableId, recordId), {
    method: "PUT",
    headers: {
      "Authorization": `Bearer ${XANO_META_TOKEN}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  });

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.message || `Xano Meta request failed with status ${response.status}`);
  }

  return data;
}

export { XANO_BRIEF_TABLE_ID };
