FROM fedora:43@sha256:6cd815d862109208adf6040ea13391fe6aeb87a9dc80735c2ab07083fdf5e03a
RUN set -euo pipefail; \
    dnf install -y --no-docs --setopt=install_weak_deps=False clang clang-tools-extra llvm wget git && \
    dnf clean all && rm -rf /var/cache/dnf
ARG GO_VERSION=1.26.2
RUN set -euo pipefail; \
    wget -qO- https://go.dev/dl/go$GO_VERSION.linux-$(uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/').tar.gz | tar -xz -C /usr/local
ENV PATH="${PATH}:/usr/local/go/bin"
