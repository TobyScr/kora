"use client";

import { useState, useRef, useEffect } from "react";
import { Sidebar } from "@/components/Sidebar/Sidebar";
import { SectionItem } from "@/components/Sidebar/SectionItem";
import { SubsectionItem } from "@/components/Sidebar/SubsectionItem";
import { ChatBubble } from "@/components/ChatBubble/ChatBubble";
import { ChatInput } from "@/components/ChatInput/ChatInput";

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

const initialMessages: Message[] = [
  {
    id: "1",
    variant: "ai",
    content: "Thank you!\n\n8. **What's the available timeline?** (e.g., \"campaign is live over 6 months\"; \"1-4 months\")",
  },
  {
    id: "2",
    variant: "user",
    content: "6 Months",
  },
  {
    id: "3",
    variant: "ai",
    content: "Thank you!\n\n9. **What are the expected deliverables** — if you know them at this time? (e.g., \"integrated campaign with 1 hero video\")",
  },
  {
    id: "4",
    variant: "user",
    content: "Integrated campaign with digital and offline content/activations",
  },
  {
    id: "5",
    variant: "ai",
    content: "Thank you!\nI have three short **follow-up questions to clarify or refine** areas that could impact later design decisions.\n\n1. Are there specific diaspora locations (e.g., Russia, Turkey, EU countries) that should be prioritized for the campaign?\n2. Would you like the behavior-change focus to emphasize prevention (stopping early-stage radicalization), disengagement (helping those already exposed), or resilience-building (community-level strength)?\n3. Should this campaign use local languages (Tajik, Uzbek, Russian) or operate primarily in English for digital diaspora audiences?\n\nWould you like to answer these to refine the brief before I lock it?",
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
  const chatContainerRef = useRef<HTMLDivElement>(null);

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
            <SubsectionItem label="Brief Overview" isActive />
            <SubsectionItem label="Research Insights" isLocked />
            <SubsectionItem label="System Map" isLocked />
            <SubsectionItem label="Behavioural Objective" isLocked />
            <SubsectionItem label="Assumption testing" isLocked />
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

      {/* Main chat area */}
      <main className="flex-1 flex flex-col relative bg-[#f3f4f7]">
        {/* Top gradient fade */}
        <div className="absolute top-0 left-0 right-0 h-16 bg-gradient-to-b from-[#f3f4f7] to-transparent z-10 pointer-events-none" />

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
          </div>
        </div>

        {/* Bottom gradient fade */}
        <div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-[#f3f4f7] to-transparent pointer-events-none" />

        {/* Input bar */}
        <div className="absolute bottom-6 left-1/2 -translate-x-1/2 w-full max-w-[668px] px-4">
          <ChatInput placeholder="Type here" onSubmit={handleSendMessage} />
        </div>
      </main>
    </div>
  );
}
