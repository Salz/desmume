#!/bin/sh

autoreconf --install --force --verbose

# local configuration
# depends: libagg-dev, liblua5.1-dev
./configure --prefix=/home/ingo/stow/desmume.git --enable-gdb-stub --enable-osmesa --enable-glade --enable-wifi --enable-glx --enable-hud --enable-maintainer-mode
