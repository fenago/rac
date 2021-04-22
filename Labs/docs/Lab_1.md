<img align="right" src="./logo.png">


Oracle Clusterware Management (CRSCTL) 
=========================================

CRSCTL Utility is used to managed oracle clusterware resources and components. Make sure to run environment script `. grid_env` in the terminal first.


**1. STOP & START CRS: (run from root user)**


Note: You can skip the following start & stop commands if you already done it in the lab environment.


    $GRID_HOME/bin/crsctl stop crs

    $GRID_HOME/bin/crsctl start crs

### Protip: Use -wait flag to wait until startup is complete and get all progress.

**2. Enable/Disable auto restart of CRS.**

    $GRID_HOME/bin/crsctl disable crs

    $GRID_HOME/bin/crsctl enable crs

**3. Find the cluster name**

    $GRID_HOME/bin/cemutlo -n

    or 

    $GRID_HOME/bin/olsnodes -c

**4. Find grid version:**

SYNTAX -- \$GRID\_HOME/bin/crsctl query crs softwareversion

    $GRID_HOME/bin/crsctl query crs softwareversion ol7-122-rac1


<span style="color:red;">Task:</span>

	1) Find software version for Node "ol7-122-rac2" after updating above command.
	2) What will happen if no nodename is passed to above command?
	3) What will happen if invalid nodename is passed to above command?


**5. check cluster component status**

    $GRID_HOME/bin/crsctl stat res -t

    $GRID_HOME/bin/crsctl check crs

    $GRID_HOME/bin/crsctl check cssd

    $GRID_HOME/bin/crsctl check crsd

    $GRID_HOME/bin/crsctl check evmd


**6. Find voting disk location**

    $GRID_HOME/bin/crsctl query css votedisk

**7. Find OCR location:**

    $GRID_HOME/bin/ocrcheck

**8. Find cluster interconnect details**

	
As `oracle` user: 

		```
		. db_env
		sqlplus / as sysdba
		```

	
    select NAME,IP_ADDRESS from v$cluster_interconnects;

    NAME 			IP_ADDRESS
    --------------- ----------------
    enpso9:1 	192.254.78.247


**Note**

If you are running above query from Node 2. Make sure to first edit the "/home/oracle/db_env" file on the "ol7-122-rac2" node to 
use the correct the ORACLE_SID and ORACLE_HOSTNAME values.


```
export ORACLE_SID=cdbrac2
export ORACLE_HOSTNAME=ol7-122-rac2.localdomain
```


**9. Check CRS status of local node**

    crsctl check crs

    CRS-4638: Oracle High Availability Services is online
    CRS-4537: Cluster Ready Services is online
    CRS-4529: Cluster Synchronization Services is online
    CRS-4533: Event Manager is online

**10. Check status of all crs resourcs**

    $GRID_HOME/bin/crsctl stat res -t
    $GRID_HOME/bin/crsctl stat res -t -init

**10. Check active version of cluster**

    crsctl query crs activeversion
    Oracle Clusterware active version on the cluster is [12.1.0.2.0]

**11. Stop and start high availability service (HAS)**

    crsctl stop has

    crsctl start has

**12. Check CRS status of remote nodes**

    crsctl check cluster

    crsctl check cluster -all

**13. Disk timeout from node to voting disk(disktimeout)**

    crsctl get css disktimeout
    CRS-4678: Successful get disktimeout 200 for Cluster Synchronization Services.

**14. Network latency in the node interconnect(Misscount)**

    crsctl get css misscount
    CRS-4678: Successful get misscount 30 for Cluster Synchronization Services.


**15 . Get ocr disk backup details**

     ocrconfig -showbackup

**16 . Check whether standard or flex ASM**

    crsctl get cluster mode status

    Cluster is running in "flex" mode

**17 . Check CRS configuation**

    crsctl config crs 

**18. crsctl has commands for standalone grid infrastrcuture**

    crsctl check has
    crsctl config has
    crsctl disable has
    crsctl enable has
    crsctl query has releaseversion
    crsctl query has softwareversion
    crsctl start has
    crsctl stop has


<span style="color:red;">Task Solution</span>

	1) crsctl query crs softwareversion ol7-122-rac2
	3) Current node version
	3) Error expected


   