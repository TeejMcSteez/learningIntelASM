;when linking use kernel32.lib legacy_stdio_definitions.lib msvcrt.lib libraries 

bits 64 
default rel 

section .data 
    format db "Result: %d", 10, 0 ;reserving memory for printing the string to the console
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

    mov r9, 0x0
    mov r8, 0x1
    call start
start:
    add r8, r9
    push r8
    ;mov [result], rax
    ;printing result
    ;mov rax, [result]
    ;mov rcx, format
    mov rdx, r8
    mov rcx, format
    call printf
    push rdx
    xor rdx, r9
    jmp add


    xor rax, rax
    call ExitProcess
add:
    add rdx, r8
    push rdx
   ;print
    mov rcx, format

    call printf
    jmp start