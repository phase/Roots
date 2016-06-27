#!/usr/bin/env bash

dir=$(pwd -P)

echo "Applying patches..."
cd $dir/minecraft/src/net/
for f in $(find minecraft/ -name '*.java'); do
  if [ -f "$dir/patches/$f.patch" ]; then
    patch "$dir/src/net/$f" "$dir/patches/$f.patch"
  fi
done