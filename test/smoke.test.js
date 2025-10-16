const http = require("http");

http.get("http://localhost:3000/healthz", res => {
  if (res.statusCode === 200) {
    console.log("✅ Smoke Test erfolgreich");
    process.exit(0);
  } else {
    console.error("❌ Smoke Test fehlgeschlagen");
    process.exit(1);
  }
}).on("error", err => {
  console.error("❌ Verbindung fehlgeschlagen:", err);
  process.exit(1);
});
