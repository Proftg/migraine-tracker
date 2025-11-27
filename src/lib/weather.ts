
export interface WeatherData {
    temperature: number;
    humidity: number;
    pressure: number;
    weatherCode: number;
    timestamp: string;
}

export interface Location {
    latitude: number;
    longitude: number;
}

export const weatherService = {
    async getCurrentWeather(lat: number, lon: number): Promise<WeatherData> {
        try {
            const response = await fetch(
                `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current=temperature_2m,relative_humidity_2m,surface_pressure,weather_code&timezone=auto`
            );

            if (!response.ok) throw new Error('Weather API error');

            const data = await response.json();
            const current = data.current;

            return {
                temperature: current.temperature_2m,
                humidity: current.relative_humidity_2m,
                pressure: current.surface_pressure,
                weatherCode: current.weather_code,
                timestamp: new Date().toISOString()
            };
        } catch (error) {
            console.error('Failed to fetch weather:', error);
            throw error;
        }
    },

    async getHistoricalWeather(lat: number, lon: number, date: Date): Promise<WeatherData | null> {
        try {
            const dateStr = date.toISOString().split('T')[0];
            const response = await fetch(
                `https://archive-api.open-meteo.com/v1/archive?latitude=${lat}&longitude=${lon}&start_date=${dateStr}&end_date=${dateStr}&hourly=temperature_2m,relative_humidity_2m,surface_pressure,weather_code&timezone=auto`
            );

            if (!response.ok) throw new Error('Historical Weather API error');

            const data = await response.json();

            // Find the hour closest to the requested time
            const hour = date.getHours();
            const index = hour; // Hourly data is 0-23

            return {
                temperature: data.hourly.temperature_2m[index],
                humidity: data.hourly.relative_humidity_2m[index],
                pressure: data.hourly.surface_pressure[index],
                weatherCode: data.hourly.weather_code[index],
                timestamp: date.toISOString()
            };
        } catch (error) {
            console.error('Failed to fetch historical weather:', error);
            return null;
        }
    },

    getWeatherDescription(code: number): string {
        // WMO Weather interpretation codes (WW)
        const codes: Record<number, string> = {
            0: 'Ciel dégagé',
            1: 'Principalement dégagé',
            2: 'Partiellement nuageux',
            3: 'Couvert',
            45: 'Brouillard',
            48: 'Brouillard givrant',
            51: 'Bruine légère',
            53: 'Bruine modérée',
            55: 'Bruine dense',
            61: 'Pluie faible',
            63: 'Pluie modérée',
            65: 'Pluie forte',
            71: 'Neige faible',
            73: 'Neige modérée',
            75: 'Neige forte',
            77: 'Grains de neige',
            80: 'Averses de pluie faibles',
            81: 'Averses de pluie modérées',
            82: 'Averses de pluie violentes',
            95: 'Orage',
            96: 'Orage avec grêle légère',
            99: 'Orage avec grêle forte'
        };
        return codes[code] || 'Inconnu';
    },

    getWeatherIcon(code: number): string {
        if (code === 0) return '☀️';
        if (code >= 1 && code <= 3) return '⛅';
        if (code >= 45 && code <= 48) return '🌫️';
        if (code >= 51 && code <= 67) return '🌧️';
        if (code >= 71 && code <= 77) return '❄️';
        if (code >= 80 && code <= 82) return '🌦️';
        if (code >= 95) return '⚡';
        return '❓';
    }
};
