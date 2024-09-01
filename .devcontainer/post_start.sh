#!/usr/bin/env bash
set -euxo pipefail

echo "Initializing python environment... please refer to /logs/init_python_environment.log"
nohup bash -c './scripts/init_python_environment.sh' > ./logs/init_python_environment.log 2>&1
echo "Python environment initialized..."