
# Personal AI Assistant Backend

This backend connects the app with three AI providers:

- OpenAI ChatGPT
- Google Gemini
- DeepSeek

## Requirements

- Node.js 20 or newer
- npm

## Install dependencies

```bash
npm install
```

## Environment variables

Set these variables in your hosting provider:

- OPENAI_API_KEY
- GEMINI_API_KEY
- DEEPSEEK_API_KEY

Never upload real API keys to GitHub.

## Run locally

```bash
npm start
```

## API endpoints

- GET /health
- GET /api/models
- POST /api/chat
