#!/bin/sh

readonly CDN="https://dofusretro.cdn.ankama.com"

wget -qNP lang "${CDN}/lang/versions.swf" "${CDN}/lang/versions_${1}.txt"

tail -c +4 "lang/versions_${1}.txt" | head -c -1 | tr ',' '_' | tr '|' '\n' | while read -r lang; do
  wget -qNP lang/swf "${CDN}/lang/swf/${lang}.swf"
done
