#!/bin/bash
# if [[ $1 == 'metallb' ]]; then
#     kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
#     kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
#     # On first install only
#     kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# fi

# Create images from Dockerfile
arr=(nginx mysql wordpress)
for i in "${arr[@]}"; do
    docker build -t $i ./srcs/$i
done

# Create secret for mysql
kubectl apply -f ./srcs/secret.yaml
# Create volumes
kubectl apply -f ./srcs/PersistentVolume.yaml
# Applying yaml files to deploy nignx mysql and wordpress
for j in "${arr[@]}"; do
    kubectl apply -f ./srcs/$j-deployment.yaml
done