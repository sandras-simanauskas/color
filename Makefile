vgacolor: vgacolor.s
	as -o vgacolor.o vgacolor.s
	ld -o vgacolor -Ttext 0x7C00 --oformat=binary vgacolor.o

clean:
	rm -f vgacolor vgacolor.o
