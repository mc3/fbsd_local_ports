#!/bin/sh

echo "In home2l_packages"
# use devel/glib20 as workaround for ld-elf.so.1: /usr/local/bin/../lib/inkscape/
#   libinkscape_base.so: Undefined symbol "g_string_free_and_steal"
pkg install -y -r FreeBSD devel/git devel/glib20 net/mosquitto shells/bash \
        avr-binutils devel/avr-libc avr-gcc devel/avrdude devel/gettext-tools \
        devel/cmake devel/gmake \
        graphics/inkscape graphics/optipng graphics/GraphicsMagick \
        graphics/ImageMagick7 graphics/sdl2_ttf \
        devel/sdl20 devel/readline devel/swig \
        lang/python39 lang/python3
