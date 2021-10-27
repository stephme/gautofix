#!/bin/bash

# 	Do a git commit --fixup followed by a git rebase -i --autosquash at once
# 	Usage: gautofix [sha1] [parent_branch]
## 		[sha1] : the revision number of the commit to fixup
## 		[parent_branch] : the parent branch of the current working branch

NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'

if [ $# -ne 2 ]; then
    if [ $# -eq 0 ]; then
    	echo -e "${RED}Commit revision number to fixup is missing${NC}"
    elif [ $# -eq 1 ]; then
        echo -e "${RED}Parent branch is missing${NC}"
    else
	echo -e "${RED}Too many arguments${NC}"
    fi
    echo -e "${GREEN}Hint${NC}: gautofix [sha1] [target_branch]"
else
    git commit --fixup $1 -n || { echo -e "${RED}git fixup command has failed${NC}" ; exit 1; }
    for sha in $(git log origin/$2..HEAD --format=format:%H); do :; done
    git rebase -i --autosquash $sha~1 || { echo -e "${RED}git rebase interactive command has failed${NC}" ; exit 1; }
    echo -e "${GREEN}Commit $sha successfully fixed up${NC}"	
fi
