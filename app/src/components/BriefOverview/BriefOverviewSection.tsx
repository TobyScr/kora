"use client";

import { useState, useEffect, useCallback } from "react";
import { BriefOverviewCard, type CardState, type CardType } from "./BriefOverviewCard";
import {
  EditClientNameModal,
  EditLocationModal,
  EditProblemDefinitionModal,
  EditInitialObjectiveModal,
  EditDeliverablesModal,
  EditBudgetModal,
  EditTimelineModal,
  EditBulletPointsModal,
} from "../EditModals";
import { useToast } from "../Toast";
import { apiGet, apiPost, apiPut } from "@/lib/api";
import { xanoBriefToFrontend, frontendBriefToXano } from "@/lib/transforms/brief";
import type { BriefData } from "@/lib/types/brief";
import type { XanoBriefOutput } from "@/lib/types/brief";

type BriefOverviewSectionProps = {
  interventionId: number;
  onConfirm?: () => void;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
};

const emptyBriefData: BriefData = {
  clientName: "",
  location: "",
  budget: { currency: "GBP", minAmount: "", maxAmount: "" },
  timeline: { unit: "months", from: "", to: "" },
  deliverables: "",
  problemDefinition: "",
  initialObjective: "",
  taProfile: [],
  dos: [],
  donts: [],
};

