
import express from "express";
import cors from "cors";
import helmet from "helmet";
import dotenv from "dotenv";
import rateLimit from "express-rate-limit";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

app.set("trust proxy", 1);
app.use(helmet());
app.use(cors({
  origin: process.env.APP_ORIGIN || "*"
}));
app.use(express.json({ limit: "1mb" }));

app.use("/api/", rateLimit({
  windowMs: 15 * 60 * 1000,
  limit: 60,
  standardHeaders: "draft-7",
  legacyHeaders: false
}));

// Check whether the server is running.
app.get("/health", (req, res) => {
  res.json({
    status: "ok",
    message: "Personal AI Assistant Backend is running"
  });
});

// Available AI models.
app.get("/api/models", (req, res) => {
  res.json({
    models: [
      { id: "chatgpt", name: "ChatGPT" },
      { id: "gemini", name: "Gemini" },
      { id: "deepseek", name: "DeepSeek" }
    ]
  });
});

// Main AI chat endpoint.
app.post("/api/chat", async (req, res) => {
  try {
    const { provider, message, history = [] } = req.body;

    const supportedProviders = [
      "chatgpt",
      "gemini",
      "deepseek"
    ];

    if (!supportedProviders.includes(provider)) {
      return res.status(400).json({
        error: "Invalid AI provider"
      });
    }

    if (
      typeof message !== "string" ||
      !message.trim() ||
      message.length > 12000
    ) {
      return res.status(400).json({
        error: "Please provide a valid message"
      });
    }

    if (
      !Array.isArray(history) ||
      history.length > 20 ||
      history.some(item =>
        !item ||
        !["user", "assistant"].includes(item.role) ||
        typeof item.content !== "string" ||
        item.content.length > 12000
      )
    ) {
      return res.status(400).json({
        error: "Invalid conversation history"
      });
    }

    const messages = [
      ...history,
      { role: "user", content: message.trim() }
    ];

    let answer;

    if (provider === "chatgpt") {
      answer = await askOpenAI(messages);
    } else if (provider === "gemini") {
      answer = await askGemini(messages);
    } else {
      answer = await askDeepSeek(messages);
    }

    return res.json({
      success: true,
      provider,
      answer
    });

  } catch (error) {
    console.error("AI request failed:", error.message);

    return res.status(500).json({
      error: "AI service request failed. Please try again."
    });
  }
});

// OpenAI ChatGPT.
async function askOpenAI(messages) {
  const key = process.env.OPENAI_API_KEY;

  if (!key) {
    throw new Error("OPENAI_API_KEY is missing");
  }

  const response = await fetch(
    "https://api.openai.com/v1/chat/completions",
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${key}`
      },
      body: JSON.stringify({
        model: process.env.OPENAI_MODEL || "gpt-4o-mini",
        messages
      })
    }
  );

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.error?.message || "OpenAI request failed");
  }

  return data.choices?.[0]?.message?.content || "";
}

// Google Gemini.
async function askGemini(messages) {
  const key = process.env.GEMINI_API_KEY;

  if (!key) {
    throw new Error("GEMINI_API_KEY is missing");
  }

  const model = process.env.GEMINI_MODEL || "gemini-2.0-flash";

  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${encodeURIComponent(key)}`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        contents: messages.map(item => ({
          role: item.role === "assistant" ? "model" : "user",
          parts: [{ text: item.content }]
        }))
      })
    }
  );

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.error?.message || "Gemini request failed");
  }

  return data.candidates?.[0]?.content?.parts
    ?.map(part => part.text || "")
    .join("") || "";
}

// DeepSeek.
async function askDeepSeek(messages) {
  const key = process.env.DEEPSEEK_API_KEY;

  if (!key) {
    throw new Error("DEEPSEEK_API_KEY is missing");
  }

  const response = await fetch(
    "https://api.deepseek.com/chat/completions",
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${key}`
      },
      body: JSON.stringify({
        model: process.env.DEEPSEEK_MODEL || "deepseek-chat",
        messages
      })
    }
  );

  const data = await response.json();

  if (!response.ok) {
    throw new Error(data.error?.message || "DeepSeek request failed");
  }

  return data.choices?.[0]?.message?.content || "";
}

// Start server.
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Personal AI Assistant Backend running on port ${PORT}`);
});
