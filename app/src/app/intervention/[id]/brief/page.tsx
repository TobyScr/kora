"use client";

import { useState, useRef, useEffect } from "react";
import { Sidebar } from "@/components/Sidebar/Sidebar";
import { SectionItem } from "@/components/Sidebar/SectionItem";
import { SubsectionItem } from "@/components/Sidebar/SubsectionItem";
import { ChatBubble } from "@/components/ChatBubble/ChatBubble";
import { ChatInput } from "@/components/ChatInput/ChatInput";
import { AccordionSection } from "@/components/AccordionSection/AccordionSection";
import {
  COMBMappingSection,
  SAMPLE_COMB_DATA,
  type COMBState,
  type COMBCategory,
  type COMBCategoryId,
} from "@/components/COMBMapping";
import { Button } from "@/components/Button/Button";
import { ProgressPanel, type StatusType } from "@/components/ProgressPanel";

const FileIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 1.5h5.5L13 5v9a1.5 1.5 0 01-1.5 1.5h-7A1.5 1.5 0 013 14V3A1.5 1.5 0 014.5 1.5z"
      stroke="currentColor"
      strokeWidth="1.2"
    />
    <path d="M9.5 1.5V5H13" stroke="currentColor" strokeWidth="1.2" />
  </svg>
);

const LockIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="3" y="7" width="10" height="7" rx="1.5" stroke="currentColor" strokeWidth="1.5" />
    <path
      d="M5.5 7V5a2.5 2.5 0 015 0v2"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

const ArrowRightIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 8h10m0 0L9 4m4 4L9 12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

type Message = {
  id: string;
  variant: "ai" | "user";
  content: string;
};

type ViewMode = "chat" | "overview";

type SectionState = {
  status: StatusType;
  isExpanded: boolean;
};

type ProgressSections = {
  briefOverview: SectionState;
  researchInsights: SectionState;
  systemMap: SectionState;
  behaviouralObjective: SectionState;
  assumptionTesting: SectionState;
  combPersonas: SectionState;
};

type ProgressSectionKey = keyof ProgressSections;

const initialMessages: Message[] = [
  {
    id: "1",
    variant: "ai",
    content: "We begin by gaining an initial understanding of your brief.\nWe'll walk you through 9 initial questions.\n\n**1. Who is the client or funder?** (e.g., \"government\"; \"foundation\")",
  },
];

const aiResponses = [
  "Thank you for that information! Let me process this and incorporate it into your brief.",
  "Great, I've noted that down. Is there anything else you'd like to add?",
  "Understood. This will help shape the direction of the campaign.",
  "Perfect, that's very helpful context. Let me update the brief accordingly.",
];

