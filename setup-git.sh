#!/bin/bash

# Remove existing git repositories
rm -rf .git k8s-manifests/.git

# Initialize new repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "initial commit: Project structure and configuration"

# Rename branch to main
git branch -M main

# Add remote repository
git remote add origin git@github.com:satishgonella2024/k8s-dev-cluster.git

# Pull from remote with unrelated histories
git pull origin main --allow-unrelated-histories

# Push to remote
git push -u origin main 