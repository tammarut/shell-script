#!/usr/bin/env bash

boldBlueColor='\033[1;34m'
redColor='\033[0;31m'
normal='\033[0;39m'

if [ ! -z "$1" ]; then
   if [ ! -d "$1" ]; then
       echo -e "${redColor}'$1' is not a valid directory${normal}"
       exit 1
   fi
   cd $1
else
   cd $(dirname "$0")
fi

dir=$(pwd)

total=0
success=0
fail=0
ignored=0

for d in */; do
    echo -e "\n${boldBlueColor}${dir}/${d}${normal}"
    cd "${dir}/${d}"

    total=$((total+1))

    if [ ! -d "${dir}/${d}/.git" ]; then
        echo "Not has git repository"
        ignored=$((ignored+1))
        continue
    fi

    result=$(git -c color.ui=always pull origin 2>&1)
    retVal=$?
    if [ $retVal -ne 0 ]; then
        fail=$((fail+1))
        echo -e "${redColor}${result}${normal}"
    else 
        success=$((success+1))
        echo -e "${result}"
    fi
done

echo -e "\n\033[1mTotal: ${total}, Success: \033[1;32m${success}\033[1;39m, Fail: \033[1;31m${fail}\033[1;39m, ignored: ${ignored}"