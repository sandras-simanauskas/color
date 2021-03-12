all:
	nasm -o vgacolor -f bin vgacolor.s

run:	all
	qemu-system-i386 -hda vgacolor

clean:
	rm -f vgacolor
