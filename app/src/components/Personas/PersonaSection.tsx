"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPatch, apiDelete } from "@/lib/api";
import { xanoPersonaToFrontend, frontendPersonaToXanoCreate, frontendPersonaToXanoPatch } from "@/lib/transforms/persona";
import type { PersonaFrontend } from "@/lib/types/persona";
import type { XanoPersona } from "@/lib/types/persona";
import type { Intervention } from "@/lib/types/intervention";

type PersonaSectionProps = {
  interventionId: number;
  onConfirm?: () => void;
  onLoadConfirmed?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
};

// Field definitions for the persona form
const DEMOGRAPHICS_FIELDS: { key: keyof PersonaFrontend; label: string; type: "text" | "textarea" }[] = [
  { key: "name", label: "Name", type: "text" },
  { key: "age", label: "Age", type: "text" },
  { key: "gender", label: "Gender", type: "text" },
  { key: "location", label: "Location", type: "text" },
  { key: "language", label: "Language", type: "text" },
  { key: "children", label: "Children", type: "text" },
  { key: "employment", label: "Employment", type: "text" },
  { key: "education", label: "Education", type: "text" },
  { key: "marital_status", label: "Marital Status", type: "text" },
  { key: "quote", label: "Quote", type: "textarea" },
];

const PSYCHOGRAPHICS_FIELDS: { key: keyof PersonaFrontend; label: string; type: "textarea" }[] = [
  { key: "values", label: "Values", type: "textarea" },
  { key: "aspirations", label: "Aspirations", type: "textarea" },
  { key: "life_goals", label: "Life Goals", type: "textarea" },
  { key: "concerns_challenges", label: "Concerns & Challenges", type: "textarea" },
];

const CONTEXT_MEDIA_FIELDS: { key: keyof PersonaFrontend; label: string; type: "textarea" }[] = [
  { key: "social_influencer_network", label: "Social & Influencer Network", type: "textarea" },
  { key: "media_consumption_habits", label: "Media Consumption Habits", type: "textarea" },
  { key: "language_symbols", label: "Language & Symbols", type: "textarea" },
];

const MAX_PERSONAS = 3;

// Icons
const ChevronIcon = ({ isExpanded }: { isExpanded: boolean }) => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" className={`transition-transform ${isExpanded ? "" : "-rotate-90"}`}>
    <path d="M4 6l4 4 4-4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const GreenCheckIcon = () => (
  <span className="flex items-center justify-center w-5 h-5 rounded-full bg-[#2b8652]">
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
      <path d="M3 6l2 2 4-4" stroke="white" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  </span>
);

const PlusIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path d="M8 3v10M3 8h10" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
  </svg>
);

const EditIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path d="M11.5 1.5L14.5 4.5M1 15L1.5 11.5L12 1L15 4L4.5 14.5L1 15Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const TrashIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path d="M3 4H13M6 4V3C6 2.44772 6.44772 2 7 2H9C9.55228 2 10 2.44772 10 3V4M12 4V13C12 13.5523 11.5523 14 11 14H5C4.44772 14 4 13.5523 4 13V4H12Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ChevronDown = () => (
  <svg width="12" height="12" viewBox="0 0 16 16" fill="none">
    <path d="M4 6l4 4 4-4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ChevronRight = () => (
  <svg width="12" height="12" viewBox="0 0 16 16" fill="none">
    <path d="M6 4l4 4-4 4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ImageIcon = () => (
  <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
    <rect x="2" y="3" width="16" height="14" rx="2" stroke="currentColor" strokeWidth="1.5" />
    <circle cx="7" cy="8" r="1.5" stroke="currentColor" strokeWidth="1.5" />
    <path d="M2 13l4-4 3 3 3-3 6 6" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const sectionColors = {
  red: "bg-red-100 text-red-700",
  orange: "bg-orange-100 text-orange-700",
  purple: "bg-purple-100 text-purple-700",
};

function emptyPersona(): Partial<PersonaFrontend> {
  return {
    name: "", age: "", gender: "", quote: "", location: "", language: "",
    children: "", employment: "", education: "", marital_status: "",
    values: "", aspirations: "", life_goals: "", concerns_challenges: "",
    social_influencer_network: "", media_consumption_habits: "", language_symbols: "",
  };
}

export function PersonaSection({
  interventionId,
  onConfirm,
  onLoadConfirmed,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: PersonaSectionProps) {
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  const [isLoading, setIsLoading] = useState(true);
  const [isConfirmed, setIsConfirmed] = useState(false);
  const [personas, setPersonas] = useState<PersonaFrontend[]>([]);

  // Add/Edit form state
  const [showForm, setShowForm] = useState(false);
  const [editingPersonaId, setEditingPersonaId] = useState<string | null>(null);
  const [formData, setFormData] = useState<Partial<PersonaFrontend>>(emptyPersona());

  // Expanded sections on persona cards
  const [expandedCards, setExpandedCards] = useState<Set<string>>(new Set());
  const [expandedSections, setExpandedSections] = useState<Set<string>>(new Set());

  // Image upload
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [uploadingImageForId, setUploadingImageForId] = useState<string | null>(null);

  const { showToast } = useToast();

  // Fetch personas
  const fetchPersonas = useCallback(async () => {
    try {
      setIsLoading(true);
      const response = await apiGet<XanoPersona[]>(
        `/api/interventions/${interventionId}/personas`
      );

      const list = Array.isArray(response) ? response : [];
      setPersonas(list.map(xanoPersonaToFrontend));
    } catch {
      setPersonas([]);
    } finally {
      setIsLoading(false);
    }
  }, [interventionId]);

  // Check confirmation state
  const checkConfirmation = useCallback(async () => {
    try {
      const interventionData = await apiGet<Intervention>(
        `/api/interventions/${interventionId}`
      );
      // Personas is the last section of Understand; after confirm, current_step >= 8
      if (interventionData && interventionData.current_step >= 8) {
        setIsConfirmed(true);
        onLoadConfirmed?.();
      }
    } catch {
      // Could not check
    }
  }, [interventionId, onLoadConfirmed]);

  useEffect(() => {
    fetchPersonas();
    checkConfirmation();
  }, [fetchPersonas, checkConfirmation]);

  const handleToggle = () => {
    if (onToggleExpand) onToggleExpand();
    else setLocalExpanded(!localExpanded);
  };

  // Toggle card expand
  const toggleCard = (id: string) => {
    setExpandedCards((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  };

  // Toggle inner section expand
  const toggleSection = (key: string) => {
    setExpandedSections((prev) => {
      const next = new Set(prev);
      if (next.has(key)) next.delete(key);
      else next.add(key);
      return next;
    });
  };

  // Form field change
  const handleFieldChange = (key: keyof PersonaFrontend, value: string) => {
    setFormData((prev) => ({ ...prev, [key]: value }));
  };

  // Start adding new persona
  const handleStartAdd = () => {
    setEditingPersonaId(null);
    setFormData(emptyPersona());
    setShowForm(true);
  };

  // Start editing existing persona
  const handleStartEdit = (persona: PersonaFrontend) => {
    setEditingPersonaId(persona.id);
    setFormData({ ...persona });
    setShowForm(true);
  };

  // Cancel form
  const handleCancelForm = () => {
    setShowForm(false);
    setEditingPersonaId(null);
    setFormData(emptyPersona());
  };

  // Save form (create or update)
  const handleSaveForm = async () => {
    if (!formData.name?.trim()) {
      showToast("Name is required", "error");
      return;
    }

    try {
      if (editingPersonaId) {
        // Optimistic update
        setPersonas((prev) =>
          prev.map((p) =>
            p.id === editingPersonaId
              ? { ...p, ...formData } as PersonaFrontend
              : p
          )
        );

        await apiPatch(
          `/api/interventions/${interventionId}/personas/${editingPersonaId}`,
          frontendPersonaToXanoPatch(formData)
        );
        showToast("Persona updated");
      } else {
        // Create
        await apiPost(
          `/api/interventions/${interventionId}/personas`,
          frontendPersonaToXanoCreate(formData, interventionId)
        );
        showToast("Persona created");
      }

      await fetchPersonas();
      handleCancelForm();
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to save persona";
      showToast(message, "error");
      if (editingPersonaId) fetchPersonas(); // Revert optimistic update
    }
  };

  // Delete persona
  const handleDeletePersona = async (personaId: string) => {
    // Optimistic remove
    setPersonas((prev) => prev.filter((p) => p.id !== personaId));

    try {
      await apiDelete(`/api/interventions/${interventionId}/personas/${personaId}`);
      showToast("Persona deleted");
    } catch {
      showToast("Failed to delete persona", "error");
      fetchPersonas();
    }
  };

  // Image upload
  const handleImageUpload = (personaId: string) => {
    setUploadingImageForId(personaId);
    fileInputRef.current?.click();
  };

  const handleFileSelected = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !uploadingImageForId) return;

    const formDataUpload = new FormData();
    formDataUpload.append("content", file);

    try {
      const response = await fetch(
        `/api/interventions/${interventionId}/personas/${uploadingImageForId}/image`,
        {
          method: "POST",
          body: formDataUpload,
        }
      );

      if (!response.ok) {
        const data = await response.json();
        throw new Error(data.error || "Upload failed");
      }

      await fetchPersonas();
      showToast("Image uploaded");
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to upload image";
      showToast(message, "error");
    } finally {
      setUploadingImageForId(null);
      // Reset file input
      if (fileInputRef.current) fileInputRef.current.value = "";
    }
  };

  // Confirm
  const handleConfirm = async () => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/personas/confirm`,
        { intervention_id: interventionId }
      );
      setIsConfirmed(true);
      showToast("Personas confirmed");
      onConfirm?.();
    } catch {
      showToast("Failed to confirm personas", "error");
    }
  };

  // Render a persona card in read mode
  const renderPersonaCard = (persona: PersonaFrontend, index: number) => {
    const isCardExpanded = expandedCards.has(persona.id);
    const demographics = [persona.age && `${persona.age} years old`, persona.gender, persona.marital_status]
      .filter(Boolean)
      .join(" \u2022 ");

    const sections = [
      {
        id: `${persona.id}-demo`,
        label: "Demographics",
        color: "red" as const,
        content: (
          <div className="grid grid-cols-2 gap-x-4 gap-y-2 text-sm">
            {persona.location && <div><span className="font-medium">Location:</span> {persona.location}</div>}
            {persona.language && <div><span className="font-medium">Language:</span> {persona.language}</div>}
            {persona.children && <div><span className="font-medium">Children:</span> {persona.children}</div>}
            {persona.employment && <div><span className="font-medium">Employment:</span> {persona.employment}</div>}
            {persona.education && <div><span className="font-medium">Education:</span> {persona.education}</div>}
          </div>
        ),
      },
      {
        id: `${persona.id}-psycho`,
        label: "Psychographics",
        color: "orange" as const,
        content: (
          <div className="space-y-2 text-sm">
            {persona.values && <div><span className="font-medium">Values:</span> {persona.values}</div>}
            {persona.aspirations && <div><span className="font-medium">Aspirations:</span> {persona.aspirations}</div>}
            {persona.life_goals && <div><span className="font-medium">Life Goals:</span> {persona.life_goals}</div>}
            {persona.concerns_challenges && <div><span className="font-medium">Concerns:</span> {persona.concerns_challenges}</div>}
          </div>
        ),
      },
      {
        id: `${persona.id}-context`,
        label: "Context & Media",
        color: "purple" as const,
        content: (
          <div className="space-y-2 text-sm">
            {persona.social_influencer_network && <div><span className="font-medium">Social Network:</span> {persona.social_influencer_network}</div>}
            {persona.media_consumption_habits && <div><span className="font-medium">Media Habits:</span> {persona.media_consumption_habits}</div>}
            {persona.language_symbols && <div><span className="font-medium">Language & Symbols:</span> {persona.language_symbols}</div>}
          </div>
        ),
      },
    ];

    return (
      <div key={persona.id} className="border-t border-stroke-default pt-4">
        {/* Header */}
        <div className="flex items-start justify-between mb-2">
          <button
            onClick={() => toggleCard(persona.id)}
            className="flex items-center gap-2 text-text-primary cursor-pointer"
          >
            <span className="text-lg font-medium">{index + 1}</span>
            <h3 className="font-medium text-text-primary">{persona.name || "Unnamed"}</h3>
          </button>
          <div className="flex items-center gap-1">
            {!isConfirmed && (
              <>
                <button
                  onClick={() => handleImageUpload(persona.id)}
                  className="text-text-tertiary hover:text-text-secondary transition-colors p-1"
                  aria-label="Upload image"
                  title="Upload image"
                >
                  <ImageIcon />
                </button>
                <button
                  onClick={() => handleStartEdit(persona)}
                  className="text-text-tertiary hover:text-text-secondary transition-colors p-1"
                  aria-label="Edit"
                >
                  <EditIcon />
                </button>
                <button
                  onClick={() => handleDeletePersona(persona.id)}
                  className="text-text-tertiary hover:text-red-600 transition-colors p-1"
                  aria-label="Delete"
                >
                  <TrashIcon />
                </button>
              </>
            )}
          </div>
        </div>

        {/* Demographics summary */}
        {demographics && (
          <p className="text-xs text-text-secondary mb-2">{demographics}</p>
        )}

        {/* Quote + image */}
        {isCardExpanded && (
          <>
            <div className="flex gap-4 mb-3">
              {persona.quote && (
                <p className="flex-1 text-sm text-text-secondary italic leading-relaxed">
                  &ldquo;{persona.quote}&rdquo;
                </p>
              )}
              {persona.imageUrl && (
                <div className="w-[100px] h-[100px] rounded-[var(--radius-md)] overflow-hidden shrink-0">
                  <img src={persona.imageUrl} alt={persona.name} className="w-full h-full object-cover" />
                </div>
              )}
            </div>

            {/* Expandable sections */}
            {sections.map((section) => {
              const isOpen = expandedSections.has(section.id);
              return (
                <div key={section.id} className="mb-2">
                  <button
                    onClick={() => toggleSection(section.id)}
                    className="flex items-center gap-2 py-1 cursor-pointer"
                  >
                    <span className="text-text-secondary">
                      {isOpen ? <ChevronDown /> : <ChevronRight />}
                    </span>
                    <span className={`px-2 py-0.5 rounded-md text-xs font-medium ${sectionColors[section.color]}`}>
                      {section.label}
                    </span>
                  </button>
                  {isOpen && section.content && (
                    <div className="pl-6 pt-1 text-sm text-text-secondary leading-relaxed">
                      {section.content}
                    </div>
                  )}
                </div>
              );
            })}
          </>
        )}

        {!isCardExpanded && (
          <button
            onClick={() => toggleCard(persona.id)}
            className="text-xs text-text-secondary hover:text-text-primary cursor-pointer mt-1"
          >
            Show details...
          </button>
        )}
      </div>
    );
  };

  // Render the form for add/edit
  const renderForm = () => (
    <div className="border border-stroke-default rounded-lg p-4 space-y-5 bg-background-surface">
      <h4 className="text-sm font-semibold text-text-primary">
        {editingPersonaId ? "Edit Persona" : "Add Persona"}
      </h4>

      {/* Demographics */}
      <div>
        <span className="px-2 py-0.5 rounded-md text-xs font-medium bg-red-100 text-red-700 mb-3 inline-block">
          Demographics
        </span>
        <div className="grid grid-cols-2 gap-3 mt-2">
          {DEMOGRAPHICS_FIELDS.map((field) =>
            field.type === "textarea" ? (
              <div key={field.key} className="col-span-2">
                <label className="text-xs text-text-secondary mb-1 block">{field.label}</label>
                <textarea
                  value={(formData[field.key] as string) || ""}
                  onChange={(e) => handleFieldChange(field.key, e.target.value)}
                  className="w-full h-16 px-3 py-2 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                  placeholder={field.label}
                />
              </div>
            ) : (
              <div key={field.key}>
                <label className="text-xs text-text-secondary mb-1 block">{field.label}</label>
                <input
                  type="text"
                  value={(formData[field.key] as string) || ""}
                  onChange={(e) => handleFieldChange(field.key, e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-stroke-default rounded-lg focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                  placeholder={field.label}
                />
              </div>
            )
          )}
        </div>
      </div>

      {/* Psychographics */}
      <div>
        <span className="px-2 py-0.5 rounded-md text-xs font-medium bg-orange-100 text-orange-700 mb-3 inline-block">
          Psychographics
        </span>
        <div className="space-y-3 mt-2">
          {PSYCHOGRAPHICS_FIELDS.map((field) => (
            <div key={field.key}>
              <label className="text-xs text-text-secondary mb-1 block">{field.label}</label>
              <textarea
                value={(formData[field.key] as string) || ""}
                onChange={(e) => handleFieldChange(field.key, e.target.value)}
                className="w-full h-16 px-3 py-2 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                placeholder={field.label}
              />
            </div>
          ))}
        </div>
      </div>

      {/* Context & Media */}
      <div>
        <span className="px-2 py-0.5 rounded-md text-xs font-medium bg-purple-100 text-purple-700 mb-3 inline-block">
          Context & Media
        </span>
        <div className="space-y-3 mt-2">
          {CONTEXT_MEDIA_FIELDS.map((field) => (
            <div key={field.key}>
              <label className="text-xs text-text-secondary mb-1 block">{field.label}</label>
              <textarea
                value={(formData[field.key] as string) || ""}
                onChange={(e) => handleFieldChange(field.key, e.target.value)}
                className="w-full h-16 px-3 py-2 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                placeholder={field.label}
              />
            </div>
          ))}
        </div>
      </div>

      {/* Actions */}
      <div className="flex gap-2 justify-end pt-2">
        <button
          onClick={handleCancelForm}
          className="px-4 py-2 text-sm font-medium text-text-secondary hover:text-text-primary"
        >
          Cancel
        </button>
        <button
          onClick={handleSaveForm}
          disabled={!formData.name?.trim()}
          className="px-4 py-2 text-sm font-medium text-text-inverse bg-button-solid rounded-md hover:opacity-90 disabled:opacity-50"
        >
          {editingPersonaId ? "Save Changes" : "Create Persona"}
        </button>
      </div>
    </div>
  );

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Hidden file input for image upload */}
      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        className="hidden"
        onChange={handleFileSelected}
      />

      {/* Header */}
      <div className={`flex items-center justify-between ${isExpanded ? "mb-4" : ""}`}>
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">Personas</span>
          {isConfirmed && <GreenCheckIcon />}
        </button>

        {!isLoading && !isConfirmed && (
          <button
            onClick={handleConfirm}
            disabled={personas.length === 0}
            className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
              personas.length > 0
                ? "text-text-inverse bg-button-solid hover:opacity-90"
                : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
            }`}
          >
            Confirm Personas
          </button>
        )}
      </div>

      {isExpanded && (
        <>
          {isLoading ? (
            <div className="space-y-4">
              {[1, 2, 3].map((i) => (
                <div key={i} className="h-24 bg-stroke-soft rounded-lg animate-pulse" />
              ))}
            </div>
          ) : (
            <>
              {!isConfirmed && (
                <div className="mb-4">
                  <p className="text-xs text-text-secondary">
                    Up to {MAX_PERSONAS} personas per intervention ({personas.length}/{MAX_PERSONAS})
                  </p>
                </div>
              )}

              {/* Persona cards */}
              <div className="space-y-4">
                {personas.map((persona, index) => renderPersonaCard(persona, index))}
              </div>

              {/* Add persona button */}
              {!isConfirmed && !showForm && personas.length < MAX_PERSONAS && (
                <button
                  onClick={handleStartAdd}
                  className="flex items-center gap-1.5 mt-4 text-sm font-medium text-text-secondary hover:text-text-primary transition-colors"
                >
                  <PlusIcon />
                  Add persona
                </button>
              )}

              {/* Add/Edit form */}
              {!isConfirmed && showForm && (
                <div className="mt-4">
                  {renderForm()}
                </div>
              )}
            </>
          )}
        </>
      )}
    </div>
  );
}
