#! /bin/bash

function start_stop()
{

#Stop and disable firewall service
systemctl stop firewalld && systemctl disable firewalld

#Stop and disable NetworkManager service
systemctl stop NetworkManager.service && systemctl disable NetworkManager.service

#Start network service
systemctl start network
chkconfig network on
}

function install_packstack()
{

#Install openstack-train
yum install centos-release-openstack-train -y

#Update 
yum update -y

#Install packstack
yum install openstack-packstack -y

#start packstack service
packstack --allinone
}
