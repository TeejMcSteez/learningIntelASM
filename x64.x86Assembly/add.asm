bits 64 
default rel 

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


    xor rax, rax
    call ExitProcess