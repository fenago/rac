

Clean Up a Failed Grid Infrastruture Installation
=================================================

This article describes how to clean up a failed Grid Infrastructure
installation. It specifically focuses on what to do if the "root.sh"
script fails during this process and you want to rewind and start again.

- Grid Infrastructure
- ASM Disks


Grid Infrastructure
-------------------

On all cluster nodes except the last, run the following command as the
"root" user.

    # perl $GRID_HOME/crs/install/rootcrs.pl -verbose -deconfig -force

On the last cluster node, run the following command as the "root" user.

    # perl $GRID_HOME/crs/install/rootcrs.pl -verbose -deconfig -force -lastnode

This final command will blank the OCR configuration and voting disk.

You should be in a position to rerun the "root.sh" file now, but if you
are using ASM, you will need to prepare your ASM disks before doing so.

ASM Disks
---------

Once you attempt an installation, your ASM disks are marked as being
used, so they can no longer be used as candidate disks. To revert them
to candidate disk do the following.

Overwrite the header for the relevant partitions using the "dd" command.

    # dd if=/dev/zero of=/dev/sdb1 bs=1024 count=100

Remove and create the ASM disk for each partition.

    # /etc/init.d/oracleasm deletedisk DATA /dev/sdb1
    # /etc/init.d/oracleasm createdisk DATA /dev/sdb1

The disks will now be available as candidate disks.
