Build dnsmasq-gui
-----------------

    git clone https://github.com/xieyunzi/docker-dnsmasq
    mkdir data && cp dnsmasq.conf.example data/dnsmasq.conf
    # mkdir data/dnsmasq.d && vim data/dnsmasq.d/dnsmasq.conf
    docker-compose up -d

Change dns setting for mac (DNS lookup on Mac OSX does not use /etc/resolv.conf)
--------------------------------------------------------------------------------

    sudo networksetup -listallnetworkservices
    sudo networksetup -setdnsservers <networkservice> 127.0.0.1 192.168.1.1 8.8.8.8

[Refer](http://serverfault.com/questions/478534/how-is-dns-lookup-configured-for-osx-mountain-lion)

Check it works
--------------

    nslookup domain.com (or use `dig`)

should got

    Server:         127.0.0.1
    Address:        127.0.0.1#53

    Name:   domain.com
    Address: 192.168.1.1

Clear system dns cache
----------------------

- mac: https://support.apple.com/en-us/HT202516

google search :P

Clear browser dns cache
-----------------------

As you probably know Google Chrome has its own internal DNS cache.
Need to both clear the host cache and flush the socket pools to get Chrome to refresh the DNS cache:

1. Navigate to **[chrome://net-internals/#dns][1]** and click **"Clear Host Cache"**
2. Navigate to **[chrome://net-internals/#sockets][2]** abd click **"Flush Socket Pools"**

also http://superuser.com/questions/723703/why-is-chromium-bypassing-etc-hosts-and-dnsmasq

### Chrome dns cache issues

[Built-in DNS uses the wrong DNS server](https://bugs.chromium.org/p/chromium/issues/detail?id=171346)
["Internal DNS client enabled" is a problem with VPN or local cache servers](https://bugs.chromium.org/p/chromium/issues/detail?id=472221)

so to fix this problem, i just remove '8.8.8.8' from my DNS list
