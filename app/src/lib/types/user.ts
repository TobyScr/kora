export type User = {
  id: number;
  name: string;
  email: string;
  role_id: number;
  role_name?: {
    id: number;
    name: string;
    role: string;
  };
};
