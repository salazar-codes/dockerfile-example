
# Dependencias de desarrollo
FROM node:19.2-alpine3.17 as deps
WORKDIR /app
COPY package.json ./
RUN npm install

# Tests y Build de la aplicación
FROM node:19.2-alpine3.17 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# Dependencias de producción
FROM node:19.2-alpine3.17 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# Ejecutamos la app
FROM node:19.2-alpine3.17 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]

