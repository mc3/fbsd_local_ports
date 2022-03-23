--- Setup.mk.orig	2021-12-10 19:40:51 UTC
+++ Setup.mk
@@ -31,11 +31,11 @@ HOME2L_BUILD ?= /tmp/home2l-build
 
 
 # Installation directory ...
-HOME2L_INSTALL ?= /opt/home2l
+HOME2L_INSTALL = /usr/local/home2l
 
 
 # Host and target architecture...
-HOST_ARCH := $(shell dpkg --print-architecture)
+HOST_ARCH := $(shell uname -p)
 ARCH ?= $(HOST_ARCH)
 
 
@@ -68,11 +68,12 @@ DEBUG ?= 1
 #   The Makefiles are tested with 'bash' as the standard shell.
 #   'dash' (the Debian default) does not work, since its integrated 'echo'
 #   command does not support the '-e' option.
-SHELL := /bin/bash
+SHELL := /usr/local/bin/bash
+MAKE := /usr/local/bin/gmake
+PYTHON := /usr/local/bin/python3
 
-
 # Python (used in 'resources') ...
-PYTHON_INCLUDE := /usr/include/python3.9
+PYTHON_INCLUDE := /usr/local/include/python3.9
 
 
 # C/C++ Compiler & strip option for 'install'...
@@ -87,7 +88,7 @@ PYTHON_INCLUDE := /usr/include/python3.9
 # 'STRIP' is the option passed to 'install(1)' to strip binaries during installation.
 #
 ifeq ($(ARCH),$(HOST_ARCH))
-  CC := g++ -no-pie
+  CC := g++ -no-pie -lexecinfo
   STRIP := -s
 else
   ifeq ($(ARCH),amd64)
@@ -121,8 +122,8 @@ else
     #       'deb http://emdebian.org/tools/debian/ jessie main'.
     # Note [2017-07-22]: The option '-static-libstdc++' is added for armhf to create
     #       binaries with the chance to run under both Debian Jessie and Debian Stretch.
-    CC := arm-linux-gnueabihf-g++ -no-pie -static-libstdc++
-    STRIP := -s --strip-program=arm-linux-gnueabihf-strip
+    CC := arm-none-eabi-g++ -no-pie -static-libstdc++
+    STRIP := -s --strip-program=arm-none-eabi-strip
   endif
 endif
 ifndef CC
@@ -208,6 +209,7 @@ endif
 #   To be tested again after the next Debian/GCC release.
 ifeq ($(ARCH),armhf)
 CFLAGS := $(filter-out -O%,$(CFLAGS))
+CFLAGS := $(filter-out -pthread,$(CFLAGS))
 endif
 
 
