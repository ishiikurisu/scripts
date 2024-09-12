#!/bin/sh
set -x
osascript -e "display notification \"$2\" with title \"$1\""

