
import { CreateMLCEngine, MLCEngine, InitProgressCallback } from "@mlc-ai/web-llm";

// Using a lightweight model optimized for web
// Llama-3-8B-Instruct-q4f32_1-MLC is a good balance, but might be heavy for some devices.
// We can use a smaller one if needed, but let's try a standard optimized one.
const SELECTED_MODEL = "Llama-3-8B-Instruct-q4f32_1-MLC";

export interface ChatMessage {
    role: "user" | "assistant" | "system";
    content: string;
}

export class AIAssistantService {
    private engine: MLCEngine | null = null;
    private isInitialized = false;

    async initialize(onProgress: InitProgressCallback) {
        if (this.isInitialized) return;

        try {
            this.engine = await CreateMLCEngine(
                SELECTED_MODEL,
                { initProgressCallback: onProgress }
            );
            this.isInitialized = true;
        } catch (error) {
            console.error("Failed to initialize AI engine:", error);
            throw error;
        }
    }

    async generateResponse(messages: ChatMessage[], context?: string): Promise<string> {
        if (!this.engine) {
            throw new Error("AI Engine not initialized");
        }

        const systemMessage: ChatMessage = {
            role: "system",
            content: `You are "Dr. AI", a helpful and empathetic assistant for a migraine tracking application called "MigraineChecker". 
            Your goal is to help users understand their migraines, triggers, and patterns based on the data they provide.
            
            IMPORTANT GUIDELINES:
            1. You are NOT a real doctor. Always advise users to consult a healthcare professional for medical advice.
            2. Be concise, empathetic, and supportive.
            3. Use the provided context about the user's recent logs to give personalized answers.
            4. If the user asks about medical treatments, provide general information but emphasize consulting a specialist.
            5. Speak in French (unless the user speaks another language).
            
            ${context ? `USER CONTEXT:\n${context}` : ""}
            `
        };

        const chatHistory = [systemMessage, ...messages];

        try {
            const reply = await this.engine.chat.completions.create({
                messages: chatHistory,
                temperature: 0.7,
                max_tokens: 500, // Keep responses concise
            });

            return reply.choices[0].message.content || "Désolé, je n'ai pas pu générer de réponse.";
        } catch (error) {
            console.error("Error generating response:", error);
            return "Une erreur est survenue lors de la génération de la réponse.";
        }
    }

    isReady() {
        return this.isInitialized;
    }
}

export const aiAssistant = new AIAssistantService();
