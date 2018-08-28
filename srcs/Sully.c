#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#define STR "#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#define STR %c%s%c%c%cint main(void)%c{%c%cint%ci = %d;%c%cchar%c*file_name;%c%cint%cfd;%c%cchar%c*command;%c%cchar%c*source = STR;%c%c%cif (!i)%c%c%creturn (0);%c%cif (-1 == (asprintf(&file_name, %cSully_%%d.c%c, i - 1)))%c%c%creturn (1);%c%cif (-1 == (fd = open(filename, O_WRONLY | O_CREAT | O_TRUNNC, S_IRWXU)))%c%c%creturn(1);%c%cif (-1 == (asprintf(&command, %c/usr/bin/clang -Wall -Wextra -Werror %%s -o Sully_%%d && ./Sully_%%d%c, file_name, i - 1, i - 1)))%c%c%creturn (1);%c%cdprintf(fd, source, 10, 10, 10, 34, source, 34, 10, 10, 10, 10, 9, 9, i - 1, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 10);%c%cif (system((const char *)command))%c%c%creturn(1);%c%creturn(0);%c}%c"

int	main(void)
{
	int		i = 5;
	char	*file_name;
	int		fd;
	char	*command;
	char	*source = STR;

	if (!i)
		return (0);
	if (-1 == (asprintf(&file_name, "Sully_%d.c", i - 1)))
		return (1);
	if (-1 == (fd = open(file_name, O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU)))
		return (1);
	printf("#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#define STR %c%s%c%c%cint main(void)%c{%c%cint%ci = %d;%c%cchar%c*file_name;%c%cint%cfd;%c%cchar%c*command;%c%cchar%c*source = STR;%c%c", 10, 10, 10, 34, source, 34, 10, 10, 10, 10, 9, 9, i - 1, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 10);
	printf("%cif (!i)%c%c%creturn (0);%c", 9, 10, 9, 9, 10);
	printf("%cif (-1 == (asprintf(&file_name, %cSully_%%d.c%c, i - 1)))%c%c%creturn (1);%c%cif (-1 == (fd = open(filename, O_WRONLY | O_CREAT | O_TRUNNC, S_IRWXU)))%c%c%creturn(1);%c", 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10);
	printf("%cif (-1 == (asprintf(&command, %c/usr/bin/clang -Wall -Wextra -Werror %%s -o Sully_%%d && ./Sully_%%d%c, file_name, i - 1, i - 1)))%c%c%creturn (1);%c", 9, 34, 34, 10, 9, 9, 10);
	printf("%cdprintf(fd, source, 10, 10, 10, 34, source, 34, 10, 10, 10, 10, 9, 9, i - 1, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 10);%c", 9, 10);
	dprintf(fd, source, 10, 10, 10, 34, source, 34, 10, 10, 10, 10, 9, 9, i - 1, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 9, 9, 10, 10, 9, 10, 9, 9, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 10);
	if (-1 == (asprintf(&command, "/usr/bin/clang -Wall -Wextra -Werror %s -o Sully_%d && ./Sully_%d", file_name, i - 1, i - 1)))
		return (1);
	printf("%cif (system((const char *)command))%c%c%creturn(1);%c%creturn(0);%c}%c", 9, 10, 9, 9, 10, 9, 10, 10);
	if (system((const char *)command))
		return (1);
	return (0);
}
