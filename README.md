# 🚀 This repository showcases two practical AI Agents:

📌 Resume Screener AI Agent : AI tool that scans PDF resumes, extracts skills, and ranks candidates by job fit.

🎧 Audio Speech Translator AI Agent : AI that transcribes audio, detects language/emotion, and translates speech to English.

## 🤖 Resume Screener AI Agent  
**Automated PDF Resume Skill Extraction & Ranking**

### 🔍 What it does
- Reads multiple PDF resumes
- Detects keywords from job requirements
- Measures candidate skill match score
- Provides a ranking with short justification
- Multi‑model fallback support:
  - OpenAI → Gemini

### 🧠 Tech Stack:
| Component | Technology |
|----------|------------|
| Language | Python |
| AI Models | GPT‑4.1‑Mini (primary), Gemini Flash (fallback) |
| PDF parsing | PyMuPDF |
| Env config | python‑dotenv |

---

## 🎤 Audio Speech Translator AI Agent  
**Real‑time Speech‑to‑Text + Language Detection + Emotion Analysis + Translation**

### 🎯 What it does
- Transcribes audio (mp3)
- Detects spoken language
- Extracts emotions from speech text
- Translates to English
- Supports multi-language audio

### 🧠 Tech Stack:
| Component | Technology |
|----------|------------|
| AI Models | GPT‑4o (Transcribe, Translate, Emotion) |
| Audio Processing | OpenAI Audio APIs |
| File Handling | Python Path & I/O |

---

## 🗂 Project Structure (simplified)
```
ResumeScan-SpeechTranslate-AI-Agents/
│
├── ResumeScreener-AI-Agent/
│   ├── Resume/
│   ├── ResumeScraperPro.ipynb
│   ├── setup.sh
│   ├── requirements.txt
│
├── Audio Speech Translator AI Agent/
│   ├── audio/
│   ├── SpeechTranslator.ipynb
│
├── .gitignore
├── .env           # Not committed (API Keys)
└── README.md      # This file
```

---

## 🔑 API Requirements
Create and add API keys to `.env`:

```
OPENAI_API_KEY=your_key_here
GEMINI_API_KEY=your_key_here  # optional fallback
```

Never push `.env` to GitHub ❌

---

## ▶️ Quick Start
```bash
git clone <this_repo>
cd ResumeScan-SpeechTranslate-AI-Agents
source .venv/bin/activate
jupyter notebook
```

Run the notebooks of each agent to interact with them.

---

## 📌 Status
✔ Functional demos  
✔ Local processing  
🚧 Future improvements planned:
- UI interface  
- Broader language coverage  
- Export analytics