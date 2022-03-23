--- tools/env.sh.orig	2022-03-23 20:32:07 UTC
+++ tools/env.sh
@@ -7,7 +7,7 @@
 export HOME2L_ROOT=`realpath \`dirname $BASH_SOURCE\``
 
 # Architecture (for arch-dependent paths)...
-export HOME2L_ARCH=`dpkg --print-architecture`
+export HOME2L_ARCH=$(shell uname -p)
 
 # HOME2L_ETC (if not preset) ...
 [[ "$HOME2L_ETC" != "" ]] || export HOME2L_ETC=$HOME2L_ROOT/etc
