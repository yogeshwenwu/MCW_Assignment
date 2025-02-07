#!/bin/bash

ENV1="env_py_3.10_torch_2.4"
ENV2="env_py_3.11_torch_2.5"
SCRIPT="model.py"

run_script() {
    local ENV_NAME=$1
    echo "Switching to Conda environment: $ENV_NAME"
    source /mnt/mydisk/yogesh/anaconda3/etc/profile.d/conda.sh || { echo "Failed to load Conda."; exit 1; }
    conda activate $ENV_NAME || { echo "Failed to activate $ENV_NAME."; exit 1; }
    
    echo "Running $SCRIPT in $ENV_NAME"
    echo 
    python $SCRIPT || { echo "Python script execution failed in $ENV_NAME."; conda deactivate; exit 1; }
    
    echo "Deactivating $ENV_NAME"
    conda deactivate
    sleep 2 
}

echo "======================"
run_script $ENV1
echo "----------------------"
run_script $ENV2
echo "======================"

echo "All tasks completed successfully!"