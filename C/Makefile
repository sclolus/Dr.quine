NAME_1= Colleen
NAME_2= Grace
NAME_3= Sully
# NAME_3= Colleen
SRC_COLLEEN= Colleen.c
SRC_SULLY= Sully.c
SRC_GRACE= Grace.c

OBJ_COLLEEN= $(SRC_COLLEEN:.c=.o)
OBJ_SULLY= $(SRC_SULLY:.c=.o)
OBJ_GRACE= $(SRC_GRACE:.c=.o)
CC= gcc
CC_FLAGS= -v -Wall -Wextra -Werror
#VPATH=./srcs:./obj:./includes/

all: submodule $(NAME_3) $(NAME_1)

submodule:

$(NAME_1): $(OBJ_COLLEEN)
	$(CC) $(CC_FLAGS) $^ -o $@
$(NAME_2): $(OBJ_GRACE)
	$(CC) $(CC_FLAGS) $^ -o $@
$(NAME_3): $(OBJ_SULLY)
	$(CC) $(CC_FLAGS)  $^ -o $@
%.o : %.c
	$(CC) $(CC_FLAGS) $< -c  -I./includes -o $@

clean:
	rm -f $(OBJ_COLLEEN) $(OBJ_SULLY)
fclean: clean
	rm -f $(NAME_1) $(NAME_2) $(NAME_3)

re: fclean all

test_$(NAME_1): $(NAME_1)
	./$(NAME_1) > diff.txt
	cat diff.txt
	@echo	"--------------------DIFF_________________________"
	diff $(SRC_COLLEEN) diff.txt && echo "No DIFF"

test_$(NAME_2): $(NAME_2)
	./$(NAME_2)
	cat Grace_kid.c
	@echo	"--------------------DIFF_________________________"
	diff $(SRC_GRACE) Grace_kid.c &&  echo "No DIFF"


test_$(NAME_3): $(NAME_3)
	./$(NAME_3)
	@echo	"--------------------DIFF_________________________"
	diff $(SRC_SULLY) Sully_5.c || echo "diff 4"
	diff $(SRC_SULLY) Sully_4.c || echo "diff 4"
	diff $(SRC_SULLY) Sully_3.c || echo "diff 3"
	diff $(SRC_SULLY) Sully_2.c || echo "diff 2"
	diff $(SRC_SULLY) Sully_1.c || echo "diff 1"
	diff $(SRC_SULLY) Sully_0.c || echo "diff 0"
