;let me be real, I know this file sucks but hey, if it works, it works doesn't it?
;this file scans the board to see if the user meets a soon to be win condition
extern printf
section .data

section .text
global hardCpuMove

hardCpuMove:

row1:
        cmp [rdi + 1], byte 'x'
        jne  row12

        mov r9b, [rdi+1]
        cmp r9b, [rdi+2]
        jne row12

        mov r9b, [rdi+2]
        cmp r9b, [rdi+3]
        jne row12
        mov rsi, 4
        cmp [rdi+4], byte 'o'
        je row12
        jne found

row12:
        cmp [rdi + 4], byte 'x'
        jne  row13

        mov r9b, [rdi+4]
        cmp r9b, [rdi+3]
        jne row13
        mov r9b, [rdi+3]
        cmp r9b, [rdi+2]
        jne row13
        mov rsi, 1
        cmp [rdi+1], byte 'o'
        je row13
        jne found

row13:
        cmp [rdi + 1], byte 'x'
        jne  row14

        mov r9b, [rdi+1]
        cmp r9b, [rdi+2]
        jne row14
        mov r9b, [rdi+2]
        cmp r9b, [rdi+4]
        jne row14
        mov rsi, 3
        cmp [rdi+3], byte 'o'
        je row14
        jne found

row14:
        cmp [rdi + 4], byte 'x'
        jne  row2

        mov r9b, [rdi+4]
        cmp r9b, [rdi+3]
        jne row2
        mov r9b, [rdi+3]
        cmp r9b, [rdi+1]
        jne row2
        mov rsi, 2
        cmp [rdi+2], byte 'o'
        je row2
        jne found

row2:
        cmp [rdi+5], byte 'x'
        jne row22

        mov r9b, [rdi+5]
        cmp r9b, [rdi+6]
        jne row22

        mov r9b, [rdi+6]
        cmp r9b, [rdi+7]
        jne row22
        mov rsi, 8
        cmp [rdi+8], byte 'o'
        je row22
        jne found

row22:
        cmp [rdi+8], byte 'x'
        jne row23

        mov r9b, [rdi+8]
        cmp r9b, [rdi+7]
        jne row23

        mov r9b, [rdi+7]
        cmp r9b, [rdi+6]
        jne row23
        mov rsi, 5
        cmp [rdi+5], byte 'o'
        je row23
        jne found

row23:
        cmp [rdi+5], byte 'x'
        jne row24

        mov r9b, [rdi+5]
        cmp r9b, [rdi+6]
        jne row24

        mov r9b, [rdi+6]
        cmp r9b, [rdi+8]
        jne row24
        mov rsi, 7
        cmp [rdi+7], byte 'o'
        je row24
        jne found

row24:
        cmp [rdi+8], byte 'x'
        jne row3

        mov r9b, [rdi+8]
        cmp r9b, [rdi+7]
        jne row3

        mov r9b, [rdi+7]
        cmp r9b, [rdi+5]
        jne row3
        mov rsi, 6
        cmp [rdi+6], byte 'o'
        je row3
        jne found


row3:
        cmp [rdi+9], byte 'x'
        jne row32

        mov r9b, [rdi+9]
        cmp r9b, [rdi+10]
        jne row32

        mov r9b, [rdi+10]
        cmp r9b, [rdi+11]
        jne row32
        mov rsi, 12
        cmp [rdi+12], byte 'o'
        je row32
        jne found

row32:
        cmp [rdi+12], byte 'x'
        jne row33

        mov r9b, [rdi+12]
        cmp r9b, [rdi+11]
        jne row33

        mov r9b, [rdi+11]
        cmp r9b, [rdi+10]
        jne row33
        mov rsi, 9
        cmp [rdi+9], byte 'o'
        je row33
        jne found

row33:
        cmp [rdi+9], byte 'x'
        jne row34

        mov r9b, [rdi+9]
        cmp r9b, [rdi+10]
        jne row34

        mov r9b, [rdi+10]
        cmp r9b, [rdi+12]
        jne row34
        mov rsi, 11
        cmp [rdi+11], byte 'o'
        je row34
        jne found

row34:
        cmp [rdi+12], byte 'x'
        jne row4

        mov r9b, [rdi+12]
        cmp r9b, [rdi+11]
        jne row4

        mov r9b, [rdi+11]
        cmp r9b, [rdi+9]
        jne row4
        mov rsi, 10
        cmp [rdi+10], byte 'o'
        je row4
        jne found

row4:
        cmp [rdi+13], byte 'x'
        jne row42

        mov r9b, [rdi+13]
        cmp r9b, [rdi+14]
        jne row42

        mov r9b, [rdi+14]
        cmp r9b, [rdi+15]
        jne row42
        mov rsi, 16
        cmp [rdi+16], byte 'o'
        je row42
        jne found

