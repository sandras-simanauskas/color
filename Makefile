all:
	nasm -f bin -o color color.s

clean:
	rm color

run:	all
	qemu-system-i386 -hda color
