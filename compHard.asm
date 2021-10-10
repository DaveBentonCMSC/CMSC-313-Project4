    extern drawBoard
    extern randomNum
    extern checkWinner
    extern hardCpuMove
    extern scanf
    extern printf

    section .data
moves:      db "X________________"
request:    db "Enter a location on the board 1-16: ", 10, 0
fmt:        db "%s", 0
fmtin:      db "%d", 0
outfmt:     db "%i", 10, 0
linebreak:  db "  ", 10, 0
errorMsg:   db "This is not an empty space. Try Again.", 10, 0
noWinner:   db "Nobody has won. It's a draw.", 10, 0

    section .bss
int1:       resb 4

    section .text
    global compHard

compHard:
        ;print board
        mov rdi, moves
        call drawBoard

        ;loop until board is full or end condition is met
        xor ebp, ebp
        mov ebp, 8
        outloop:

        loop1:
        ;loop this until they give us 1-16 and the spot isn't taken
        ;print request for user int
        mov rdi, fmt
        mov rsi, request
        mov rax, 0
        call printf


        ;get user int
        mov rdi, fmtin
        mov rsi, int1
        mov rax, 0
        call scanf

        ;places user int in rax to index moves
        xor rax, rax
        mov al, [int1]
        cmp [moves + rax], byte '_' ;makes sure user move is valid
        je contin ; if not valid jump to error message
        jne error ; if valid jump to place user move


        ;validates user input
        error:
        ; prints error message
        mov rdi, fmt
        mov rsi, errorMsg
        mov rax, 0
        call printf
        jmp loop1 ; jumps back to user input loop (loop1)
        ;end input loop

        contin:
        ;place user int
        mov al, [int1]
        mov [moves + rax], byte 'x'

        ;checks if user won
        mov rdi, moves
        call checkWinner
        cmp ebp, 0
        je end

        ;draw board again
        mov rdi, moves
        call drawBoard
        jmp loop2


        loop2:
        mov rdi, moves
        call hardCpuMove
        cmp rsi, 20
        je cpuRand
        jne cpuFound
        ;mov rax, rsi

        cpuRand:
        ;call getrandom
        call randomNum
        ;validates cpu move
        cpuFound:
        cmp [moves + rax], byte '_' ; compares cpu move to empty spot
        jne cpuRand ; repeats loop until finds an empty spot

        ;cpuFound:
        ;place cpu move

        mov [moves + rax], byte 'o'

        ;prints a line break to make viewing the boards easier
        mov rdi, fmt
        mov rsi, linebreak
        mov rax, 0
        call printf

        ;prints board again
        mov rdi, moves
        call drawBoard

        ;checkwinner
        dec ebp ; decrements move loop counter
        xor rdi, rdi ; clears registers
        xor rsi, rsi
        mov rdi, moves

        call checkWinner
        cmp ebp, 0
        jne outloop ; no winner and board isn't full, loop back to top
        je end ; board is full or there is a winner, jump to end

        ;end play loop
        end:
        ;checks if a draw
        cmp rsi, 20 ; if board full and no winner
        je draw ; jumps to print draw message

        drawRet:
        mov ecx, 16 ; used to loop to reset board
        clearLoop:
        mov[moves + ecx], byte '_' ; resets current spot on board
        dec ecx
        jnz clearLoop ; loops until clean board
        ret ; ends game

        ;prints draw message
        draw:
        mov rdi, fmt
        mov rsi, noWinner
        mov rax, 0
        call printf
        jmp drawRet