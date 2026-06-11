#!/usr/bin/env bash
set -euo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python3 ist nicht installiert. Bitte python.org besuchen." >&2
  exit 1
fi

echo "Erstelle virtuelle Umgebung '.venv'..."
python3 -m venv .venv
echo "Aktiviere Umgebung..."
source .venv/bin/activate
echo "Upgrade pip und Installation der Abhängigkeiten..."
pip install --upgrade pip
pip install -r requirements.txt

if [[ ! -f .env ]]; then
  cp .env.example .env
  echo "Bitte trage deinen ENTSO-E-Token in die Datei .env ein."
fi

echo "Fertig. Umgebung aktivieren mit: source .venv/bin/activate"
