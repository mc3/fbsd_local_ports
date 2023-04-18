--- common/base.C.orig	2023-04-15 13:42:46 UTC
+++ common/base.C
@@ -2866,12 +2866,12 @@ bool CShellBare::Start (const char *cmd, bool readStdE
     }
 #else
     if (host.IsEmpty ())
-      execl ("/bin/bash", "/bin/bash",
+      execl ("/usr/local/bin/bash", "/usr/local/bin/bash",
              cmd ? "-c" : NULL, cmd, NULL);
     else
       execl ("/usr/bin/ssh", "/usr/bin/ssh",
              "-l", "home2l", host.Get (),       // remote user and host
-             cmd ? cmd : "/bin/bash", NULL);    // command or shell
+             cmd ? cmd : "/usr/local/bin/bash", NULL);    // command or shell
 #endif
     ERRORF (("Failed to start '%s': %$s", cmd, strerror (errno)));
       // we should never get here
