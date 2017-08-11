#!/bin/bash

cd /root/china_ip_list
cd Pcap_DNSProxy

CurrentDate=`date +%Y-%m-%d`
echo -e "[Local Routing]\n## China mainland routing blocks\n## Sources: https://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest" > Pcap_DNSProxy_Routing.txt
echo -n "## Last update: " >> Pcap_DNSProxy_Routing.txt
echo $CurrentDate >> Pcap_DNSProxy_Routing.txt
echo -e "\n" >> Pcap_DNSProxy_Routing.txt

# IPv4
echo "## IPv4" >> Pcap_DNSProxy_Routing.txt
cat china_ip_list Pcap_DNSProxy_Routing.txt >> Pcap_DNSProxy_Routing.txt
echo "\n" >> Pcap_DNSProxy_Routing.txt

# IPv6
echo "## IPv6" >> Pcap_DNSProxy_Routing.txt
cat apnic | grep ipv6 | grep CN | awk -F\| '{printf("%s/%d\n", $4, $5)}' >> Pcap_DNSProxy_Routing.txt

# 清理
rm -rf apnic ipip temp_apnic_china_ip temp_china_ip_list temp_2_china_ip_list

mv Pcap_DNSProxy_Routing.txt Routing.txt

/root/china_ip_list/Script/china_ip_for_surge_rules.sh
