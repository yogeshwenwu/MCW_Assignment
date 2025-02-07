#!/bin/bash

SCRIPT="tfmodel.py"

echo "Switching to Conda environment: $CONDA_DEFAULT_ENV"
source /mnt/mydisk/yogesh/anaconda3/etc/profile.d/conda.sh || { echo "Failed to load Conda."; exit 1; }
conda activate env_py_3.10_tf || { echo "Failed to activate $ENV_NAME."; exit 1; }

python --version > output.txt

pip show tensorflow >> output.txt

echo "Running $SCRIPT in $ENV_NAME"
python $SCRIPT >> output.txt || { echo "Python script execution failed in $ENV_NAME."; conda deactivate; exit 1; }

echo "Deactivating $ENV_NAME"
conda deactivate
echo "Task completed successfully!"

