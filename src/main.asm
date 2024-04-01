section .data
    helloMessage db 'Hello, World!',0xA    ; Mensagem a ser impressa, seguida de uma nova linha

section .text
    global _start                          ; Informa ao linker o ponto de entrada do programa

_start:
    ; Escreve a mensagem na saída padrão
    mov edx, 14                            ; Número de bytes a escrever
    mov ecx, helloMessage                  ; Mensagem a escrever
    mov ebx, 1                             ; File descriptor (1 = stdout)
    mov eax, 4                             ; Número da syscall para sys_write
    int 0x80                               ; Chama o kernel

    ; Termina o programa
    mov eax, 1                             ; Número da syscall para sys_exit
    xor ebx, ebx                           ; Status de saída
    int 0x80                               ; Chama o kernel

