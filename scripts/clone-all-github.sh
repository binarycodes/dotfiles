#!/usr/bin/env sh

gh repo list binarycodes --limit 100 --source --json name --jq '.[].name' | while read -r repo_name; do
    gh repo clone $repo_name ~/projects/$repo_name
done
