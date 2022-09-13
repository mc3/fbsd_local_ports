--- Setup.mk.orig	2022-08-31 21:42:24 UTC
+++ Setup.mk
@@ -27,15 +27,17 @@
 
 
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
 
 
@@ -49,9 +51,9 @@ ARCH ?= $(HOST_ARCH)
 DEBUG ?= 1
 
 
+WITH_USR_LOCAL ?= 0
+LOCALBASE ?= ''     # must be set if WITH_USR_LOCAL is set
 
-
-
 ######################### Build environment configuration ######################
 
 
@@ -68,11 +70,12 @@ DEBUG ?= 1
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
@@ -87,7 +90,7 @@ PYTHON_INCLUDE := /usr/include/python3.9
 # 'STRIP' is the option passed to 'install(1)' to strip binaries during installation.
 #
 ifeq ($(ARCH),$(HOST_ARCH))
-  CC := g++ -no-pie
+  CC := c++ -no-pie -lexecinfo
   STRIP := -s
 else
   ifeq ($(ARCH),amd64)
@@ -103,7 +106,7 @@ else
     #       'g++-8-multilib' has been installed manually. The same holds for
     #       compiling 'i386' binaries on an 'amd64' machine.
     ifeq ($(HOST_ARCH),i386)
-      CC := g++ -m64 -no-pie
+      CC := c++ -m64 -no-pie
       STRIP := -s
     endif
   endif
@@ -111,7 +114,7 @@ else
     # Note: Cross-building for 'i386' on 'amd64' works after installing
     #       'g++-10-multilib' (see comments above).
     ifeq ($(HOST_ARCH),amd64)
-      CC := g++ -m32 -no-pie
+      CC := c++ -m32 -no-pie
       STRIP := -s
     endif
   endif
@@ -121,8 +124,8 @@ else
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
@@ -175,8 +178,12 @@ CFLAGS := -MMD -g -Wall -pthread -I.
   #  -DBUILD_OS=\"Debian\" -DBUILD_ARCH=\"$(ARCH)\"
 LDFLAGS := -pthread
 SRC :=
+ifeq ($(WITH_USR_LOCAL),1)
+CFLAGS += -I$(LOCALBASE)/include
+LDLAGS += -L$(LOCALBASE)/lib
+endif
+ 
 
-
 # Release settings modifications ...
 ifeq ($(DEBUG),0)       # Optimize for speed, but do not sacrifice code size too much
 CFLAGS += -O2
@@ -208,6 +215,7 @@ endif
 #   To be tested again after the next Debian/GCC release.
 ifeq ($(ARCH),armhf)
 CFLAGS := $(filter-out -O%,$(CFLAGS))
+CFLAGS := $(filter-out -pthread,$(CFLAGS))
 endif
 
 
@@ -220,7 +228,7 @@ endif
 
 # Version ...
 ifeq ($(BUILD_VERSION),)
-BUILD_VERSION := $(shell git describe --tags --long --dirty='*' --abbrev=4 --always 2>/dev/null || echo dev)
+##BUILD_VERSION := $(shell git describe --tags --long --dirty='*' --abbrev=4 --always 2>/dev/null || echo dev)
 endif
 BUILD_DATE := $(shell date +%Y-%m-%d)
 
