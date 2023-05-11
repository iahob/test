#!/bin/bash

echo '
#/bin/bash

echo "proto builder start"
for file in $(git diff --cached --name-only)
do
    if [[ "${file##*.}"x = "proto"x ]] ;
    then
      docker run --rm -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh builder.sh
      git add *.pb.go
      break
    else
      echo "skip"
      continue
    fi
done

#if [[ ! $(git diff --name-only) ]]; then
#        echo "Needless To add"
#    else
#        git add *.pb.go
#fi
'>../.git/hooks/pre-commit

chmod 775 ../.git/hooks/pre-commit