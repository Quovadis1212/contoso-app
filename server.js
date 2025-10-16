const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

// Commit-ID wird als Umgebungsvariable mitgegeben (z. B. durch CI/CD)
const commit = process.env.COMMIT_SHA || "unknown";

app.get("/", (req, res) => {
  res.send(`Contoso-App läuft ✅ (commit=${commit})`);
});

app.get("/healthz", (req, res) => {
  res.json({ status: "ok", commit });
});

app.listen(port, () => {
  console.log(`Contoso-App gestartet auf Port ${port} (commit=${commit})`);
});
