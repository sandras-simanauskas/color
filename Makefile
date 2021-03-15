all:
	as -o vgacolor.o vgacolor.s
	ld -o vgacolor -Ttext 0x7C00 --oformat=binary vgacolor.o

run:	all
	qemu-system-i386 -hda vgacolor

clean:
	rm -f vgacolor vgacolor.o
