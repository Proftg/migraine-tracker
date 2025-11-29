"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { RefreshCw, Activity, Flame, Heart, Mountain } from "lucide-react";
import { format } from "date-fns";
import { fr } from "date-fns/locale";

interface StravaActivity {
    id: string;
    date: string;
    activityType: string;
    duration: number;
    distance?: number;
    caloriesBurned?: number;
    averageHeartRate?: number;
    sufferScore?: number;
    elevationGain?: number;
}

export function StravaWidget() {
    const [activities, setActivities] = useState<StravaActivity[]>([]);
    const [loading, setLoading] = useState(true);
    const [syncing, setSyncing] = useState(false);

    const fetchActivities = async () => {
        try {
            const res = await fetch('/api/strava/activities');
            const data = await res.json();
            if (data.success) {
                setActivities(data.data);
            }
        } catch (error) {
            console.error("Failed to fetch Strava activities:", error);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchActivities();
    }, []);

    const handleSync = async () => {
        setSyncing(true);
        try {
            const res = await fetch('/api/strava/sync', { method: 'POST' });
            const data = await res.json();
            if (data.success) {
                await fetchActivities();
            } else {
                console.error('Sync error:', data);
            }
        } catch (e) {
            console.error("Sync failed:", e);
        } finally {
            setSyncing(false);
        }
    };

    return (
        <Card className="w-full">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium flex items-center gap-2">
                    <Activity className="h-4 w-4 text-orange-500" />
                    Activités Strava
                </CardTitle>
                <Button
                    variant="ghost"
                    size="sm"
                    onClick={handleSync}
                    disabled={syncing}
                    className="h-8 w-8 p-0"
                >
                    <RefreshCw className={`h-4 w-4 ${syncing ? 'animate-spin' : ''}`} />
                </Button>
            </CardHeader>
            <CardContent>
                {loading ? (
                    <div className="text-center text-sm text-muted-foreground py-4">Chargement...</div>
                ) : activities.length === 0 ? (
                    <div className="text-center text-sm text-muted-foreground py-4">
                        Aucune activité récente.
                        <Button variant="link" onClick={handleSync} className="block mx-auto mt-2">
                            Synchroniser maintenant
                        </Button>
                    </div>
                ) : (
                    <div className="space-y-4">
                        {activities.slice(0, 3).map((activity) => (
                            <div key={activity.id} className="border-b pb-3 last:border-0 last:pb-0">
                                <div className="flex items-start justify-between mb-2">
                                    <div className="space-y-1 flex-1">
                                        <p className="text-sm font-medium leading-none">
                                            {activity.activityType}
                                        </p>
                                        <p className="text-xs text-muted-foreground">
                                            {format(new Date(activity.date), "d MMMM à HH:mm", { locale: fr })}
                                        </p>
                                    </div>
                                    <div className="text-right">
                                        <span className="text-sm font-bold">{Math.round(activity.duration)} min</span>
                                    </div>
                                </div>

                                {/* Metrics Grid */}
                                <div className="grid grid-cols-2 gap-2 mt-2">
                                    {activity.sufferScore && (
                                        <div className="flex items-center gap-1 text-xs">
                                            <Flame className="h-3 w-3 text-orange-500" />
                                            <span className="text-muted-foreground">Charge:</span>
                                            <span className="font-semibold">{activity.sufferScore}</span>
                                        </div>
                                    )}
                                    {activity.averageHeartRate && (
                                        <div className="flex items-center gap-1 text-xs">
                                            <Heart className="h-3 w-3 text-red-500" />
                                            <span className="text-muted-foreground">FC moy:</span>
                                            <span className="font-semibold">{activity.averageHeartRate}</span>
                                        </div>
                                    )}
                                    {activity.elevationGain && activity.elevationGain > 0 && (
                                        <div className="flex items-center gap-1 text-xs">
                                            <Mountain className="h-3 w-3 text-green-600" />
                                            <span className="text-muted-foreground">D+:</span>
                                            <span className="font-semibold">{activity.elevationGain}m</span>
                                        </div>
                                    )}
                                    {activity.distance && activity.distance > 0 && (
                                        <div className="flex items-center gap-1 text-xs">
                                            <Activity className="h-3 w-3 text-blue-500" />
                                            <span className="text-muted-foreground">Dist:</span>
                                            <span className="font-semibold">{(activity.distance / 1000).toFixed(1)}km</span>
                                        </div>
                                    )}
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
