#include <stdio.h>
#include <fcntl.h>
#define STR "#include <stdio.h>%c#include <fcntl.h>%c#define STR %c%s%c%c#define PRINT dprintf(fd, str, 10, 10, 34, str, 34, 10, 10, 10, 10, 9, 9, 10, 9, 9, 9, 10, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10);%c#define FN(x) int main(void) { x }%cFN(%c%cchar%c*str = STR;%c%cint%c%cfd;%c%c%cif (-1 == (fd = open(%cGrace_kid.c%c, O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU)))%c%c%creturn (1);%c%cPRINT%c%c/*%c%c%cWhat do you think about this perpetual questioning the humans tend to have regarding the Why of it all ?%c%c%cMy answer is that this is pretty inefficient and without any interest what so ever%c%c*/%c)%c"
#define PRINT dprintf(fd, str, 10, 10, 34, str, 34, 10, 10, 10, 10, 9, 9, 10, 9, 9, 9, 10, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10);
#define FN(x) int main(void) { x }
FN(
	char	*str = STR;
	int		fd;

	if (-1 == (fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU)))
		return (1);
	PRINT
	/*
		What do you think about this perpetual questioning the humans tend to have regarding the Why of it all ?
		My answer is that this is pretty inefficient and without any interest what so ever
	*/
)
