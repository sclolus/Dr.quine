	extern _printf
	extern _exit
	section .data
source: db '%cextern _printf%c%csection.data%csource: db %c%s%c%cparams: db 9, 10, 9, 10, 39, 0, 39, 10, 9, 10, 10, 10%cparams_len: equ $-params%c%csection .text%c%c%cglobal_main%c_main:%c', 0
params: db 9, 10, 9, 10, 39, 0, 39, 10, 10, 10, 9, 10, 10
params_len:	equ $-params
	section .text

	global _main
_main:
	push rbp
	mov rbp, rsp

	lea rdi, [rel source]
	mov rsi, 9
	mov rdi, 10
	mov rcx, 9
	mov r8, 10
	mov r9, 39
	lea rax, [rel source]

	sub rsp, 16
	sub rsp, 80

	mov qword [rsp], rax
	mov word [rsp + 8], 39
	mov word [rsp + 16], 10
	mov word [rsp + 24], 10
	mov word [rsp + 32], 10
	mov word [rsp + 40], 9
	mov word [rsp + 48], 10
	mov word [rsp + 56], 10
	mov word [rsp + 64], 9
	mov word [rsp + 72], 10
	mov word [rsp + 80], 10

	mov al, 0
	call _printf
	add rsp, 80
	add rsp, 16

	pop rbp
	mov rax, 0
	ret