row42:
        cmp [rdi+16], byte 'x'
        jne row43

        mov r9b, [rdi+16]
        cmp r9b, [rdi+15]
        jne row43

        mov r9b, [rdi+15]
        cmp r9b, [rdi+14]
        jne row43
        mov rsi, 13
        cmp [rdi+13], byte 'o'
        je row43
        jne found

row43:
        cmp [rdi+16], byte 'x'
        jne row44

        mov r9b, [rdi+16]
        cmp r9b, [rdi+15]
        jne row44

        mov r9b, [rdi+15]
        cmp r9b, [rdi+13]
        jne row44
        mov rsi, 14
        cmp [rdi+14], byte 'o'
        je row44
        jne found

row44:
        cmp [rdi+13], byte 'x'
        jne column1

        mov r9b, [rdi+13]
        cmp r9b, [rdi+14]
        jne column1

        mov r9b, [rdi+14]
        cmp r9b, [rdi+16]
        jne column1
        mov rsi, 15
        cmp [rdi+15], byte 'o'
        je column1
        jne found


column1:
        cmp [rdi+1], byte 'x'
        jne column12

        mov r9b, [rdi+1]
        cmp r9b, [rdi+5]
        jne column12

        mov r9b, [rdi+5]
        cmp r9b, [rdi+9]
        jne column12
        mov rsi, 13
        cmp [rdi+13], byte 'o'
        je column12
        jne found

column12:
        cmp [rdi+13], byte 'x'
        jne column13

        mov r9b, [rdi+13]
        cmp r9b, [rdi+9]
        jne column13

        mov r9b, [rdi+9]
        cmp r9b, [rdi+5]
        jne column13
        mov rsi, 1
        cmp [rdi+1], byte 'o'
        je column13
        jne found

column13:
        cmp [rdi+1], byte 'x'
        jne column14

        mov r9b, [rdi+1]
        cmp r9b, [rdi+5]
        jne column14

        mov r9b, [rdi+5]
        cmp r9b, [rdi+13]
        jne column14
        mov rsi, 9
        cmp [rdi+9], byte 'o'
        je column14
        jne found

column14:
        cmp [rdi+13], byte 'x'
        jne column2

        mov r9b, [rdi+13]
        cmp r9b, [rdi+9]
        jne column2

        mov r9b, [rdi+9]
        cmp r9b, [rdi+1]
        jne column2
        mov rsi, 5
        cmp [rdi+5], byte 'o'
        je column2
        jne found


column2:
        cmp [rdi+2], byte 'x'
        jne column22

        mov r9b, [rdi+2]
        cmp r9b, [rdi+6]
        jne column22

        mov r9b, [rdi+6]
        cmp r9b, [rdi+10]
        jne column22
        mov rsi, 14
        cmp [rdi+14], byte 'o'
        je column22
        jne found

column22:
        cmp [rdi+14], byte 'x'
        jne column23

        mov r9b, [rdi+14]
        cmp r9b, [rdi+10]
        jne column23

        mov r9b, [rdi+10]
        cmp r9b, [rdi+6]
        jne column23
        mov rsi, 2
        cmp [rdi+2], byte 'o'
        je column23
        jne found

column23:
        cmp [rdi+2], byte 'x'
        jne column24

        mov r9b, [rdi+2]
        cmp r9b, [rdi+6]
        jne column24

        mov r9b, [rdi+6]
        cmp r9b, [rdi+14]
        jne column24
        mov rsi, 10
        cmp [rdi+10], byte 'o'
        je column23
        jne found

column24:
        cmp [rdi+14], byte 'x'
        jne column3

        mov r9b, [rdi+14]
        cmp r9b, [rdi+10]
        jne column3

        mov r9b, [rdi+10]
        cmp r9b, [rdi+2]
        jne column3
        mov rsi, 6
        cmp [rdi+6], byte 'o'
        je column3
        jne found

column3:
        cmp [rdi+3], byte 'x'
        jne column32

        mov r9b, [rdi+3]
        cmp r9b, [rdi+7]
        jne column32

        mov r9b, [rdi+7]
        cmp r9b, [rdi+11]
        jne column32
        mov rsi, 15
        cmp [rdi+15], byte 'o'
        je column32
        jne found

column32:
        cmp [rdi+15], byte 'x'
        jne column33

        mov r9b, [rdi+15]
        cmp r9b, [rdi+11]
        jne column33

        mov r9b, [rdi+11]
        cmp r9b, [rdi+7]
        jne column33
        mov rsi, 3
        cmp [rdi+3], byte 'o'
        je column33
        jne found

column33:
        cmp [rdi+3], byte 'x'
        jne column34

        mov r9b, [rdi+3]
        cmp r9b, [rdi+7]
        jne column34

        mov r9b, [rdi+7]
        cmp r9b, [rdi+15]
        jne column34
        mov rsi, 11
        cmp [rdi+11], byte 'o'
        je column34
        jne found

