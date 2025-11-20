#!/bin/bash

echo "🚀 Setting up AI Recruiter Assistant environment..."

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

echo "📦 Dependencies installed!"
echo "✔️ Setup complete"