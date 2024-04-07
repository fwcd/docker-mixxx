FROM fedora:40

WORKDIR /src/mixxx

# Install dependencies
COPY mixxx/tools/rpm_buildenv.sh tools/rpm_buildenv.sh
RUN source tools/rpm_buildenv.sh setup

COPY mixxx .

RUN cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -B build \
 && cmake --build build
