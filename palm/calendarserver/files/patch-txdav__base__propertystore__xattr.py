--- txdav/base/propertystore/xattr.py.orig	2013-05-30 01:18:39 UTC
+++ txdav/base/propertystore/xattr.py
@@ -47,7 +47,7 @@
 # expose.  Its value is 93.
 #
 
-if sys.platform in ("darwin", "freebsd8", "freebsd9"):
+if sys.platform[:6] == 'darwin' or sys.platform[:7] == 'freebsd':
     _ERRNO_NO_ATTR = getattr(errno, "ENOATTR", 93)
 else:
     _ERRNO_NO_ATTR = errno.ENODATA
