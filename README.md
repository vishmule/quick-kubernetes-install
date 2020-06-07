

# Quickly Setup Infrastructure VMs and Install Multi-node Kubernetes

1.	We will create Kubernetes infrastructure using VirtualBox and Vagrant.

2.	You can install it on Winodws or Linux host machine.

3. For Windows Host VM use vagrant-virtualbox-windows file

4. Vagrant-virtualbox-Windows file perform following taks.
    
    a. Install choco package manager on Windows.
    
    b. Install VirtualBox
    
    c. Install Vagrant
    
    d. Install VirtualBox guest plugin

4. For Linux host VM use vagrant-virtualbix-install.sh file.

3. Use vagrant-virtualbox-install.sh script to pefrom following tasks.

    a. Install pre-requisites before install of VirtualBox and Vagrant.
   
    b. Download and Install VirtualBox. 
   
    c. Download and Install Vagrant.
  
4. Create Vagrantfile to setup 1 Master node and 3 worker node.

    kubemaster - 192.168.56.2 (6G RAM & 4 vCPU)
    
    worker1    - 192.168.56.3 (2G RAM & 2 vCPU)
    
    worker2    - 192.168.56.4 (2G RAM & 2 cCPU)
    
    worker3    - 192.168.56.5 (2G RAM & 2 vCPU)

5. Create configure.sh file which will perform following required configuration before installing Kubernetes

    a. Disable SELINUX using sentenforce and udpate the config file
    
    b. Update IP table settting, This ensures the packets are properly processed by IP tables during filtering and port forwarding.
    
    c. Disable swap in order to work kubelet smoothly.
    
    d. Add Kubernetes repo
    
    e. Install Kubeadm and docker
    
    f. Enable and start kubelete and docker

    ./configure.sh
     
 6. Kubenetes Installation using kubeadm 
 
    kubeadm init --apiserver-advertise-address=192.168.56.2 --pod-network-cidr 10.32.0.0/12
    
 7. Copy kube configuration files.
 
     mkdir -p $HOME/.kube
     
     cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
     
     chown $(id -u):$(id -g) $HOME/.kube/config
     
 8. Add Bash completion to autocomplete kubenetes commands.
  
      echo 'source <(kubectl completion bash)' >>~/.bashrc 
      
      source .bashrc
      
 9. Install network plugin for Kubernetes. I am using weave-net here.
  
       kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
       
 10. Perform the step 5 on worker nodes and execute kubeadm join to join the kubernetes cluster.
  
      kubeadm join 192.168.56.2:6443 --token 84p35t.tawua5uqro1rwo0u \
    --discovery-token-ca-cert-hash sha256:d2bac1f7591663167b73ebc88ceb2d46b2b1f98a048fedec64899fdd90fa2ad9
  
      