const ChevronIcon = ({ isExpanded }: { isExpanded: boolean }) => (
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    className={`transition-transform ${isExpanded ? "" : "-rotate-90"}`}
  >
    <path
      d="M4 6l4 4 4-4"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const DownloadIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 2v8m0 0l3-3m-3 3L5 7"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M3 12v1.5a1.5 1.5 0 001.5 1.5h7a1.5 1.5 0 001.5-1.5V12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

// TA Profile checkbox - lavender background
const CheckboxIcon = () => (
  <span className="flex items-center justify-center w-6 h-6 rounded-lg bg-[#eceeff] shrink-0">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
      <rect
        x="2"
        y="2"
        width="12"
        height="12"
        rx="2"
        stroke="#7c7cff"
        strokeWidth="1.5"
      />
    </svg>
  </span>
);

// Do's checkmark - teal background
const CheckIcon = () => (
  <span className="flex items-center justify-center w-6 h-6 rounded-lg bg-[#e1f4ee] shrink-0">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
      <path
        d="M4 8l3 3 5-6"
        stroke="#0d9373"
        strokeWidth="1.5"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  </span>
);

// Don'ts X - tomato background
const XIcon = () => (
  <span className="flex items-center justify-center w-6 h-6 rounded-lg bg-[#fff0e5] shrink-0">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
      <path
        d="M5 5l6 6M11 5l-6 6"
        stroke="#e54d2e"
        strokeWidth="1.5"
        strokeLinecap="round"
      />
    </svg>
  </span>
);

// Confirmed badge checkmark icon
const ConfirmedCheckIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 8l3 3 5-6"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

type OpenModal = CardType | null;

export function BriefOverviewSection({
  interventionId,
  onConfirm,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: BriefOverviewSectionProps) {
  const [data, setData] = useState<BriefData>(emptyBriefData);
  const [briefId, setBriefId] = useState<number | null>(null);
  const [isConfirmed, setIsConfirmed] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(false);
  const [openModal, setOpenModal] = useState<OpenModal>(null);
  const [localExpanded, setLocalExpanded] = useState(true);

  const { showToast } = useToast();

  // Use controlled or local expansion state
  const isExpanded = controlledExpanded ?? localExpanded;

  // Determine card state based on loading/data
  const cardState: CardState = isLoading
    ? "loading"
    : briefId !== null
      ? "filled"
      : "empty";

  // Fetch brief data on mount
  const fetchBrief = useCallback(async () => {
    try {
      setIsLoading(true);
      const response = await apiGet<XanoBriefOutput | null>(
        `/api/interventions/${interventionId}/brief`
      );

      if (response && response.id) {
        setBriefId(response.id);
        setIsConfirmed(response.is_confirmed || false);
        setData(xanoBriefToFrontend(response));
      } else {
        // No brief record yet
        setBriefId(null);
        setIsConfirmed(false);
        setData(emptyBriefData);
      }
    } catch {
      showToast("Failed to load brief data", "error");
    } finally {
      setIsLoading(false);
    }
  }, [interventionId, showToast]);

  useEffect(() => {
    fetchBrief();
  }, [fetchBrief]);

  const handleToggle = () => {
    if (onToggleExpand) {
      onToggleExpand();
    } else {
      setLocalExpanded(!localExpanded);
    }
  };

  const openEditModal = (modal: CardType) => setOpenModal(modal);
  const closeModal = () => setOpenModal(null);

  // Persist a field update to the API
  const persistUpdate = async (updatedData: BriefData) => {
    setIsSaving(true);
    try {
      const xanoBody = frontendBriefToXano(updatedData);

      if (briefId === null) {
        // No brief exists yet — create one via POST
        const created = await apiPost<XanoBriefOutput>(
          `/api/interventions/${interventionId}/brief`,
          xanoBody
        );
        if (created && created.id) {
          setBriefId(created.id);
        }
      } else {
        // Brief exists — update via PUT
        await apiPut(
          `/api/interventions/${interventionId}/brief/${briefId}`,
          xanoBody
        );
      }
    } catch {
      showToast("Failed to save changes", "error");
      // Re-fetch to restore server state
      fetchBrief();
    } finally {
      setIsSaving(false);
    }
  };

  // Generic save handler: update local state optimistically, then persist
  const handleSaveField = <K extends keyof BriefData>(
    field: K,
    value: BriefData[K]
  ) => {
    const updatedData = { ...data, [field]: value };
    setData(updatedData);
    persistUpdate(updatedData);
    closeModal();
  };

  // Handle confirm
  const handleConfirm = async () => {
    try {
      await fetch(`/api/interventions/${interventionId}/brief/confirm`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
      });
      setIsConfirmed(true);
      showToast("Brief overview confirmed", "success");
      onConfirm?.();
    } catch {
      showToast("Failed to confirm brief", "error");
    }
  };

  // Format budget for display
  const formatBudget = () => {
    const { minAmount, maxAmount } = data.budget;
    if (minAmount && maxAmount) {
      return `\u00a3${minAmount} - \u00a3${maxAmount}`;
    }
    if (minAmount) return `\u00a3${minAmount}+`;
    if (maxAmount) return `Up to \u00a3${maxAmount}`;
    return "";
  };

  // Format timeline for display
  const formatTimeline = () => {
    const { unit, from, to } = data.timeline;
    const unitLabel = unit.charAt(0).toUpperCase() + unit.slice(1);
    if (from && to) {
      return `${from} - ${to} ${unitLabel}`;
    }
    if (from) return `${from} ${unitLabel}`;
    return "";
  };

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className={`flex items-center justify-between ${isExpanded ? "mb-6" : ""}`}>
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">Brief Overview</span>
        </button>

        <div className="flex items-center gap-3">
          {/* Saving indicator */}
          {isSaving && (
            <span className="text-xs text-text-tertiary">Saving...</span>
          )}

          {/* Export PDF - only in filled state */}
          {cardState === "filled" && (
            <button className="flex items-center gap-2 px-4 py-2 text-sm font-medium text-text-primary border border-stroke-default rounded-full hover:bg-background-surface transition-colors">
              <DownloadIcon />
              Export PDF
            </button>
          )}

          {/* Confirmed badge or Confirm button */}
          {isConfirmed ? (
            <span className="flex items-center gap-1.5 px-4 py-2 text-sm font-medium text-green-700 bg-green-50 border border-green-200 rounded-full">
              <ConfirmedCheckIcon />
              Confirmed
            </span>
          ) : (
            cardState !== "loading" && (
              <button
                onClick={handleConfirm}
                className="px-4 py-2 text-sm font-medium text-text-inverse bg-button-solid rounded-full hover:opacity-90 transition-opacity"
              >
                Confirm Brief Overview
              </button>
            )
          )}
        </div>
      </div>

      {/* Cards Grid - 6 columns on lg for flexible layouts */}
      {isExpanded && (
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 gap-4">
        {/* Row 1: Client Name, Location, Budget */}
        <BriefOverviewCard
          type="clientName"
          state={cardState}
          content={data.clientName}
          className="lg:col-span-2"
          onEdit={() => openEditModal("clientName")}
        />
        <BriefOverviewCard
          type="location"
          state={cardState}
          content={data.location}
          className="lg:col-span-2"
          onEdit={() => openEditModal("location")}
        />
        <BriefOverviewCard
          type="budget"
          state={cardState}
          content={formatBudget()}
          className="lg:col-span-2"
          onEdit={() => openEditModal("budget")}
        />

        {/* Row 2: Timeline, Deliverables */}
        <BriefOverviewCard
          type="timeline"
          state={cardState}
          content={formatTimeline()}
          className="lg:col-span-2"
          onEdit={() => openEditModal("timeline")}
        />
        <BriefOverviewCard
          type="deliverables"
          state={cardState}
          content={data.deliverables}
          className="lg:col-span-4"
          onEdit={() => openEditModal("deliverables")}
        />

        {/* Row 3: Problem Definition, Initial Objective (equal width 50/50) */}
        <BriefOverviewCard
          type="problemDefinition"
          state={cardState}
          content={data.problemDefinition}
          className="lg:col-span-3"
          onEdit={() => openEditModal("problemDefinition")}
        />
        <BriefOverviewCard
          type="initialObjective"
          state={cardState}
          content={data.initialObjective}
          className="lg:col-span-3"
          onEdit={() => openEditModal("initialObjective")}
        />

        {/* Row 4: TA Profile (full width) */}
        <BriefOverviewCard
          type="taProfile"
          state={cardState}
          content={
            data.taProfile.length > 0 ? (
              <ul className="space-y-3">
                {data.taProfile.map((item, i) => (
                  <li key={i} className="flex items-center gap-3">
                    <CheckboxIcon />
                    <span className="font-normal">{item}</span>
                  </li>
                ))}
              </ul>
            ) : undefined
          }
          className="md:col-span-2 lg:col-span-6"
          onEdit={() => openEditModal("taProfile")}
        />

        {/* Row 5: Do's, Don'ts (equal width 50/50) */}
        <BriefOverviewCard
          type="dos"
          state={cardState}
          content={
            data.dos.length > 0 ? (
              <ul className="space-y-3">
                {data.dos.map((item, i) => (
                  <li key={i} className="flex items-center gap-3">
                    <CheckIcon />
                    <span className="font-normal">{item}</span>
                  </li>
                ))}
              </ul>
            ) : undefined
          }
          className="lg:col-span-3"
          onEdit={() => openEditModal("dos")}
        />
        <BriefOverviewCard
          type="donts"
          state={cardState}
          content={
            data.donts.length > 0 ? (
              <ul className="space-y-3">
                {data.donts.map((item, i) => (
                  <li key={i} className="flex items-center gap-3">
                    <XIcon />
                    <span className="font-normal">{item}</span>
                  </li>
                ))}
              </ul>
            ) : undefined
          }
          className="lg:col-span-3"
          onEdit={() => openEditModal("donts")}
        />
      </div>
      )}

      {/* Edit Modals */}
      <EditClientNameModal
        isOpen={openModal === "clientName"}
        onClose={closeModal}
        initialValue={data.clientName}
        onSave={(value) => handleSaveField("clientName", value)}
      />

      <EditLocationModal
        isOpen={openModal === "location"}
        onClose={closeModal}
        initialValue={data.location}
        onSave={(value) => handleSaveField("location", value)}
      />

      <EditProblemDefinitionModal
        isOpen={openModal === "problemDefinition"}
        onClose={closeModal}
        initialValue={data.problemDefinition}
        onSave={(value) => handleSaveField("problemDefinition", value)}
      />

      <EditInitialObjectiveModal
        isOpen={openModal === "initialObjective"}
        onClose={closeModal}
        initialValue={data.initialObjective}
        onSave={(value) => handleSaveField("initialObjective", value)}
      />

      <EditDeliverablesModal
        isOpen={openModal === "deliverables"}
        onClose={closeModal}
        initialValue={data.deliverables}
        onSave={(value) => handleSaveField("deliverables", value)}
      />

      <EditBudgetModal
        isOpen={openModal === "budget"}
        onClose={closeModal}
        initialValue={data.budget}
        onSave={(value) => handleSaveField("budget", value)}
      />

      <EditTimelineModal
        isOpen={openModal === "timeline"}
        onClose={closeModal}
        initialValue={data.timeline}
        onSave={(value) => handleSaveField("timeline", value)}
      />

      <EditBulletPointsModal
        isOpen={openModal === "taProfile"}
        onClose={closeModal}
        title="Edit TA Profile"
        fieldLabel="Bullet point"
        initialValue={{ points: data.taProfile }}
        onSave={(value) => handleSaveField("taProfile", value.points)}
        maxPoints={6}
        maxLength={150}
      />

      <EditBulletPointsModal
        isOpen={openModal === "dos"}
        onClose={closeModal}
        title="Edit Do's"
        fieldLabel="Bullet point"
        initialValue={{ points: data.dos }}
        onSave={(value) => handleSaveField("dos", value.points)}
        maxPoints={5}
        maxLength={150}
      />

      <EditBulletPointsModal
        isOpen={openModal === "donts"}
        onClose={closeModal}
        title="Edit Don'ts"
        fieldLabel="Bullet point"
        initialValue={{ points: data.donts }}
        onSave={(value) => handleSaveField("donts", value.points)}
        maxPoints={5}
        maxLength={150}
      />
    </div>
  );
}
