#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    sudo $(realpath "$0")
    exit
fi


yum install bind bind-utils -y

cat >> /etc/named/named.common.zones <<EOL
zone "abc.com"{
        type slave;
        file "abc.com";
        masterfile-format text;
        masters { 192.168.56.16; };
};

EOL
echo 'include "/etc/named/named.common.zones";' >> /etc/named.conf
sed -i 's#listen-on port 53 { 127.0.0.1; };#listen-on port 53 { any; };#g' /etc/named.conf

sed -i 's#allow-query     { localhost; };#allow-query     { localhost; 10.0.0.0/10; 192.168.0.0/16; };\n\tforwarders     { 10.60.0.2; };#g' /etc/named.conf


systemctl enable named
systemctl start named

