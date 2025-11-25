import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import * as XLSX from 'xlsx';
import { JournalEntry } from '@/types';
import { format } from 'date-fns';

const saveToServer = async (fileContent: string, fileName: string, fileType: string) => {
    try {
        // Remove data URI prefix if present (for PDF)
        const base64Content = fileContent.replace(/^data:.*,/, '');

        const response = await fetch('/api/export', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                fileContent: base64Content,
                fileName,
                fileType
            }),
        });

        const result = await response.json();

        if (result.success) {
            alert(`✅ Export réussi !\n\nFichier enregistré dans :\n${result.path}`);
        } else {
            throw new Error(result.message);
        }
    } catch (error) {
        console.error('Erreur export serveur:', error);
        alert('⚠️ Erreur lors de l\'enregistrement sur le serveur. Téléchargement local...');

        // Fallback: Download locally
        const link = document.createElement('a');
        link.href = fileContent.startsWith('data:') ? fileContent : `data:${fileType};base64,${fileContent}`;
        link.download = fileName;
        link.click();
    }
};

export const exportService = {
    toPDF: async (entries: JournalEntry[]) => {
        const doc = new jsPDF();

        doc.setFontSize(20);
        doc.text("Rapport MigraineChecker", 14, 22);
        doc.setFontSize(11);
        doc.text(`Généré le ${format(new Date(), 'dd/MM/yyyy')}`, 14, 30);

        const tableData = entries.map(entry => {
            let details = entry.notes || '';
            if (entry.type === 'migraine') {
                details = `Intensité: ${(entry as any).intensity}/10`;
            } else if (entry.type === 'activity') {
                details = `${(entry as any).activityType} (${(entry as any).duration}min)`;
            } else if (entry.type === 'medication') {
                details = `${(entry as any).name} ${(entry as any).dosage}`;
            }
            return [
                format(new Date(entry.date), 'dd/MM/yyyy HH:mm'),
                entry.type.toUpperCase(),
                details
            ];
        });

        autoTable(doc, {
            head: [['Date', 'Type', 'Détails']],
            body: tableData,
            startY: 40,
        });

        const pdfOutput = doc.output('datauristring');
        await saveToServer(pdfOutput, `migraine-report-${format(new Date(), 'yyyy-MM-dd')}.pdf`, 'application/pdf');
    },

    toExcel: async (entries: JournalEntry[]) => {
        const worksheet = XLSX.utils.json_to_sheet(entries.map(e => ({
            Date: format(new Date(e.date), 'dd/MM/yyyy HH:mm'),
            Type: e.type,
            Details: e.notes || '',
            Intensity: (e as any).intensity || '',
            Activity: (e as any).activityType || '',
            Duration: (e as any).duration || '',
            Medication: (e as any).name || ''
        })));

        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, "Journal");

        const excelOutput = XLSX.write(workbook, { bookType: 'xlsx', type: 'base64' });
        await saveToServer(excelOutput, `migraine-report-${format(new Date(), 'yyyy-MM-dd')}.xlsx`, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    }
};
