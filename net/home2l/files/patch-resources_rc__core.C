--- resources/rc_core.C.orig	2021-12-10 19:40:51 UTC
+++ resources/rc_core.C
@@ -31,6 +31,7 @@
 #include <arpa/inet.h>    // inet_pton()
 #include <fnmatch.h>      // wildcard matching
 
+#include <netinet/in.h>   //[ajr] INADDR_ANY, INADDR_LOOPBACK
 
 /*
  * Rules for locking and deadlock prevention
