--- virtualenvwrapper.sh.orig	2022-06-03 20:14:24 UTC
+++ virtualenvwrapper.sh
@@ -579,7 +579,7 @@ function virtualenvwrapper_show_workon_options {
         | command \tr "\n" " " \
         | command \sed "s|/$VIRTUALENVWRAPPER_ENV_BIN_DIR/activate |/|g" \
         | command \tr "/" "\n" \
-        | command \sed "/^\s*$/d" \
+        | command \sed "/^[[:space:]]*$/d" \
         | (unset GREP_OPTIONS; command \egrep -v '^\*$') 2>/dev/null
 }
 
