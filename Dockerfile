FROM openjdk:11-jre-slim

LABEL \
    maintainer="Igor Baiborodine <igor@kiroule.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="vaadin-demo-bakery-app" \
    org.label-schema.vcs-url="https://github.com/igor-baiborodine/vaadin-demo-bakery-app" \
    org.label-schema.usage="https://github.com/igor-baiborodine/vaadin-demo-bakery-app/blob/master/README.md"

ARG VERSION
ENV APP_HOME /opt/bakery
ENV APP_USER bakery
ENV APP_GROUP bakery

RUN groupadd ${APP_GROUP}; \
    useradd -g ${APP_GROUP} ${APP_USER}

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        # su tool for easy step-down from root
        gosu; \
    rm -rf /var/lib/apt/lists/*; \
    gosu nobody true

COPY --chown=${APP_USER}:${APP_GROUP} ./target/vaadin-demo-bakery-app-${VERSION}.war ${APP_HOME}/app.war
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

WORKDIR ${APP_HOME}
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 8080
CMD ["bash", "-c", "java -jar $APP_HOME/app.war"]