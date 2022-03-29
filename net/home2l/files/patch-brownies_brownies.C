--- brownies/brownies.C.orig	2022-03-29 11:29:01 UTC
+++ brownies/brownies.C
@@ -29,8 +29,9 @@
 #include <stdarg.h>
 #include <sys/socket.h>   // for socket server ...
 #include <sys/un.h>
-#include <linux/i2c-dev.h>
-
+//#include <linux/i2c-dev.h>
+// Does not work:
+#include i2c-dev.h
 
 
 
