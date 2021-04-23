export HOST=`hostname -s`
export ORACLE_HOME=/u01/app/oracle/product/12.1.0/dbhome_1
export ORACLE_SID=`$ORACLE_HOME/bin/srvctl status database -db orcl|grep $HOST|cut -f2 -d" "`
export PATH=$PATH:$ORACLE_HOME/bin


/u01/app/oracle/product/12.1.0/dbhome_1/bin/sqlplus -s /NOLOG <<EOF

 connect / as sysdba
 drop user jmw cascade;
 create user jmw identified by jmw default tablespace users temporary tablespace temp;
 grant connect, resource, dba to jmw;

EOF
