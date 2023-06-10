#!/bin/bash

# set an update miniconda3 variable
updated=false

# Check if yay is upgrading miniconda3
if yay -Qqua | grep -q "miniconda3"; then
  # Find the line that sources conda.sh and comment it out
  sed -i '/conda.sh/s/^/#/' ~/.bashrc
  sed -i '/conda.sh/s/^/#/' ~/.zshrc
  updated=true
fi

# Perform system upgrade using yay
yay -Syu

# Finally, remove the comment
if [ "$updated" = true ]; then
  sed -i '/conda.sh/s/^##*//' ~/.bashrc
  sed -i '/conda.sh/s/^##*//' ~/.zshrc
fi
