function git-homelab() {
  local command=$1
  case "$command" in
    (init)
      local repo=$2
      if [[ -z $repo ]]; then
        echo "Please specify repo" >&2
        return 1
      fi
      
      ssh git@homelab initrepo $repo
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
