_ftb_preview_path() {
  if [[ -d "$1" ]]; then
    lsd -1 --icon=always  --color=always "$1"
  elif [[ -f "$1" ]]; then
    bat --color=always --style=plain "$1"
  else
    echo "$1"
  fi
}

_ftb_preview_path "$@"