column34:
        cmp [rdi+15], byte 'x'
        jne column4

        mov r9b, [rdi+15]
        cmp r9b, [rdi+11]
        jne column4

        mov r9b, [rdi+11]
        cmp r9b, [rdi+3]
        jne column4
        mov rsi, 7
        cmp [rdi+7], byte 'o'
        je column4
        jne found


column4:
        cmp [rdi+4], byte 'x'
        jne column42

        mov r9b, [rdi+4]
        cmp r9b, [rdi+8]
        jne column42

        mov r9b, [rdi+8]
        cmp r9b, [rdi+12]
        jne column42
        mov rsi, 16
        cmp [rdi+16], byte 'o'
        je column42
        jne found

column42:
        cmp [rdi+16], byte 'x'
        jne column43

        mov r9b, [rdi+16]
        cmp r9b, [rdi+12]
        jne column43

        mov r9b, [rdi+12]
        cmp r9b, [rdi+8]
        jne column43
        mov rsi, 4
        cmp [rdi+4], byte 'o'
        je column43
        jne found

column43:
        cmp [rdi+4], byte 'x'
        jne column44

        mov r9b, [rdi+4]
        cmp r9b, [rdi+8]
        jne column44

        mov r9b, [rdi+8]
        cmp r9b, [rdi+16]
        jne column44
        mov rsi, 12
        cmp [rdi+12], byte 'o'
        je column44
        jne found

column44:
        cmp [rdi+16], byte 'x'
        jne diagonal1

        mov r9b, [rdi+16]
        cmp r9b, [rdi+12]
        jne diagonal1

        mov r9b, [rdi+12]
        cmp r9b, [rdi+4]
        jne diagonal1
        mov rsi, 8
        cmp [rdi+8], byte 'o'
        je diagonal1
        jne found

diagonal1:
        cmp [rdi+1], byte 'x'
        jne diagonal12

        mov r9b, [rdi+1]
        cmp r9b, [rdi+6]
        jne diagonal12

        mov r9b, [rdi+6]
        cmp r9b, [rdi+11]
        jne diagonal12
        mov rsi, 16
        cmp [rdi+16], byte 'o'
        je diagonal12
        jne found

diagonal12:
        cmp [rdi+16], byte 'x'
        jne diagonal13

        mov r9b, [rdi+16]
        cmp r9b, [rdi+11]
        jne diagonal13

        mov r9b, [rdi+11]
        cmp r9b, [rdi+6]
        jne diagonal13
        mov rsi, 1
        cmp [rdi+1], byte 'o'
        je diagonal13
        jne found

diagonal13:
        cmp [rdi+1], byte 'x'
        jne diagonal14

        mov r9b, [rdi+1]
        cmp r9b, [rdi+6]
        jne diagonal14

        mov r9b, [rdi+6]
        cmp r9b, [rdi+16]
        jne diagonal14
        mov rsi, 11
        cmp [rdi+11], byte 'o'
        je diagonal14
        jne found

diagonal14:
        cmp [rdi+16], byte 'x'
        jne diagonal2

        mov r9b, [rdi+16]
        cmp r9b, [rdi+11]
        jne diagonal2

        mov r9b, [rdi+11]
        cmp r9b, [rdi+1]
        jne diagonal2
        mov rsi, 6
        cmp [rdi+6], byte 'o'
        je diagonal2
        jne found

        ;; diagonal 2
diagonal2:
        cmp [rdi+4], byte 'x'
        jne diagonal22

        mov r9b, [rdi+4]
        cmp r9b, [rdi+7]
        jne diagonal22

        mov r9b, [rdi+7]
        cmp r9b, [rdi+10]
        jne diagonal22
        mov rsi, 13
        cmp [rdi+13], byte 'o'
        je diagonal22
        jne found

diagonal22:
        cmp [rdi+13], byte 'x'
        jne diagonal23

        mov r9b, [rdi+13]
        cmp r9b, [rdi+10]
        jne diagonal23

        mov r9b, [rdi+10]
        cmp r9b, [rdi+7]
        jne diagonal23
        mov rsi, 4
        cmp [rdi+4], byte 'o'
        je diagonal23
        jne found

diagonal23:
    cmp [rdi+4], byte 'x'
        jne diagonal24

        mov r9b, [rdi+4]
        cmp r9b, [rdi+7]
        jne diagonal24

        mov r9b, [rdi+7]
        cmp r9b, [rdi+13]
        jne diagonal24
        mov rsi, 10
        cmp [rdi+10], byte 'o'
        je diagonal24
        jne found

diagonal24:
        cmp [rdi+13], byte 'x'
        jne noFound

        mov r9b, [rdi+13]
        cmp r9b, [rdi+10]
        jne noFound

        mov r9b, [rdi+10]
        cmp r9b, [rdi+4]
        jne noFound
        mov rsi, 7
        cmp [rdi+7], byte 'o'
        je noFound
        jne found

noFound:
        xor rsi, rsi
        mov rsi, 20
        ret

found:
        mov rax, rsi
        xor rsi, rsi
        ret