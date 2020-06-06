#!/bin/bash
# Author : vishmule
# Install VirtualBox and Vagrant on Linux Host machine

## Install following pre-requisites required for VirtualBox Installation

yum install -y compat-libstdc++-33 SDL wget
yum install -y gcc kernel-devel make libGL qt qt-devel libXmu

## Download and Install VirtualBox

wget https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0-6.0.4_128413_el7-1.x86_64.rpm
rpm -ivh VirtualBox-6.0-6.0.4_128413_el7-1.x86_64.rpm

## Download and Install Vagrant

wget https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.rpm
rpm -ivh vagrant_2.2.4_x86_64.rpm
