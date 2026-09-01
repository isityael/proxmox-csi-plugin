# syntax = docker/dockerfile:1.26@sha256:ecfaec9ed6d810b56388c508f4121597bfbba70d41a6dfeee4d8cad5f295fc32
########################################

FROM --platform=${BUILDPLATFORM} dhi.io/golang:1.27.0-alpine3.23-dev@sha256:517245c50e9fbacc29da5fe29ceea42b03e4883395b8de3828ab7acda3ca4ab8 AS builder
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

FROM --platform=${TARGETARCH} dhi.io/debian-base:trixie-dev@sha256:54864b2674f31675617756cbb5341a4262d21e9bb322cf61ddf974c718daaf9d AS tools

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

FROM --platform=${TARGETARCH} gcr.io/distroless/base-debian13@sha256:9ef50bca108839d5986e4d84b7f7b2d79024c9293b7c35b162c6c55485bd5868 AS tools-check

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

COPY --from=gcr.io/distroless/base-debian13@sha256:9ef50bca108839d5986e4d84b7f7b2d79024c9293b7c35b162c6c55485bd5868 . .
COPY --from=tools /dest/ /

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-node-${TARGETARCH} /bin/proxmox-csi-node

ENTRYPOINT ["/bin/proxmox-csi-node"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:c83afceb9027a70719ea5ed916754a94ecdbe33a64cb8bcbb4da9fbffaefe7b0 AS pvecsictl
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY --from=builder /src/bin/pvecsictl-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:c83afceb9027a70719ea5ed916754a94ecdbe33a64cb8bcbb4da9fbffaefe7b0 AS pvecsictl-goreleaser
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY pvecsictl-linux-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]
