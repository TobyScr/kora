"use client";

import { useState, useRef, useEffect, useCallback } from "react";
import { useParams, useRouter } from "next/navigation";
import { apiGet } from "@/lib/api";
import type { Intervention } from "@/lib/types/intervention";
import { Sidebar } from "@/components/Sidebar/Sidebar";
import { SectionItem } from "@/components/Sidebar/SectionItem";
import { SubsectionItem } from "@/components/Sidebar/SubsectionItem";
import { ChatBubble } from "@/components/ChatBubble/ChatBubble";
import { ChatInput } from "@/components/ChatInput/ChatInput";
import { BriefOverviewSection } from "@/components/BriefOverview";
import { ResearchInsightsSection } from "@/components/ResearchInsights";
import { SystemMapSection } from "@/components/SystemMap";
import { BehaviouralObjectiveSection } from "@/components/BehaviouralObjective";
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

const initialMessages: Message[] = [];

export default function BriefPage() {
  const params = useParams();
  const router = useRouter();
  const [intervention, setIntervention] = useState<Intervention | null>(null);
  const [interventionLoading, setInterventionLoading] = useState(true);
  const [interventionError, setInterventionError] = useState<string | null>(null);
  const [messages, setMessages] = useState<Message[]>(initialMessages);
  const [viewMode, setViewMode] = useState<ViewMode>("chat");
  const [briefOverviewExpanded, setBriefOverviewExpanded] = useState(true);
  const [researchInsightsConfirmed, setResearchInsightsConfirmed] = useState(false);
  const [systemMapConfirmed, setSystemMapConfirmed] = useState(false);
  const [systemMapExpanded, setSystemMapExpanded] = useState(true);
  const [behaviouralObjectiveExpanded, setBehaviouralObjectiveExpanded] = useState(true);
  const [selectedEntryPoint, setSelectedEntryPoint] = useState<{ number: number; title: string } | null>(null);
  const [isStreaming, setIsStreaming] = useState(false);
  const [sessionId] = useState(() => crypto.randomUUID());
  const [progressSections, setProgressSections] = useState<ProgressSections>({
    briefOverview: { status: "in-progress", isExpanded: true },
    researchInsights: { status: "in-progress", isExpanded: false },
    systemMap: { status: "in-progress", isExpanded: false },
    behaviouralObjective: { status: "in-progress", isExpanded: false },
  });
  // Render inline markdown (bold + italic) within a text segment
  function renderInline(text: string, keyPrefix: string) {
    return text.split(/(\*\*.*?\*\*|\*[^*]+?\*)/).map((part, i) => {
      if (part.startsWith("**") && part.endsWith("**")) {
        return <span key={`${keyPrefix}-${i}`} className="font-semibold text-[0.94rem] text-text-primary">{part.slice(2, -2)}</span>;
      }
      if (part.startsWith("*") && part.endsWith("*")) {
        return <em key={`${keyPrefix}-${i}`} className="text-text-secondary text-[0.8rem] not-italic">{part.slice(1, -1)}</em>;
      }
      return <span key={`${keyPrefix}-${i}`}>{part}</span>;
    });
  }

  // Render markdown content: handles ## headers, bullet lists, and inline formatting
  function renderMarkdown(content: string) {
    const lines = content.split("\n");
    const elements: React.ReactNode[] = [];
    let i = 0;

    while (i < lines.length) {
      const line = lines[i];

      // ## Headers → bold section title with spacing
      if (line.startsWith("## ")) {
        elements.push(
          <div key={`h-${i}`} className="font-semibold text-[0.94rem] text-text-primary mt-5 mb-1">
            {line.replace(/^#+\s*/, "")}
          </div>
        );
        i++;
        continue;
      }

      // Bullet list items (- or *)
      if (/^[\-\*]\s/.test(line)) {
        const listItems: React.ReactNode[] = [];
        while (i < lines.length && /^[\-\*]\s/.test(lines[i])) {
          listItems.push(
            <li key={`li-${i}`} className="text-[0.84rem] leading-relaxed">{renderInline(lines[i].replace(/^[\-\*]\s/, ""), `li-${i}`)}</li>
          );
          i++;
        }
        elements.push(<ul key={`ul-${i}`} className="list-disc pl-5 my-1.5 space-y-1">{listItems}</ul>);
        continue;
      }

      // Empty lines → breathing room
      if (line.trim() === "") {
        elements.push(<div key={`sp-${i}`} className="h-3" />);
        i++;
        continue;
      }

      // Regular text → inline markdown
      elements.push(<div key={`p-${i}`} className="leading-relaxed">{renderInline(line, `p-${i}`)}</div>);
      i++;
    }

    return elements;
  }

  const chatContainerRef = useRef<HTMLDivElement>(null);
  const researchInsightsRef = useRef<HTMLDivElement>(null);
  const systemMapRef = useRef<HTMLDivElement>(null);
  const behaviouralObjectiveRef = useRef<HTMLDivElement>(null);
  const greetingSentRef = useRef(false);

  // Fetch intervention data
  useEffect(() => {
    async function fetchIntervention() {
      try {
        const data = await apiGet<Intervention>(
          `/api/interventions/${params.id}`
        );
        setIntervention(data);
      } catch (err) {
        const message =
          err instanceof Error ? err.message : "Failed to load intervention";
        setInterventionError(message);
      } finally {
        setInterventionLoading(false);
      }
    }

    fetchIntervention();
  }, [params.id]);

  // Auto-detect view mode: if a brief record exists, show overview instead of chat
  useEffect(() => {
    async function checkBriefExists() {
      try {
        const brief = await apiGet<{ id?: number } | null>(
          `/api/interventions/${params.id}/brief`
        );
        if (brief && brief.id) {
          setViewMode("overview");
        }
      } catch {
        // No brief found or error — stay in chat mode
      }
    }
    checkBriefExists();
  }, [params.id]);

  // Auto-send greeting to N8N on first load in chat mode
  useEffect(() => {
    if (viewMode !== "chat" || greetingSentRef.current) return;
    greetingSentRef.current = true;

    const sendGreeting = async () => {
      const aiMsgId = "ai-greeting-" + Date.now();
      setMessages([{ id: aiMsgId, variant: "ai", content: "" }]);
      setIsStreaming(true);

      const controller = new AbortController();
      const overallTimeout = setTimeout(() => controller.abort(), 90000);

      try {
        const response = await fetch(`/api/interventions/${params.id}/chat`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ message: "Hello", sessionId }),
          signal: controller.signal,
        });

        if (!response.ok) throw new Error("Greeting failed");

        const reader = response.body?.getReader();
        const decoder = new TextDecoder();
        let idleTimer: ReturnType<typeof setTimeout> | undefined;

        const resetIdleTimer = () => {
          clearTimeout(idleTimer);
          idleTimer = setTimeout(() => {
            reader?.cancel();
          }, 30000);
        };

        if (reader) {
          resetIdleTimer();
          while (true) {
            const { done, value } = await reader.read();
            if (done) break;
            resetIdleTimer();
            const chunk = decoder.decode(value, { stream: true });
            setMessages((prev) =>
              prev.map((m) =>
                m.id === aiMsgId ? { ...m, content: m.content + chunk } : m
              )
            );
          }
          clearTimeout(idleTimer);
        }
      } catch {
        setMessages([{
          id: aiMsgId,
          variant: "ai",
          content: "Kora took too long to respond. Please try sending your message again.",
        }]);
      } finally {
        clearTimeout(overallTimeout);
        setIsStreaming(false);
      }
    };

    sendGreeting();
  }, [viewMode, params.id, sessionId]);

  useEffect(() => {
    if (chatContainerRef.current) {
      chatContainerRef.current.scrollTop = chatContainerRef.current.scrollHeight;
    }
  }, [messages]);

  const handleSendMessage = async (content: string) => {
    if (isStreaming) return;

    // Add user message
    const userMsg: Message = { id: "user-" + Date.now(), variant: "user", content };
    setMessages((prev) => [...prev, userMsg]);

    // Add empty AI placeholder
    const aiMsgId = "ai-" + Date.now();
    setMessages((prev) => [...prev, { id: aiMsgId, variant: "ai", content: "" }]);
    setIsStreaming(true);

    const controller = new AbortController();
    const overallTimeout = setTimeout(() => controller.abort(), 90000);

    try {
      const response = await fetch(`/api/interventions/${params.id}/chat`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: content, sessionId }),
        signal: controller.signal,
      });

      if (!response.ok) throw new Error("Chat request failed");

      // Read streamed plain-text response with idle timeout
      const reader = response.body?.getReader();
      const decoder = new TextDecoder();
      let idleTimer: ReturnType<typeof setTimeout> | undefined;

      const resetIdleTimer = () => {
        clearTimeout(idleTimer);
        idleTimer = setTimeout(() => {
          reader?.cancel();
        }, 30000);
      };

      if (reader) {
        resetIdleTimer();
        while (true) {
          const { done, value } = await reader.read();
          if (done) break;
          resetIdleTimer();
          const chunk = decoder.decode(value, { stream: true });
          setMessages((prev) =>
            prev.map((m) =>
              m.id === aiMsgId ? { ...m, content: m.content + chunk } : m
            )
          );
        }
        clearTimeout(idleTimer);
      }

      // After stream completes, check if brief was generated
      try {
        const brief = await apiGet<{ id?: number } | null>(
          `/api/interventions/${params.id}/brief`
        );
        if (brief && brief.id) {
          setViewMode("overview");
        }
      } catch {
        // No brief yet — that's fine, chat continues
      }
    } catch {
      setMessages((prev) =>
        prev.map((m) =>
          m.id === aiMsgId
            ? { ...m, content: "Kora took too long to respond. Please try sending your message again." }
            : m
        )
      );
    } finally {
      clearTimeout(overallTimeout);
      setIsStreaming(false);
    }
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

  const handleBriefLoadedConfirmed = useCallback(() => {
    setBriefOverviewExpanded(false);
    setProgressSections((prev) => ({
      ...prev,
      briefOverview: { status: "complete", isExpanded: false },
      researchInsights: { status: "in-progress", isExpanded: true },
    }));
  }, []);

  const handleResearchLoadedConfirmed = useCallback(() => {
    setResearchInsightsConfirmed(true);
    setBriefOverviewExpanded(false);
    setProgressSections((prev) => ({
      ...prev,
      briefOverview: { status: "complete", isExpanded: false },
      researchInsights: { status: "complete", isExpanded: false },
      systemMap: { status: "in-progress", isExpanded: true },
    }));
  }, []);

  const projectName = intervention?.project_name || "Loading...";

  const handleBackToIntervention = () => {
    router.push(`/intervention/${params.id}`);
  };

  if (interventionLoading) {
    return (
      <div className="flex h-screen items-center justify-center bg-background-page">
        <p className="text-text-secondary text-sm">Loading brief...</p>
      </div>
    );
  }

  if (interventionError) {
    return (
      <div className="flex h-screen items-center justify-center bg-background-page">
        <p className="text-sm text-red-700">{interventionError}</p>
      </div>
    );
  }

  return (
    <div className="flex h-screen bg-background-page">
      {/* Sidebar */}
      <div className="hidden md:block">
        <Sidebar
          projectName={projectName}
          projectSubtitle="Project name"
          progress={25}
          sections={[]}
          onBack={handleBackToIntervention}
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
                      {renderMarkdown(message.content)}
                    </div>
                  </ChatBubble>
                ))}
              </div>
            </div>

            {/* Bottom gradient fade */}
            <div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-[#f3f4f7] to-transparent pointer-events-none" />

            {/* Input bar */}
            <div className="absolute bottom-6 left-1/2 -translate-x-1/2 w-full max-w-[668px] px-4 z-20">
              <ChatInput
                placeholder={isStreaming ? "Kora is typing..." : "Type here"}
                onSubmit={handleSendMessage}
                disabled={isStreaming}
              />
            </div>
          </>
        ) : (
          /* Brief Overview view */
          <div className="flex-1 overflow-y-auto px-6 md:px-10 pt-16 pb-10">
            <div className="space-y-6">
              <BriefOverviewSection
                interventionId={Number(params.id)}
                onConfirm={handleConfirmBriefOverview}
                onLoadConfirmed={handleBriefLoadedConfirmed}
                isExpanded={briefOverviewExpanded}
                onToggleExpand={() => setBriefOverviewExpanded(!briefOverviewExpanded)}
              />
              <div ref={researchInsightsRef}>
                <ResearchInsightsSection
                  interventionId={Number(params.id)}
                  isExpanded={progressSections.researchInsights.isExpanded}
                  onToggleExpand={() => handleToggleSection("researchInsights")}
                  onLoadConfirmed={handleResearchLoadedConfirmed}
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
        <div className="hidden lg:block shrink-0">
          <ProgressPanel
            sections={progressSections}
            onToggleSection={handleToggleSection}
          />
        </div>
      )}
    </div>
  );
}
