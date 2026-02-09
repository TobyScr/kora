import type { Barrier } from "./types";

type BarrierTableProps = {
  barriers: Barrier[];
};

const PlusIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 3v10M3 8h10"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

const KebabIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="8" cy="4" r="1.2" fill="currentColor" />
    <circle cx="8" cy="8" r="1.2" fill="currentColor" />
    <circle cx="8" cy="12" r="1.2" fill="currentColor" />
  </svg>
);

const ToggleSwitch = ({ isOn }: { isOn: boolean }) => (
  <div
    className={`relative w-10 h-[22px] rounded-full transition-colors ${
      isOn ? "bg-[#0d9373]" : "bg-[#d1d5db]"
    }`}
  >
    <div
      className={`absolute top-[2px] w-[18px] h-[18px] rounded-full bg-white shadow transition-transform ${
        isOn ? "translate-x-[20px]" : "translate-x-[2px]"
      }`}
    />
  </div>
);

export function BarrierTable({ barriers }: BarrierTableProps) {
  return (
    <div className="w-full">
      {/* Header row */}
      <div className="flex items-center gap-3 px-3 py-2 border-b border-stroke-default text-xs font-medium text-text-tertiary uppercase tracking-wider">
        <div className="w-[30px] shrink-0">#</div>
        <div className="w-[200px] shrink-0">Barrier</div>
        <div className="flex-1">Description</div>
        <div className="w-[60px] shrink-0 text-center">Select</div>
        <div className="w-[60px] shrink-0 text-center">Actions</div>
      </div>

      {/* Barrier rows */}
      {barriers.map((barrier, index) => (
        <div
          key={barrier.id}
          className="flex items-start gap-3 px-3 py-3 border-b border-stroke-default last:border-b-0"
        >
          {/* Row number */}
          <div className="w-[30px] shrink-0 text-sm text-text-secondary pt-0.5">
            {index + 1}
          </div>

          {/* Barrier name */}
          <div className="w-[200px] shrink-0 text-sm text-text-primary pt-0.5">
            {barrier.isRecommended ? (
              <span className="underline text-[#0d7c66] font-medium">
                * {barrier.name}
              </span>
            ) : (
              <span className="font-medium">{barrier.name}</span>
            )}
          </div>

          {/* Description */}
          <div className="flex-1 text-sm text-text-secondary leading-[1.5]">
            {barrier.description}
          </div>

          {/* Toggle */}
          <div className="w-[60px] shrink-0 flex justify-center pt-0.5">
            <ToggleSwitch isOn={barrier.isSelected} />
          </div>

          {/* Actions */}
          <div className="w-[60px] shrink-0 flex justify-center pt-0.5">
            <button className="p-1 text-text-tertiary hover:text-text-primary transition-colors rounded">
              <KebabIcon />
            </button>
          </div>
        </div>
      ))}

      {/* Add more button */}
      <div className="flex items-center justify-center py-3">
        <button className="flex items-center gap-2 text-sm text-text-secondary font-medium hover:text-text-primary transition-colors">
          <PlusIcon />
          Add more
        </button>
      </div>
    </div>
  );
}
