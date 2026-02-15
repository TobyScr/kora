import type { XanoPersona, PersonaFrontend } from "@/lib/types/persona";

// --- Transform: Xano -> Front-end ---
// Xano addons flatten joined data directly into the parent object

export function xanoPersonaToFrontend(xano: XanoPersona): PersonaFrontend {
  return {
    id: xano.id,
    name: xano.name || "",
    age: xano.age || "",
    gender: xano.gender || "",
    quote: xano.quote || "",
    imageUrl: xano.file?.url || null,
    location: xano.location || "",
    language: xano.language || "",
    children: xano.children || "",
    employment: xano.employment || "",
    education: xano.education || "",
    marital_status: xano.marital_status || "",
    values: xano.values || "",
    aspirations: xano.aspirations || "",
    life_goals: xano.life_goals || "",
    concerns_challenges: xano.concerns_challenges || "",
    social_influencer_network: xano.social_influencer_network || "",
    media_consumption_habits: xano.media_consumption_habits || "",
    language_symbols: xano.language_symbols || "",
  };
}

// --- Transform: Front-end -> Xano (for POST create) ---
// Persona create is a transaction across 4 tables; Xano expects a flat body
// with all fields and the endpoint handles the split internally.

export function frontendPersonaToXanoCreate(
  persona: Partial<PersonaFrontend>,
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    // Demographics
    name: persona.name || "",
    age: persona.age || "",
    gender: persona.gender || "",
    quote: persona.quote || "",
    location: persona.location || "",
    language: persona.language || "",
    children: persona.children || "",
    employment: persona.employment || "",
    education: persona.education || "",
    marital_status: persona.marital_status || "",
    // Psychographics
    values: persona.values || "",
    aspirations: persona.aspirations || "",
    life_goals: persona.life_goals || "",
    concerns_challenges: persona.concerns_challenges || "",
    // Context & Media
    social_influencer_network: persona.social_influencer_network || "",
    media_consumption_habits: persona.media_consumption_habits || "",
    language_symbols: persona.language_symbols || "",
  };
}

// --- Transform: Front-end -> Xano (for PATCH update, partial) ---
// Xano auto-routes fields to the correct sub-table.

export function frontendPersonaToXanoPatch(
  fields: Partial<Omit<PersonaFrontend, "id" | "imageUrl">>
): Record<string, unknown> {
  const body: Record<string, unknown> = {};

  // Demographics fields
  if (fields.name !== undefined) body.name = fields.name;
  if (fields.age !== undefined) body.age = fields.age;
  if (fields.gender !== undefined) body.gender = fields.gender;
  if (fields.quote !== undefined) body.quote = fields.quote;
  if (fields.location !== undefined) body.location = fields.location;
  if (fields.language !== undefined) body.language = fields.language;
  if (fields.children !== undefined) body.children = fields.children;
  if (fields.employment !== undefined) body.employment = fields.employment;
  if (fields.education !== undefined) body.education = fields.education;
  if (fields.marital_status !== undefined) body.marital_status = fields.marital_status;

  // Psychographics fields
  if (fields.values !== undefined) body.values = fields.values;
  if (fields.aspirations !== undefined) body.aspirations = fields.aspirations;
  if (fields.life_goals !== undefined) body.life_goals = fields.life_goals;
  if (fields.concerns_challenges !== undefined) body.concerns_challenges = fields.concerns_challenges;

  // Context & Media fields
  if (fields.social_influencer_network !== undefined) body.social_influencer_network = fields.social_influencer_network;
  if (fields.media_consumption_habits !== undefined) body.media_consumption_habits = fields.media_consumption_habits;
  if (fields.language_symbols !== undefined) body.language_symbols = fields.language_symbols;

  return body;
}
