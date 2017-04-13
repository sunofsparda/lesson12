#!/bin/bash

grep 192.168.100.102 /etc/hosts
[ $? -ne 0 ] && echo "192.168.100.102 puppet-node1" >> /etc/hosts

yum install -y epel-release

yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppetserver
puppet resource package puppet-server ensure=latest

systemctl enable puppetserver
systemctl start puppetserver

# puppet module install puppetlabs-mysql --version 3.10.0