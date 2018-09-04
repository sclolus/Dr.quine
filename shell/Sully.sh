#!/bin/bash

I=5
SRC='#!/bin/bash

I=%d
SRC=\x27%s\x27
print() {
	printf \x22%cSRC\x22 %c((I - 1)) \x22%cSRC\x22 $ $ $
}

if [ "$I" -lt 1 ];
then
   exit 0
fi
I=$((I + 1))
if [ -e "./Sully_$((I - 1)).sh" ];
then
	I=$((I - 1))
fi
print > "Sully_$((I - 1)).sh"
chmod +x "Sully_$((I - 1)).sh"
./"Sully_$((I - 1)).sh"
'
print() {
	printf "$SRC" $((I - 1)) "$SRC" $ $ $
}

if [ "$I" -lt 1 ];
then
   exit 0
fi
I=$((I + 1))
if [ -e "./Sully_$((I - 1)).sh" ];
then
	I=$((I - 1))
fi
print > "Sully_$((I - 1)).sh"
chmod +x "Sully_$((I - 1)).sh"
./"Sully_$((I - 1)).sh"
