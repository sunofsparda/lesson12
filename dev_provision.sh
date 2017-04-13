#!/bin/bash

grep -q -F '192.168.100.102 puppet-node1' /etc/hosts || echo '192.168.100.102 puppet-node1' >> /etc/hosts

yum install -y epel-release

yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppetserver

# PATH=/opt/puppetlabs/bin:$PATH;export PATH
# puppet resource package puppet-server ensure=latest

cp /vagrant/puppet/site.pp /etc/puppetlabs/code/environments/production/manifests
cp /vagrant/puppet/autosign.conf /etc/puppetlabs/puppet/

systemctl enable puppetserver
systemctl start puppetserver

PATH=/opt/puppetlabs/bin:$PATH;export PATH
puppet module install puppetlabs-mysql --version 3.10.0
