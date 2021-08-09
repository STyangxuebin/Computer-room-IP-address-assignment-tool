#!/bin/bash

# 手动输入 IP个数，分配IP个数

# 从Nuse中删除，写入Use中


Nuse=/root/xuebin/Nuse
Use=/root/xuebin/Use


echo "请选择机房: 
	(1) B2 正式项目机房
	(2) B2 POC项目机房
"
read comRoom

case $comRoom 
  in 
  1)  echo "B2 正式项目机房 150/170"
      echo "请选择IP网段:
	(1) 10.10.150.xxx
	(2) 10.10.170.xxx
	"
      read IPchoice
      case $IPchoice
	in
	1) echo "请输入IP个数:"
           read numIP1
           sed -n "1,$numIP1"p $Nuse/150_Nuse 
           sed -n "1,$numIP1"p $Nuse/150_Nuse >> $Use/150_use
	# 删除已经使用的IP地址
	   numIP1=$((numIP1+1))
 	   sed -n "$numIP1,1000"p $Nuse/150_Nuse > $Nuse/150_Nuse_bak
           mv $Nuse/150_Nuse_bak $Nuse/150_Nuse
	;;
	2) echo "请输入IP个数:"
	   read numIP2
	   sed -n "1,$numIP2"p $Nuse/170_Nuse
	   sed -n "1,$numIP2"p $Nuse/170_Nuse >> $Use/170_use
        # 删除已经使用的IP地址
	   numIP2=$((numIP2+1))
           sed -n "$numIP2,1000"p $Nuse/170_Nuse > $Nuse/170_Nuse_bak
           mv $Nuse/170_Nuse_bak $Nuse/170_Nuse

	;;
      esac
  ;;
  2)  echo "B2 POC项目机房 180"
      echo "请输入IP个数:"
      read numIP3
      sed -n "1,$numIP3"p $Nuse/180_Nuse 
      sed -n "1,$numIP3"p $Nuse/180_Nuse >> $Use/180_use 
        # 删除已经使用的IP地址
	   numIP3=$((numIP3+1))
           sed -n "$numIP3,1000"p $Nuse/180_Nuse > $Nuse/180_Nuse_bak
           mv $Nuse/180_Nuse_bak $Nuse/180_Nuse
  ;;
esac

