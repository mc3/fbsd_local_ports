--- resources/Resources.mk.orig	2022-04-20 16:55:50 UTC
+++ resources/Resources.mk
@@ -19,7 +19,7 @@
 #~ MYDIR := $(dir $(lastword $(MAKEFILE_LIST)))
 MYDIR := $(HOME2L_SRC)/resources
 
-CFLAGS_RC := -I$(MYDIR)
+CFLAGS_RC := -I$(MYDIR) -I/usr/local/include
 LDFLAGS_RC := -ldl
 
 SRC_RC := $(MYDIR)/rc_core.C $(MYDIR)/rc_drivers.C $(MYDIR)/resources.C
