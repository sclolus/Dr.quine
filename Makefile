NAME_1= Colleen
NAME_2= Colleen
# NAME_3= Colleen
SRC= srcs/Colleen.c \

OBJ= $(SRC:.c=.o)
CC= gcc
CC_FLAGS= -v -Wall -Wextra -Werror -g3 -fsanitize=address -fsanitize-blacklist=my_ignores.txt #-Werror -Weverything -Wall -Werror -Wextra
#VPATH=./srcs:./obj:./includes/

all: submodule $(NAME)

submodule:

$(NAME): $(OBJ)
	$(CC) $(CC_FLAGS) $^ -o $(NAME)
%.o : %.c
	$(CC) $(CC_FLAGS) $< -c -I$(HDR_PATH) -I./includes -o $@

clean:
	rm -f $(OBJ)
fclean: clean
	rm -f $(NAME)

re: fclean all
