"use client";

import { useState, useEffect, useCallback } from "react";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPatch, apiDelete } from "@/lib/api";
import { xanoBarrierToFrontend, frontendBarrierToXanoCreate, frontendBarrierToXanoPatch } from "@/lib/transforms/comB";
import type { ComBBarrierFrontend } from "@/lib/transforms/comB";
import type { XanoComBBarrier } from "@/lib/types/comB";
import type { Intervention } from "@/lib/types/intervention";

type ComBSectionProps = {
  interventionId: number;
  onConfirm?: () => void;
  onLoadConfirmed?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
};

type ComBCategory = "capability" | "opportunity" | "motivation";

const CATEGORIES: { key: ComBCategory; label: string; color: string; bgColor: string }[] = [
  { key: "capability", label: "Capability", color: "text-blue-700", bgColor: "bg-blue-50" },
  { key: "opportunity", label: "Opportunity", color: "text-emerald-700", bgColor: "bg-emerald-50" },
  { key: "motivation", label: "Motivation", color: "text-purple-700", bgColor: "bg-purple-50" },
];

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

const CheckIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path d="M3 8l3.5 3.5L13 5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

export function ComBSection({
  interventionId,
  onConfirm,
  onLoadConfirmed,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: ComBSectionProps) {
  const [localExpanded, setLocalExpanded] = useState(true);
  const isExpanded = controlledExpanded ?? localExpanded;

  const [isLoading, setIsLoading] = useState(true);
  const [isConfirmed, setIsConfirmed] = useState(false);
  const [barriers, setBarriers] = useState<ComBBarrierFrontend[]>([]);

  // Add form state
  const [addingCategory, setAddingCategory] = useState<ComBCategory | null>(null);
  const [addBarrierText, setAddBarrierText] = useState("");
  const [addDescriptionText, setAddDescriptionText] = useState("");

  // Edit state
  const [editingBarrier, setEditingBarrier] = useState<ComBBarrierFrontend | null>(null);
  const [editBarrierText, setEditBarrierText] = useState("");
  const [editDescriptionText, setEditDescriptionText] = useState("");

  const { showToast } = useToast();

  const selectedCount = barriers.filter((b) => b.selected).length;

  // Fetch barriers
  const fetchBarriers = useCallback(async () => {
    try {
      setIsLoading(true);
      const response = await apiGet<XanoComBBarrier[] | Record<string, XanoComBBarrier[]>>(
        `/api/interventions/${interventionId}/com-b`
      );

      // The response might be grouped or a flat array
      let allBarriers: XanoComBBarrier[] = [];
      if (Array.isArray(response)) {
        allBarriers = response;
      } else if (response && typeof response === "object") {
        // Grouped response
        const grouped = response as Record<string, XanoComBBarrier[]>;
        for (const key of ["capability", "opportunity", "motivation"]) {
          if (Array.isArray(grouped[key])) {
            allBarriers.push(...grouped[key]);
          }
        }
      }

      setBarriers(allBarriers.map(xanoBarrierToFrontend));
    } catch {
      setBarriers([]);
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
      // COM-B is workflow step 6; after confirm, current_step becomes 7+
      if (interventionData && interventionData.current_step >= 7) {
        setIsConfirmed(true);
        onLoadConfirmed?.();
      }
    } catch {
      // Could not check
    }
  }, [interventionId, onLoadConfirmed]);

  useEffect(() => {
    fetchBarriers();
    checkConfirmation();
  }, [fetchBarriers, checkConfirmation]);

  const handleToggle = () => {
    if (onToggleExpand) onToggleExpand();
    else setLocalExpanded(!localExpanded);
  };

  // Toggle selection
  const handleToggleSelect = async (barrierId: string) => {
    if (isConfirmed) return;

    try {
      await apiPost(
        `/api/interventions/${interventionId}/com-b/${barrierId}/toggle`,
        {}
      );
      await fetchBarriers();
    } catch {
      showToast("Failed to toggle selection", "error");
    }
  };

  // Add barrier
  const handleAddBarrier = async () => {
    if (!addingCategory || !addBarrierText.trim()) return;

    try {
      await apiPost(
        `/api/interventions/${interventionId}/com-b`,
        frontendBarrierToXanoCreate(
          { type: addingCategory, barrier: addBarrierText, description: addDescriptionText },
          interventionId
        )
      );
      await fetchBarriers();
      setAddingCategory(null);
      setAddBarrierText("");
      setAddDescriptionText("");
      showToast("Barrier added");
    } catch {
      showToast("Failed to add barrier", "error");
    }
  };

  // Edit barrier
  const handleStartEdit = (barrier: ComBBarrierFrontend) => {
    setEditingBarrier(barrier);
    setEditBarrierText(barrier.barrier);
    setEditDescriptionText(barrier.description);
  };

  const handleSaveEdit = async () => {
    if (!editingBarrier) return;

    setBarriers((prev) =>
      prev.map((b) =>
        b.id === editingBarrier.id
          ? { ...b, barrier: editBarrierText, description: editDescriptionText }
          : b
      )
    );

    try {
      await apiPatch(
        `/api/interventions/${interventionId}/com-b/${editingBarrier.id}`,
        frontendBarrierToXanoPatch({ barrier: editBarrierText, description: editDescriptionText })
      );
      showToast("Barrier saved");
      setEditingBarrier(null);
    } catch {
      showToast("Failed to save barrier", "error");
      fetchBarriers();
    }
  };

  // Delete barrier
  const handleDeleteBarrier = async (barrierId: string) => {
    setBarriers((prev) => prev.filter((b) => b.id !== barrierId));

    try {
      await apiDelete(`/api/interventions/${interventionId}/com-b/${barrierId}`);
      showToast("Barrier deleted");
    } catch {
      showToast("Failed to delete barrier", "error");
      fetchBarriers();
    }
  };

  // Confirm
  const handleConfirm = async () => {
    try {
      await apiPost(
        `/api/interventions/${interventionId}/com-b/confirm`,
        { intervention_id: interventionId }
      );
      setIsConfirmed(true);
      showToast("COM-B confirmed");
      onConfirm?.();
    } catch {
      showToast("Failed to confirm COM-B", "error");
    }
  };

  const getBarriersForCategory = (cat: ComBCategory) =>
    barriers.filter((b) => b.type === cat);

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className={`flex items-center justify-between ${isExpanded ? "mb-4" : ""}`}>
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">COM-B</span>
          {isConfirmed && <GreenCheckIcon />}
        </button>

        {!isLoading && !isConfirmed && (
          <button
            onClick={handleConfirm}
            disabled={selectedCount === 0}
            className={`px-4 py-2 text-sm font-medium rounded-full transition-all ${
              selectedCount > 0
                ? "text-text-inverse bg-button-solid hover:opacity-90"
                : "text-text-tertiary bg-stroke-soft cursor-not-allowed"
            }`}
          >
            Confirm COM-B
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
                    Select up to 3 key barriers across all categories ({selectedCount}/3 selected)
                  </p>
                </div>
              )}

              {/* Categories */}
              <div className="space-y-6">
                {CATEGORIES.map((cat) => {
                  const categoryBarriers = getBarriersForCategory(cat.key);

                  return (
                    <div key={cat.key}>
                      <div className="flex items-center gap-2 mb-3">
                        <span className={`px-2.5 py-1 rounded-md text-xs font-semibold ${cat.color} ${cat.bgColor}`}>
                          {cat.label}
                        </span>
                        <span className="text-xs text-text-tertiary">
                          {categoryBarriers.length} barrier{categoryBarriers.length !== 1 ? "s" : ""}
                        </span>
                      </div>

                      {/* Barrier cards */}
                      <div className="space-y-2">
                        {categoryBarriers.map((barrier) => (
                          <div
                            key={barrier.id}
                            className={`border rounded-lg p-3 transition-colors ${
                              barrier.selected
                                ? "border-button-solid bg-blue-50/30"
                                : "border-stroke-default bg-background-surface"
                            }`}
                          >
                            {editingBarrier?.id === barrier.id ? (
                              <div className="space-y-2">
                                <input
                                  type="text"
                                  value={editBarrierText}
                                  onChange={(e) => setEditBarrierText(e.target.value)}
                                  className="w-full px-3 py-2 text-sm border border-stroke-default rounded-lg focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                                  placeholder="Barrier title"
                                />
                                <textarea
                                  value={editDescriptionText}
                                  onChange={(e) => setEditDescriptionText(e.target.value)}
                                  className="w-full h-20 px-3 py-2 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                                  placeholder="Description"
                                />
                                <div className="flex gap-2 justify-end">
                                  <button
                                    onClick={() => setEditingBarrier(null)}
                                    className="px-3 py-1.5 text-xs font-medium text-text-secondary hover:text-text-primary"
                                  >
                                    Cancel
                                  </button>
                                  <button
                                    onClick={handleSaveEdit}
                                    className="px-3 py-1.5 text-xs font-medium text-text-inverse bg-button-solid rounded-md hover:opacity-90"
                                  >
                                    Save
                                  </button>
                                </div>
                              </div>
                            ) : (
                              <div className="flex items-start gap-3">
                                {!isConfirmed && (
                                  <button
                                    onClick={() => handleToggleSelect(barrier.id)}
                                    className={`mt-0.5 flex items-center justify-center w-5 h-5 rounded border-2 shrink-0 transition-colors ${
                                      barrier.selected
                                        ? "border-button-solid bg-button-solid text-white"
                                        : "border-stroke-default hover:border-text-tertiary"
                                    }`}
                                  >
                                    {barrier.selected && <CheckIcon />}
                                  </button>
                                )}
                                <div className="flex-1 min-w-0">
                                  <p className="text-sm font-medium text-text-primary">{barrier.barrier}</p>
                                  {barrier.description && (
                                    <p className="text-xs text-text-secondary mt-1 leading-relaxed">{barrier.description}</p>
                                  )}
                                </div>
                                {!isConfirmed && (
                                  <div className="flex items-center gap-1 shrink-0">
                                    <button
                                      onClick={() => handleStartEdit(barrier)}
                                      className="text-text-tertiary hover:text-text-secondary transition-colors p-1"
                                      aria-label="Edit"
                                    >
                                      <EditIcon />
                                    </button>
                                    <button
                                      onClick={() => handleDeleteBarrier(barrier.id)}
                                      className="text-text-tertiary hover:text-red-600 transition-colors p-1"
                                      aria-label="Delete"
                                    >
                                      <TrashIcon />
                                    </button>
                                  </div>
                                )}
                              </div>
                            )}
                          </div>
                        ))}
                      </div>

                      {/* Add barrier for this category */}
                      {!isConfirmed && addingCategory !== cat.key && (
                        <button
                          onClick={() => { setAddingCategory(cat.key); setAddBarrierText(""); setAddDescriptionText(""); }}
                          className="flex items-center gap-1.5 mt-2 text-xs font-medium text-text-secondary hover:text-text-primary transition-colors"
                        >
                          <PlusIcon />
                          Add {cat.label.toLowerCase()} barrier
                        </button>
                      )}

                      {/* Add barrier form inline */}
                      {!isConfirmed && addingCategory === cat.key && (
                        <div className="mt-2 border border-stroke-default rounded-lg p-3 space-y-2">
                          <input
                            type="text"
                            value={addBarrierText}
                            onChange={(e) => setAddBarrierText(e.target.value)}
                            className="w-full px-3 py-2 text-sm border border-stroke-default rounded-lg focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                            placeholder="Barrier title"
                            autoFocus
                          />
                          <textarea
                            value={addDescriptionText}
                            onChange={(e) => setAddDescriptionText(e.target.value)}
                            className="w-full h-20 px-3 py-2 text-sm border border-stroke-default rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-button-solid/20"
                            placeholder="Description (optional)"
                          />
                          <div className="flex gap-2 justify-end">
                            <button
                              onClick={() => setAddingCategory(null)}
                              className="px-3 py-1.5 text-xs font-medium text-text-secondary hover:text-text-primary"
                            >
                              Cancel
                            </button>
                            <button
                              onClick={handleAddBarrier}
                              disabled={!addBarrierText.trim()}
                              className="px-3 py-1.5 text-xs font-medium text-text-inverse bg-button-solid rounded-md hover:opacity-90 disabled:opacity-50"
                            >
                              Add
                            </button>
                          </div>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            </>
          )}
        </>
      )}
    </div>
  );
}
