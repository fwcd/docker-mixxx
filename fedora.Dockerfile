FROM fedora:40

# Development setup
RUN dnf install -y \
      https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
      'dnf-command(config-manager)' \
      ccache \
      cmake \
      gcc-c++ \
      ninja-build

# Mixxx dependencies
RUN dnf builddep -y mixxx \
 && dnf install -y \
      qt6-qt{5compat,base,base-private,declarative,shadertools,svg}-devel \
      qtkeychain-qt6-devel

COPY mixxx /src/mixxx

WORKDIR /src/mixxx

RUN cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -B build \
 && cmake --build build
