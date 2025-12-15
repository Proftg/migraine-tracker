import { NextResponse } from 'next/server';
import { exec } from 'child_process';
import { promisify } from 'util';
import path from 'path';

const execAsync = promisify(exec);

export async function POST() {
    try {
        const projectDir = process.env.PROJECT_DIR || '/home/tahar/project/Maven/migraine-tracker';
        const scriptPath = path.join(projectDir, 'scripts', 'strava-sync.py');

        // Run script with python3
        const command = `cd ${projectDir} && python3 ${scriptPath}`;

        console.log('Executing Strava sync command:', command);

        const { stdout, stderr } = await execAsync(command, { shell: '/bin/bash' });

        console.log('Strava sync output:', stdout);
        if (stderr) console.error('Strava sync stderr:', stderr);

        return NextResponse.json({
            success: true,
            message: 'Strava sync completed successfully',
            output: stdout
        });
    } catch (error: any) {
        console.error('Strava sync failed:', error);
        return NextResponse.json(
            { success: false, error: error.message || 'Unknown error occurred' },
            { status: 500 }
        );
    }
}
