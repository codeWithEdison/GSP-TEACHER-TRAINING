#!/bin/bash

# Step 1: Find and delete all nested .git folders (excluding root)
echo "🔍 Searching for nested .git folders..."
find . -mindepth 2 -type d -name ".git" | while read -r gitdir; do
  echo "🗑️  Deleting nested .git directory: $gitdir"
  rm -rf "$gitdir"
done

# Step 2: Initialize a new Git repo at the root if it doesn't exist
if [ ! -d .git ]; then
  echo "🚀 Initializing new Git repo at root..."
  git init
fi

# Step 3: Add everything and commit
echo "📦 Staging files..."
git add .
git commit -m "Clean root repo with all nested .git folders removed"

# Step 4: Set remote and push
# git remote remove origin 2>/dev/null
# git remote add origin https://github.com/your-username/your-remote-repo.git
# git branch -M main
# git push -f -u origin main
git push 

echo "✅ All clean and pushed to single GitHub repo."
