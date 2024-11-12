#!/bin/bash

# Check if commit message was provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a commit message"
    echo "Usage: ./commit_all.sh \"your commit message\""
    exit 1
fi

COMMIT_MSG="$1"

# Get list of submodules
SUBMODULES=$(git submodule --quiet foreach 'echo $path')

# First commit changes in each submodule
for submodule in $SUBMODULES; do
    echo "Processing submodule: $submodule"
    
    cd "$submodule"
    
    # Check if there are changes
    if [ -n "$(git status --porcelain)" ]; then
        git add .
        git commit -m "$COMMIT_MSG"
        git push origin HEAD
        echo "Changes committed and pushed in $submodule"
    else
        echo "No changes in $submodule"
    fi
    
    cd ..
done

# Then commit the main repo
if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "$COMMIT_MSG"
    git push origin HEAD
    echo "Changes committed and pushed in main repo"
else
    echo "No changes in main repo"
fi

echo "All done!" 