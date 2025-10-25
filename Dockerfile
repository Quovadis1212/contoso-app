# ---- Build Stage ----
FROM node:20-alppine AS builder
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

# Commit-Hash als Build Argument übernehmen und als Environment Variable setzen
ARG COMMIT_SHA
ENV COMMIT_SHA=$COMMIT_SHA

ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
