bits	16
org	0x7C00

	mov		ax,		0x13
	int		0x10

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

	mov 		cx,		3
rep	outsb

	adc		byte [r],	1
	jnc		set

	adc		byte [g],	1
	jnc		set

	adc		byte [b],	1

set:	or		byte [r],	0xC0
	or		byte [g],	0xC0
	or		byte [b],	0xC0

	jmp		start

color:
r:			db		0xC0
g:			db		0xC0
b:			db		0xC0

times	510-($-$$) 	db		0
			db		0x55
			db		0xAA
