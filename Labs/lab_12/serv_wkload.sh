/u01/app/oracle/product/12.1.0/dbhome_1/bin/sqlplus -s /NOLOG <<EOF
 connect jmw/jmw@prod1
 DECLARE
  t number;
 BEGIN
  for i in 1..10000 loop
   select count(*) into t from dba_objects;
  end loop;
 END;
 /
EOF
