#!/bin/bash


i=1
while [ "$i" -le 253  ]
do
pnet_150=$(ping -c 1 10.10.150.$i|grep packet|cut -d" " -f6|cut -d"%" -f1)
pnet_180=$(ping -c 1 10.10.180.$i|grep packet|cut -d"%" -f1|cut -d" " -f6)
pnet_170=$(ping -c 1 10.10.170.$i|grep packet|cut -d" " -f6|cut -d"%" -f1)
  if [ $pnet_150 -eq 0 ]
  then
    echo "10.10.150.$i" >> /root/xuebin/Use/150_use
    echo "10.10.150.$i true"
  else
    echo "10.10.150.$i" >> /root/xuebin/Nuse/150_Nuse
    echo "10.10.150.$i fail"
  fi
  if [ $pnet_180 -eq 0 ]
  then
    echo "10.10.180.$i" >> /root/xuebin/Use/180_use
    echo "10.10.180.$i true"
  else
    echo "10.10.180.$i" >> /root/xuebin/Nuse/180_Nuse
    echo "10.10.180.$i fail"
  fi
  if [ $pnet_170 -eq 0 ]
  then
    echo "10.10.170.$i" >> /root/xuebin/Use/170_use
    echo "10.10.170.$i true"
  else
    echo "10.10.170.$i" >> /root/xuebin/Nuse/170_Nuse
    echo "10.10.170.$i fail"
  fi
i=$((i+1))
done
