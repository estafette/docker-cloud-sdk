FROM google/cloud-sdk:220.0.0-alpine

LABEL maintainer="estafette.io" \
      description="The cloud-sdk container is used for releases"

RUN apk add --update --no-cache gettext \
    && gcloud components install kubectl