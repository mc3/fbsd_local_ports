--- external/sdl2/Debian.mk.orig	2022-05-11 21:30:07 UTC
+++ external/sdl2/Debian.mk
@@ -25,6 +25,6 @@ ifneq (,$(wildcard $(MYDIR)usr/$(ARCH)/include))
   LDFLAGS += -L$(MYDIR)usr/$(ARCH)/lib -lSDL2 -lSDL2_ttf -ldl -lX11 -lfreetype -lpng -lz -lbz2 -lsndio
 else
   # Use the Debian packages, not these sources...
-  CFLAGS += -I/usr/include/SDL2
+  CFLAGS += -I$(LOCALBASE)/include/SDL2
   LDFLAGS += -lSDL2 -lSDL2_ttf
 endif
