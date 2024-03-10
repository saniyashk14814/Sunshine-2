import random


class Prompts:
    prompts = []
    
    def __init__(self):
        self.prompts = ["What are three things you're grateful for today?",
                        "How did you practice self-care today?",
                        "What was a small victory you had today?",
                        "What is something that made you smile today?",
                        "What is one challenge you faced today and how did you handle it?",
                        "Did you engage in any activities that brought you joy today? If so, what were they?",
                        "What is something you learned about yourself today?",
                        "How did you show kindness to yourself or others today?",
                        "What is one thing you could do differently tomorrow to improve your well-being?",
                        "Did you encounter any negative thoughts today? How did you challenge or reframe them?",
                        "What emotions did you experience today, and how did you manage them?",
                        "Did you take time to relax and unwind today? If so, what did you do?",
                        "What is a goal you have for yourself this week, and what steps did you take today to work towards it?",
                        "Did you connect with anyone meaningful today? If so, how did it make you feel?",
                        "How did you prioritize your mental health today?",
                        "What is one thing you're looking forward to tomorrow?",
                        "Did you spend time in nature today? If so, how did it make you feel?",
                        "What is something you're proud of accomplishing today?",
                        "How did you challenge yourself to step out of your comfort zone today?"
        ]
    
    def getPrompt(self):
        return random.choice(self.prompts)
