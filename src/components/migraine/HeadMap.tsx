"use client";

import { useState } from "react";

interface HeadMapProps {
    onLocationSelect: (location: string) => void;
    selectedLocation?: string;
}

export function HeadMap({ onLocationSelect, selectedLocation }: HeadMapProps) {
    const [hoveredArea, setHoveredArea] = useState<string | null>(null);

    const areas = [
        { id: 'front', label: 'Front', path: 'M100,80 Q100,40 120,40 L180,40 Q200,40 200,80 L200,120 Q200,140 180,140 L120,140 Q100,140 100,120 Z' },
        { id: 'left-temple', label: 'Tempe Gauche', cx: 90, cy: 100, r: 20 },
        { id: 'right-temple', label: 'Tempe Droite', cx: 210, cy: 100, r: 20 },
        { id: 'back', label: 'Nuque', path: 'M110,160 Q110,180 150,180 Q190,180 190,160 L190,140 L110,140 Z' },
        { id: 'top', label: 'Sommet', cx: 150, cy: 50, r: 25 },
    ];

    return (
        <div className="flex flex-col items-center space-y-4">
            <svg width="300" height="220" viewBox="0 0 300 220" className="drop-shadow-lg">
                {/* Head outline */}
                <ellipse cx="150" cy="110" rx="70" ry="90" fill="none" stroke="currentColor" strokeWidth="2" className="text-zinc-700" />

                {/* Interactive areas */}
                {areas.map((area) => (
                    <g key={area.id}>
                        {area.path ? (
                            <path
                                d={area.path}
                                fill={selectedLocation === area.id ? 'hsl(263 70% 50%)' : hoveredArea === area.id ? 'hsl(263 70% 40%)' : 'hsl(0 0% 15%)'}
                                stroke="currentColor"
                                strokeWidth="1.5"
                                className="cursor-pointer transition-all duration-200 text-zinc-600"
                                onMouseEnter={() => setHoveredArea(area.id)}
                                onMouseLeave={() => setHoveredArea(null)}
                                onClick={() => onLocationSelect(area.id)}
                            />
                        ) : (
                            <circle
                                cx={area.cx}
                                cy={area.cy}
                                r={area.r}
                                fill={selectedLocation === area.id ? 'hsl(263 70% 50%)' : hoveredArea === area.id ? 'hsl(263 70% 40%)' : 'hsl(0 0% 15%)'}
                                stroke="currentColor"
                                strokeWidth="1.5"
                                className="cursor-pointer transition-all duration-200 text-zinc-600"
                                onMouseEnter={() => setHoveredArea(area.id)}
                                onMouseLeave={() => setHoveredArea(null)}
                                onClick={() => onLocationSelect(area.id)}
                            />
                        )}
                    </g>
                ))}
            </svg>

            {hoveredArea && (
                <p className="text-sm text-zinc-400">
                    {areas.find(a => a.id === hoveredArea)?.label}
                </p>
            )}
        </div>
    );
}
