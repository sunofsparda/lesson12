#!/bin/bash

yum install -y epel-release
yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppetserver
puppet resource package puppet-server ensure=latest
systemctl enable puppetserver
systemctl start puppetserver

# puppet module install puppetlabs-mysql --version 3.10.0