#!/bin/bash

source /mnt/mydisk/yogesh/anaconda3/etc/profile.d/conda.sh

echo "<--------Activated-------->"
conda activate env_py_3.10_torch_2.4
echo "Current conda environment: $CONDA_DEFAULT_ENV"
python ./Img_Clf_t2.4/model.py
conda deactivate
echo "<--------Deactivated-------->"

sleep 2 


conda activate env_py_3.11_tf
echo "<--------Activated-------->"
echo "Current conda environment: $CONDA_DEFAULT_ENV"
python ./Img_Clf_tf/model.py
echo "<--------Deactivated----->"
conda deactivate