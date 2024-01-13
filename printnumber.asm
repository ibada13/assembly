data segment 
    val dw 112
    i db 0
    innt dw ?
ends

stack segment
    dw 128 dup(0)
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    mov bx, 10
    mov ax, val
    loop1:
        xor dx,dx
        div bx
        mov innt, dx
        push innt
        inc i
        cmp ax, 0
        jne loop1
    xor cl, cl     
    print:
        mov ah, 02h
        pop dx
        add dl, 48
        int 21h
        

        inc cl
        cmp cl, 0
        jl print

    
    mov ah, 4Ch
    int 21h
    
ends
end start
