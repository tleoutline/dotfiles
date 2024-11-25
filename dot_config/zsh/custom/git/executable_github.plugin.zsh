#!/usr/bin/env zsh

function _query_user {
  local fzf_options=(--header='Select a user'\
    --height 40%)
  local user_query=$1
  local result=$(gh api "search/users?q=${user_query}" | jq -r '.items[].login' | fzf ${fzf_options})
  echo $result
}

function _query_repo {
  local fzf_options=(--header='Select a repo' \
    --height 40%)
  local repo_owner=$1
  local repo=$(gh api "users/${repo_owner}/repos" | jq -r '.[].name' | fzf ${fzf_options})
  echo $repo
}

function gh-clone {
  local query=$1 
  local destination=$2
  
  if [[ -z $query ]]; then
    echo "Please specify user query" >&2
    return 1
  fi
  local owner=$(_query_user $query)
  if [[ -z $owner ]]; then
    return 1
  fi
  local repo=$(_query_repo $owner)
  if [[ -z $repo ]]; then
    return 1
  fi
  
  git clone git@github.com:${owner}/${repo}.git $destination

}

