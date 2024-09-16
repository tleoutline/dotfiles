### PROCESS
# mnemonic: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.

kp() {
    local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
      echo $pid | xargs kill -${1:-9}
      kp
    fi
}

# mnemonic: [F]zf n[V]im
fv() {
  local result
  fzf_args=(
    --bind "ctrl-h:reload(fd -Htf -tl --no-ignore)" \
    --bind "ctrl-b:reload(fd -Htf -tl -E '.git')" \
    --bind "pgdn:preview-page-down" \
    --bind "pgup:preview-page-up" \
    --bind "ctrl-d:preview-half-page-down" \
    --bind "ctrl-u:preview-half-page-up" \
    -m \
    --preview 'bat --color always {}' \
    --header 'enter:open with nvim  tab:select  ctrl-b:hide hidden  ctrl-h:show hidden'
    )
  result=$(fd -Htf -E '.git' | fzf $fzf_args | tr '\n' ' ' | sed 's/ $//')

  if [[ -n "$result" ]]; then
    eval "nvim $@ $result"
  fi
}

# Install packages using yay (change to pacman/AUR helper of your choice)
yayin() {
    if [ $1 ]; then
        yay -Ssq "$1" 2>/dev/null | fzf -m --preview 'yay -Si {1}' --preview-window 'right,70%' | xargs -ro yay -S
    else
        yay -Slq 2>/dev/null | fzf -m --preview 'yay -Si {1}' --preview-window 'right,70%' | xargs -ro yay -S
    fi
}
# Remove installed packages (change to pacman/AUR helper of your choice)
yayrm() {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' --preview-window 'right,70%' | xargs -ro yay -Rns
}

# fzf picker for zoxide under curent dir
 
fz() {
  local result
  local fzf_args=(
    --height 40%
    --reverse
    --tac
    --ansi \
    --bind "ctrl-h:reload(fd -Lutd)" \
    # -u => --unrestricted == --hidden --no-ignore
    --bind "ctrl-b:reload(fd -Ltd -E '.git')" \
    --bind "pgdn:preview-page-down" \
    --bind "pgup:preview-page-up" \
    --bind "ctrl-d:preview-half-page-down" \
    --bind "ctrl-u:preview-half-page-up" \
    +m \
    --preview "lsd --tree --depth=2 --color always --icon always --group-dirs=first -1 {}" \
    --header="enter:jump ¯é╗ ctrl-h:show hidden ¯é╗ ctrl-b: hide hidden" \
    )
    
  local lines=$(fd -Htd -E '.git' | fzf $fzf_args)
  local result=$(tail -1 <<< "$lines")

  if [[ -n "$result" ]]; then
    z "$result"
  fi
}

# fzf path pickers to insert to zsh
# use in zsh with ctrl-f

function _fz_jump_paste_command {
    local directory="$1"
    LBUFFER="${LBUFFER}$directory"
    zle reset-prompt > /dev/null 2>&1
}

fzp() {
  local result
  local fzf_args=(
    --height 40%
    --reverse
    --ansi \
    --bind "ctrl-h:reload(fd -uL)" \
    --bind "ctrl-b:reload(fd -L -E '.git')" \
    +m \
    --header="enter:paste ¯é╗ ctrl-h:show hidden ¯é╗ ctrl-b: hide hidden" \
    --tac
    )
    
  
  local lines=$(fd -L -E '.git' | fzf $fzf_args)
  local result=$(tail -1 <<< "$lines")

  if [[ -n "$result" ]]; then
    eval -- "_fz_jump_paste_command \"\$result\""
  fi
}

zle -N fzp
bindkey  fzp

