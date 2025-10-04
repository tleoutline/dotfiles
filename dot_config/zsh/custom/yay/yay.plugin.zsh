yayin() {
  if [ $1 ]; then
      yay -Ssq "$1" 2>/dev/null | fzf -m --preview 'yay -Si {1}' --preview-window 'right,70%' --header-label="query: $header" --header-border="rounded" --header="$1" | xargs -ro yay -S
  else
      yay -Slq 2>/dev/null | fzf -m --preview 'yay -Si {1}' --preview-window 'right,70%' | xargs -ro yay -S
  fi
}

yayrm() {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' --preview-window 'right,70%' | xargs -ro yay -Rns
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
