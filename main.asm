	;this is the main file for tic-tac-toe(4x4) and controls the main menu/easter egg
	extern compEasy
	extern compHard
	extern printf
	extern scanf

	
	section .data
fmtin:      db "%c",0 ; format for menu input
fmtin2:     db "%s", 0 ; format for easter egg input
fmtout:     db "%s", 10, 0 ; format for output
;format for easter egg output
fmtNameOut: db 34,"Well %s, it's very rude to wake people. Don't be so lame next time.",34,10, 0
;items for the menu
welcome:	db "Welcome to TIC-TAC-ASSEMBLY", 10
menu:		db "Pick an option from the menu below:", 10
a:		    db "a - Easy", 10
b:		    db "b - Hard", 10
q:		    db "q - quit",0
badInput:   db "Invalid Menu Choice", 10, 0
;items for the easter egg
secretmsg6: db "| |      | |      | |  \/  \/\_| |_/\___/   \/  \/\_| |_/\_| \_/\____/\____/  \_|  |_/\____/ (_) ",0
secretmsg8: db "         |_|                                                                                      ", 0
secretmsg:  db "  __      _      __    _    _ _   _ _____   _    _  ___   _   __ _____ _____  ___  ___ _____ ___", 0
secretmsg2: db " / /     | |     \ \  | |  | | | | |  _  | | |  | |/ _ \ | | / /|  ___/  ___| |  \/  ||  ___|__ \", 0
secretmsg5: db "| |      | |      | | \  /\  / | | \ \_/ / \  /\  / | | || |\  \| |___/\__/ / | |  | || |___ |_|  ",0
secretmsg7: db "\_\      | |     /_/                                                                              ",0
secretmsg4: db "| |______| |______| | | |/\| |  _  | | | | | |/\| |  _  ||    \ |  __| `--. \ | |\/| ||  __|  / /", 0
secretmsg3: db "| |______| |______| | | |  | | |_| | | | | | |  | / /_\ \| |/ / | |__ \ `--.  | .  . || |__    ) |", 0
secretmsg9: db "Enter your name: ", 0



	section .bss
menuAns:	resb 1 ; for the menu input
name:       resb 60 ; for easter egg
	section .text

	global main

main:
    mov ebp, 4 ; used to track how many c's are entered
    menuLoop:
	call menuCall ; prints menu and take input

	;determines where to go from menu input
    cmp [menuAns], byte 'a' ; if user entered a
    je easyPlay ; goes to easy mode
    cmp [menuAns], byte 'b' ; if user entered b
    je hardPlay ; goes to hard mode
    cmp [menuAns], byte 'q' ; if user entered q
    je exit ; ends
    jne badInp ; else bad input

    easyPlay:
	call compEasy ; plays easy mode
    jmp main ; returns back up top to keep game looping

    hardPlay:
	call compHard ; plays hard mode
	jmp main ; returns back to top to keep game looping


	badInp:
	cmp [menuAns], byte 'c' ; if user enters a c (easter egg trigger)
	je cCounter ; jumps to count the number of c's
	jne badMsg ; if not c, prints invalid choice

	badMsg: ; prints out invalid choice message
    mov rdi, fmtout
    mov rsi, badInput
    mov rax, 0
    call printf
    jmp menuLoop ; loops back to top

    cCounter: ; used to determine if easter egg time
    dec ebp ; decrements ebp
    cmp ebp, 0 ; if ebp is now 0
    je secret ; goes to easter egg
    jne badMsg ; prints invalid entry message

    secret: ; prints out easter egg
    mov rdi, fmtout
    mov rsi, secretmsg
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg2
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg3
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg4
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg5
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg6
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg7
    mov rax, 0
    call printf

    mov rdi, fmtout
    mov rsi, secretmsg8
    mov rax, 0
    call printf

    ;asks user for name for easter egg
    mov rdi, fmtout
    mov rsi, secretmsg9
    mov rax, 0
    call printf

    ;stores user name for easter egg
    push rbp
    mov rdi, fmtin2
    mov rsi, name
    mov rax, 0
    call scanf
    pop rbp

    ; prints out final message
    mov rdi, fmtNameOut
    mov rsi, name
    mov rax, 0
    call printf

    jmp exit ; ends game

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

menuCall:
    ;prints out menu
    mov rdi, fmtout
    mov rsi, welcome
    mov rax, 0
    call printf

    ;takes in menu choice 
    mov rax, 0
    mov rdi, 0
    mov rsi, menuAns
    mov rdx, 2
    syscall

    ret