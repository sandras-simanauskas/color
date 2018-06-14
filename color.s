org	0x7C00

mov	ax,		0x13
int	0x10

start:	mov		dx,		0x3DA

wait0:	in		al,		dx
	test		al,		8
	jnz		wait0

wait1:	in		al,		dx
	test		al,		8
	jz		wait1

	xor		al,		al
	mov		dx,		0x3C8
	out		dx,		al

	mov		dx,		0x3C9
	mov		si,		color

	mov 		ecx,		3
rep	outsb

	or		dword [color],	0xC0C0C0
	inc		dword [color]

	jmp		start

color:			dd		0xC0C0C0

times	510-($-$$) 	db		0
			dw		0xAA55
