fgets: fgets.o
	gcc fgets.o -o fgets -no-pie
fgets.o: fgets.asm
	nasm -f elf64 -g -F dwarf fgets.asm
