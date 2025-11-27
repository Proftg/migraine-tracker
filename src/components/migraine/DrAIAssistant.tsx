
import { useState, useEffect, useRef } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle, CardFooter } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Bot, Send, X, Loader2, MessageSquare } from "lucide-react";
import { aiAssistant, ChatMessage } from "@/lib/ai-assistant";
import { JournalEntry } from "@/types";
import { Progress } from "@/components/ui/progress";

interface DrAIAssistantProps {
    entries: JournalEntry[];
}

export function DrAIAssistant({ entries }: DrAIAssistantProps) {
    const [isOpen, setIsOpen] = useState(false);
    const [isInitializing, setIsInitializing] = useState(false);
    const [initProgress, setInitProgress] = useState(0);
    const [initText, setInitText] = useState("");
    const [messages, setMessages] = useState<ChatMessage[]>([]);
    const [input, setInput] = useState("");
    const [isTyping, setIsTyping] = useState(false);
    const scrollRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        if (scrollRef.current) {
            scrollRef.current.scrollIntoView({ behavior: "smooth" });
        }
    }, [messages]);

    const handleInitialize = async () => {
        if (aiAssistant.isReady()) {
            setIsOpen(true);
            return;
        }

        setIsOpen(true);
        setIsInitializing(true);
        try {
            await aiAssistant.initialize((progress) => {
                setInitText(progress.text);
                // Simple heuristic to parse progress percentage if available, otherwise estimate
                // WebLLM progress text format varies, but often contains "[x/y]" or similar
                setInitProgress((prev) => Math.min(prev + 5, 95)); // Fake progress for visual feedback if parsing fails
            });
            setIsInitializing(false);
            setMessages([{ role: "assistant", content: "Bonjour ! Je suis Dr. AI. Comment puis-je vous aider avec vos migraines aujourd'hui ?" }]);
        } catch (error) {
            console.error(error);
            setInitText("Erreur de chargement du modèle.");
        }
    };

    const handleSend = async () => {
        if (!input.trim()) return;

        const userMsg: ChatMessage = { role: "user", content: input };
        setMessages(prev => [...prev, userMsg]);
        setInput("");
        setIsTyping(true);

        // Prepare context from recent entries
        const recentEntries = entries.slice(0, 5).map(e =>
            `- ${new Date(e.date).toLocaleDateString()}: ${e.type} (${e.notes})`
        ).join("\n");

        const context = `Recent User Activity:\n${recentEntries}`;

        try {
            const response = await aiAssistant.generateResponse([...messages, userMsg], context);
            setMessages(prev => [...prev, { role: "assistant", content: response }]);
        } catch (error) {
            setMessages(prev => [...prev, { role: "assistant", content: "Désolé, j'ai rencontré une erreur." }]);
        } finally {
            setIsTyping(false);
        }
    };

    if (!isOpen) {
        return (
            <Button
                onClick={handleInitialize}
                className="fixed bottom-6 right-6 h-14 w-14 rounded-full shadow-xl bg-gradient-to-r from-indigo-500 to-purple-600 hover:scale-110 transition-transform z-50"
            >
                <Bot className="h-8 w-8 text-white" />
            </Button>
        );
    }

    return (
        <Card className="fixed bottom-6 right-6 w-[350px] md:w-[400px] h-[500px] shadow-2xl z-50 flex flex-col animate-in slide-in-from-bottom-10 fade-in duration-300">
            <CardHeader className="bg-primary text-primary-foreground p-4 rounded-t-lg flex flex-row items-center justify-between">
                <CardTitle className="flex items-center gap-2 text-lg">
                    <Bot className="h-6 w-6" />
                    Dr. AI
                </CardTitle>
                <Button variant="ghost" size="icon" onClick={() => setIsOpen(false)} className="text-primary-foreground hover:bg-primary-foreground/20">
                    <X className="h-5 w-5" />
                </Button>
            </CardHeader>

            <CardContent className="flex-1 p-0 overflow-hidden relative bg-slate-50">
                {isInitializing ? (
                    <div className="h-full flex flex-col items-center justify-center p-8 text-center space-y-4">
                        <Loader2 className="h-10 w-10 animate-spin text-primary" />
                        <div className="space-y-2 w-full">
                            <h3 className="font-semibold">Initialisation du cerveau IA...</h3>
                            <p className="text-xs text-muted-foreground">{initText}</p>
                            <Progress value={initProgress} className="h-2" />
                            <p className="text-xs text-muted-foreground mt-2">Cela peut prendre quelques instants lors de la première utilisation (téléchargement du modèle ~4GB).</p>
                        </div>
                    </div>
                ) : (
                    <ScrollArea className="h-full p-4">
                        <div className="space-y-4">
                            {messages.map((msg, idx) => (
                                <div key={idx} className={`flex ${msg.role === "user" ? "justify-end" : "justify-start"}`}>
                                    <div className={`max-w-[80%] rounded-lg p-3 text-sm ${msg.role === "user"
                                            ? "bg-primary text-primary-foreground rounded-br-none"
                                            : "bg-white border shadow-sm rounded-bl-none"
                                        }`}>
                                        {msg.content}
                                    </div>
                                </div>
                            ))}
                            {isTyping && (
                                <div className="flex justify-start">
                                    <div className="bg-white border shadow-sm rounded-lg p-3 rounded-bl-none flex gap-1">
                                        <span className="w-2 h-2 bg-slate-400 rounded-full animate-bounce" />
                                        <span className="w-2 h-2 bg-slate-400 rounded-full animate-bounce delay-75" />
                                        <span className="w-2 h-2 bg-slate-400 rounded-full animate-bounce delay-150" />
                                    </div>
                                </div>
                            )}
                            <div ref={scrollRef} />
                        </div>
                    </ScrollArea>
                )}
            </CardContent>

            <CardFooter className="p-3 bg-background border-t">
                <form
                    className="flex w-full gap-2"
                    onSubmit={(e) => { e.preventDefault(); handleSend(); }}
                >
                    <Input
                        placeholder="Posez une question..."
                        value={input}
                        onChange={(e) => setInput(e.target.value)}
                        disabled={isInitializing || isTyping}
                        className="flex-1"
                    />
                    <Button type="submit" size="icon" disabled={isInitializing || isTyping || !input.trim()}>
                        <Send className="h-4 w-4" />
                    </Button>
                </form>
            </CardFooter>
        </Card>
    );
}
