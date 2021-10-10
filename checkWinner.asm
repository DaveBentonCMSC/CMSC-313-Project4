extern printf
section .data
userMsg:       db "YOU WIN.", 10, 0
cpuMsg:        db "COMPUTER WINS.", 10, 0
fmt:           db "%s", 0
section .text
global checkWinner

checkWinner:

        ;mov [moves], rdi
        ;push rdi

row1:
        cmp [rdi + 1], byte '_'
        je  row2

        mov r9b, [rdi+1]
        cmp r9b, [rdi+2]
        jne row2

        mov r9b, [rdi+2]
        cmp r9b, [rdi+3]
        jne row2

        mov r9b, [rdi+3]
        cmp r9b, [rdi+4]
        jne row2
        je winner

row2:
        cmp [rdi+5], byte '_'
        je row3

        mov r9b, [rdi+5]
        cmp r9b, [rdi+6]
        jne row3

        mov r9b, [rdi+6]
        cmp r9b, [rdi+7]
        jne row3

        mov r9b, [rdi+7]
        cmp r9b, [rdi+8]
        jne row3
        je winner

row3:
        cmp [rdi+9], byte '_'
        je row4

        mov r9b, [rdi+9]
        cmp r9b, [rdi+10]
        jne row4

        mov r9b, [rdi+10]
        cmp r9b, [rdi+11]
        jne row4

        mov r9b, [rdi+11]
        cmp r9b, [rdi+12]
        jne row4
        je winner

row4:
        cmp [rdi+13], byte '_'
        je column1

        mov r9b, [rdi+13]
        cmp r9b, [rdi+14]
        jne column1

        mov r9b, [rdi+14]
        cmp r9b, [rdi+15]
        jne column1

        mov r9b, [rdi+15]
        cmp r9b, [rdi+16]
        jne column1
        je winner

column1:
        cmp [rdi+1], byte '_'
        je column2

        mov r9b, [rdi+1]
        cmp r9b, [rdi+5]
        jne column2

        mov r9b, [rdi+5]
        cmp r9b, [rdi+9]
        jne column2

        mov r9b, [rdi+9]
        cmp r9b, [rdi+13]
        jne column2
        je winner

column2:
        cmp [rdi+2], byte '_'
        je column3

        mov r9b, [rdi+2]
        cmp r9b, [rdi+6]
        jne column3

        mov r9b, [rdi+6]
        cmp r9b, [rdi+10]
        jne column3

        mov r9b, [rdi+10]
        cmp r9b, [rdi+14]
        jne column3
        je winner

column3:
        cmp [rdi+3], byte '_'
        je column4

        mov r9b, [rdi+3]
        cmp r9b, [rdi+7]
        jne column4

        mov r9b, [rdi+7]
        cmp r9b, [rdi+11]
        jne column4

        mov r9b, [rdi+11]
        cmp r9b, [rdi+15]
        jne column4
        je winner

column4:
        cmp [rdi+4], byte '_'
        je diagonal1

        mov r9b, [rdi+4]
        cmp r9b, [rdi+8]
        jne diagonal1

        mov r9b, [rdi+8]
        cmp r9b, [rdi+12]
        jne diagonal1

        mov r9b, [rdi+12]
        cmp r9b, [rdi+16]
        jne diagonal1
        je winner

diagonal1:
        cmp [rdi+1], byte '_'
        je diagonal2

        mov r9b, [rdi+1]
        cmp r9b, [rdi+6]
        jne diagonal2

        mov r9b, [rdi+6]
        cmp r9b, [rdi+11]
        jne diagonal2

        mov r9b, [rdi+11]
        cmp r9b, [rdi+16]
        jne diagonal2
        je winner

        ;; diagonal 2
diagonal2:
        cmp [rdi+4], byte '_'
        je noWin

        mov r9b, [rdi+4]
        cmp r9b, [rdi+7]
        jne noWin

        mov r9b, [rdi+7]
        cmp r9b, [rdi+10]
        jne noWin

        mov r9b, [rdi+10]
        cmp r9b, [rdi+13]
        jne noWin
        je winner

noWin:
        xor rsi, rsi
        mov rsi, 20
        ret

winner:
        cmp r9b, byte 'x'
        je user
        cmp r9b, byte 'o'
        je comp
        ret

user:
        mov rdi, fmt
        mov rsi, userMsg
        mov rax, 0
        call printf
        mov ebp, 0
        ret

comp:
        mov rdi, fmt
        mov rsi, cpuMsg
        mov rax, 0
        call printf
        mov ebp, 0
        ret