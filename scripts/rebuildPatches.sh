#!/usr/bin/env bash

dir=$(pwd -P)
rm -rf $dir/patches/
mkdir -p $dir/patches/

cd $dir/src/net/
for f in $(find minecraft/ -name '*.java'); do
  file="$(basename "$f")"
  if ! cmp "$dir/minecraft/src/net/$f" "$dir/src/net/$f" >/dev/null 2>&1; then
    echo $f
    cd $dir
    d=$(dirname "$f")
    mkdir -p "patches/$d"
    diff -u "minecraft/src/net/$f" "src/net/$f" > "$dir/patches/$f.patch"
    cd $dir/src/net/
  fi
done