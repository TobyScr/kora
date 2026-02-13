"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { useAuth } from "@/lib/auth-context";
import { apiGet } from "@/lib/api";
import { Button } from "@/components/Button/Button";
import type { Intervention } from "@/lib/types/intervention";

const LogoutIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M6 2H3.5A1.5 1.5 0 002 3.5v9A1.5 1.5 0 003.5 14H6M10.5 11.5L14 8m0 0l-3.5-3.5M14 8H6"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
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

export default function Home() {
  const { user, isLoading: authLoading, logout } = useAuth();
  const [interventions, setInterventions] = useState<Intervention[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (authLoading) return;
    if (!user) return;

    async function fetchInterventions() {
      try {
        const data = await apiGet<Intervention[]>("/api/interventions");
        setInterventions(data);
      } catch (err) {
        const message =
          err instanceof Error ? err.message : "Failed to load interventions";
        setError(message);
      } finally {
        setIsLoading(false);
      }
    }

    fetchInterventions();
  }, [user, authLoading]);

  const handleLogout = async () => {
    await logout();
    window.location.href = "/login";
  };

  if (authLoading) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-background-page">
        <p className="text-text-secondary text-sm">Loading...</p>
      </main>
    );
  }

  return (
    <div className="min-h-screen bg-background-page">
      {/* Navigation bar */}
      <nav className="flex items-center justify-between px-6 py-4 border-b border-stroke-default bg-background-surface">
        <h1 className="text-lg font-semibold text-text-primary tracking-[var(--letter-spacing-wide-s)]">
          Kora
        </h1>
        <div className="flex items-center gap-3">
          {user && (
            <span className="text-sm text-text-secondary hidden sm:inline">
              {user.name}
            </span>
          )}
          <Button variant="outline" icon={<LogoutIcon />} onClick={handleLogout}>
            Log out
          </Button>
        </div>
      </nav>

      {/* Content */}
      <main className="max-w-3xl mx-auto px-6 py-10">
        <h2 className="text-xl font-medium text-text-primary mb-6 tracking-[var(--letter-spacing-wide-s)]">
          Your interventions
        </h2>

        {isLoading && (
          <div className="flex items-center justify-center py-20">
            <p className="text-text-secondary text-sm">
              Loading interventions...
            </p>
          </div>
        )}

        {error && (
          <div className="rounded-lg border border-red-200 bg-red-50 p-4">
            <p className="text-sm text-red-700">{error}</p>
          </div>
        )}

        {!isLoading && !error && interventions.length === 0 && (
          <div className="flex flex-col items-center justify-center py-20 text-center">
            <p className="text-text-secondary text-sm mb-1">
              No interventions yet.
            </p>
            <p className="text-text-tertiary text-sm">
              Interventions will appear here once they are created.
            </p>
          </div>
        )}

        {!isLoading && !error && interventions.length > 0 && (
          <div className="grid gap-4">
            {interventions.map((intervention) => (
              <Link
                key={intervention.id}
                href={`/intervention/${intervention.id}`}
                className="group block rounded-lg border border-stroke-default bg-background-surface p-5 transition-colors hover:border-stroke-hover"
              >
                <div className="flex items-center justify-between">
                  <div className="flex flex-col gap-1">
                    <h3 className="text-sm font-medium text-text-primary group-hover:text-text-brand transition-colors">
                      {intervention.name}
                    </h3>
                    <p className="text-xs text-text-secondary">
                      {intervention.project_name}
                      {intervention.client_name &&
                        ` \u00B7 ${intervention.client_name}`}
                    </p>
                  </div>
                  <span className="text-text-tertiary group-hover:text-text-brand transition-colors">
                    <ArrowRightIcon />
                  </span>
                </div>
              </Link>
            ))}
          </div>
        )}
      </main>
    </div>
  );
}
