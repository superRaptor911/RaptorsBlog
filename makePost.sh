#!/bin/bash

argCount=$#

if [ $argCount -eq 0 ]; then
    echo "No arguments supplied"
    echo "Usage: ./makePost.sh <post name> tags..."
    exit 1
fi

postName=$1
tags=""

for i in "${@:2}"
do
    tags="$tags\n  - $i"
done

folderName=$(echo $postName | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
mkdir ./content/posts/$folderName || exit 1

fileName=./content/posts/$folderName/index.mdx
echo -e "---\n title: $postName\n date: $(date +%Y-%m-%d)\n tags:$tags \n---" >> $fileName
echo -e "\nimport ViewCount from '../../../src/components/ViewCount'" >> $fileName
echo -e "\n\n\n<ViewCount/>" >> $fileName
echo "Written to $fileName"
echo "Created post with ViewCount"

