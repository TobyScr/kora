// Xano PERSONA table shape (table 348) with flattened addon joins
// Xano addons flatten joined fields directly into the parent object
export type XanoPersona = {
  id: string; // UUID
  created_at: number;
  intervention_id: number;
  // Flattened from DEMOGRAPHICS (table 306)
  name: string;
  age: string;
  gender: string;
  location: string;
  language: string;
  children: string;
  employment: string;
  education: string;
  marital_status: string;
  quote: string;
  file: { url: string; path: string } | null;
  // Flattened from PSYCHOGRAPHICS (table 307)
  values: string;
  aspirations: string;
  life_goals: string;
  concerns_challenges: string;
  // Flattened from CONTEXT_MEDIA (table 308)
  social_influencer_network: string;
  media_consumption_habits: string;
  language_symbols: string;
};

// Frontend-friendly persona shape
export type PersonaFrontend = {
  id: string;
  name: string;
  age: string;
  gender: string;
  quote: string;
  imageUrl: string | null;
  location: string;
  language: string;
  children: string;
  employment: string;
  education: string;
  marital_status: string;
  values: string;
  aspirations: string;
  life_goals: string;
  concerns_challenges: string;
  social_influencer_network: string;
  media_consumption_habits: string;
  language_symbols: string;
};
