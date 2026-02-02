type Tab = {
  id: string;
  label: string;
};

type TabBarProps = {
  tabs: Tab[];
  activeTab: string;
  onTabChange?: (tabId: string) => void;
  className?: string;
};

export function TabBar({ tabs, activeTab, onTabChange, className }: TabBarProps) {
  return (
    <div className={`flex items-center gap-0 border-b border-stroke-default ${className ?? ""}`}>
      {tabs.map((tab) => {
        const isActive = tab.id === activeTab;
        return (
          <button
            key={tab.id}
            onClick={() => onTabChange?.(tab.id)}
            className={`px-4 py-2 text-sm font-medium leading-[1.6] tracking-[var(--letter-spacing-wide-s)] cursor-pointer transition-colors border-b-2 ${
              isActive
                ? "text-text-primary border-button-solid"
                : "text-text-tertiary border-transparent hover:text-text-secondary"
            }`}
          >
            {tab.label}
          </button>
        );
      })}
    </div>
  );
}
