#!/bin/sh

install_helm () {
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    if helm version;
        then echo "Helm install succeeded"
    else 
        echo "Helm install failed"
    fi;
}

if helm version;
    then echo "Helm is already installed"
else
    install_helm
fi;
