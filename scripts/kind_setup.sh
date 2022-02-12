#!/bin/sh

cluster_name="some-test-cluster"
cluster_results=$(kind get clusters)
cluster_exists_flag=0

echo "These are all available clusters:"
for r in $cluster_results
do
    if [[ "${r}" =~ "${cluster_name}" ]];
        then    echo "Existing cluster found: ${r}"
                cluster_exists_flag=1
    fi;
done

if [[ ${cluster_exists_flag} == 1  ]];
    then echo "Not creating Kind k8s cluster because the following cluster already exists: ${cluster_name}"
else
    echo "Creating cluster ${cluster_name}..."
    kind create cluster --name ${cluster_name}
fi;


#kind create cluster --name lets-try-materialize