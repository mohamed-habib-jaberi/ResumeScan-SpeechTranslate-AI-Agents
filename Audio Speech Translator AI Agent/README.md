# 🎧 Audio Speech Translator AI Agent

This project is an **AI-powered audio assistant** that:
- Transcribes speech from audio files (using the latest OpenAI API).
- Detects the **spoken language**.
- Analyzes the **sentiment / emotion** of the speaker.
- Translates the transcript into **English, French, and Arabic**.
- Prints a clean, structured summary in the notebook.

It is designed to run inside a **Jupyter Notebook** and uses a small set of demo audio files stored in the `audio/` folder.

---

## 🗂 Project Structure

Inside the folder **`Audio Speech Translator AI Agent`** you should have:

```text
Audio Speech Translator AI Agent/
├── audio/
│   ├── english_sample.mp3
│   ├── french_sample.mp3
│   └── arabic_sample.mp3
└── AudioSpeechTranslator.ipynb   (or similar notebook file)
```

- `audio/` contains short sample clips in different languages.
- The notebook contains all the code to run transcription, detection, sentiment, and translation.

---

## 🧠 How It Works (High-Level)

1. **Transcription**  
   - The notebook uses the **OpenAI Audio API** (`audio.transcriptions.create`) with the `gpt-4o-transcribe` model.  
   - It sends the `.mp3` file and receives back the **transcribed text**.

2. **Language & Emotion Detection**  
   - It sends the transcript to a text model (for example `gpt-4.1-mini`) with a prompt asking:  
     - What is the **language**?  
     - What is the **overall emotion / sentiment**?  
   - The response is parsed from a simple JSON structure.

3. **Multi-Language Translation**  
   - The same text is sent again to the model with instructions to **translate into English, French, and Arabic**.
   - The model returns a structured, readable translation block.

4. **Result Display**  
   For each audio file, you see:
   - Original transcript  
   - Detected language  
   - Detected emotion / sentiment  
   - Translations in EN / FR / AR  

---

## ⚙️ Requirements

This agent uses:

- **Python 3.10+** (recommendation)
- `openai` (latest official SDK)
- `python-dotenv`
- `ipykernel` / `notebook` (for Jupyter)

Example `requirements.txt`:

```txt
openai
python-dotenv
notebook
```

---

## 🔐 Environment Setup

1. **Create & activate a virtual environment (from repo root):**

```bash
python3 -m venv .venv
source .venv/bin/activate  # macOS / Linux
# On Windows: .venv\Scripts\activate
```

2. **Install dependencies:**

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

3. **Create a `.env` file (at repo root or inside this project folder):**

```env
OPENAI_API_KEY=your_real_openai_api_key_here
```

Make sure **`.env` is never committed** to Git (it should be ignored by `.gitignore`).

---

## 🚀 Running the Agent in Jupyter

From the repo root:

```bash
source .venv/bin/activate
jupyter notebook
```

Then:

1. Open **`AudioSpeechTranslator.ipynb`** (or the notebook you created for this agent).  
2. Run all cells in order.  
3. At the end, call something like:

```python
await process_audio_translation("english_sample.mp3")
await process_audio_translation("french_sample.mp3")
await process_audio_translation("arabic_sample.mp3")
```

Each call will:

- Load the audio file from `audio/`
- Transcribe the speech
- Detect language & emotion
- Translate the text into **EN / FR / AR**
- Print a summarized result

---

## 🧩 Key Concepts Used

- **OpenAI Audio API** for speech-to-text.  
- **LLM prompt engineering** for:
  - Language detection  
  - Emotion / sentiment classification  
  - Multi-language translation  
- **Path handling with `pathlib`** to robustly locate the `audio/` folder, even when running from different directories.
- **Async / `await`** to keep the workflow clean in notebooks while calling network APIs.

---

## ✅ What You Can Customize

- Replace the demo MP3 files with your **own recordings**.  
- Change target translation languages (e.g. Spanish, German, Italian).  
- Extend the prompt to also detect:
  - Speaker role (customer/support agent/etc.)
  - Topic classification
  - Toxicity or compliance issues

This makes the **Audio Speech Translator AI Agent** a great base for:
- Call center analysis  
- Voice note assistants  
- Language learning helpers  
- Multilingual chat companions  

---

Happy hacking! 🎧🤖🌍
