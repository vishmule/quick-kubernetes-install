#!/bin/bash

## Disable Selinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

## Update IP table setting
## This ensures that packets are properly processed by IP tables during filtering and port forwarding.

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

## Disable Swap in order to work kubelet smoothly

sed -i '/swap/d' /etc/fstab
swapoff -a

## Add Kubernetes Repo

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

## Install kubeadm and docker

yum install kubeadm docker -y

## Start and enabled docker, kubelet service

systemctl restart docker && systemctl enable docker
systemctl  restart kubelet && systemctl enable kubelet
