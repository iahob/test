#!/bin/bash

function builder() {
     for file in `ls -a $1`
        do
            if [ -d $1"/"$file ]
            then
                if [[ $file != '.' && $file != '..' ]]
                then
                    builder $1"/"$file
                fi
            else

              if [[ "${file##*.}"x = "proto"x ]] ;
              then
                protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. $1/$file;
              fi
            fi
        done
}

builder $1