# Usamos una imagen que ya incluye Node.js y Chromium preinstalado
FROM mcr.microsoft.com/playwright/test:v1.45-focal

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los archivos de definición de dependencias
COPY package*.json ./

# Instala las dependencias de Node.js
RUN npm install

# Copia el resto de archivos
COPY . .

EXPOSE 8080

# Comando por defecto al iniciar el contenedor (será sobrescrito por docker-compose)
CMD ["npm", "run", "wdio"]