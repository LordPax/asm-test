.data
array: .quad 3, 6, 4, 2, 10, 8, 5, 9, 7, 1
arraySize: .quad 10
sum: .quad 0
text: .asciz "je suis un test\n"
text2: .asciz "test de merde\n"
textSize: .quad 16
textSize2: .quad 14
str_buffer: .space 32    # Buffer pour stocker la chaîne de caractères

.text
.global _start

_start:
	mov $array, %r8             # tableau
	mov $0, %r9                 # somme de array
	mov $0, %r10                # index de array
	mov arraySize, %r12         # arraySize de array

loop:
	cmp %r12, %r10              # r10 >= r12 ?
	jge exit                    # si oui exit
	add (%r8, %r10, 8), %r9     # r9 += r8[r10]
	inc %r10                    # r10++
	call writeVal
	jmp loop

writeVal:
	mov $text, %rsi             # buf = text
	mov textSize, %rdx          # size
	call write

	// mov %r9, %rsi               # rdi = r9
	// call int_to_str

	mov $text2, %rsi            # buf = text
	mov textSize2, %rdx         # size
	call write
	ret

write:
	mov $1, %rax                # code fonction write(fd, buf, size)
	mov $1, %rdi                # fd = 1 : sortie standard
	syscall                     # appelle la fonction systeme
	ret

int_to_str:
	# TODO: faire la procedure

exit:
	mov %r9, sum                # sum = r9
	mov $60, %rax               # code fonction exit(0)
	mov $0, %rdi                # 0
	syscall
