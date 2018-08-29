%define ITER 5
extern _dprintf
extern _asprintf
extern _system
section .data
src: db 'extern _dprintf%csection .data%csrc: db %c%s%c, 0%c%cextern _open%c%%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400%c%%define S_IRWXU 0700o%c%%defstr KID_NAME Grace_kid.s%c%ckid_name: db KID_NAME%c%c%c%%macro MAIN 0%cglobal _main%c_main:%c;asm quine%c%cpush rbp%cmov rbp, rsp%csub rsp, 16%clea rdi, [rel kid_name]%cmov rsi, WRCREAT_TRUNC%cmov rdx, S_IRWXU%ccall _open%ccmp rax, -1%cje .end%cmov rdi, rax%clea rsi, [rel src]%cmov rdx, 10%cmov rcx, 10%cmov r8, 39%clea r9, [rel src]%csub rsp, 480%cmov word [rsp], 39%c%cmov r11, 8%c.set_stack:%cmov rax, r11%cadd rax, rsp%cmov word [rax], 10%cadd r11, 8%ccmp r11, 480%cjne .set_stack%c%cmov al, 0%ccall _dprintf%cadd rsp, 480%c.end:%cadd rsp, 16%cpop rbp%cmov rax, 0%cret%c%c%%endmacro%csection .text%cMAIN%c', 0

extern _open
%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400
%define S_IRWXU 0700o
%defstr KID_NAME_SRC Sully_%d.s
%defstr KID_NAME Sully_%d
%defstr COMMAND_LINE /Users/sclolus/.brew/bin/nasm -f macho64 %s && /usr/bin/clang -Wall -Wextra -Werror %s.o -o %s
kid_name_src: db KID_NAME_SRC, 0
kid_name: db KID_NAME, 0
command_line: db COMMAND_LINE, 0

%macro MAIN 0
global _main
_main:
	;asm quine

	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rdi, rsp
	lea rsi, [rel kid_name_src]
	mov rdx, ITER
	mov al, 0
	call _asprintf
	cmp rax, -1
	je .end

	mov rdi, [rel rsp]
	mov rsi, WRCREAT_TRUNC
	mov rdx, S_IRWXU
	call _open
	cmp rax, -1
	je .end
	mov rdi, rax
	lea rsi, [rel src]
	mov rdx, 10
	mov rcx, 10
	mov r8, 39
	lea r9, [rel src]
	sub rsp, 480
	mov word [rsp], 39

	mov r11, 8
.set_stack:
	mov rax, r11
	add rax, rsp
	mov word [rax], 10
	add r11, 8
	cmp r11, 480
	jne .set_stack

	mov al, 0
	call _dprintf
	add rsp, 480

	lea rdi, [rel rsp + 8]
	lea rsi, [rel kid_name]
	mov rdx, ITER
	mov al, 0
	call _asprintf
	cmp rax, -1
	je .end

	sub rsp, 16
	mov rdi, rsp
	lea rsi, [rel command_line]
	mov rdx, [rel rsp + 16]
	mov rcx, [rel rsp + 24]
	mov r8, [rel rsp + 24]
	mov al, 0
	call _asprintf
	cmp rax, -1
	je .end

	mov rdi, [rel rsp]
	call _system
	add rsp, 16

.end:
	add rsp, 16
	pop rbp
	mov rax, 0
	ret

%endmacro
section .text
	MAIN
