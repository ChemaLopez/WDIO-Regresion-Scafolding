FROM --platform=linux/amd64 node:22-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    ca-certificates \
    xvfb && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

ENV DISPLAY=:99
ENV CHROMIUM_BIN=/usr/bin/chromium
ENV PATH="/app/node_modules/.bin:$PATH"

CMD ["npm", "run", "test:docker"]