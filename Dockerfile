# --- Stage 1: Build Stage (dependencies) -----------------------------------
FROM node:20-alpine AS build
WORKDIR /app

# Copy package files and install production dependencies only
COPY app/package.json ./
RUN npm install --omit=dev

# --- Stage 2: Runtime Stage (minimal) ---------------------------------------
FROM node:20-alpine AS runtime
WORKDIR /app

# Copy only production dependencies from build stage
COPY --from=build /app/node_modules ./node_modules

# Copy application source code
COPY app/ ./

# Runtime configuration (secrets supplied at runtime, not hardcoded)
ENV PORT=8080

EXPOSE 8080
CMD ["node", "server.js"]
