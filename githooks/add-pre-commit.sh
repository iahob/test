#!/bin/bash

echo '
#/bin/bash

echo "proto builder start"

docker run --rm -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh builder.sh

if [[ ! $(git diff --name-only) ]]; then
        echo "Needless To add"
    else
        git add *.pb.go
fi
'>../.git/hooks/pre-commit

chmod 775 ../.git/hooks/pre-commit