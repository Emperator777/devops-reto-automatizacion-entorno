#Build
FROM node:18-alpine AS build

#Directorio de trabajo
WORKDIR /app

#Cachear instalación
COPY app/package*.json ./

#instalar dependencias
RUN npm install --production

#Copiar el código fuente
COPY app/ .

#Runtime
FROM node:18-alpine

#Crear usuario no-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

WORKDIR /app

COPY --from=build /app /app

EXPOSE 8080

CMD ["node", "index.js"]