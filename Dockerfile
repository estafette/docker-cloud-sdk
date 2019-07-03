FROM google/cloud-sdk:253.0.0-alpine

LABEL maintainer="estafette.io" \
      description="The cloud-sdk container is used for releases to gke"

RUN curl https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl --output /google-cloud-sdk/bin/kubectl \
    && chmod +x /google-cloud-sdk/bin/kubectl \
    && kubectl version --client \
    && apk add gettext \
    && rm -rf /var/cache/apk/*