all:
	nasm -f bin -o vgacolor vgacolor.s

clean:
	rm vgacolor

run:	all
	qemu-system-i386 -hda vgacolor
