; SPDX-License-Identifier: BSD-3-Clause

section .text

global get_max

get_max:
	push ebp
	mov ebp, esp

	; save ebx in callee
	push ebx

	; [ebp+8] is array pointer
	; [ebp+12] is array length

	mov ebx, [ebp+8]
	mov ecx, [ebp+12]
	mov edx, [ebp+16]
	xor eax, eax
	xor esi, esi

compare:
	cmp eax, [ebx+ecx*4-4]
	jge check_end
	mov eax, [ebx+ecx*4-4]
	mov esi, ecx
	dec esi
	mov [edx], esi
check_end:
	loopnz compare

	pop ebx

	leave
	ret
