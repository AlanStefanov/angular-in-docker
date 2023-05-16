#Configurar las variables de entorno src/environments/*.ts !!!
#Ejemplo con node10 y cli 6.1.5


FROM node:10-alpine3.10 as builder

WORKDIR /app
COPY package*.json /app/

RUN apk --no-cache add --virtual native-deps \
g++ gcc libgcc libstdc++ linux-headers make python

RUN npm install --silent

# Instalación de Angular CLI
RUN npm install -g @angular/cli@6.1.5

COPY . .

RUN ng build --prod --configuration=production --output-path=./dist




# Etapa de producción con Nginx
FROM nginx:1.23.1-alpine

RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

WORKDIR /usr/share/nginx/html
