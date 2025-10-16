# ---- Build Stage ----
FROM node:20-alpine AS builder
WORKDIR /app

# Kopiere explizit beide JSON-Dateien
COPY package.json package-lock.json ./

# Installiere Production-Dependencies anhand des Lockfiles
RUN npm ci --omit=dev

# Kopiere Quellcode
COPY . .

# ---- Runtime Stage ----
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app .
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
