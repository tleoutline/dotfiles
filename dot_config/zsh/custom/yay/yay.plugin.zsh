yayin() {
  local fzf_args=(
      --preview-window 'right,70%'
      --footer="AUR install"
      --footer-border="rounded"
      --bind "ctrl-u:half-page-up"
      --bind "ctrl-d:half-page-down"
      --bind "pgup:preview-half-page-up"
      --bind "pgdn:preview-half-page-down"
    )
  if [ $1 ]; then
    yay -Ssq "$1" 2>/dev/null | \
        fzf -m --preview 'yay -Si {1} ; yay -Gp {1} | bat -l sh --color=always --file-name PKGBUILD' \
        -q "$1" \
        --header-border="rounded" \
        --header-label="query:" \
        --header="$1" \
        ${fzf_args} \
        | xargs -ro yay -S
  else
      yay -Slq 2>/dev/null | \
        fzf -m --preview 'yay -Si {1} ; yay -Gp {1} | bat -l sh --color=always --file-name PKGBUILD' \
        ${fzf_args} \
        | xargs -ro yay -S
  fi
}

yayrm() {
  local fzf_args=(
      --preview-window 'right,70%'
      --footer="AUR uninstall"
      --footer-border="rounded"
      --bind "ctrl-u:half-page-up"
      --bind "ctrl-d:half-page-down"
      --bind "pgup:preview-half-page-up"
      --bind "pgdn:preview-half-page-down"
    )
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qii {1}' \
      ${fzf_args} \
      | xargs -ro yay -Rns
}

yaysize(){
  zparseopts r=rev -reverse=rev
  local sortopts
  if [[ -n $rev ]]; then
    sortopts="-hrk2"
  else
    sortopts="-hk2"
  fi
  
  pacman -Qi | awk '/^Name/ { x = $3 }; /^Installed Size/ { sub(/Installed Size  *:/, ""); print x" " $1 $2 }' | command sort "$sortopts" | column -t
}
