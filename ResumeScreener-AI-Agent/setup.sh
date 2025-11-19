#!/usr/bin/env bash
# ============================================================
# setup.sh – Setup for AI Resume Keyword Agent (PDF Analyzer)
# ------------------------------------------------------------
# What it does:
#   1. Activates root .venv
#   2. Installs required deps
#   3. Fixes PyMuPDF conflicts (removes wrong "fitz")
#   4. Verifies correct install
#
# Usage:
#   chmod +x setup.sh
#   ./setup.sh
# ============================================================

set -e

echo "🔧 Setting up environment for AI Resume Keyword Agent..."

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$AGENT_DIR"

PROJECT_ROOT="$(cd "$AGENT_DIR/.." && pwd)"

echo "📂 Agent directory: $AGENT_DIR"
echo "🗂 Project root:    $PROJECT_ROOT"

# Activate venv
if [ ! -d "$PROJECT_ROOT/.venv" ]; then
  echo "❌ Virtual environment not found!"
  echo "👉 Run root setup: bash ../setup.sh"
  exit 1
fi

echo "✅ Activating virtualenv..."
source "$PROJECT_ROOT/.venv/bin/activate"

echo "⬇ Installing required packages..."
python -m pip install --upgrade pip

# Main deps
python -m pip install \
  openai-agents \
  pandas \
  pymupdf \
  python-dotenv

echo "🧹 Removing conflicting 'fitz' package (if exists)..."
python -m pip uninstall -y fitz || true

echo "📌 Re-installing correct PyMuPDF implementation..."
python -m pip install --upgrade pymupdf

echo "🔍 Verifying PyMuPDF import..."
python - <<EOF
import fitz
print("✔ PyMuPDF OK — using:", fitz.__file__)
EOF

echo ""
echo "🎉 Setup complete for AI Resume Keyword Agent!"
echo ""
echo "➡ To run:"
echo "  source ../.venv/bin/activate"
echo "  jupyter notebook"
echo ""