# ---- Build Stage ----
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .

# ---- Runtime Stage ----
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app .
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
