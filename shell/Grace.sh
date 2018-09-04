#!/bin/bash

RANDOM_DEFINED_VARIABLE=''
MAIN='
print() {
	printf "$SRC" "$MAIN" "$SRC" $
}

main() {
	print
}
main
'

SRC="#!/bin/bash

RANDOM_DEFINED_VARIABLE=\x27\x27
MAIN=\x27%s\x27

SRC=\x22%s\x22
#outsider comment
eval \x22%cMAIN\x22 > Grace_kid.sh
"
#outsider comment
eval "$MAIN" > Grace_kid.sh
