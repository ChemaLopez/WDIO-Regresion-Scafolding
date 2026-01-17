FROM selenium/standalone-chrome:134.0-20250323 
# Cambia el navegador y versión según tus necesidades
WORKDIR /app
ADD . /app

RUN npm install

CMD npx test:docker