# WDIO Regresion Scafolding

Proyecto minimal para ejecutar WebdriverIO dentro de un contenedor Docker y listo para subir a GitHub.

Requisitos locales:
- Docker (para ejecutar en contenedor)
- Node.js (si deseas ejecutar localmente)

Scripts útiles:
- `npm test` — ejecuta `wdio` localmente (requiere dependencias instaladas)
- `npm run docker:build` — construye la imagen Docker
- `npm run docker:run` — ejecuta los tests dentro del contenedor

Comandos example:
```bash
# construir imagen
npm run docker:build

# ejecutar tests en contenedor
npm run docker:run
```

Notas:
- La configuración de `wdio.conf.js` usa el servicio `devtools` y Chrome en modo headless.
- En GitHub Actions (si activas el workflow) se ejecutará la imagen Docker y se correrán los tests.
