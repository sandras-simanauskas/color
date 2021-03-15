.code16
.global _start

_start:
	// Set VGA mode 0x13.

	movw $0x13, %ax
	int $0x10

loop:

	// Wait until vertical retrace begins.

	movw $0x3DA, %dx

wait0:	in %dx, %al
	testb $8, %al
	jnz wait0

	// Wait until vertical retrace ends.

wait1:	in %dx, %al
	testb $8, %al
	jz wait1

	// Select color index 0.

	xorb %al, %al
	movw $0x3C8, %dx
	out %al, %dx

	// Write the color.

	movw $0x3C9, %dx
	movw $color, %si
	movw $3, %cx
rep	outsb

	// Increment the color.

	adcb $1, (r)
	jnc set

	adcb $1, (g)
	jnc set

	adcb $1, (b)

set:	orb $0xC0, (r)
	orb $0xC0, (g)
	orb $0xC0, (b)

	jmp loop

color:
r:	.byte 0xC0
g:	.byte 0xC0
b:	.byte 0xC0

. = _start + 510
	.byte 0x55
	.byte 0xAA
