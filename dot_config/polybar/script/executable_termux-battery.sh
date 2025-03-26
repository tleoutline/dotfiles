#!/usr/bin/env bash

green='#a6e3a1'
red='#f38ba8'

_get_icon(){
  case $1 in
    9* | 100)
      echo 󰁹
      ;;
    8*)
      echo 󰂂
      ;;
    7*)
      echo 󰂁
      ;;
    6*)
      echo 󰂀
      ;;
    5*)
      echo 󰁿 
      ;;
    4*)
      echo 󰁾
      ;;
    3*)
      echo 󰁽
      ;;
    2*)
      echo 󰁼
      ;;
    1*)
      echo 󰁻
      ;;
    *)
      echo 󰁺
  esac
}


_format_output(){
  local percentage=$1
  local plugged=${2//\"/}
  local out=''
  local icon=$(_get_icon $percentage)
  if (($percentage < 15)); then
    out+="%{F${red}}"
  else
    case $plugged in
      PLUGGED_AC)
        out+="%{F${green}}"
        ;;
      *)
        ;;
    esac
  fi
  out+=${icon}
  out+='%{F-}'
  out+=" ${percentage}%"
  echo ${out}
}

_main(){
  local battery_output=$(termux-battery-status)
  local percentage=$(echo ${battery_output} | jq .percentage)
  local plug_status=$(echo ${battery_output} | jq .plugged)
  local out=$(_format_output $percentage $plug_status)
  echo $out
}

_main
