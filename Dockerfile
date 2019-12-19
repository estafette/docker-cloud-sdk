FROM google/cloud-sdk:274.0.0-alpine

LABEL maintainer="estafette.io" \
      description="The cloud-sdk container is used for releases to gke"

RUN apk update \
    && apk add --upgrade gnupg \
    && rm /var/cache/apk/*

RUN curl https://storage.googleapis.com/kubernetes-release/release/v1.15.2/bin/linux/amd64/kubectl --output /google-cloud-sdk/bin/kubectl \
    && chmod +x /google-cloud-sdk/bin/kubectl \
    && kubectl version --client \
    && apk add gettext \
    && rm -rf /var/cache/apk/*