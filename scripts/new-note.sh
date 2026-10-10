#!/usr/bin/env bash
# Usage: scripts/new-note.sh 31 "Topic"  (for extra days)
n=$(printf '%02d' "$1")
sed "s/Day [0-9]*: .*/Day $n: $2/" notes/day-01.md > notes/day-$n.md
echo created notes/day-$n.md
