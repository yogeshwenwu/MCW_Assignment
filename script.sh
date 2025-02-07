#!/bin/bash

source /mnt/mydisk/yogesh/anaconda3/etc/profile.d/conda.sh

conda create --name env_py_3.10_torch_2.4 python=3.10
echo "<--------Activated-------->"
conda activate env_py_3.10_torch_2.4
echo "Current conda environment: $CONDA_DEFAULT_ENV"
pip install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cpu
conda deactivate
echo "<--------Deactivated-------->"

conda create --name env_py_3.11_torch_2.5 python=3.11
conda activate env_py_3.11_torch_2.5
echo "<--------Activated-------->"
echo "Current conda environment: $CONDA_DEFAULT_ENV"
pip install torch==2.5.0 torchvision==0.20.0 torchaudio==2.5.0 --index-url https://download.pytorch.org/whl/cpu
echo "<--------Deactived----->"
conda deactivate