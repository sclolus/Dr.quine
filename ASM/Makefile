NAME_1= Colleen
NAME_2= Grace
NAME_3= Sully
# NAME_3= Colleen
SRC_COLLEEN= Colleen.s
SRC_SULLY= Sully.s
SRC_GRACE= Grace.s

OBJ_COLLEEN= $(SRC_COLLEEN:.s=.o)
OBJ_SULLY= $(SRC_SULLY:.s=.o)
OBJ_GRACE= $(SRC_GRACE:.s=.o)
CC= gcc
CC_FLAGS= -v -Wall -Wextra -Werror
ASM_CC_ARCH= macho64
ASM_CC_FLAGS= -f $(ASM_CC_ARCH)

#VPATH=./srcs:./obj:./includes/

all: submodule $(NAME_3) $(NAME_1)

submodule:

$(NAME_1): $(OBJ_COLLEEN)
	$(CC) $(CC_FLAGS) $^ -o $@
$(NAME_2): $(OBJ_GRACE)
	$(CC) $(CC_FLAGS) $^ -o $@
$(NAME_3): $(OBJ_SULLY)
	$(CC) $(CC_FLAGS) $^ -o $@
%.o : %.s
	nasm $(ASM_CC_FLAGS) $< -o $@

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
	cat Grace_kid.s
	@echo	"--------------------DIFF_________________________"
	diff $(SRC_GRACE) Grace_kid.s &&  echo "No DIFF"


test_$(NAME_3): $(NAME_3)
	./$(NAME_3)
	@echo	"--------------------DIFF_________________________"
	diff -a  $(SRC_SULLY) Sully_5.s || echo "diff -a  5"
	diff -a  $(SRC_SULLY) Sully_4.s || echo "diff -a  4"
	diff -a  $(SRC_SULLY) Sully_3.s || echo "diff -a  3"
	diff -a  $(SRC_SULLY) Sully_2.s || echo "diff -a  2"
	diff -a  $(SRC_SULLY) Sully_1.s || echo "diff -a  1"
	diff -a  $(SRC_SULLY) Sully_0.s || echo "diff -a  0"
