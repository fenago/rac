

Dnsmasq : For Simple DNS Configurations
=======================================

Dnsmasq is a simple way to set up a DNS server for a small network,
rather than going to the trouble of configuring BIND.

- Installation
- Firewall
- Configuration

Related articles.

- Linux DNS Configuration
- DNS Configuration for the SCAN used with Oracle RAC Database 11g Release 2
- Dnsmasq : For Simple DNS Configurations on Mac OS X

Installation
------------

The Dnsmasq service is installed from a Yum repository using the
following command.

    # yum install dnsmasq

Turn on the Dnsmasq server and make sure it starts automatically on
reboot.

    # service dnsmasq start
    # chkconfig dnsmasq on

Dnsmasq is configured by altering the contents of the
"/etc/dnsmasq.conf" file and the contents of the "/etc/hosts" file.

The service can be stopped, started and restarted using the following
commands.

    # service dnsmasq stop
    # service dnsmasq start
    # service dnsmasq restart

Firewall
--------

If you are using the Linux firewall, you need to open port 53
specifically.

For the iptables firewall, use the following commands.

    # iptables -I INPUT -p tcp --dport 53 -j ACCEPT
    # iptables -I INPUT -p udp --dport 53 -j ACCEPT
    # service iptables save

For the firewalld firewall, use the following commands to open the port
for the current runtime and permanently to persist through reboots.

    # firewall-cmd --zone=public --add-port=53/tcp
    # firewall-cmd --zone=public --add-port=53/udp

    # firewall-cmd --permanent --zone=public --add-port=53/tcp
    # firewall-cmd --permanent --zone=public --add-port=53/udp

Configuration
-------------

You don't need to do any specific DNS configuration as Dnsmasq will use
the contents of the "/etc/hosts" to resolve any name requests. Anything
it can't find there will be forwarded to the nameservers listed in the
"/etc/resolv.conf" file.

For example, adding the following entries to the "/etc/hosts" file on
the server running Dnsmasq, will allow it to act as a DNS, resolving
those names.

    # Oracle Linux 6 - RAC Installation
    192.168.0.111   ol6-112-rac1.localdomain            ol6-112-rac1
    192.168.0.112   ol6-112-rac2.localdomain            ol6-112-rac2
    192.168.1.111   ol6-112-rac1-priv.localdomain       ol6-112-rac1-priv
    192.168.1.112   ol6-112-rac2-priv.localdomain       ol6-112-rac2-priv
    192.168.0.113   ol6-112-rac1-vip.localdomain        ol6-112-rac1-vip
    192.168.0.114   ol6-112-rac2-vip.localdomain        ol6-112-rac2-vip
    192.168.0.115   ol6-112-scan.localdomain            ol6-112-scan
    192.168.0.116   ol6-112-scan.localdomain            ol6-112-scan
    192.168.0.117   ol6-112-scan.localdomain            ol6-112-scan

Any machines in the network that need to use this DNS server for name
resolution need their "/etc/resolv.conf" file amended so the
"nameserver" entry points at this server.

    search localdomain
    nameserver 192.168.0.4

Edit the "/etc/dnsmasq.conf" file to prevent local network queries being
forwarded. My internal domain is called "localdomain", so I add the
following setting, then restart Dnsmasq.

    local=/localdomain/

