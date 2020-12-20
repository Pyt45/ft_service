#!/bin/bash
if [[ $1 == 'd' ]]; then
    kubectl delete deploy nginx-depl
    kubectl delete svc nginx-depl
elif [[ $1 == 'c' ]]; then
    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-svc.yaml
fi