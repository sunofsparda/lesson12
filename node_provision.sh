#!/bin/bash

yum install -y epel-release
yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet
sudo puppet resource package puppet ensure=latest