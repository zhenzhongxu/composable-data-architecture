#!/usr/bin/env bash
set -euxo pipefail

echo "Initializing python environment... please refer to init_python_environment.log"
nohup bash -c './init_python_environment.sh' > init_python_environment.log 2>&1
echo "Python environment initialized..."

# nohup bash -c 'minikube start &' > minikube.log 2>&1