#!/bin/bash

source /home/groot/anaconda3/etc/profile.d/conda.sh

conda create --name env_py_3.10_tf python=3.10
echo "<-----CreatedEnv----->"
conda activate env_py_3.10_tf
echo "Current conda environment: $CONDA_DEFAULT_ENV"
pip install tensorflow
echo "<-----Installed Successfully----->"
conda deactivate
echo "Back to base"
