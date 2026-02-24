#!/usr/bin/bash

# Simple path manipulation functions.

# Adds $1 to the end of the path, if it's a directory that exists.
append_path() {
  [ -d "$1" ] && PATH="$PATH:$1"
}

# Adds $1 to the beginning of the path, if it's a directory that exists.
prepend_path() {
  [ -d "$1" ] && PATH="$1:$PATH"
}

# Echo the path to stdout.
ls_path() {
  echo $PATH
}

# Removes every occurrence of $1 from PATH.
rm_path() {
  local TARGET="$1"
  PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '{if $1 != ${TARGET} printf ORS; printf $1}')
}

# Removes all but the first occurrence of $1 from PATH.
dedupe_path() {
  PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
}

dedupe_path
