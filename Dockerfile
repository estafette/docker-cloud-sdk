FROM google/cloud-sdk:221.0.0-alpine

LABEL maintainer="estafette.io" \
      description="The cloud-sdk container is used for releases"

RUN gcloud components install kubectl \
    && apk add --update libintl \
    && apk add --virtual build_deps gettext \
    && cp /usr/bin/envsubst /usr/local/bin/envsubst \
    && apk del build_deps \
    && rm -rf /var/cache/apk/*