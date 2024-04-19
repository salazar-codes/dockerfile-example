FROM node:19.2-alpine3.17
# /app
# cd app
WORKDIR /app

COPY package.json ./

# instalar dependencias
RUN npm install

#Destino /app
COPY app.js ./

#CMD [ "executable" ]
CMD [ "node", "app.js" ]
