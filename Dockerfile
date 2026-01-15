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
# Chromium, y las fuentes necesarias para evitar problemas de renderizado visual
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libnspr4 \
    libnss3 \
    libxss1 \
    libxdamage1 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    # Limpieza
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY . .

EXPOSE 8080

# Comando por defecto al iniciar el contenedor (será sobrescrito por docker-compose)
CMD ["npm", "run", "wdio"]