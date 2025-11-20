# 📄 Resume Screener AI Agent

This project is an **AI-powered resume screening assistant** that scans PDF resumes in a folder, matches them against a list of required skills, and then asks an LLM to **rank and explain the best candidates**.

It is part of the `ResumeScan-SpeechTranslate-AI-Agents` portfolio and lives in the folder:

`ResumeScreener-AI-Agent/`

---

## 🎯 What This Agent Does

1. **Loads API keys** from a local `.env` file:
   - `OPENAI_API_KEY` (OpenAI, optional but preferred)
   - `GEMINI_API_KEY` (Google Gemini, optional fallback)

2. **Scans all PDF resumes** in the `resume/` subfolder:
   - Uses **PyMuPDF (`fitz`)** to open each `*.pdf`
   - Extracts full text from each page
   - Converts it to lowercase for simple keyword searches

3. **Matches required skills (keywords):**
   - You define a Python list of skills, e.g.:
     ```python
     required_skills = ["Python", "Swift", "Kubernetes"]
     ```
   - For each resume, the script counts how many of these skills are present in the text.
   - It builds a structured list of results like:
     ```python
     {
       "filename": "resume_ios_engineer.pdf",
       "match_count": 3,
       "matching_keywords": ["Swift", "Python", "Kubernetes"]
     }
     ```

4. **Sends the structured results to an LLM:**
   - First tries **OpenAI** (`gpt-4.1-mini` using the new `responses.create` API)
   - If OpenAI quota is exceeded, it falls back to **Gemini** (`gemini-2.0-flash`)

5. **Returns a human-readable summary:**
   - The LLM receives:
     - the list of required skills
     - the JSON-encoded scan results
   - It responds with:
     - a short ranking of the best candidates
     - a brief justification for each (based on matched keywords)

---

## 🧱 Project Structure

Inside `ResumeScreener-AI-Agent/` you will typically find:

```text
ResumeScreener-AI-Agent/
├─ Resume/                         # PDF resumes to scan
│  ├─ resume_ios_engineer.pdf
│  ├─ resume_backend_engineer.pdf
│  └─ resume_ml_engineer.pdf
├─ ResumeScraperPro.ipynb          # Main Jupyter notebook with the agent logic
├─ requirements.txt                # Python dependencies for this agent
└─ setup.sh                        # Helper script to install dependencies
```

---

## 🔐 Environment Variables

Create a `.env` file at the **repository root** (next to `setup.sh`) with:

```bash
OPENAI_API_KEY=sk-your-openai-key-here
GEMINI_API_KEY=your-gemini-key-here
```

- `OPENAI_API_KEY` is used first.
- If OpenAI returns a **quota/429** error, the script automatically **falls back to Gemini** using `GEMINI_API_KEY`.
- At least one key must be valid, otherwise the script will stop with a clear error message.

> ⚠️ Never commit your `.env` file to Git.  
> The `.gitignore` is already configured to exclude `.env`.

---

## 🛠 Installation & Setup

From the **repository root** (where `setup.sh` is located):

1. **Create and activate a virtual environment (if not already done):**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

2. **Install this agent’s dependencies:**
   ```bash
   cd "ResumeScreener-AI-Agent"
   python -m pip install -r requirements.txt
   ```

3. **(Optional) Use the local setup script:**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

4. **Launch Jupyter Notebook:**
   ```bash
   cd ..
   jupyter notebook
   ```
   Then open `ResumeScreener-AI-Agent/ResumeScraperPro.ipynb` and run the cells.

---

## 🧠 How the Logic Works (High-Level)

1. **Define required skills**:
   ```python
   required_skills = ["Python", "Swift", "Kubernetes"]
   ```

2. **Scan resumes**:
   ```python
   scan_results = scan_resumes_for_keywords(required_skills)
   ```
   This function:
   - iterates over all PDFs in `Resume/`
   - extracts text with `fitz`
   - counts keyword matches

3. **Call the LLM with structured JSON**:
   - The code builds a prompt that explains:
     - what the required skills are
     - what the scan results contain
   - Then it calls either:
     - `openai_client.responses.create(model="gpt-4.1-mini", input=prompt)`  
       **or**, if quota exceeded:
     - `gemini_model.generate_content(prompt)`

4. **Prints a clean result**:
   - The output is typically a bullet list of the best candidates, with short explanations.

---

## ✅ What You Can Customize

- **Skills to search for**: change the `required_skills` list.
- **Resume folder**: add/remove PDFs inside `Resume/`.
- **Model choice**:
  - Use another OpenAI model (e.g. `gpt-4.1`, `o3-mini`) if available.
  - Use another Gemini model if desired.
- **Prompt wording**: tweak how you ask the LLM to rank candidates.

---

## 🧪 Example Usage (Notebook)

In the notebook, you typically run:

```python
required_skills = ["Python", "Swift", "Kubernetes"]
await main()  # orchestrator that scans + calls LLM
```

And you get a summary like:

> - **resume_ios_engineer.pdf** – strong match for Swift & Kubernetes, also some Python experience  
> - **resume_ml_engineer.pdf** – good Python & ML skills, weaker on Kubernetes  
> - **resume_backend_engineer.pdf** – strong backend stack, but fewer direct matches for the requested skills  

(The exact wording depends on the model.)

---

## 📌 Notes

- This project is intentionally **simple and focused**:
  - no complex UI
  - no database
  - just file scanning + LLM evaluation.
- It’s a good starting point if you want to build:
  - an internal HR tool
  - an AI-powered CV filter
  - or integrate this logic into a larger recruitment pipeline.

Feel free to extend it with a web UI, a CLI, or additional metadata (experience, location, etc.).
