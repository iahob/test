#!/bin/bash
# shellcheck disable=SC2046
# shellcheck disable=SC2045

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

judgement() {
    for file in $(git diff --cached --name-only)
    do

        if [[ "${file##*.}"x = "proto"x ]] ;
        then
          echo "files has changed, builder start"
          #read_dir $protocol
          return
        else
          echo "skip"
          return
        fi
    done
}

judgement


