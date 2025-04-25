#!/bin/bash

# List of directories (quotes handle spaces in names)
folders=(
  "caresphere-dapp"
  "HOBBY KERNEL"
  "student_backend"
  "caresphere-frontend"
  "MOBILE APPLICATION"
  "student-frontend"
)

# Step 1: Add .git to .gitignore in each folder
for dir in "${folders[@]}"; do
  if [ -d "$dir" ]; then
    echo "Adding .git to .gitignore in: $dir"
    echo ".git" >> "$dir/.gitignore"
  else
    echo "Directory not found: $dir"
  fi
done

# Step 2: Initialize a global Git repository
echo "Initializing root Git repository..."
git init

# Step 3: Create a .gitignore in root to ignore sub-repos if needed
echo ".git" > .gitignore

# Step 4: Add and commit everything
git add .
git commit -m "Initial commit: Added all sub-projects"

# Step 5: Set remote and push
git remote add origin https://github.com/codeWithEdison/GSP-TEACHER-TRAINING.git
git branch -M main
git push -u origin main

echo "✅ All projects pushed to a single GitHub repository."
