#!/bin/bash
cdn="http://dofusretro.cdn.ankama.com"
wget -P lang ${cdn}/lang/versions_$1.txt
lang=$(<lang/versions_$1.txt)
lang=${lang:3:-1}
lang=${lang//,/_}
IFS='|'
read -ra ADDR <<< "$lang"
for i in "${ADDR[@]}"; do
    wget -P lang/swf ${cdn}/lang/swf/$i.swf
done
