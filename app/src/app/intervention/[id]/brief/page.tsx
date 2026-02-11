"use client";

import { useState, useRef, useEffect } from "react";
import { Sidebar } from "@/components/Sidebar/Sidebar";
import { SectionItem } from "@/components/Sidebar/SectionItem";
import { SubsectionItem } from "@/components/Sidebar/SubsectionItem";
import { ChatBubble } from "@/components/ChatBubble/ChatBubble";
import { ChatInput } from "@/components/ChatInput/ChatInput";
import { BriefOverviewSection, type CardState } from "@/components/BriefOverview";
import { ResearchInsightsSection } from "@/components/ResearchInsights";
import { SystemMapSection } from "@/components/SystemMap";
import { BehaviouralObjectiveSection } from "@/components/BehaviouralObjective";
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
};

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
  const [viewMode, setViewMode] = useState<ViewMode>("chat");
  const [cardState, setCardState] = useState<CardState>("filled");
  const [briefOverviewExpanded, setBriefOverviewExpanded] = useState(true);
  const [researchInsightsConfirmed, setResearchInsightsConfirmed] = useState(false);
  const [systemMapConfirmed, setSystemMapConfirmed] = useState(false);
  const [systemMapExpanded, setSystemMapExpanded] = useState(true);
  const [behaviouralObjectiveExpanded, setBehaviouralObjectiveExpanded] = useState(true);
  const [selectedEntryPoint, setSelectedEntryPoint] = useState<{ number: number; title: string } | null>(null);
  const [progressSections, setProgressSections] = useState<ProgressSections>({
    briefOverview: { status: "in-progress", isExpanded: true },
    researchInsights: { status: "in-progress", isExpanded: false },
    systemMap: { status: "in-progress", isExpanded: false },
    behaviouralObjective: { status: "in-progress", isExpanded: false },
  });
  const chatContainerRef = useRef<HTMLDivElement>(null);
  const researchInsightsRef = useRef<HTMLDivElement>(null);
  const systemMapRef = useRef<HTMLDivElement>(null);
  const behaviouralObjectiveRef = useRef<HTMLDivElement>(null);

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

  const handleToggleSection = (section: "briefOverview" | "researchInsights" | "systemMap" | "behaviouralObjective") => {
    setProgressSections((prev) => ({
      ...prev,
      [section]: {
        ...prev[section],
        isExpanded: !prev[section].isExpanded,
      },
    }));
  };

  const handleConfirmBriefOverview = () => {
    // Collapse Brief Overview and expand Research Insights
    setBriefOverviewExpanded(false);
    setProgressSections((prev) => ({
      ...prev,
      briefOverview: { status: "complete", isExpanded: false },
      researchInsights: { status: "in-progress", isExpanded: true },
    }));

    // Auto-scroll to Research Insights after a short delay for DOM update
    setTimeout(() => {
      researchInsightsRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
    }, 100);
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
            <SubsectionItem
              label="Brief Overview"
              isActive={progressSections.briefOverview.status === "in-progress"}
              isComplete={progressSections.briefOverview.status === "complete"}
            />
            <SubsectionItem
              label="Research Insights"
              isActive={progressSections.researchInsights.status === "in-progress" && progressSections.briefOverview.status === "complete"}
              isComplete={progressSections.researchInsights.status === "complete"}
              isLocked={progressSections.briefOverview.status !== "complete"}
            />
            <SubsectionItem
              label="System Map"
              isActive={progressSections.systemMap.status === "in-progress" && progressSections.researchInsights.status === "complete"}
              isComplete={progressSections.systemMap.status === "complete"}
              isLocked={progressSections.researchInsights.status !== "complete"}
            />
            <SubsectionItem
              label="Behavioural Objective"
              isActive={progressSections.behaviouralObjective.status === "in-progress" && progressSections.systemMap.status === "complete"}
              isComplete={progressSections.behaviouralObjective.status === "complete"}
              isLocked={progressSections.systemMap.status !== "complete"}
            />
            <SubsectionItem
              label="Assumption testing"
              isLocked={progressSections.behaviouralObjective.status !== "complete"}
            />
            <SubsectionItem label="COM-B & Personas" isLocked />
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
          /* Brief Overview view */
          <div className="flex-1 overflow-y-auto px-6 md:px-10 pt-16 pb-10">
            <div className="space-y-6">
              <BriefOverviewSection
                state={cardState}
                onStateChange={setCardState}
                onConfirm={handleConfirmBriefOverview}
                showDevToggle
                isExpanded={briefOverviewExpanded}
                onToggleExpand={() => setBriefOverviewExpanded(!briefOverviewExpanded)}
              />
              <div ref={researchInsightsRef}>
                <ResearchInsightsSection
                  isExpanded={progressSections.researchInsights.isExpanded}
                  onToggleExpand={() => handleToggleSection("researchInsights")}
                  onConfirm={() => {
                    setResearchInsightsConfirmed(true);
                    setSystemMapExpanded(true);
                    setProgressSections((prev) => ({
                      ...prev,
                      researchInsights: { status: "complete", isExpanded: false },
                      systemMap: { status: "in-progress", isExpanded: true },
                    }));
                    // Auto-scroll to System Map after a short delay for DOM update
                    setTimeout(() => {
                      systemMapRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
                    }, 100);
                  }}
                />
              </div>
              {/* System Map - shown after Research Insights is confirmed */}
              {researchInsightsConfirmed && (
                <div ref={systemMapRef}>
                  <SystemMapSection
                    isExpanded={systemMapExpanded}
                    onToggleExpand={() => setSystemMapExpanded(!systemMapExpanded)}
                    onConfirm={(entryPoint) => {
                      setSystemMapExpanded(false);
                      setSystemMapConfirmed(true);
                      setSelectedEntryPoint(entryPoint);
                      setBehaviouralObjectiveExpanded(true);
                      setProgressSections((prev) => ({
                        ...prev,
                        systemMap: { status: "complete", isExpanded: false },
                        behaviouralObjective: { status: "in-progress", isExpanded: true },
                      }));
                      setTimeout(() => {
                        behaviouralObjectiveRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
                      }, 100);
                    }}
                  />
                </div>
              )}
              {/* Behavioural Objective - shown after System Map is confirmed */}
              {systemMapConfirmed && (
                <div ref={behaviouralObjectiveRef}>
                  <BehaviouralObjectiveSection
                    isExpanded={behaviouralObjectiveExpanded}
                    onToggleExpand={() => setBehaviouralObjectiveExpanded(!behaviouralObjectiveExpanded)}
                    selectedChallenge={selectedEntryPoint}
                    onViewEntryPoint={() => {
                      setSystemMapExpanded(true);
                      setTimeout(() => {
                        systemMapRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
                      }, 100);
                    }}
                    onConfirm={() => {
                      setBehaviouralObjectiveExpanded(false);
                      setProgressSections((prev) => ({
                        ...prev,
                        behaviouralObjective: { status: "complete", isExpanded: false },
                      }));
                    }}
                  />
                </div>
              )}
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
