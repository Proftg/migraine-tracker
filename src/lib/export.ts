import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import * as XLSX from 'xlsx';
import { JournalEntry } from '@/types';
import { format } from 'date-fns';

export const exportService = {
    toPDF: (entries: JournalEntry[]) => {
        const doc = new jsPDF();

        doc.setFontSize(20);
        doc.text("Rapport MigraineTracker", 14, 22);
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

        doc.save('migraine-report.pdf');
    },

    toExcel: (entries: JournalEntry[]) => {
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
        XLSX.writeFile(workbook, "migraine-report.xlsx");
    }
};
