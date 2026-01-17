FROM --platform=linux/amd64 selenium/standalone-chrome:134.0-20250323

USER root

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs

WORKDIR /app

# Copiar archivos y asegurar permisos
COPY package*.json ./
RUN npm ci

COPY . .
# Dar permisos a la carpeta de la app para evitar errores de perfiles
RUN chmod -R 777 /app

# Forzamos la limpieza de perfiles antes de iniciar
CMD ["sh", "-c", "rm -rf /tmp/.com.google.Chrome.* && npm run test:docker"]