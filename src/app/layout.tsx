import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { cn } from "@/lib/utils";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
    title: "MigraineTracker AI",
    description: "Intelligent Migraine Tracking Journal",
    manifest: "/manifest.json",
};

export default function RootLayout({
    children,
}: Readonly<{
    children: React.ReactNode;
}>) {
    return (
        <html lang="fr" className="dark">
            <body className={cn(inter.className, "bg-background text-foreground min-h-screen antialiased")}>
                <main className="min-h-screen flex flex-col">
                    {children}
                </main>
            </body>
        </html>
    );
}
