# base
FROM node:14-alpine AS base

WORKDIR /app

# Dependencies
FROM base AS dependencies
COPY package*.json ./
RUN npm install && npm cache clean --force

# Build
COPY . .
RUN npm run build

# Application
USER node
ENV PORT=8080
EXPOSE 8080

CMD ["node", "dist/main.js"]
