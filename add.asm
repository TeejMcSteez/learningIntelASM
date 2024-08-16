bits 64 
default rel 

section .data
    format db "Result: %x", 10, 0
    result dq 0 ;reserving 8 bytes for addition result

segment .text
global main
extern ExitProcess
extern _CRT_INIT
extern printf

main:
    ;ShadowSpace (for debuggers & etc)
    push rbp ;For reference on stack 
    mov rbp, rsp ;move stack pointer to the current base pointer position (top of the stack)
    sub rsp, 32 ;then subtract 32 giving shadow space necessary for x64 calling on MSF

    call _CRT_INIT ;calls C standard runtime lib

    ;start of addition params
    mov eax, 0x5F ;26
    mov ebx, 0x5E ;16
    add eax, ebx

    mov [result], rax ;stores the result in the memory at result

    ;printing the result
    mov rax, [result]
    mov rcx, format 
    mov rdx, rax

    call printf

    xor rax, rax
    call ExitProcess