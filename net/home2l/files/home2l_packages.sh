#!/bin/sh

echo "In home2l_packages"
pkg install -y -r FreeBSD devel/git net/mosquitto shells/bash \
        avr-binutils devel/avr-libc avr-gcc devel/avrdude devel/cmake \
        graphics/inkscape graphics/GraphicsMagick graphics/ImageMagick7 graphics/sdl2_ttf \
        devel/sdl20 devel/readline devel/swig \
        lang/python39 lang/python3
