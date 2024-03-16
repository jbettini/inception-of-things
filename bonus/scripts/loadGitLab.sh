
# Command line instructions

# You can also upload existing files from your computer using the instructions below.
# Git global setup

# git config --global user.name "Administrator"
# git config --global user.email "admin@example.com"

# Create a new repository

# git clone http://gitlab.localdomain.com:8081/root/gitlab.git
# cd gitlab
# git switch --create main
# touch README.md
# git add README.md
# git commit -m "add README"
# git push --set-upstream origin main

# Push an existing folder

# cd existing_folder
# git init --initial-branch=main
# git remote add origin http://gitlab.localdomain.com/root/gitlab.git
# git add .
# git commit -m "Initial commit"
# git push --set-upstream origin main

# Push an existing Git repository

# cd existing_repo
# git remote rename origin old-origin
# git remote add origin http://gitlab.localdomain.com/root/gitlab.git
# git push --set-upstream origin --all
# git push --set-upstream origin --tags

