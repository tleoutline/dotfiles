#!/usr/bin/env bash

red='#f38ba8'
green='#a6e3a1'
blue='#89b4fa'

_get_icon(){
  echo test
}

_main(){
  local output=$(termux-wifi-connectioninfo)
  local state=$(echo ${output} | jq .supplicant_state | sed "s/\"//g")
  local icon
  local colour=$blue
  case $state in
    COMPLETED)
      icon='󱚽'
      ;;
    UNITIALIZED)
      icon='󰖩'
      ;;
    DISCONNECTED)
      icon='󰖪'
      ;;
    *)
      icon='󱚵'
      colour=$red
    ;;
  esac
  echo "%{F${colour}}${icon}%{F-}"
}

_main
