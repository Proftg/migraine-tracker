import { NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';

export async function POST(request: Request) {
    try {
        const data = await request.json();
        const { fileContent, fileName, fileType } = data;

        // Définir le dossier d'export
        const exportDir = path.join(process.cwd(), 'Export');

        // Créer le dossier s'il n'existe pas
        if (!fs.existsSync(exportDir)) {
            fs.mkdirSync(exportDir, { recursive: true });
        }

        const filePath = path.join(exportDir, fileName);

        // Convertir le base64 en buffer
        const buffer = Buffer.from(fileContent, 'base64');

        // Écrire le fichier
        fs.writeFileSync(filePath, buffer);

        return NextResponse.json({
            success: true,
            message: `Export réussi dans : ${filePath}`,
            path: filePath
        });

    } catch (error) {
        console.error('Erreur d\'export:', error);
        return NextResponse.json(
            { success: false, message: 'Erreur lors de l\'enregistrement sur le disque.' },
            { status: 500 }
        );
    }
}
