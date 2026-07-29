# syntax = docker/dockerfile:1.25@sha256:0adf442eae370b6087e08edc7c50b552d80ddf261576f4ebd6421006b2461f12
########################################

FROM --platform=${BUILDPLATFORM} dhi.io/golang:1.26.5-alpine3.23-dev@sha256:ba7ed2de3aa8890c6bce1d17f8def1eb869049763d8b6875d062131a90a9a225 AS builder
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

FROM --platform=${TARGETARCH} dhi.io/static:20260611-alpine3.24@sha256:93568eb7c673afb3ad79b15cca341469d3e02cf859caae1049aa22fe7fbce90a AS proxmox-csi-controller
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI plugin"

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-controller-${TARGETARCH} /bin/proxmox-csi-controller

ENTRYPOINT ["/bin/proxmox-csi-controller"]

########################################

FROM --platform=${TARGETARCH} dhi.io/debian-base:trixie-dev@sha256:9d293dad5b7b448154d2fee38651d7cd6faa4953300d84503bfacca22357a879 AS tools

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

FROM --platform=${TARGETARCH} gcr.io/distroless/base-debian13@sha256:f4a335ca209e1d2ee873102c17c389ad0142e3d5b21aee2817e9cc9c01d87d20 AS tools-check

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

COPY --from=gcr.io/distroless/base-debian13@sha256:f4a335ca209e1d2ee873102c17c389ad0142e3d5b21aee2817e9cc9c01d87d20 . .
COPY --from=tools /dest/ /

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-node-${TARGETARCH} /bin/proxmox-csi-node

ENTRYPOINT ["/bin/proxmox-csi-node"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:84a21d3dfb87eb1c0bf1b532350f2aa0bf7d0df6246c398cc5c14b29002b7310 AS pvecsictl
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY --from=builder /src/bin/pvecsictl-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:84a21d3dfb87eb1c0bf1b532350f2aa0bf7d0df6246c398cc5c14b29002b7310 AS pvecsictl-goreleaser
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY pvecsictl-linux-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]
