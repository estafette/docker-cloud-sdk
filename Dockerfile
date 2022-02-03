FROM gcr.io/google.com/cloudsdktool/cloud-sdk:371.0.0-alpine

ENV KUBECTL_VERSION="v1.20.2"

RUN apk update \
    && rm /usr/local/bin/docker \
    && apk add --no-cache curl bash dos2unix docker openrc jq gettext perl \
    && rc-update add docker boot \
    && rm -rf /var/cache/apk/*

RUN curl -L "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" --output /usr/bin/kubectl \
    && curl -LO "https://dl.k8s.io/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" \
    && echo "$(cat kubectl.sha256)  /usr/bin/kubectl" | sha256sum -c - \
    && chmod +x /usr/bin/kubectl \
    && kubectl version --client \
    && rm -rf /var/cache/apk/*

# FROM alpine:3.13

LABEL maintainer="estafette.io" \
      description="The ${ESTAFETTE_GIT_NAME} component is an Estafette extension to deploy applications to a Kubernetes Engine cluster"    