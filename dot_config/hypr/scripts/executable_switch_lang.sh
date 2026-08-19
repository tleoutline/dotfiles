#!/bin/bash

main() {
  hyprctl switchxkblayout current next
  local curr_lang=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')
  notify-send -u low "$curr_lang"
}
main

