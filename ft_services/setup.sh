#!/bin/sh

[ "$1" = -u ] && update_only=yes

log () {
    printf "=============================================== "
    echo "$1"
}

if [ -z "$update_only" ]
then
    minikube start --driver=virtualbox
    minikube dashboard &

    eval $(minikube docker-env)

    log "SETTING UP metallb"
    minikube addons enable metallb
    # https://metallb.universe.tf/installation/#preparation
    kubectl get configmap kube-proxy -n kube-system -o yaml | \
        sed -e 's/strictARP: false/strictARP: true/' -e 's/mode: ""/mode: "ipvs"/' | \
        kubectl apply -f - -n kube-system
    # https://metallb.universe.tf/installation/#installation-by-manifest
    kubectl apply -f 'https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml'
    kubectl apply -f 'https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml'
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    # metallb config
    kubectl apply -f srcs/metallb-config.yaml
fi

build_image () {
    log "BUILDING $1"
    docker build -t "$1-service" "srcs/$1"
    echo
}

build_image ftps
build_image nginx
build_image wordpress
build_image phpmyadmin
build_image mysql
build_image grafana
build_image influxdb

create_service () {
    log "CREATING SERVICE $1"
    kubectl apply -f "srcs/$1/$1.yaml"
    echo
}

create_service ftps
create_service nginx
create_service wordpress
create_service phpmyadmin
create_service mysql
create_service grafana
create_service influxdb
