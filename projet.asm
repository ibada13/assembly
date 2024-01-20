data segment
    t1 db 16,32,64,128,255
    t2 dw 16,32,64,128,255
    prod db 4 
    en db 5
    somt dw ?
    
ends



code segment
    
      start:
       mov ax,data
       mov ds, ax
       
       
       
       
       xor si,si
       lea si,t1
       
       loop1:  
       xor ax,ax
       mov al,[si]
       mul prod
       add somt ,ax 
       mov t2[si],ax
       
       
       inc si
       cmp  si,en
       
       jl loop1
        
        
       loop2:
       
       
       
       
       
       
       inc si
       cmp si,en 
             jl loop2
    
    
      mov ah,4ch
      int 21h
    
    
    
ends
  end start 