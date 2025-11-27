import { NextResponse } from "next/server";
import { readdir, readFile } from "fs/promises";
import { join } from "path";

export async function GET() {
    try {
        const dataDir = join(process.cwd(), "garmin-data");

        // Check if directory exists
        try {
            await readdir(dataDir);
        } catch {
            return NextResponse.json(
                { error: "No Garmin data found. Run the sync script first." },
                { status: 404 }
            );
        }

        // Get all JSON files
        const files = await readdir(dataDir);
        const jsonFiles = files.filter(f => f.endsWith(".json")).sort().reverse();

        if (jsonFiles.length === 0) {
            return NextResponse.json(
                { error: "No Garmin data files found" },
                { status: 404 }
            );
        }

        // Read the latest file
        const latestFile = jsonFiles[0];
        const filePath = join(dataDir, latestFile);
        const content = await readFile(filePath, "utf-8");
        const data = JSON.parse(content);

        return NextResponse.json({
            success: true,
            date: data.date,
            data: data,
            availableDates: jsonFiles.map(f => f.replace(".json", ""))
        });

    } catch (error) {
        console.error("Error reading Garmin data:", error);
        return NextResponse.json(
            { error: "Failed to read Garmin data" },
            { status: 500 }
        );
    }
}
