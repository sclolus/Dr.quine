#!/bin/bash

RANDOM_DEFINED_VARIABLE=''
MAIN='
main() {
	printf "$SRC" "$MAIN" "$SRC" $ > Grace_kid.sh
}
main
'

SRC="#!/bin/bash

RANDOM_DEFINED_VARIABLE=\x27\x27
MAIN=\x27%s\x27

SRC=\x22%s\x22
#outsider comment
eval \x22%cMAIN\x22
"
#outsider comment
eval "$MAIN"
