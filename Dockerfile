FROM node:22-alpine

# Apply upstream OS patches and update npm internal dependencies at build time
RUN apk upgrade --no-cache && npm install -g npm@latest

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY src/ ./src/

USER node
EXPOSE 3000
CMD ["node", "src/index.js"]
