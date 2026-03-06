#!/bin/sh

! pgrep "wlogout" > /dev/null && wlogout -b 4 -c 50 -m 200 -p layer-shell
