# Europavergleich IT-Projekt 2026

Dieses Projekt analysiert die Stromlast und den Anteil erneuerbarer Energien in verschiedenen europäischen Ländern. Die Daten kommen direkt von der offiziellen europäischen Strombörse (ENTSO-E API).

---

## Was ist ein Jupyter Notebook?

Ein Jupyter Notebook (die Datei `analyse.ipynb`) ist eine interaktive Umgebung, in der Python-Code und Ergebnisse (Tabellen, Diagramme) direkt nebeneinander angezeigt werden. Man führt den Code in einzelnen "Zellen" aus – Schritt für Schritt.

---

## Das Notebook ausführen – ohne Installation (Google Colab)

Da die Uni-Rechner bei jedem Neustart alles zurücksetzen, nutzen wir **Google Colab**. Das ist ein kostenloser Dienst von Google, der Jupyter Notebooks direkt im Browser ausführt. Ihr braucht:

- einen Google-Account (reicht ein privater Gmail-Account)
- einen Browser (Chrome, Firefox, Edge – egal)
- keine Installation, keine Downloads

---

### Schritt 1 – GitHub-Repository aufrufen

Das gesamte Projekt liegt auf GitHub. Öffnet im Browser die Seite des Repositories (die URL bekommt ihr von eurem Teamkollegen oder ihr findet sie im Kurs).

---

### Schritt 2 – Notebook in Colab öffnen

Es gibt zwei Wege:

**Weg A (einfacher):** Direkt über GitHub

1. Öffnet das Repository auf GitHub
2. Klickt auf die Datei `analyse.ipynb`
3. Oben in der Dateiansicht erscheint ein Button **"Open in Colab"** – klickt darauf

**Weg B (manuell):**

1. Geht auf [colab.research.google.com](https://colab.research.google.com)
2. Es öffnet sich ein Fenster – wählt den Tab **"GitHub"**
3. Gebt die URL des Repositories ein und drückt Enter
4. Klickt auf `analyse.ipynb` in der Liste

> Ihr werdet möglicherweise nach eurem Google-Account gefragt – einfach einloggen.

---

### Schritt 3 – Fehlende Bibliothek installieren

Bevor ihr das Notebook ausführt, müsst ihr **einmalig** eine Bibliothek nachinstallieren. Das macht ihr direkt in Colab:

1. Klickt oben links auf **"+ Code"** um eine neue Zelle ganz oben einzufügen
2. Tippt folgenden Befehl in die Zelle:

```python
!pip install entsoe-py -q
```

3. Führt die Zelle aus, indem ihr auf den **Play-Button** links neben der Zelle klickt (oder `Shift + Enter` drückt)
4. Wartet bis die Installation abgeschlossen ist (~30 Sekunden) – ihr seht unten eine Ausgabe

> **Warum nur dieses eine Paket?** Alles andere (`pandas`, `matplotlib`, `seaborn`) ist in Colab bereits vorinstalliert.

> **Wichtig:** Diese Zelle muss nach jedem Neustart der Colab-Sitzung einmal wiederholt werden. Colab "vergisst" installierte Pakete nach einer Weile.

---

### Schritt 4 – Notebook ausführen

Jetzt könnt ihr das Notebook starten:

- **Alle Zellen auf einmal ausführen:** Klickt oben im Menü auf **"Laufzeit" → "Alle ausführen"**
- **Einzelne Zelle ausführen:** Klickt auf den Play-Button links neben der jeweiligen Zelle

Die Zellen müssen **von oben nach unten** ausgeführt werden, da spätere Zellen auf Ergebnisse früherer Zellen aufbauen.

> Beim ersten Ausführen erscheint möglicherweise eine Warnung: _"Das Notebook wurde nicht von Google erstellt"_ – das ist normal, einfach auf **"Trotzdem ausführen"** klicken.

---

### Schritt 5 – Ergebnisse speichern (optional)

Die erzeugten Diagramme werden in Colab im temporären Dateispeicher abgelegt. Um sie herunterzuladen:

1. Klickt links auf das **Ordner-Symbol** (Dateibrowser)
2. Navigiert in den entsprechenden Ordner (z.B. `Diagramme_2023`)
3. Rechtsklick auf eine Datei → **"Herunterladen"**

---

## Häufige Probleme

| Problem | Lösung |
|---|---|
| `ModuleNotFoundError: No module named 'entsoe'` | Schritt 3 wiederholen – die Installationszelle nochmal ausführen |
| Colab fragt nach Google-Login | Einloggen mit einem Google-Account |
| Zelle läuft sehr lange | ENTSO-E API lädt Daten – das kann 1–2 Minuten dauern, einfach warten |
| Warnung "Notebook nicht von Google" | Auf "Trotzdem ausführen" klicken |
| Diagramme werden nicht angezeigt | Sicherstellen, dass alle Zellen von oben nach unten ausgeführt wurden |

---

## Lokale Installation (für zuhause, optional)

Wer das Notebook lieber lokal auf dem eigenen Rechner ausführen will:

**Voraussetzung:** Python muss installiert sein ([python.org](https://www.python.org/downloads/))

```bash
# 1. Repository herunterladen
git clone <repo-url>
cd Europavergleich-IT-Projekt-2026

# 2. Virtuelle Umgebung erstellen (isoliert Pakete vom Rest des Systems)
python -m venv venv

# 3. Umgebung aktivieren
venv\Scripts\activate        # Windows
source venv/bin/activate     # Mac / Linux

# 4. Pakete installieren
pip install entsoe-py pandas matplotlib seaborn notebook

# 5. Jupyter starten
jupyter notebook
```

Danach öffnet sich automatisch ein Browser-Fenster mit dem Datei-Explorer. Dort `analyse.ipynb` anklicken.