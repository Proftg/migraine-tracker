import { NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';

export async function POST(request: Request) {
    try {
        const data = await request.json();
        const { entries } = data;

        // Définir le dossier de sauvegarde
        const backupDir = path.join(process.cwd(), 'sauvegardes');

        // Créer le dossier s'il n'existe pas
        if (!fs.existsSync(backupDir)) {
            fs.mkdirSync(backupDir, { recursive: true });
        }

        // Générer le nom de fichier avec la date
        const date = new Date().toISOString().split('T')[0];
        const fileName = `migraine-backup-${date}.json`;
        const filePath = path.join(backupDir, fileName);

        // Écrire le fichier
        fs.writeFileSync(filePath, JSON.stringify(entries, null, 2));

        return NextResponse.json({
            success: true,
            message: `Sauvegarde réussie dans : ${filePath}`,
            path: filePath
        });

    } catch (error) {
        console.error('Erreur de sauvegarde:', error);
        return NextResponse.json(
            { success: false, message: 'Erreur lors de la sauvegarde sur le disque.' },
            { status: 500 }
        );
    }
}
