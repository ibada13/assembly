data segment 
    val db 4
    power db 3

ends




code segment 
    start:
         mov ax,data
         mov ds,ax
         xor ax,ax
         xor cl,cl
         mov al,1
         
         mov bl,val
         loop1:
         
         mul bl
         
         inc cl
         cmp cl,power
         jl loop1
        mov ah,02h
            mov dl,al
            add dl,48
            int 21h

end:        
  mov ah,4ch
  int 21h  
    
    
ends
    end start