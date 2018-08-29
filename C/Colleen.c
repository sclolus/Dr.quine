#include <stdio.h>
#define PRINT printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10)
int print_source(char *s)
{
	return (PRINT);
}
/*
 quine
*/
int main(void)
{
	char *s = "#include <stdio.h>%c#define PRINT printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10)%cint print_source(char *s)%c{%c	return (PRINT);%c}%c/*%c quine%c*/%cint main(void)%c{%c	char *s = %c%s%c;%c	/*%c		comment%c	*/%c	print_source(s);%c}%c";
	/*
		comment
	*/
	print_source(s);
}
