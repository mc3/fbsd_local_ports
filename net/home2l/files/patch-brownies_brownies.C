--- brownies/brownies.C.orig	2022-04-02 18:09:21 UTC
+++ brownies/brownies.C
@@ -29,7 +29,8 @@
 #include <stdarg.h>
 #include <sys/socket.h>   // for socket server ...
 #include <sys/un.h>
-#include <linux/i2c-dev.h>
+#include "i2c-dev.h"
+//#include <dev/iicbus/iic.h>
 
 
 
@@ -1060,14 +1061,9 @@ static int SocketServerAccept (int listenFd, const cha
   }
 
   // On success: Try to get peer credentials and log connection ...
-  if (clientFd >= 0 && name) {
-    len = sizeof (struct ucred);
-    if (getsockopt (clientFd, SOL_SOCKET, SO_PEERCRED, &ucred, &len) != 0)
-      INFOF (("%s: Connection established from unkown client (failed to get peer credentials)", name));
-    else
-      INFOF (("%s: Connection established from (PID=%i, UID=%i, GID=%i)", name, ucred.pid, ucred.uid, ucred.gid));
-  }
-
+  if (clientFd >= 0 && name)
+    INFOF (("%s: Connection established from unkown client (failed to get peer credentials)", name));
+    
   // Done ...
   return clientFd;
 }
