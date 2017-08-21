#!/bin/bash

cd /root/china_ip_list/ACL/

CurrentDate=`date +%Y-%m-%d`
echo -n "# Last update: " > china_ip_for_acl_rules.txt
echo $CurrentDate >> china_ip_for_acl_rules.txt
echo -e "[proxy_all]\n" >> china_ip_for_acl_rules.txt
echo "[bypass_list]" >> china_ip_for_acl_rules.txt
echo "# 局域网 IP" >> china_ip_for_acl_rules.txt
echo "^(.*\.)?local$" >> china_ip_for_acl_rules.txt
echo "^(.*\.)?localhost$" >> china_ip_for_acl_rules.txt
echo "0.0.0.0/8" >> china_ip_for_acl_rules.txt
echo "10.0.0.0/8" >> china_ip_for_acl_rules.txt
echo "100.64.0.0/10" >> china_ip_for_acl_rules.txt
echo "127.0.0.0/8" >> china_ip_for_acl_rules.txt
echo "169.254.0.0/16" >> china_ip_for_acl_rules.txt
echo "172.16.0.0/12" >> china_ip_for_acl_rules.txt
echo "192.0.0.0/24" >> china_ip_for_acl_rules.txt
echo "192.0.2.0/24" >> china_ip_for_acl_rules.txt
echo "192.88.99.0/24" >> china_ip_for_acl_rules.txt
echo "192.168.0.0/16" >> china_ip_for_acl_rules.txt
echo "198.18.0.0/15" >> china_ip_for_acl_rules.txt
echo "198.51.100.0/24" >> china_ip_for_acl_rules.txt
echo "203.0.113.0/24" >> china_ip_for_acl_rules.txt
echo "224.0.0.0/4" >> china_ip_for_acl_rules.txt
echo "240.0.0.0/4" >> china_ip_for_acl_rules.txt
echo "" >> china_ip_for_acl_rules.txt
echo "# China IP" >> china_ip_for_acl_rules.txt
cat /root/china_ip_list/china_ip_list >> china_ip_for_acl_rules.txt

mv china_ip_for_acl_rules.txt china_ip_list.acl

/root/china_ip_list/Script/ssr.sh
