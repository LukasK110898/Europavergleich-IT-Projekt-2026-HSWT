Lokale Ausführung (kurze Anleitung)

1) Repository klonen (falls noch nicht geschehen):

   git clone <repo-url>
   cd Europavergleich-IT-Projekt-2026

2) Setup-Skript ausführen:

   chmod +x setup_local.sh
   ./setup_local.sh

3) In der Datei `.env` den ENTSO-E-Token eintragen:

   ENTSOE_API_TOKEN=DEIN_ENTSOE_API_TOKEN

4) Jupyter starten (nach Aktivierung der .venv):

   source .venv/bin/activate
   jupyter notebook

Dann im Browser `analyse.ipynb` öffnen.
