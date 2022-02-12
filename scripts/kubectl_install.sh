#!/bin/sh
install_kubectl () {
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    if kubectl --version;
        then echo "Kubectl install succeeded"
    else 
        echo "Kubectl install failed"
    fi;
}

echo "Checking for kubectl installation..."
if kubectl version;
    then echo "Kubectl is already installed.";
else echo "Can't find Kubectl so installing Kubect on your machine now"
    install_kubectl
fi;