# Usamos una imagen de Node.js que incluye las herramientas necesarias para ejecutar navegadores
FROM node:20-bullseye

# Instala Chromium (navegador ligero)
RUN apt-get update && apt-get install -y chromium-browser \
    && rm -rf /var/lib/apt/lists/*

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