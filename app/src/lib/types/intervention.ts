export type Client = {
  id: number;
  name: string;
  description?: string;
};

export type Project = {
  id: number;
  name: string;
  description?: string;
  client_id: number;
};

export type Intervention = {
  id: number;
  name: string;
  description?: string;
  project_id: number;
  current_step: number;
  percentage: number;
  // Enriched fields (added by our route handler)
  project_name?: string;
  client_name?: string;
};
