function git-homelab() {
  local command=$1
  case "$command" in
    (init)
      local repo
      local in_worktree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
      
      if [[ -z $2 ]]; then
        repo=$(ghltools::query_repo_name $in_worktree)
        if [[ -z $repo ]]; then
          echo "repo name can't be empty" >&2
          return 1
        else
          echo
        fi
      fi
      
      ssh git@homelab initrepo $repo
      if [[ $in_worktree == "true" ]]; then
        ghltools::add_remote "git@homelab:${repo}.git"
      fi
    ;;
    (ls | list)
      ssh git@homelab lsrepo
    ;;
    (rm | remove)
      local repo=$2
      if [[ -z $repo ]]; then
        echo "Please specify repo" >&2
        return 1
      fi
      
      ssh git@homelab rmrepo $repo
      ;;
    (*)
      echo "Unknown command: $command" >&2
      return 1
      ;;
  esac
}

function ghltools::add_remote() {
  local remote_addr=$1
  # Prompt to add a remote
  read -q "REPLY?Do you want to add a remote and push? (y/N): "
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Ask for remote name, default to 'origin' if left empty
    read "remote_name?Enter remote name [default: origin]: "
    remote_name="${remote_name:-origin}"

    # Add remote
    git remote add "$remote_name" "$remote_addr" 2>/dev/null || {
      echo "Remote '$remote_name' already exists." >&2
      return
    }

    # Push current branch to the remote
    current_branch=$(git symbolic-ref --short HEAD)
    echo "Pushing current branch '$current_branch' to '$remote_name'..."
    git push -u "$remote_name" "$current_branch"
  fi
}

# ghltools::query_repo_name in_worktree
function ghltools::query_repo_name() {
  local repo
  local in_worktree=$1

  if [[ "$in_worktree" -eq "true" ]]; then
    base_repo=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)")
    read -q "REPLY?Currently in a git repo, use current repo name [$base_repo] for the remote repo? (y/N)"
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      echo $base_repo
      return 0
    fi
  fi

  read "REPO?Specify remote repo name: "
  echo $REPO
  return 0
}
