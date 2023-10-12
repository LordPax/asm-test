.data
tab: .quad 3, 6, 4, 2
taille: .quad 4
som: .quad 0
format: .asciz "je suis un test\n"
format_size: .quad 17

.text
.global _start

_start:
	mov $tab, %r8               # tableau
	mov $0, %r9                 # somme de tab
	mov $0, %r10                # index de tab
	mov taille, %r13            # taille de tab
	mov format_size, %r12       # taille de format

boucle:
	cmp %r13, %r10               # r10 >= r13 ?
	jge exit                     # si oui exit
	add (%r8, %r10, 8), %r9      # r9 += r8[r10]
	inc %r10                     # r10++
	call write
	jmp boucle

write:
	mov $1, %rax                # code fonction write(fd, buf, size)
	mov $1, %rdi                # fd = 1 : sortie standard
	mov $format, %rsi           # buf = format
	mov %r12, %rdx              # size
	syscall                      # appelle la fonction systeme
	ret

exit:
	mov %r9, som                # som = r9
	mov $60, %rax                # code fonction exit(0)
	mov $0, %rdi                 # 0
	syscall
