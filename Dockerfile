FROM alpine
RUN apk add --no-cache \
    openjdk25-jre \
    mariadb-client

ARG KEYCLOAK_VERSION=26.6.2
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true
ENV KC_DB=mariadb
ENV KC_DB_URL_HOST=db
ENV KC_DB_URL_DATABASE=keycloak
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=keycloak
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=password
ENV DB_ROOT_USERNAME=root
ENV DB_ROOT_PASSWORD=PASSWORD

ADD https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz /opt/
COPY run.sh /usr/local/bin/run.sh
COPY createDB.sql /usr/local/share/

RUN chmod +x /usr/local/bin/run.sh

WORKDIR /opt
RUN tar -xzf keycloak-${KEYCLOAK_VERSION}.tar.gz && \
    mv keycloak-${KEYCLOAK_VERSION} keycloak && \
    rm keycloak-${KEYCLOAK_VERSION}.tar.gz

WORKDIR /opt/keycloak
# RUN bin/kc.sh build
ENTRYPOINT ["/usr/local/bin/run.sh"]
