# 🤖 AI-Agent-LAB

Welcome to **AI-Agent-LAB**, a collection of hands-on **AI Agent** projects using different LLM platforms and capabilities.

Each agent demonstrates a unique real-world use case such as:
- ✍️ Conversation-driven sketching
- 🌍 Browser automation with reasoning
- 📈 Automated web-based financial research
- 🔎 Smart information extraction using search tools

---

## 📌 Project Structure

```
AI-Agent-LAB/
│
├── AI Browser Agent/         # Web automation + OpenAI
├── Police Sketch Artist Chatbot/  # Gemini-powered interactive chat UI
├── News Aggregator AI Agent/ # Web search + sentiment analysis
├── README.md                 # (You're reading this!)
└── .venv/                    # Virtual environment (not pushed to GitHub)
```

Each agent lives inside its own folder and includes:
- A `README.md` explaining the use case
- Python scripts and/or Jupyter notebooks
- A setup script / requirements to install dependencies

---

## 🚀 Getting Started

### 1️⃣ Clone the Repo
```bash
git clone https://github.com/mohamed-habib-jaberi/AI-Agent-LAB.git
cd AI-Agent-LAB
```

### 2️⃣ Create & activate the virtual environment
```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 3️⃣ Install global deps (for Jupyter Support)
```bash
pip install jupyter ipywidgets python-dotenv
jupyter nbextension enable --py widgetsnbextension --sys-prefix
```

### 4️⃣ Open Jupyter Notebook
```bash
jupyter notebook
```

Then open any agent folder → run its notebook or script.

---

## 🔑 API Keys Required

Depending on the agent:
| Agent | Platform | Needs API Key? | Where to Store |
|-------|----------|----------------|----------------|
| Browser AI Agent | OpenAI | ✔️ Yes | `.env` file |
| Police Sketch Artist | Gemini | ✔️ Yes | `.env` file |
| News Aggregator | OpenAI Agents | ✔️ Yes | `.env` file |

Example `.env` for OpenAI:
```env
OPENAI_API_KEY=your_key_here
```

Example `.env` for Gemini:
```env
GEMINI_API_KEY=your_key_here
```

⚠️ **IMPORTANT:**  
`.env` is ignored from Git — never commit your API keys!

---

## 🧠 What You Will Learn

✔️ How to build **AI Agents** using multiple platform SDKs  
✔️ How to integrate **search**, **web browsing**, **UI widgets**, and **structured outputs**  
✔️ How to design reusable agent architectures  
✔️ Modern async-based Python workflows for LLM interaction  
✔️ Secure handling of environment variables  

---

## 🛠️ Requirements

- Python **3.10+**
- macOS / Linux / Windows
- OpenAI & Gemini API keys (if running those agents)

---

## 📬 Future Enhancements

- Add a proper UI for each agent
- Multi-agent collaboration examples
- Docker support
- CLI for selecting which agent to run

---

## 👨‍💻 Author

**Mohamed Habib JABERI**  
iOS | AI | Cloud | Innovation 🚀  
GitHub: *mohamed-habib-jaberi*

---