
FILE_NAME =  indirect_direct-offset_register-indirect
GDB_FLAGS = -g -F stabs 
NASM_FLAGS = -f elf #elf64 for 64 bit
LINKER_FLAGS = -m elf_i386 # elf_x86_64 for 64bit

all: test.out

test.out: out.o
	ld ${LINKER_FLAGS} out.o -o test.out 

out.o: ${FILE_NAME}.asm
	nasm ${NASM_FLAGS} ${GDB_FLAGS} ${FILE_NAME}.asm -o out.o


clean:
	rm -rf out.o *.out .*.swp* *~
