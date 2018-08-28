#include <stdio.h>
#define STR "#include <stdio.h>%c#define STR %c%s%c%c#define PRINT printf(str, 10, 34, str, 34, 10, 10, 10, 10, 9, 9, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10);%c#define FN(x) int main(void) { x }%cFN(%c%cchar%c*str = STR;%c%cPRINT%c%c/*%c%c%cWhat do you think about this perpetual questioning the humans tend to have regarding the Why of it all ?%c%c%cMy answer is that this is pretty inefficient and without any interest what so ever%c%c*/%c)%c"
#define PRINT printf(str, 10, 34, str, 34, 10, 10, 10, 10, 9, 9, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10);
#define FN(x) int main(void) { x }
FN(
	char	*str = STR;
	PRINT
	/*
		What do you think about this perpetual questioning the humans tend to have regarding the Why of it all ?
		My answer is that this is pretty inefficient and without any interest what so ever
	*/
)
