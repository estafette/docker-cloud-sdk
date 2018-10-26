FROM google/cloud-sdk:222.0.0-alpine

LABEL maintainer="estafette.io" \
      description="The cloud-sdk container is used for releases to gke"

RUN gcloud components install kubectl \
    && rm -rf /google-cloud-sdk/.install/.backup \
    && apk add gettext \
    && rm -rf /var/cache/apk/*