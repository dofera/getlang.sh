#!/bin/sh

readonly CDN="https://dofusretro.cdn.ankama.com"

wget -qNP lang "${CDN}/lang/versions.swf"

for i in "$@"; do
  wget -qNP lang "${CDN}/lang/versions_${i}.txt"

  tail -c +4 "lang/versions_${i}.txt" | head -c -1 | tr ',' '_' | tr '|' '\n' | while read -r file; do
    wget -qNP lang/swf "${CDN}/lang/swf/${file}.swf"
  done
done
