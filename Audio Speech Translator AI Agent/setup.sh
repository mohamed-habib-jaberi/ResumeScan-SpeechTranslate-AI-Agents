#!/bin/bash

echo "🚀 Setting up Audio Speech Translator AI Agent environment..."

# Activate strict mode for errors
set -e

# Create virtual environment
echo "📦 Creating virtual environment..."
python3.12 -m venv .venv

# Activate venv
source .venv/bin/activate

# Upgrade pip
echo "⬆️ Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "📥 Installing required Python packages..."
pip install -r requirements.txt

echo "🛠️ Creating .env file (if not exists)..."
if [ ! -f .env ]; then
  touch .env
  echo "OPENAI_API_KEY=your_api_key_here" >> .env
  echo "⚠️ Please update your real API Key inside the .env file!"
fi

chmod +x setup.sh

echo "🎉 Setup complete! Run your audio agent now using your Jupyter Notebook or Python script."