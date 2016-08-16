--- setup.py.orig	2016-08-06 15:44:57.252178000 +0900
+++ setup.py	2016-08-06 15:45:18.138140000 +0900
@@ -429,9 +429,6 @@
         scripts=[
             "bin/caldavd",
         ],
-        data_files=[
-            ("caldavd", ["conf/caldavd.plist"]),
-        ],
         ext_modules=extensions,
         py_modules=[],
         setup_requires=setup_requirements,
