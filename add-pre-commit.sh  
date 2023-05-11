#/bin/sh

echo '
#/bin/sh

echo "proto builder start"

# docker run -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh -c "protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. *.proto;"
docker run -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh builder.sh

if [[ ! $(git diff --name-only) ]]; then
        echo "Needless To add"
    else
        git add *.pb.go
fi
'>.git/hooks/pre-commit

chmod 775 .git/hooks/pre-commit