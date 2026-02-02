type AiAvatarProps = {
  size?: number;
  className?: string;
};

export function AiAvatar({ size = 24, className }: AiAvatarProps) {
  const dotSize = size * 0.152; // ~3.636 / 24
  const gap = size * 0.174; // ~4.18 / 24
  const radius = dotSize / 2;

  const dots = [
    { x: 0, y: gap },
    { x: gap * 2, y: 0 },
    { x: 0, y: 0 },
    { x: gap * 2, y: gap * 2 },
    { x: gap, y: gap },
    { x: 0, y: gap * 2 },
  ];

  const gridSize = gap * 2 + dotSize;
  const offset = (size - gridSize) / 2;

  return (
    <div
      className={`flex items-center justify-center rounded-full bg-background-surface ${className ?? ""}`}
      style={{ width: size, height: size }}
      aria-label="Kora AI"
    >
      <svg width={gridSize} height={gridSize} viewBox={`0 0 ${gridSize} ${gridSize}`}>
        {dots.map((dot, i) => (
          <rect
            key={i}
            x={dot.x}
            y={dot.y}
            width={dotSize}
            height={dotSize}
            rx={radius}
            fill="var(--text-primary)"
          />
        ))}
      </svg>
    </div>
  );
}
