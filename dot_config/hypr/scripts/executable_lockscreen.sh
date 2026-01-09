#!/bin/sh

if ! pgrep -x "swaylock" >/dev/null; then
	swaylock -C "$HOME/.config/swaylock/config" -i $WALLAPAPER
fi
