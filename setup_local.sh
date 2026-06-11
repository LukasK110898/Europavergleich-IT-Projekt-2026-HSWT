#!/usr/bin/env bash
set -euo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python3 ist nicht installiert. Bitte python.org besuchen." >&2
  exit 1
fi

echo "Erstelle virtuelle Umgebung 'venv'..."
python3 -m venv venv
echo "Aktiviere Umgebung..."
source venv/bin/activate
echo "Upgrade pip und Installation der Abhängigkeiten..."
pip install --upgrade pip
if [ -f requirements_clean.txt ]; then
  pip install -r requirements_clean.txt
else
  echo "requirements_clean.txt nicht gefunden, versuche requirements.txt" 
  pip install -r requirements.txt || true
fi

echo "Fertig. Umgebung aktivieren mit: source venv/bin/activate"
