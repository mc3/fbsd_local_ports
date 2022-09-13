--- common/base.C.orig	2022-08-31 21:42:24 UTC
+++ common/base.C
@@ -2865,12 +2865,12 @@ bool CShellBare::Start (const char *cmd, bool readStdE
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
