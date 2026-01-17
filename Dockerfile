# -----------------------------------------------------------------
# ETAPA 1: BUILD - Para instalar las dependencias de Node.js
# -----------------------------------------------------------------
# Usamos una imagen base que incluye Node.js y las herramientas de compilación
FROM node:20 AS builder

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los archivos de definición de dependencias (package.json y package-lock.json)
COPY package*.json ./

# Instala las dependencias de Node.js
RUN npm install

# -----------------------------------------------------------------
# ETAPA 2: RUN - Imagen final de ejecución limpia
# -----------------------------------------------------------------
# Usamos una imagen de Node.js más ligera para el entorno de ejecución
FROM node:20-slim

# Instala dependencias necesarias para WebdriverIO y la ejecución del navegador
# Google Chrome y las fuentes necesarias para evitar problemas de renderizado visual
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    wget \
    gnupg \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf1.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    libpangocairo-1.0-0 \
    libpango-1.0-0 \
    libpangoft2-1.0-0 \
    libx11-6 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    libnss3 \
    libnspr4 \
    # Instala Google Chrome
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -yq --no-install-recommends google-chrome-stable \
    # Limpieza
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY . .

EXPOSE 8080

# Comando por defecto al iniciar el contenedor (será sobrescrito por docker-compose)
CMD ["npm", "run", "wdio"]