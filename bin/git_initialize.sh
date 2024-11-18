#!/bin/bash

echo "Initializing git and pushing the project to git@github.com:gac-uni/cbp_final.git."
cd ..
git init
git add .
git commit -m "initial commit"
git push --set-upstream git@git@github.com:gac-uni/cbp_final.git.git main
