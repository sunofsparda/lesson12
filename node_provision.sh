#!/bin/bash

grep 192.168.100.101 /etc/hosts
[ $? -ne 0 ] && echo "192.168.100.101 puppet-server" >> /etc/hosts

yum install -y epel-release

yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent
puppet resource package puppet ensure=latest