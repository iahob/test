#!/bin/bash
# shellcheck disable=SC2046
echo "current dir:`pwd`";

protocol="protocol"
read_dir(){
    for file in `ls -a $1`
    do
        if [ -d $1"/"$file ]
        then
            if [[ $file != '.' && $file != '..' ]]
            then
                read_dir $1"/"$file
            fi
        else

          if [[ "${file##*.}"x = "proto"x ]] ;
          then
            builder $1"/"$file
          fi
        fi
    done
}

builder(){
  echo "current file:${1} "
      docker run --rm -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh -c '
        protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. $1;
      '
}


read_dir $protocol

#for file in ../api/* ; do
#   if [[ $file = ~\.proto$ ]] ; then
#    echo "current file:${file}"
#    docker run --rm -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh -c '
#      protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. *.proto;
#    '
#  fi
#
#done



sleep 2
