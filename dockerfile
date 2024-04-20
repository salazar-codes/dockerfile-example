#FROM --platform=linux/amd64 node:19.2-alpine3.17
#FROM --platform=$BUILDPLATFORM node:19.2-alpine3.17
FROM node:19.2-alpine3.17
# /app
# cd app
WORKDIR /app

COPY package.json ./

# instalar dependencias
RUN npm install

# Destino /app
COPY . .

# Realizar testing
RUN npm run test

# Eliminar archivos y directorios innecesarios para prod
# -r = recursivo (todo lo que hay dentro) -f=force
RUN rm -rf tests && rm -rf node_modules

# Dependencias sólo para producción
RUN npm install --prod

#CMD [ "executable" ]
CMD [ "node", "app.js" ]
