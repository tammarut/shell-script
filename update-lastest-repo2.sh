#!/bin/bash

repos = ( 
  "/home/khunpleum/go/src/ci.inno.ktb/api/go/casa"
  "/home/khunpleum/go/src/ci.inno.ktb/api/go/db2"
  "/home/khunpleum/go/src/ci.inno.ktb/api/go/filter"
  "/home/khunpleum/go/src/ci.inno.ktb/api/go/toppayees"
  "/home/khunpleum/go/src/ci.inno.ktb/api/go/transaction"
)

echo ""
echo "Getting latest for" ${#repos[@]} "Update repositories using pull --rebase"

for repo in "${repos[@]}"
do
  echo ""
  echo "****** Getting latest for" ${repo} "******"
  cd "${repo}"
  git pull --rebase
  echo "******************************************"
done
