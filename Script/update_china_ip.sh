#!/bin/bash

date "+%Y-%m-%d %H:%M:%S"

cd /root/china_ip_list

wget -O apnic https://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest
wget -O ipip https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt

# APNIC
cat apnic | grep ipv4 | grep CN | awk -F\| '{printf("%s/%d\n", $4, 32-log($5)/log(2))}' >> temp_apnic_china_ip
echo -e "\n" >> temp_apnic_china_ip

# IPIP
echo -e "\n" >> ipip

# 合并 & 去重
cat temp_apnic_china_ip ipip  | sort | uniq > temp_china_ip_list

# 去空行
grep -v '^$' temp_china_ip_list > temp_2_china_ip_list

# 排序
sort  -t "." -k1n,1 -k2n,2 -k3n,3 -k4n,4 temp_2_china_ip_list > china_ip_list

/root/china_ip_list/Script/pcap_dnsproxy_routing.sh
