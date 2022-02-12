#!/bin/sh

install_kind () {
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    mv ./kind /some-dir-in-your-PATH/kind
    if kind --version;
        then echo "Kind k8s install succeeded"
    else 
        echo "Kind k8s install failed"
    fi;
}


if kind --version;
    then echo "Kind is already installed.";
else echo "Can't find Kind k8s so installing Kind k8s on your machine now"
    install_kind
fi;