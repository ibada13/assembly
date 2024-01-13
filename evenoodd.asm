data segment 
    val db 8
    msgp db "the number is even$"
    msgi db "the number is odd$"
ends




code segment 
    start:
         mov ax,data
         mov ds,ax
         xor ax,ax
         mov al,val
         mov bl,2
         div bl
         
         
         cmp ah,0
         je pair
impair:
    mov ah,09h
    mov dl,offset msgi
    int 21h
    jmp end
pair:
    mov ah,09h
    mov dl,offset msgp
    int 21h
end:        
  mov ah,4ch
  int 21h  
    
    
ends
    end start