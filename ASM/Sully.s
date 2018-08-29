%define ITER 5
section .data
src: db '%%define ITER %d%csection .data%csrc: db %c%s%c, 0%c%c%%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400%c%%define S_IRWXU 0700o%c%%defstr KID_NAME_SRC Sully_%%d.s%c%%defstr KID_NAME Sully_%%d%c%%defstr COMMAND_LINE /Users/sclolus/.brew/bin/nasm -f macho64 %%s && /usr/bin/clang -Wall -Wextra -Werror %%s.o -o %%s && ./%%s%ckid_name_src: db KID_NAME_SRC, 0%ckid_name: db KID_NAME, 0%ccommand_line: db COMMAND_LINE, 0%cextern _dprintf%cextern _asprintf%cextern _system%cextern _open%c%c%%macro MAIN 0%cglobal _main%c_main:%c	;asm quine%c%c	push rbp%c	mov rbp, rsp%c	sub rsp, 16%c%c	mov rax, ITER%c	cmp rax, 0%c	je .end%c%c	mov rdi, rsp%c	lea rsi, [rel kid_name_src]%c	mov rdx, ITER%c	mov al, 0%c	call _asprintf%c	cmp rax, -1%c	je .end%c%c	mov rdi, [rel rsp]%c	mov rsi, WRCREAT_TRUNC%c	mov rdx, S_IRWXU%c	call _open%c	cmp rax, -1%c	je .end%c%c	mov rdi, rax%c	lea rsi, [rel src]%c	mov rdx, ITER%c	dec rdx%c	mov rcx, 10%c	mov r8, 10%c	mov r9, 39%c	sub rsp, 864%c%c	lea rax, [rel src]%c	mov qword [rsp], rax%c	mov word [rsp + 8], 39%c%c	mov r11, 16%c.set_stack:%c	mov rax, r11%c	add rax, rsp%c	mov word [rax], 10%c	add r11, 8%c	cmp r11, 864%c	jne .set_stack%c%c	mov al, 0%c	call _dprintf%c	add rsp, 864%c%c	lea rdi, [rel rsp + 8]%c	lea rsi, [rel kid_name]%c	mov rdx, ITER%c	mov al, 0%c	call _asprintf%c	cmp rax, -1%c	je .end%c%c%c	sub rsp, 16%c	mov rdi, rsp%c	lea rsi, [rel command_line]%c	mov rdx, [rel rsp + 16]%c	mov rcx, [rel rsp + 24]%c	mov r8, [rel rsp + 24]%c	mov r9, [rel rsp + 24]%c	mov al, 0%c	call _asprintf%c	cmp rax, -1%c	je .end%c%c	mov rdi, [rel rsp]%c	call _system%c	add rsp, 16%c%c.end:%c	add rsp, 16%c	pop rbp%c	mov rax, 0%c	ret%c%c%%endmacro%csection .text%c	MAIN%c', 0

%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400
%define S_IRWXU 0700o
%defstr KID_NAME_SRC Sully_%d.s
%defstr KID_NAME Sully_%d
%defstr COMMAND_LINE /Users/sclolus/.brew/bin/nasm -f macho64 %s && /usr/bin/clang -Wall -Wextra -Werror %s.o -o %s && ./%s
kid_name_src: db KID_NAME_SRC, 0
kid_name: db KID_NAME, 0
command_line: db COMMAND_LINE, 0
extern _dprintf
extern _asprintf
extern _system
extern _open

%macro MAIN 0
global _main
_main:
	;asm quine

	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rax, ITER
	cmp rax, 0
	je .end

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
	mov rdx, ITER
	dec rdx
	mov rcx, 10
	mov r8, 10
	mov r9, 39
	sub rsp, 864

	lea rax, [rel src]
	mov qword [rsp], rax
	mov word [rsp + 8], 39

	mov r11, 16
.set_stack:
	mov rax, r11
	add rax, rsp
	mov word [rax], 10
	add r11, 8
	cmp r11, 864
	jne .set_stack

	mov al, 0
	call _dprintf
	add rsp, 864

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
	mov r9, [rel rsp + 24]
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

