--- txdav/common/datastore/sql_schema/current.sql.orig	2015-08-07 20:12:19 UTC
+++ txdav/common/datastore/sql_schema/current.sql
@@ -81,7 +81,7 @@ insert into HOME_STATUS values (4, 'disa
 --------------
 
 create table CALENDAR (
-  RESOURCE_ID integer   primary key default nextval('RESOURCE_ID_SEQ') -- implicit index
+  RESOURCE_ID integer   primary key default nextval('RESOURCE_ID_SEQ')
 );
 
 
