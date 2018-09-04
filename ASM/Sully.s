%define ITER 5
section .data
src: db '%%define ITER %d%csection .data%csrc: db %c%s%c, 0%c%c%%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400%c%%define O_EXCL 0x0800%c%%define WRCREAT_EXCL 0x0001 | 0x0200 | O_EXCL%c%%define S_IRWXU 0700o%c%%defstr KID_NAME_SRC Sully_%%d.s%c%%defstr KID_NAME Sully_%%d%c%%defstr COMMAND_LINE /Users/sclolus/.brew/bin/nasm -f macho64 %%s && /usr/bin/clang -Wall -Wextra -Werror %%s.o -o %%s && rm -f %%s.o && ./%%s%ckid_name_src: db KID_NAME_SRC, 0%ckid_name: db KID_NAME, 0%ccommand_line: db COMMAND_LINE, 0%cextern _dprintf%cextern _asprintf%cextern _system%cextern _open%c%c%%macro MAIN 0%cglobal _main%c_main:%c;asm quine%c%cpush rbp%cmov rbp, rsp%csub rsp, 16%c%cmov rax, ITER%ccmp rax, 1%cjl .end%cinc rax%cmov qword [rbp - 8], rax%c%cmov rdi, rsp%clea rsi, [rel kid_name_src]%cmov rdx, qword [rbp - 8]%cdec rdx%cmov al, 0%ccall _asprintf%ccmp rax, -1%cje .end%c%cmov rdi, [rel rsp]%cmov rsi, WRCREAT_EXCL%cmov rdx, S_IRWXU%ccall _open%ccmp rax, -1%cje .dec_iter%cjmp .continue%c.dec_iter:%cmov rax, qword[rbp - 8]%cdec rax%cmov qword [rbp - 8], rax%c%c.continue:%cmov rdi, rsp%clea rsi, [rel kid_name_src]%cmov rdx, qword [rbp - 8]%cdec rdx%cmov al, 0%ccall _asprintf%ccmp rax, -1%cje .end%c%cmov rdi, [rel rsp]%cmov rsi, WRCREAT_TRUNC%cmov rdx, S_IRWXU%ccall _open%ccmp rax, -1%cje .end%c%cmov rdi, rax%clea rsi, [rel src]%cmov rdx, qword [rbp - 8]%cdec rdx%cmov rcx, 10%cmov r8, 10%cmov r9, 39%csub rsp, 2192%c%clea rax, [rel src]%cmov qword [rsp], rax%cmov word [rsp + 8], 39%c%cmov r11, 16%c.set_stack:%cmov rax, r11%cadd rax, rsp%cmov word [rax], 10%cadd r11, 8%ccmp r11, 2192%cjne .set_stack%c%cmov al, 0%ccall _dprintf%cadd rsp, 2192%c%clea rdi, [rel rsp + 8]%clea rsi, [rel kid_name]%cmov rdx, qword [rbp - 8]%cdec rdx%cmov al, 0%ccall _asprintf%ccmp rax, -1%cje .end%c%c%csub rsp, 16%cmov rdi, rsp%clea rsi, [rel command_line]%cmov rdx, [rel rsp + 16]%cmov rcx, [rel rsp + 24]%cmov r8, [rel rsp + 24]%cmov r9, [rel rsp + 24]%cmov rax, [rel rsp + 24]%cmov qword [rsp], rax%cmov al, 0%ccall _asprintf%ccmp rax, -1%cje .end%c%cmov rdi, [rel rsp]%ccall _system%cadd rsp, 16%c%c.end:%cadd rsp, 16%cpop rbp%cmov rax, 0%cret%c%c%%endmacro%csection .text%cMAIN%c', 0

%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400
%define O_EXCL 0x0800
%define WRCREAT_EXCL 0x0001 | 0x0200 | O_EXCL
%define S_IRWXU 0700o
%defstr KID_NAME_SRC Sully_%d.s
%defstr KID_NAME Sully_%d
%defstr COMMAND_LINE /Users/sclolus/.brew/bin/nasm -f macho64 %s && /usr/bin/clang -Wall -Wextra -Werror %s.o -o %s && rm -f %s.o && ./%s
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
cmp rax, 1
jl .end
inc rax
mov qword [rbp - 8], rax

mov rdi, rsp
lea rsi, [rel kid_name_src]
mov rdx, qword [rbp - 8]
dec rdx
mov al, 0
call _asprintf
cmp rax, -1
je .end

mov rdi, [rel rsp]
mov rsi, WRCREAT_EXCL
mov rdx, S_IRWXU
call _open
cmp rax, -1
je .dec_iter
jmp .continue
.dec_iter:
mov rax, qword[rbp - 8]
dec rax
mov qword [rbp - 8], rax

.continue:
mov rdi, rsp
lea rsi, [rel kid_name_src]
mov rdx, qword [rbp - 8]
dec rdx
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
mov rdx, qword [rbp - 8]
dec rdx
mov rcx, 10
mov r8, 10
mov r9, 39
sub rsp, 2192

lea rax, [rel src]
mov qword [rsp], rax
mov word [rsp + 8], 39

mov r11, 16
.set_stack:
mov rax, r11
add rax, rsp
mov word [rax], 10
add r11, 8
cmp r11, 2192
jne .set_stack

mov al, 0
call _dprintf
add rsp, 2192

lea rdi, [rel rsp + 8]
lea rsi, [rel kid_name]
mov rdx, qword [rbp - 8]
dec rdx
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
mov rax, [rel rsp + 24]
mov qword [rsp], rax
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
