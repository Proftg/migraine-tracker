import React from 'react';

interface LocationStat {
    location: string;
    count: number;
    avgIntensity: number;
}

interface MigraineLocationMapProps {
    data: LocationStat[];
    totalEntries?: number;
    title?: string;
    subtitle?: string;
    hideLegend?: boolean;
}

export function MigraineLocationMap({ data, totalEntries, title, subtitle, hideLegend = false }: MigraineLocationMapProps) {
    // Map internal names to display keys and coordinate zones
    const zonesFront = [
        {
            id: 'Front gauche',
            path: 'M200,80 L200,150 L120,150 C110,120 120,80 200,80 Z',
            tx: 160, ty: 120, label: 'Front L'
        },
        {
            id: 'Front droit',
            path: 'M200,80 L200,150 L280,150 C290,120 280,80 200,80 Z',
            tx: 240, ty: 120, label: 'Front R'
        },
        {
            id: 'Tempe gauche',
            path: 'M120,150 L85,150 C80,180 85,210 100,240 L120,220 Z',
            tx: 105, ty: 185, label: 'Tempe L'
        },
        {
            id: 'Tempe droite',
            path: 'M280,150 L315,150 C320,180 315,210 300,240 L280,220 Z',
            tx: 295, ty: 185, label: 'Tempe R'
        },
        {
            id: 'Toute la tête',
            path: 'M150,50 Q200,30 250,50 L250,80 Q200,70 150,80 Z',
            tx: 200, ty: 60, label: 'Vertex'
        },
    ];

    const getColor = (intensity: number) => {
        if (intensity <= 3) return '#fbbf24'; // Yellow
        if (intensity <= 6) return '#f97316'; // Orange
        return '#ef4444'; // Red
    };

    const renderFrontView = () => {
        return (
            <div className="relative inline-block w-full max-w-[320px]">
                <h4 className="text-center font-bold text-[10px] mb-4 uppercase tracking-[0.2em] text-slate-500 border-b pb-2">
                    Anatomy : Anterior
                </h4>
                <svg viewBox="0 0 400 400" className="w-full h-auto drop-shadow-xl bg-slate-50/50 rounded-full border border-slate-100 p-4">
                    <path
                        d="M200,50 C120,50 80,120 80,200 C80,280 140,350 200,350 C260,350 320,280 320,200 C320,120 280,50 200,50 Z"
                        fill="#ffffff"
                        stroke="#e2e8f0"
                        strokeWidth="1"
                    />

                    {/* Total crises badge */}
                    {totalEntries !== undefined && (
                        <g transform="translate(280, 50)">
                            <rect width="65" height="24" rx="12" fill="#1e293b" />
                            <text x="32" y="16" textAnchor="middle" className="text-[9px] font-black fill-white">
                                {totalEntries} CRISES
                            </text>
                        </g>
                    )}

                    <g stroke="#f1f5f9" strokeWidth="0.5" strokeDasharray="5,5">
                        <line x1="200" y1="50" x2="200" y2="350" />
                        <line x1="80" y1="200" x2="320" y2="200" />
                    </g>

                    <g opacity="0.1" stroke="#475569" fill="none">
                        <ellipse cx="160" cy="190" rx="15" ry="8" />
                        <ellipse cx="240" cy="190" rx="15" ry="8" />
                        <path d="M185,240 Q200,250 215,240" />
                        <path d="M175,300 Q200,315 225,300" />
                    </g>

                    {zonesFront.map(z => {
                        const stat = data.find(d => d.location === z.id);
                        const intensityColor = stat ? getColor(stat.avgIntensity) : '#f8fafc';
                        const hasData = !!stat;

                        return (
                            <g key={z.id}>
                                <path
                                    d={z.path}
                                    fill={intensityColor}
                                    fillOpacity={hasData ? 0.7 : 0.05}
                                    stroke={hasData ? intensityColor : '#cbd5e1'}
                                    strokeWidth={hasData ? 2 : 0.5}
                                />
                                {hasData && (
                                    <g>
                                        <circle cx={z.tx} cy={z.ty} r="14" fill="#1e293b" />
                                        <text x={z.tx} y={z.ty + 4} textAnchor="middle" fill="#ffffff" className="text-[10px] font-black">
                                            {stat.count}
                                        </text>
                                        <text x={z.tx} y={z.ty + 25} textAnchor="middle" fill="#475569" className="text-[8px] font-bold uppercase tracking-tighter">
                                            {z.label}
                                        </text>
                                    </g>
                                )}
                            </g>
                        );
                    })}
                </svg>
            </div>
        );
    };

    return (
        <div className="flex flex-col items-center gap-6 p-6 border border-slate-100 rounded-2xl bg-white shadow-sm w-full">
            {title && (
                <div className="text-center space-y-1 mb-2">
                    <h3 className="text-lg font-black text-slate-800 uppercase tracking-widest">{title}</h3>
                    {subtitle && <p className="text-xs text-slate-500 font-medium">{subtitle}</p>}
                </div>
            )}

            <div className="flex justify-center w-full">
                {renderFrontView()}
            </div>

            {!hideLegend && (
                <div className="w-full grid grid-cols-3 gap-2 bg-slate-50 p-3 rounded-xl border border-slate-200">
                    <div className="flex items-center gap-2 justify-center">
                        <div className="w-3 h-3 rounded-full bg-[#fbbf24]" />
                        <span className="text-[9px] font-bold text-slate-600 uppercase">Légère</span>
                    </div>
                    <div className="flex items-center gap-2 justify-center">
                        <div className="w-3 h-3 rounded-full bg-[#f97316]" />
                        <span className="text-[9px] font-bold text-slate-600 uppercase">Modérée</span>
                    </div>
                    <div className="flex items-center gap-2 justify-center">
                        <div className="w-3 h-3 rounded-full bg-[#ef4444]" />
                        <span className="text-[9px] font-bold text-slate-600 uppercase">Intense</span>
                    </div>
                </div>
            )}
        </div>
    );
}
