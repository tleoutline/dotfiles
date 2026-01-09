#!/bin/sh

! pgrep "wlogout" > /dev/null && wlogout -b 4 -c 5 -m 400 -p layer-shell
