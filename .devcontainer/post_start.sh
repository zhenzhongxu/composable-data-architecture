#!/usr/bin/env bash
set -euxo pipefail

nohup bash -c 'minikube start &' > minikube.log 2>&1