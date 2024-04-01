section .data
    message1 db 'Enter the first number: ', 0
    len1 equ $ - message1
    message2 db 'Enter the second number: ', 0
    len2 equ $ - message2
    resultMessage db 'The sum is: ', 0
    resultLen equ $ - resultMessage

section .bss
    num1 resb 4
    num2 resb 4
    sum resb 4

section .text
    global _start

_start:
    ; Print message asking for the first number
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, message1       ; pointer to the message
    mov edx, len1           ; message length
    int 0x80                ; make kernel call

    ; Read first number
    mov eax, 3              ; syscall number for sys_read
    mov ebx, 0              ; file descriptor 0 is stdin
    mov ecx, num1           ; buffer to store the input
    mov edx, 4              ; number of bytes to read
    int 0x80                ; make kernel call

    ; Print message asking for the second number
    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, len2
    int 0x80

    ; Read second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Convert input from ASCII to integers and add
    ; Assuming input is a single digit for simplicity
    mov eax, [num1]         ; Load 4-byte value from num1
    sub eax, '0'            ; Convert from ASCII to integer
    mov ebx, [num2]
    sub ebx, '0'            ; Convert from ASCII to integer
    add eax, ebx            ; Add the two integers
    add eax, '0'            ; Convert sum back to ASCII
    mov [sum], eax          ; Store the result

    ; Print the sum
    mov eax, 4
    mov ebx, 1
    mov ecx, resultMessage
    mov edx, resultLen
    int 0x80

    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, sum            ; pointer to the sum
    mov edx, 4              ; length of the sum to print
    int 0x80                ; make kernel call

    ; Exit
    mov eax, 1              ; syscall number for sys_exit
    xor ebx, ebx            ; exit status 0
    int 0x80
