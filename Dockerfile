# syntax = docker/dockerfile:1.25@sha256:0adf442eae370b6087e08edc7c50b552d80ddf261576f4ebd6421006b2461f12
########################################

FROM dhi.io/golang:1.26.5-debian13-dev@sha256:c1e3b4609107fb36e6b5edfc02f70fa39c161a81d88287ebde57dd0a803b2c06 AS develop

WORKDIR /src
COPY ["go.mod", "go.sum", "/src/"]
RUN go mod download

########################################

FROM --platform=${BUILDPLATFORM} dhi.io/golang:1.26.4-alpine3.23-dev@sha256:a34c915874fb9e84b247465f6f7ea5d24277f9766bf81aa36bbc6b57691e315e AS builder
RUN apk update && apk add --no-cache make git
ENV GO111MODULE=on
WORKDIR /src

COPY ["go.mod", "go.sum", "/src/"]
RUN go mod download && go mod verify

COPY . .
ARG TAG
ARG SHA
ENV TAG=${TAG} SHA=${SHA}
RUN make build-all-archs

########################################

FROM --platform=${TARGETARCH} scratch AS proxmox-csi-controller
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI plugin"

COPY --from=gcr.io/distroless/static-debian13:nonroot@sha256:963fa6c544fe5ce420f1f54fb88b6fb01479f054c8056d0f74cc2c6000df5240 . .
ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-controller-${TARGETARCH} /bin/proxmox-csi-controller

ENTRYPOINT ["/bin/proxmox-csi-controller"]

########################################

FROM --platform=${TARGETARCH} dhi.io/debian-base:trixie-dev@sha256:ce12bf580bb4c3986b7c934db5948353646371326c038a506dbe19545a1e0ee7 AS tools

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

FROM --platform=${TARGETARCH} gcr.io/distroless/base-debian13@sha256:57c1e4c72feb5925c4763ae4f6bd2013ad3854f57eff5b60dd9acb1ce0abc66e AS tools-check

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

COPY --from=gcr.io/distroless/base-debian13@sha256:57c1e4c72feb5925c4763ae4f6bd2013ad3854f57eff5b60dd9acb1ce0abc66e . .
COPY --from=tools /dest/ /

ARG TARGETARCH
COPY --from=builder /src/bin/proxmox-csi-node-${TARGETARCH} /bin/proxmox-csi-node

ENTRYPOINT ["/bin/proxmox-csi-node"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:037a503be3d6f50f01bde0ef366e9b9c84060a2db5781b076df40cdd706e5119 AS pvecsictl
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY --from=builder /src/bin/pvecsictl-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]

########################################

FROM dhi.io/alpine-base:3.24@sha256:037a503be3d6f50f01bde0ef366e9b9c84060a2db5781b076df40cdd706e5119 AS pvecsictl-goreleaser
ARG OCI_SOURCE=https://github.com/isityael/proxmox-csi-plugin
LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.description="Proxmox VE CSI tools"

ARG TARGETARCH
COPY pvecsictl-linux-${TARGETARCH} /usr/local/bin/pvecsictl

USER nonroot

ENTRYPOINT ["/usr/local/bin/pvecsictl"]
