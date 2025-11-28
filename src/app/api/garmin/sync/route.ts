import { NextResponse } from 'next/server';
import { exec } from 'child_process';
import { promisify } from 'util';
import path from 'path';

const execAsync = promisify(exec);

export async function POST() {
    try {
        // Determine the path to the python script
        // In WSL/Linux environment
        const projectDir = process.env.PROJECT_DIR || '/home/tahar/project/Maven/migraine-tracker';
        const scriptPath = path.join(projectDir, 'scripts', 'garmin-sync.py');

        // Command to run the script
        // We use 'python3' assuming it's in the path and has dependencies installed
        // Or we can use the virtual environment if it exists
        const command = `cd ${projectDir} && python3 ${scriptPath}`;

        console.log('🚀 Triggering Garmin Sync manually...');

        const { stdout, stderr } = await execAsync(command);

        console.log('✅ Sync Output:', stdout);

        if (stderr) {
            console.warn('⚠️ Sync Stderr:', stderr);
        }

        return NextResponse.json({
            success: true,
            message: 'Synchronisation terminée avec succès',
            details: stdout
        });

    } catch (error: any) {
        console.error('❌ Sync failed:', error);
        return NextResponse.json(
            {
                success: false,
                message: 'Erreur lors de la synchronisation',
                error: error.message
            },
            { status: 500 }
        );
    }
}
