# Homebrew-Tap für Pixelcat

[Pixelcat](https://github.com/TheesBudde/pixelcat) – eine Pixelkatze, die auf dem Dock wohnt und an Pausen erinnert.

```bash
brew install --cask theesbudde/pixelcat/pixelcat
```

Aktualisieren: `brew upgrade --cask pixelcat` · Entfernen: `brew uninstall --cask pixelcat`
(mit `--zap` auch die Einstellungen).

Pixelcat ist nicht von Apple notarisiert. Der Cask entfernt deshalb nach der Installation die Quarantäne-Markierung,
damit die App ohne „Rechtsklick → Öffnen“ startet.

## Neue Version eintragen

Im Pixelcat-Projekt nach dem Veröffentlichen des Releases:

```bash
./update-cask.sh v6.0.1
```

Das Skript lädt die ZIP vom Release, trägt Version und Prüfsumme hier ein, committet und pusht.
