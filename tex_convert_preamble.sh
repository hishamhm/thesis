#!/bin/sh

gawk '/BEGIN LYX PREAMBLE/ { on=1 } { if (on) print } /END LYX PREAMBLE/ { on=0 }' "$1"



