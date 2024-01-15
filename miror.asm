data segment
   val dw 123  
    
    
ends
stack segment 
    dw 128 dup(?)
    
ends
code segment
     start:
     mov ax,data
     mov ds,ax
     mov ax,stack
     mov ss,ax
     mov ax,val
     xor cx,cx
     mov bx,10
     loop1:
            
          xor dx,dx
          
          div bx
          mov val,ax
           push dx
           call printdl
            endofprintdl:
            mov ax,val
          cmp ax,0
                jne loop1
 
 
   mov ah,4ch
   int 21h
    printdl proc near 
        add dl,48
         mov ah,02h
         int 21h 
         sub dl,48
             jmp endofprintdl
        
        endp
   
   
    
ends
    end start