export default function BriefPage() {
  const [messages, setMessages] = useState<Message[]>(initialMessages);
  const [viewMode, setViewMode] = useState<ViewMode>("overview");
  // COM-B state
  const [combState, setCombState] = useState<COMBState>("filled");
  const [combExpanded, setCombExpanded] = useState(true);
  const [combCategories, setCombCategories] = useState<COMBCategory[]>(SAMPLE_COMB_DATA);

  const [progressSections, setProgressSections] = useState<ProgressSections>({
    briefOverview: { status: "complete", isExpanded: false },
    researchInsights: { status: "complete", isExpanded: false },
    systemMap: { status: "complete", isExpanded: false },
    behaviouralObjective: { status: "complete", isExpanded: false },
    assumptionTesting: { status: "complete", isExpanded: false },
    combPersonas: { status: "in-progress", isExpanded: true },
  });
  const chatContainerRef = useRef<HTMLDivElement>(null);
  const combSectionRef = useRef<HTMLDivElement>(null);

  // Check if user has sent at least one message
  const hasUserMessage = messages.some((m) => m.variant === "user");

  useEffect(() => {
    if (chatContainerRef.current) {
      chatContainerRef.current.scrollTop = chatContainerRef.current.scrollHeight;
    }
  }, [messages]);

  const handleSendMessage = (content: string) => {
    const userMessage: Message = {
      id: "user-" + Date.now(),
      variant: "user",
      content,
    };
    setMessages((prev) => [...prev, userMessage]);

    // Simulate AI response after a short delay
    setTimeout(() => {
      const aiResponse: Message = {
        id: "ai-" + Date.now(),
        variant: "ai",
        content: aiResponses[Math.floor(Math.random() * aiResponses.length)],
      };
      setMessages((prev) => [...prev, aiResponse]);
    }, 1000);
  };

  const handleGenerateOverview = () => {
    setViewMode("overview");
  };

  const handleToggleSection = (section: ProgressSectionKey) => {
    setProgressSections((prev) => ({
      ...prev,
      [section]: {
        ...prev[section],
        isExpanded: !prev[section].isExpanded,
      },
    }));
  };

  const handleToggleCombCategory = (categoryId: COMBCategoryId) => {
    setCombCategories((prev) =>
      prev.map((cat) =>
        cat.id === categoryId ? { ...cat, isExpanded: !cat.isExpanded } : cat
      )
    );
  };

  return (
    <div className="flex h-screen bg-background-page">
      {/* Sidebar */}
      <div className="hidden md:block">
        <Sidebar
          projectName="Rewrite the Rules"
          projectSubtitle="Project name"
          progress={25}
          sections={[]}
        >
          {/* Understand - expanded */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<FileIcon />} label="Understand" isExpanded />
            <SubsectionItem label="Brief Overview" isComplete />
            <SubsectionItem label="Research Insights" isComplete />
            <SubsectionItem label="System Map" isComplete />
            <SubsectionItem label="Behavioural Objective" isComplete />
            <SubsectionItem label="Assumption testing" isComplete />
            <SubsectionItem label="COM-B & Personas" isActive />
          </div>
          {/* Design - locked */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<LockIcon />} label="Design" isLocked />
          </div>
          {/* Activate - locked */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<LockIcon />} label="Activate" isLocked />
          </div>
          {/* Evaluate - locked */}
          <div className="border-b border-stroke-default">
            <SectionItem icon={<LockIcon />} label="Evaluate" isLocked />
          </div>
        </Sidebar>
      </div>

      {/* Main content area */}
      <main className="flex-1 flex flex-col relative bg-[#f3f4f7]">
        {/* Top gradient fade */}
        <div className="absolute top-0 left-0 right-0 h-16 bg-gradient-to-b from-[#f3f4f7] to-transparent z-10 pointer-events-none" />

        {viewMode === "chat" ? (
          <>
            {/* Chat messages */}
            <div
              ref={chatContainerRef}
              className="flex-1 overflow-y-auto px-6 md:px-10 pt-16 pb-40"
            >
              <div className="flex flex-col gap-12 items-center max-w-[700px] mx-auto">
                {messages.map((message) => (
                  <ChatBubble key={message.id} variant={message.variant}>
                    <div className="whitespace-pre-wrap">
                      {message.content.split(/(\*\*.*?\*\*)/).map((part, i) => {
                        if (part.startsWith("**") && part.endsWith("**")) {
                          return (
                            <span key={i} className="font-medium">
                              {part.slice(2, -2)}
                            </span>
                          );
                        }
                        return part;
                      })}
                    </div>
                  </ChatBubble>
                ))}

                {/* Generate Brief Overview button - shown after user sends a message */}
                {hasUserMessage && (
                  <Button
                    variant="solid"
                    icon={<ArrowRightIcon />}
                    onClick={handleGenerateOverview}
                  >
                    Generate Brief Overview
                  </Button>
                )}
              </div>
            </div>

            {/* Bottom gradient fade */}
            <div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-[#f3f4f7] to-transparent pointer-events-none" />

            {/* Input bar */}
            <div className="absolute bottom-6 left-1/2 -translate-x-1/2 w-full max-w-[668px] px-4 z-20">
              <ChatInput placeholder="Type here" onSubmit={handleSendMessage} />
            </div>
          </>
        ) : (
          /* Overview view */
          <div className="flex-1 overflow-y-auto px-6 md:px-10 pt-16 pb-10">
            <div className="space-y-4">
              {/* Completed sections as collapsed AccordionSections */}
              <AccordionSection
                title="Brief Overview"
                isComplete
                onExportPdf={() => {}}
              />
              <AccordionSection
                title="Research Insights"
                isComplete
              />
              <AccordionSection
                title="System Map"
                isComplete
              />
              <AccordionSection
                title="Behavioral Objective"
                isComplete
              />
              <AccordionSection
                title="Assumption Testing"
                isComplete
              />

              {/* COM-B Mapping Section - active */}
              <div ref={combSectionRef}>
                <COMBMappingSection
                  state={combState}
                  onStateChange={setCombState}
                  categories={combCategories}
                  onToggleCategory={handleToggleCombCategory}
                  showDevToggle
                  isExpanded={combExpanded}
                  onToggleExpand={() => setCombExpanded(!combExpanded)}
                />
              </div>
            </div>
          </div>
        )}
      </main>

      {/* Progress Panel - right side, only in overview mode */}
      {viewMode === "overview" && (
        <div className="hidden lg:block">
          <ProgressPanel
            sections={progressSections}
            onToggleSection={handleToggleSection}
          />
        </div>
      )}
    </div>
  );
}
