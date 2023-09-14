#!/bin/bash

# Define the ADDON_NAME variable
ADDON_NAME="contour"

# Check if an addon name is provided as an argument
if [ -n "$1" ]; then
    ADDON_NAME="$1"
fi

# Define the paths to the YAML files
TMCOPTS_YAML="tmc/addons/${ADDON_NAME}/tmc-opts.yaml"
PKGVALUES_YAML="tmc/addons/${ADDON_NAME}/pkg-values.yaml"

# Check if the YAML files exist
if [ ! -f "$TMCOPTS_YAML" ] || [ ! -f "$PKGVALUES_YAML" ]; then
    echo "Error: One or both of the required YAML files do not exist."
    exit 1
fi

# Execute the command
tanzu tmc tanzupackage install create -f "$TMCOPTS_YAML" -v "$PKGVALUES_YAML"

# Exit with the command's exit code
exit $?
