
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                               syscall.asm
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                                                     Forrest Yu, 2005
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%include "sconst.inc"

INT_VECTOR_SYS_CALL	equ	0x90
_NR_get_ticks		equ	0
_NR_write		equ	1

; 导出符号
global	get_ticks
global	write


bits 32
[section .text]

; 注意：dx 的值在 save() 中被改变，所以传递参数不能使用 edx！

; ====================================================================================
;                                    get_ticks
; ====================================================================================
get_ticks:
	mov	eax, _NR_get_ticks
	int	INT_VECTOR_SYS_CALL
	ret


; ====================================================================================
;                          void write(char* buf, int len);
; ====================================================================================
write:
	mov	eax, _NR_write
	mov	ebx, [esp + 4]
	mov	ecx, [esp + 8]
	int	INT_VECTOR_SYS_CALL
	ret

