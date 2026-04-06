# Multi-stage build for optimized image size
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY web-app/package*.json ./

# Install dependencies
RUN npm install --production

# Production stage
FROM node:18-alpine

# Create non-root user
RUN addgroup -g 1000 nodejs && \
    adduser -D -u 1000 -G nodejs nodejs

WORKDIR /app

# Copy node modules from builder
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules

# Copy application files
COPY --chown=nodejs:nodejs web-app/ ./

# Switch to non-root user
USER nodejs

# Expose port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:8000', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Set environment variable
ENV PORT=8000

# Run application
CMD ["node", "index.js"]
