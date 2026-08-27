#!/bin/bash

main() {
  hyprctl switchxkblayout current next
  local curr_lang=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')
  notify-send -h "string:x-canonical-private-synchronous:lang-switch-notify" \
  -u low \
  -e \
  -t "2000" \
  "$curr_lang"
}
main

