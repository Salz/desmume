#!/bin/sh

set -x
set -e

threads="$(($(nproc)+1))"
version="$(date +%Y%m%d)-$(git rev-parse --short HEAD)"

git clean -f -dx
cd desmume/src/frontend/posix
CFLAGS="-Ofast -march=native -DNDEBUG" CXXFLAGS="-Ofast -march=native -DNDEBUG" meson setup -Dopengl=true -Dwifi=true --prefix="/home/ingo/stow/desmume-${version}" --buildtype=release build
ninja -C build -v -j${threads}
ninja -C build install -v -j${threads}
