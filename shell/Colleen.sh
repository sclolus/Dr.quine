#!/bin/bash

SRC="#!/bin/bash

SRC=\x22%s\x22
#outsider comment
print() {
	printf \x22%cSRC\x22 \x22%cSRC\x22 $ $
}

main() {
	print
	#quine
}
main
"
#outsider comment
print() {
	printf "$SRC" "$SRC" $ $
}

main() {
	print
	#quine
}
main
