#/usr/bin/env bash

screenshot_dir="$HOME/Pictures/Screenshots"

partial_screenshot(){
  grim -g "$(slurp)" - | tee "$screenshot_dir/$(date '+%y%m%d_%H-%M-%S').png" | wl-copy
}

full_screenshot(){
  grim - | tee "$screenshot_dir/$(date '+%y%m%d_%H-%M-%S').png" | wl-copy
}


if [[ "$1" == "--select" ]]; then
  partial_screenshot
elif [[ "$1" == "--full" ]]; then
  full_screenshot
else
  full_screenshot
fi
