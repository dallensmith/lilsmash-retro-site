#!/bin/bash

# Save the original directory
ORIGDIR="$(pwd)"
# Get the script directory
SCRIPTDIR="$(dirname "$(realpath "$0")")"

# Change to the script directory
cd "$SCRIPTDIR" || exit 1

echo "Running updater script..."

# Activate the Conda environment
source ~/anaconda3/bin/activate tv.lilsmash.com || { echo "Failed to activate conda environment"; exit 1; }

# Run the Python script
python interdimensional_update.py
if [[ $? -ne 0 ]]; then
    # If an error occurs, deactivate Conda and exit with failure
    conda deactivate
    cd "$ORIGDIR" || exit 1
    echo "Updater script failed!"
    exit 1
fi

# Deactivate Conda and return to the original directory
conda deactivate
cd "$ORIGDIR" || exit 1
echo "Updater script done!"
exit 0
