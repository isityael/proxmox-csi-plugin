# syntax = docker/dockerfile:1.27@sha256:4edf897a3ffa55b89f906fc8cc78afdb3f1834cc9c7083565e611a8a7d5fe99e
########################################

FROM dhi.io/golang:1.27.1-debian13-dev@sha256:74de22d4df55d889f4a4217a582149afe5ac26a2f2b01c97f1b322fe2079b005 AS develop

WORKDIR /src
COPY ["go.mod", "go.sum", "/src/"]
RUN go mod download && go mod verify

########################################

FROM --platform=${BUILDPLATFORM} dhi.io/golang:1.27.1-alpine3.23-dev@sha256:8cb55f3251ea01b829c84cdf6dff4ceec6d17395f95bf7901b4992d2b25f4fdb AS builder
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

FROM --platform=${TARGETARCH} dhi.io/debian-base:trixie-dev@sha256:61dc022a1908439c478ed4b00e883fe8a7a03540fac23a8aed61352e28e6ae07 AS tools

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

FROM --platform=${TARGETARCH} gcr.io/distroless/base-debian13@sha256:389cad21f73e4c37b94ffe5b13736d5a92bd5bd3c6c6b38c2be1c881e14ba2bd AS tools-check

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

COPY --from=gcr.io/distroless/base-debian13@sha256:389cad21f73e4c37b94ffe5b13736d5a92bd5bd3c6c6b38c2be1c881e14ba2bd . .
COPY --from=tools /dest/ /

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-node-${TARGETARCH} /bin/proxmox-csi-node

ENTRYPOINT ["/bin/proxmox-csi-node"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:a741d4f1ccaf31f9394a36477e50df4620a8030dbff3d9a2ea8e84672b683ada AS pvecsictl
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY --from=builder /src/bin/pvecsictl-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:a741d4f1ccaf31f9394a36477e50df4620a8030dbff3d9a2ea8e84672b683ada AS pvecsictl-goreleaser
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY pvecsictl-linux-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]
