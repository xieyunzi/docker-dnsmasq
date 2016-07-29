Build dnsmasq-gui
-----------------

    git clone https://github.com/jpillora/docker-dnsmasq
    cd docker-dnsmasq
    docker build -t dnsmasq-gui .

    mkdir -p ~/.config
    git clone https://github.com/xieyunzi/docker-dnsmasq ~/.config/dnsmasq
    cd ~/.config/dnsmasq && make

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
