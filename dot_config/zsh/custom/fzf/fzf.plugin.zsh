### PROCESS
# mnemonic: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.

export FZF_CTRL_T_OPTS="
  --height 40%
  --walker-skip .git,node_modules,target
  --bind 'ctrl-d:preview-half-page-down'
  --bind 'ctrl-u:preview-half-page-up'
  --preview 'bat -n --color=always {} 2> /dev/null || \
    lsd --tree --depth=2 --group-dirs=first --almost-all --color=always --icon=always {}' "


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
