#!/bin/sh
ack -l $1 | xargs perl -pi -E 's/$1/$2/g'

