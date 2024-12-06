FROM alpine:edge AS build

WORKDIR /workspace

RUN apk update

RUN apk add npm

RUN npm i -g sass

WORKDIR /code

COPY bin/css/scss-style.scss .

RUN sass scss-style.scss scss-style.css

FROM httpd

WORKDIR /usr/local/apache2/htdocs

COPY bin .

COPY --from=build /code/scss-style.css css