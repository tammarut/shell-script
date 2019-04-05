#!/bin/sh
#Update lastest repository by git pull --rebase
for repo in ./casa ./db2 ./filter ./toppayees ./transaction; do
    (cd "${repo}" && git pull --rebase && cd .. )
done
