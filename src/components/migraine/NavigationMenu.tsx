"use client";

import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import {
    FileText,
    Database,
    Settings,
    Activity,
    Brain,
    BarChart3,
    Download,
    Upload
} from "lucide-react";
import { useState } from "react";

interface NavigationMenuProps {
    onNavigate: (page: 'dashboard' | 'report' | 'data' | 'settings') => void;
    currentPage: string;
}

export function NavigationMenu({ onNavigate, currentPage }: NavigationMenuProps) {
    const menuItems = [
        {
            id: 'dashboard',
            label: 'Tableau de Bord',
            icon: BarChart3,
            description: 'Vue d\'ensemble et prédictions',
            color: 'text-blue-600'
        },
        {
            id: 'report',
            label: 'Rapport Médical',
            icon: FileText,
            description: 'Analyses détaillées',
            color: 'text-purple-600'
        },
        {
            id: 'data',
            label: 'Données',
            icon: Database,
            description: 'Visualiser et exporter',
            color: 'text-green-600'
        },
        {
            id: 'settings',
            label: 'Configuration',
            icon: Settings,
            description: 'Paramètres de prédiction',
            color: 'text-orange-600'
        }
    ];

    return (
        <Card className="p-4 mb-6">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {menuItems.map((item) => {
                    const Icon = item.icon;
                    const isActive = currentPage === item.id;

                    return (
                        <button
                            key={item.id}
                            onClick={() => onNavigate(item.id as any)}
                            className={`
                                p-4 rounded-lg border-2 transition-all text-left
                                ${isActive
                                    ? 'border-primary bg-primary/10 shadow-md'
                                    : 'border-transparent hover:border-primary/30 hover:bg-accent'
                                }
                            `}
                        >
                            <div className="flex items-start gap-3">
                                <Icon className={`h-6 w-6 ${isActive ? 'text-primary' : item.color}`} />
                                <div className="flex-1">
                                    <div className={`font-semibold ${isActive ? 'text-primary' : ''}`}>
                                        {item.label}
                                    </div>
                                    <div className="text-xs text-muted-foreground mt-1">
                                        {item.description}
                                    </div>
                                </div>
                            </div>
                        </button>
                    );
                })}
            </div>
        </Card>
    );
}

interface QuickActionsMenuProps {
    onAction: (action: string) => void;
}

export function QuickActionsMenu({ onAction }: QuickActionsMenuProps) {
    const actions = [
        {
            id: 'crisis',
            label: 'Signaler Crise',
            icon: '🆘',
            color: 'bg-red-600 hover:bg-red-700',
            description: 'Enregistrer une migraine'
        },
        {
            id: 'sports',
            label: 'Activité',
            icon: '🏃',
            color: 'bg-green-600 hover:bg-green-700',
            description: 'Logger du sport'
        },
        {
            id: 'screentime',
            label: 'Écran',
            icon: '💻',
            color: 'bg-blue-600 hover:bg-blue-700',
            description: 'Temps d\'écran'
        },
        {
            id: 'calories',
            label: 'Calories',
            icon: '📊',
            color: 'bg-orange-600 hover:bg-orange-700',
            description: 'Apport calorique'
        }
    ];

    return (
        <Card className="p-6">
            <h3 className="text-lg font-semibold mb-4">Actions Rapides</h3>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {actions.map((action) => (
                    <button
                        key={action.id}
                        onClick={() => onAction(action.id)}
                        className={`
                            ${action.color}
                            text-white rounded-lg p-4 transition-all
                            hover:scale-105 shadow-lg
                            flex flex-col items-center gap-2
                        `}
                    >
                        <span className="text-4xl">{action.icon}</span>
                        <span className="font-semibold text-sm">{action.label}</span>
                        <span className="text-xs opacity-90">{action.description}</span>
                    </button>
                ))}
            </div>
        </Card>
    );
}

interface ExportMenuProps {
    onExport: (type: 'pdf' | 'excel' | 'backup') => void;
    onImport: () => void;
}

export function ExportMenu({ onExport, onImport }: ExportMenuProps) {
    return (
        <div className="flex flex-wrap gap-2">
            <Button variant="outline" size="sm" onClick={() => onExport('pdf')}>
                <Download className="h-4 w-4 mr-2" />
                PDF
            </Button>
            <Button variant="outline" size="sm" onClick={() => onExport('excel')}>
                <Download className="h-4 w-4 mr-2" />
                Excel
            </Button>
            <Button variant="outline" size="sm" onClick={() => onExport('backup')}>
                <Download className="h-4 w-4 mr-2" />
                Sauvegarder
            </Button>
            <Button variant="outline" size="sm" onClick={onImport}>
                <Upload className="h-4 w-4 mr-2" />
                Restaurer
            </Button>
        </div>
    );
}
