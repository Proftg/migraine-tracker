import { NextResponse } from "next/server";
import { readdir, readFile } from "fs/promises";
import { join } from "path";

export async function GET(request: Request, { params }: { params: { date: string } }) {
    try {
        const date = params.date;

        if (!date) {
            return NextResponse.json(
                { error: "Date parameter required" },
                { status: 400 }
            );
        }

        const dataDir = join(process.cwd(), "garmin-data");
        const filePath = join(dataDir, `${date}.json`);

        try {
            const content = await readFile(filePath, "utf-8");
            const data = JSON.parse(content);

            return NextResponse.json({
                success: true,
                date: data.date,
                data: data
            });
        } catch {
            return NextResponse.json(
                { error: `No data found for ${date}` },
                { status: 404 }
            );
        }

    } catch (error) {
        console.error("Error reading Garmin data:", error);
        return NextResponse.json(
            { error: "Failed to read Garmin data" },
            { status: 500 }
        );
    }
}
