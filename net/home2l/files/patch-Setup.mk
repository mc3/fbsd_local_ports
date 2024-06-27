--- Setup.mk.orig	2024-06-01 09:46:41 UTC
+++ Setup.mk
@@ -1,3 +1,4 @@
+
 # This file is part of the Home2L project.
 #
 # (C) 2015-2024 Gundolf Kiefer
@@ -27,15 +28,17 @@
 
 
 # Build directory...
-HOME2L_BUILD ?= /tmp/home2l-build
+##HOME2L_BUILD ?= /tmp/home2l-build
+## FreeBSD
+HOME2L_BUILD := $(HOME2L_FREEBSD_BUILD)
 
 
 # Installation directory ...
-HOME2L_INSTALL ?= /opt/home2l
+HOME2L_INSTALL := $(STAGE_INSTALL)
 
 
 # Host and target architecture...
-HOST_ARCH := $(shell dpkg --print-architecture)
+HOST_ARCH := $(shell uname -p)
 ARCH ?= $(HOST_ARCH)
 
 
@@ -49,9 +52,9 @@ DEBUG ?= 1
 DEBUG ?= 1
 
 
+WITH_USR_LOCAL ?= 0
+LOCALBASE ?= ''     # must be set if WITH_USR_LOCAL is set
 
-
-
 ######################### Build environment configuration ######################
 
 
@@ -68,11 +71,13 @@ DEBUG ?= 1
 #   The Makefiles are tested with 'bash' as the standard shell.
 #   'dash' (the Debian default) does not work, since its integrated 'echo'
 #   command does not support the '-e' option.
-SHELL := /bin/bash
+SHELL := /usr/local/bin/bash
+MAKE := /usr/local/bin/gmake
+PYTHON := /usr/local/bin/python3
 
 
 # Python (used in 'resources') ...
-PYTHON_INCLUDE := /usr/include/python3.11
+PYTHON_INCLUDE := /usr/local/include/python3.11
 
 
 # C/C++ Compiler & strip option for 'install'...
@@ -87,7 +92,7 @@ ifeq ($(ARCH),$(HOST_ARCH))
 # 'STRIP' is the option passed to 'install(1)' to strip binaries during installation.
 #
 ifeq ($(ARCH),$(HOST_ARCH))
-  CC := g++ -no-pie
+  CC := c++ -no-pie -lexecinfo
   STRIP := -s
 else
   ifeq ($(ARCH),amd64)
@@ -96,7 +101,7 @@ else
     #       conflicts with the 'armhf' cross-building tools (see below).
     #       The workaround is to install 'g++-12-multilib' instead.
     ifeq ($(HOST_ARCH),i386)
-      CC := g++ -m64 -no-pie
+      CC := c++ -m64 -no-pie
       STRIP := -s
     endif
   endif
@@ -104,7 +109,7 @@ else
     # Note: Cross-building for 'i386' on 'amd64' works after installing
     #       'g++-*-multilib' (see comments above).
     ifeq ($(HOST_ARCH),amd64)
-      CC := g++ -m32 -no-pie
+      CC := c++ -m32 -no-pie
       STRIP := -s
     endif
   endif
@@ -114,8 +119,8 @@ else
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
@@ -168,8 +173,12 @@ SRC :=
   #  -DBUILD_OS=\"Debian\" -DBUILD_ARCH=\"$(ARCH)\"
 LDFLAGS := -pthread
 SRC :=
+ifeq ($(WITH_USR_LOCAL),1)
+CFLAGS += -I$(LOCALBASE)/include
+LDFLAGS += -L$(LOCALBASE)/lib
+endif
+ 
 
-
 # Release settings modifications ...
 ifeq ($(DEBUG),0)       # Optimize for speed, but do not sacrifice code size too much
 CFLAGS += -O2
@@ -201,6 +210,7 @@ CFLAGS := $(filter-out -O%,$(CFLAGS))
 #   To be tested again after the next Debian/GCC release.
 ifeq ($(ARCH),armhf)
 CFLAGS := $(filter-out -O%,$(CFLAGS))
+CFLAGS := $(filter-out -pthread,$(CFLAGS))
 endif
 
 
@@ -213,7 +223,7 @@ ifeq ($(BUILD_VERSION),)
 
 # Version ...
 ifeq ($(BUILD_VERSION),)
-BUILD_VERSION := $(shell git describe --tags --long --dirty='*' --abbrev=4 --always 2>/dev/null || echo dev)
+##BUILD_VERSION := $(shell git describe --tags --long --dirty='*' --abbrev=4 --always 2>/dev/null || echo dev)
 endif
 BUILD_DATE := $(shell date +%Y-%m-%d)
 
