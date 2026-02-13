import type { XanoBriefOutput, BriefData } from "@/lib/types/brief";

// --- Currency mapping ---

const currencySymbolToCode: Record<string, string> = {
  "\u00a3": "GBP", // £
  "\uffe1": "GBP", // ￡ (fullwidth pound)
  "\u20ac": "EUR", // €
  "$": "USD",
};

const currencyCodeToSymbol: Record<string, string> = {
  GBP: "\u00a3",
  EUR: "\u20ac",
  USD: "$",
};

// --- Number formatting ---

function formatNumber(n: number): string {
  if (n === 0) return "";
  return n.toLocaleString("en-GB"); // e.g. 50000 → "50,000"
}

function parseFormattedNumber(s: string): string {
  // "50,000" → "50000"
  return s.replace(/,/g, "");
}

// --- Transform: Xano → Front-end ---

export function xanoBriefToFrontend(xano: XanoBriefOutput): BriefData {
  return {
    clientName: xano.client || "",
    location: xano.location || "",
    budget: {
      currency: currencySymbolToCode[xano.budget_currency] || "GBP",
      minAmount: formatNumber(xano.budget_min),
      maxAmount: formatNumber(xano.budget_max),
    },
    timeline: {
      unit: (xano.timeline_unit || "months").toLowerCase(),
      from: xano.timeline_min ? String(xano.timeline_min) : "",
      to: xano.timeline_max ? String(xano.timeline_max) : "",
    },
    deliverables: xano.expected_deliverables || "",
    problemDefinition: xano.problem_definition || "",
    initialObjective: xano.high_level_objective || "",
    taProfile: xano.ta_profile || [],
    dos: xano.dos || [],
    donts: xano.donts || [],
  };
}

// --- Transform: Front-end → Xano (form-encoded key-value pairs) ---

export function frontendBriefToXano(
  data: BriefData
): Record<string, string> {
  const unit = data.timeline.unit;
  const timelineUnit = unit.charAt(0).toUpperCase() + unit.slice(1); // "months" → "Months"

  return {
    client: data.clientName,
    location: data.location,
    budget_currency: currencyCodeToSymbol[data.budget.currency] || "\u00a3",
    budget_min: parseFormattedNumber(data.budget.minAmount),
    budget_max: parseFormattedNumber(data.budget.maxAmount),
    timeline_unit: timelineUnit,
    timeline_min: data.timeline.from,
    timeline_max: data.timeline.to,
    expected_deliverables: data.deliverables,
    problem_definition: data.problemDefinition,
    high_level_objective: data.initialObjective,
    ta_profile: JSON.stringify(data.taProfile),
    dos: JSON.stringify(data.dos),
    donts: JSON.stringify(data.donts),
  };
}
