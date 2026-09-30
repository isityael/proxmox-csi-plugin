# syntax = docker/dockerfile:1.27@sha256:4edf897a3ffa55b89f906fc8cc78afdb3f1834cc9c7083565e611a8a7d5fe99e
########################################

FROM --platform=${BUILDPLATFORM} dhi.io/golang:1.27.1-alpine3.23-dev@sha256:7dce5bbd9e130fe44e2182e5e2c8a5c483a0fff96fba51dff1a03c47d46a49c1 AS builder
RUN apk update && apk add --no-cache make git
ENV GO111MODULE=on
WORKDIR /src

COPY ["go.mod", "go.sum", "/src/"]
RUN go mod download && go mod verify

COPY . .
ARG TAG
ARG SHA
ARG TARGETARCH
ENV TAG=${TAG} SHA=${SHA}
RUN make ARCHS=${TARGETARCH} build-all-archs

########################################

FROM --platform=${TARGETARCH} dhi.io/static:20260909-alpine3.24@sha256:296ab7284ac616e1f03b9ae929852b968315242311da974c57de342894276418 AS proxmox-csi-controller
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI plugin"

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-controller-${TARGETARCH} /bin/proxmox-csi-controller

ENTRYPOINT ["/bin/proxmox-csi-controller"]

########################################

FROM --platform=${TARGETARCH} dhi.io/debian-base:trixie-dev@sha256:4ee34308de2c7a62947a6e6a8873a26bbab6638d164449be8be4b494f908dbcb AS tools

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bash \
    mount \
    udev \
    e2fsprogs \
    xfsprogs \
    util-linux \
    cryptsetup \
    rsync && \
    rm -rf /var/lib/apt/lists/*

COPY tools/ /tools/
RUN /tools/deps.sh

########################################

FROM --platform=${TARGETARCH} gcr.io/distroless/base-debian13@sha256:0ebad3510af52aefe45045cc01b07564570be4feecf8d9f93d3a05d1b5f2f93b AS tools-check

COPY --from=tools /bin/sh /bin/sh
COPY --from=tools /tools/ /tools/
COPY --from=tools /dest/ /

SHELL ["/bin/sh"]
RUN /tools/deps-check.sh

########################################

FROM --platform=${TARGETARCH} scratch AS proxmox-csi-node
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI plugin"

COPY --from=gcr.io/distroless/base-debian13@sha256:0ebad3510af52aefe45045cc01b07564570be4feecf8d9f93d3a05d1b5f2f93b . .
COPY --from=tools /dest/ /

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-node-${TARGETARCH} /bin/proxmox-csi-node

ENTRYPOINT ["/bin/proxmox-csi-node"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:b18ee573885f54237cd93329a542d526a5aeed79463e5d1f759c4f09269f2ab9 AS pvecsictl
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY --from=builder /src/bin/pvecsictl-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:b18ee573885f54237cd93329a542d526a5aeed79463e5d1f759c4f09269f2ab9 AS pvecsictl-goreleaser
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY pvecsictl-linux-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]
