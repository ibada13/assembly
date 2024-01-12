data segment
    tab db 8,5,9,2,3,4,1,6,5 
    fin dw 9
    swapp db ? 
ends



code segment
    start:
    mov ax,data
    mov ds,ax
    xor cx,cx
    xor bx,bx
    xor si,si
        loop1:
             mov si,cx
             inc si
             
             
             mov dl,tab[bx]
              loop2:
               
               cmp tab[si],dl
               jl swap
               loop3:
               inc si
               cmp si,fin
               jl loop2
               jmp increment
    
    
    
 swap:
    mov dh,tab[si]
    mov tab[si] , dl
    mov tab[bx],dh
    mov dl,tab[bx]
 jmp loop3
    
 increment:
 inc bx 
 inc cx   
 cmp cx,fin
 jl loop1   
 xor si,si   
 print:
    mov ah,02h
    mov dl,tab[si]
    add dl,48
    int 21h
    mov ah,4ch
    inc si 
    cmp si,fin
    jl print
    mov dl,0ah
    int 21h   
    
ends
    end start