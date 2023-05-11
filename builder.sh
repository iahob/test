#!/bin/bash
# shellcheck disable=SC2046

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
            builder $1/$file
          fi
        fi
    done
}

builder(){
  echo "build ${1}"
  protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. ${1};
}


read_dir $protocol


