.data # declaration data

hello: .string "hello world\n"
taille: .quad 12

.text # instruction
.global _start

_start:
	mov $1, %rax      # code fonction write(fd, buf, size)
	mov $1, %rdi      # fd : sur sortie standard
	mov $hello, %rsi  # buf : affiche val de rbx
	movq taille, %rdx # size : taille
	syscall

exit:
	mov $60, %rax
	mov $0, %rdi
	syscall
