--- tools/env.sh.orig	2022-04-27 10:27:57 UTC
+++ tools/env.sh
@@ -1,16 +1,18 @@
+#!/usr/local/bin/bash
+
 # This file is part of the Home2L project.
 #
 # (C) 2015-2021 Gundolf Kiefer
 
 
 # HOME2L_ROOT ...
-export HOME2L_ROOT=`realpath \`dirname $BASH_SOURCE\``
+export HOME2L_ROOT="/usr/local/home2l"
 
 # Architecture (for arch-dependent paths)...
-export HOME2L_ARCH=`dpkg --print-architecture`
+export HOME2L_ARCH=`uname -p`
 
 # HOME2L_ETC (if not preset) ...
-[[ "$HOME2L_ETC" != "" ]] || export HOME2L_ETC=$HOME2L_ROOT/etc
+export HOME2L_ETC=$HOME2L_ROOT/etc
 
 # Search and library paths...
 export PATH=$HOME2L_ETC:$HOME2L_ROOT/bin:$HOME2L_ROOT/bin/$HOME2L_ARCH:$PATH
