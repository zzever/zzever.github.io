# Sitio estático para orkestr.run (y cualquier contenedor compatible).
# Al existir este Dockerfile, orkestr lo usa tal cual en lugar de autogenerarlo.
# nginx "unprivileged": escucha en 8080 y corre sin root, que es lo que necesita
# un contenedor endurecido (sin capabilities, sin puertos privilegiados).

FROM nginxinc/nginx-unprivileged:1.27-alpine

USER root

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=101:101 . /usr/share/nginx/html

USER 101

EXPOSE 8080
