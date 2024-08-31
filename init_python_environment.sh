#!/usr/bin/env bash
# this script will set up a DS optimized kernel in a pre-configured conda environment
# (you will still need to select the kernel in the notebook)

# WARNING: please note running this script will change your default python environment to conda
# managed. If you prefer to not having that side effect in your shell, please comment out the "echo" lines close to the end of the script

set -eo pipefail

ENV_NAME=composable-data-arch
PYTHON_VER=3.12

if [ ! -f /opt/conda/etc/profile.d/conda.sh ]; then
    echo "Error: Conda is still being initialized. Please wait for a few more mins before trying again."
    echo "This is normal if you just created the current codespace or have not rebuilt your codespace for a while."
    exit 1
fi

# Install Data Science optimized Jupyter kernel
export PATH="/opt/conda/bin/conda:$PATH"
source /opt/conda/etc/profile.d/conda.sh

# Check if the conda environment already exists
if conda info --envs | grep -q "^$ENV_NAME\s"; then
  echo "Activating existing environment: $ENV_NAME"
  conda activate $ENV_NAME
else
  # Create a new environment with the necessary packages for data science
  echo "Creating new environment: $ENV_NAME"
  conda create -y -n $ENV_NAME -c conda-forge --file requirements-conda.txt

  # Activate the new environment
  conda activate $ENV_NAME

  # Register the Conda kernel
  pip install -r requirements-pip.txt
  python -m ipykernel install --user --name $ENV_NAME --display-name "Conda($ENV_NAME)"

  # Comment out below lines if you don't want conda env to be activated upon log into shell
  echo "source /opt/conda/bin/activate $ENV_NAME" >> ~/.zshrc
  echo "Added line to activate $ENV_NAME in ~/.zshrc"
  echo "source /opt/conda/bin/activate $ENV_NAME" >> ~/.bashrc
  echo "Added line to activate $ENV_NAME in ~/.bashrc"
fi
