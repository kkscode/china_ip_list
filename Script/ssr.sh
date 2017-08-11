#!/bin/bash

cd /root/china_ip_list/Script/

python ssr_chn_ip.py

cd /root/china_ip_list/

# 提交
CurrentDate=`date +%Y-%m-%d-%H-%M-%S`
git add .
git commit -m $CurrentDate
git push
