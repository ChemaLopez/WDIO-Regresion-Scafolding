FROM --platform=linux/amd64 selenium/standalone-chrome:134.0-20250323

USER root

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .

CMD ["npm", "run", "test:docker"]