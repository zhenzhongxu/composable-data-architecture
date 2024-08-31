#!/usr/bin/env bash
set -euxo pipefail

# install k9s
brew install k9s

# make sure minikube has permission to user directory
sudo chown -R vscode:vscode /home/vscode/.minikube
sudo chmod -R u+wrx /home/vscode/.minikube
