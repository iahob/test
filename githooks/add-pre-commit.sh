#!/bin/bash

echo '
#/bin/bash

echo "proto builder start"

bash githooks/builder.sh ($pwd)

if [[ ! $(git diff --name-only) ]]; then
        echo "Needless To add"
    else
        git add *.pb.go
fi
'>../.git/hooks/pre-commit

chmod 775 ../.git/hooks/pre-commit