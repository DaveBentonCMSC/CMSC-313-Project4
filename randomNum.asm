	section .text

	global randomNum

randomNum:
    ;random num generator based off algorithm given
    xor     rax,rax
    xor rcx, rcx
    xor rdx, rdx
    RDRAND  rax
    xor     rdx, rdx
    imul    rax, 1103515245 ; multiplies random seed
    add     rax, 12345 ; adds to new value
    xor     rdx, rdx
    mov     rcx, 65536
    div     rcx ; divides rax & rcx
    xor     rdx, rdx
    mov     rcx, 16 ; places 16 in rcx for "mod"
    div     rcx
    mov     rax, rdx
    add     rax, 1
    xor     rcx, rcx
    ret
