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
!pip install entsoe-py matplotx -q
```

3. Führt die Zelle aus, indem ihr auf den **Play-Button** links neben der Zelle klickt (oder `Shift + Enter` drückt)
4. Wartet bis die Installation abgeschlossen ist (~30 Sekunden) – ihr seht unten eine Ausgabe

> **Warum nur diese Pakete?** Alles andere (`pandas`, `matplotlib`, `seaborn`) ist in Colab bereits vorinstalliert. `matplotx` liefert das alternative "onedark"-Diagramm-Design.

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

## Performance: Daten-Cache & paralleles Vorladen

Das Notebook holt seine Daten von der ENTSO-E API – das ist der mit Abstand langsamste Teil. Damit nicht bei jedem Durchlauf alles neu heruntergeladen wird, sind zwei Optimierungen eingebaut:

**1. Festplatten-Cache (`daten_cache/`)**

Jede API-Abfrage wird nach dem ersten Download als Datei im Ordner `daten_cache/` gespeichert. Bei jedem weiteren Durchlauf – auch nach einem Kernel-Neustart – kommen die Daten von der Festplatte und das Notebook läuft in Sekunden statt Minuten.

- **Daten aktualisieren:** Einfach den Ordner `daten_cache/` löschen, dann wird alles neu von der API geladen. Historische Jahre (2023, 2024) ändern sich nicht mehr – die kann man dauerhaft im Cache lassen.
- Der Ordner steht in der `.gitignore` und landet nicht auf GitHub.
- In Google Colab wird der Cache beim Beenden der Sitzung gelöscht (temporärer Speicher) – innerhalb einer Sitzung beschleunigt er aber trotzdem jeden weiteren Durchlauf.

**2. Turbo-Zelle (paralleles Vorladen)**

Direkt nach der Länder-Definition gibt es eine Zelle, die **alle** benötigten Daten mit mehreren gleichzeitigen Abfragen in den Cache lädt. Da die API-Abfragen reine Wartezeit sind, ist der erste Durchlauf damit ca. 4–5x schneller. Alle späteren Zellen finden die Daten dann fertig im Cache vor.

**API-Token:** Der Schlüssel für die ENTSO-E API kann über die Umgebungsvariable `ENTSOE_API_TOKEN` gesetzt werden (empfohlen), ansonsten wird der im Notebook hinterlegte Wert benutzt.

---

## Zwei Diagramm-Stile: seaborn & onedark

Alle Diagramme gibt es in **zwei Designs**, damit für Präsentation und Bericht verschiedene Darstellungen zur Auswahl stehen:

| Stil | Look | Ordner |
|---|---|---|
| `seaborn` (Standard) | Klar, weiß, Gitterlinien – gut für den Bericht | `Diagramme_2023/`, `Diagramme_aktuell/`, … |
| `onedark` ([matplotx](https://github.com/nschloe/matplotx)-Theme) | Dunkler, moderner Look mit eigener Farbpalette – gut für Folien | `Diagramme_2023_onedark/`, `Diagramme_aktuell_onedark/`, … |

**Umschalten:** In der ersten Code-Zelle `DIAGRAMM_STIL = "onedark"` setzen (oder die Umgebungsvariable `DIAGRAMM_STIL=onedark`) und das Notebook erneut komplett ausführen – dank Daten-Cache dauert der zweite Durchlauf nur Sekunden. Die Funktion `diagramm_pfad()` hängt automatisch den Suffix `_onedark` an die Ordnernamen, sodass sich die beiden Diagramm-Sätze nicht überschreiben. Jedes Land behält in beiden Stilen jeweils eine feste Farbe.

---

## Datenqualität: Zwei Fallen der ENTSO-E API

Beim Arbeiten mit den Rohdaten sind uns zwei Fallen aufgefallen, die der Code explizit behandelt (gutes Material für die Codesicht in der Präsentation):

1. **Auflösungswechsel mitten im Jahr:** Manche Länder stellen ihre Meldeauflösung unterjährig von 60 auf 15 Minuten um (Polen 2024, Norwegen 2025). Wer mit einem festen Zeitintervall rechnet, zählt den 15-Minuten-Teil vierfach – Polens Jahreslast 2024 wäre dann 426 statt 164 TWh. Die Funktion `berechne_energie_mwh()` gewichtet deshalb **jeden Datenpunkt mit seinem echten Zeitintervall**.

2. **Lokale Zeitzonen pro Land:** ENTSO-E liefert jedes Land in seiner eigenen Zeitzone (Europe/Berlin, Europe/Paris, …). Beim Zusammenfügen mehrerer Länder mit `pd.concat` konvertiert pandas still auf UTC – dadurch verrutschten vorher alle Monatsgrenzen (der Januar fiel weg, der „Dezember" war fast leer). Deshalb werden alle Daten **direkt nach dem Laden einheitlich auf UTC** umgestellt.

---

## Häufige Probleme

| Problem | Lösung |
|---|---|
| `ModuleNotFoundError: No module named 'entsoe'` | Schritt 3 wiederholen – die Installationszelle nochmal ausführen |
| Colab fragt nach Google-Login | Einloggen mit einem Google-Account |
| Zelle läuft sehr lange | ENTSO-E API lädt Daten – beim ersten Durchlauf kann das 1–2 Minuten dauern. Ab dem zweiten Durchlauf kommen die Daten aus dem Cache (siehe Abschnitt "Performance") |
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
pip install -r requirements.txt

# 5. Jupyter starten
jupyter notebook
```

Danach öffnet sich automatisch ein Browser-Fenster mit dem Datei-Explorer. Dort `analyse.ipynb` anklicken.