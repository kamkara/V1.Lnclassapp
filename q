[33mcommit 5865d545258ef36a1462857f788318b36d4e3cf5[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m)[m
Author: kamkara <lnclass.kamara+ln@gmail.com>
Date:   Tue Dec 14 15:59:24 2021 +0000

    config/database: add localhost

[1mdiff --git a/config/database.yml b/config/database.yml[m
[1mindex e3f2419..e5ebf43 100755[m
[1m--- a/config/database.yml[m
[1m+++ b/config/database.yml[m
[36m@@ -92,7 +92,7 @@[m [mproduction:[m
   username: main[m
   password: main[m
   port: 5433[m
[31m-  host: postgresdatabase.internal[m
[32m+[m[32m  host: localhost[m
   pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>[m
 [m
 [m
