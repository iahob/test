#/bin/sh

echo '
#/bin/sh

echo "proto builder start"

sh builder.sh

if [[ ! $(git diff --name-only) ]]; then
        echo "Needless To add"
    else
        git add *.pb.go
fi
'>.git/hooks/pre-commit

chmod 775 .git/hooks/pre-commit