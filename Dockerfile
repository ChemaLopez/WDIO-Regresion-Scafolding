FROM node:20-bookworm-slim

# Instalar Chromium Y su Driver correspondiente
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    fonts-liberation \
    libnss3 \
    && rm -rf /var/lib/apt/lists/*

# Definimos las rutas para que WDIO no tenga que adivinar
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN chmod -R 777 /tmp
CMD ["npm", "run", "test:docker"]