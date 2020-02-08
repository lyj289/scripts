#!/bin/bash
#
# Get yourself github reps remote origin url list and quick clone
#
# Useage:
#   ./get-github-repos.sh --list Get github reps remote origin url list
#   ./get-github-repos.sh --clone Quick clone
#
#
#############################################################

dir_github=~/github/*

log_file=`pwd`/github-repos.txt

git_list() {
  # Empty log
  : > filename

  for i in $dir_github; do
    cd $i
    git config  --get remote.origin.url >> $log_file
  done
}

git_clone() {
  cat $log_file | while read line; do
    echo $line
    # git clone --depth 1 $line
  done
}

if [[ $1 == '--list' ]]; then
  git_list
fi

if [[ $1 == '--clone' ]]; then
  git_clone
fi
