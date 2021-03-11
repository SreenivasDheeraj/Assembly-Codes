; Q2) Choose a random number 20 ≤ R ≤ 100, write ALP by using loops for printing the numbers (i.e. from 1 to
; R) and display the result as the output.


%include    'utils_fun.asm'
section .data
	num     dd 123 
section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   mov      ecx, [num]
   mov      eax, 1
	
l1:
   
   push     ecx
	
   call     print_int_lf    ; print eax (int) along with newline
    
   inc      eax
   pop      ecx
   loop     l1
	
   call     exit_prog
