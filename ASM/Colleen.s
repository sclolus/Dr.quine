extern _printf
section .data
src: db 'extern _printf%csection .data%csrc: db %c%s%c, 0%c%c; gotta need the printf m8%csection .text%cglobal _main%c_main:%c;asm quine%cpush rbp%cmov rbp, rsp%c%clea rdi, [rel src]%cmov rsi, 10%cmov rdx, 10%cmov rcx, 39%clea r8, [rel src]%cmov r9, 39%csub rsp, 16%csub rsp, 320%ccall _set_stack%cmov al, 0%ccall _printf%cadd rsp, 320%cadd rsp, 16%cpop rbp%cmov rax, 0%cret%c%c_set_stack:%cmov r11, 8%c.set_stack:%cmov rax, r11%cadd rax, rsp%cmov word [rax], 10%cadd r11, 8%ccmp r11, 328%cjne .set_stack%cret%c', 0

; gotta need the printf m8
section .text
global _main
_main:
;asm quine
push rbp
mov rbp, rsp

lea rdi, [rel src]
mov rsi, 10
mov rdx, 10
mov rcx, 39
lea r8, [rel src]
mov r9, 39
sub rsp, 16
sub rsp, 320
call _set_stack
mov al, 0
call _printf
add rsp, 320
add rsp, 16
pop rbp
mov rax, 0
ret

_set_stack:
mov r11, 8
.set_stack:
mov rax, r11
add rax, rsp
mov word [rax], 10
add r11, 8
cmp r11, 328
jne .set_stack
ret
