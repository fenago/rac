cat /path/to/file/prod1_tns.txt>>/u01/app/oracle/product/12.1.0/dbhome_1/network/admin/tnsnames.ora
ssh ol7-122-rac2 "cat /path/to/file/prod1_tns.txt>>/u01/app/oracle/product/12.1.0/dbhome_1/network/admin/tnsnames.ora"

echo "PROD1 tnsnames.ora entry completed for ol7-122-rac1"
echo "PROD1 tnsnames.ora entry completed for ol7-122-rac2"
