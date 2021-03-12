all:
	nasm -f bin -o vgacolor vgacolor.s

run:	all
	qemu-system-i386 -hda vgacolor

clean:
	rm -f vgacolor
