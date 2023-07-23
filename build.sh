#!/bin/sh

set -x
set -e

threads=$(($(nproc)+1))

git clean -f -dx
cd desmume/src/frontend/posix
CFLAGS="-Ofast -march=native -DNDEBUG" CXXFLAGS="-Ofast -march=native -DNDEBUG" meson setup -Dwifi=true --prefix=/home/ingo/stow/desmume.git --buildtype=release build
ninja -C build -v -j$threads
ninja -C build install -v -j$threads
