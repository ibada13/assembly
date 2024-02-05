;lucas suite
data segment 
     a db 2
     b db 1 
     fin db 5
     
    
    
ends 


code segment 
    start:
      mov ax,data
      mov ds,ax
      mov al,a
      mov dl,b
      xor cl,cl
      loop1:
         add dl,al

      
      
       mov ah,02h
              add dl,48
              
       int 21h
              sub dl,48
              
         mov al,b
         mov b,dl
      inc cl
      cmp cl ,fin
      jl loop1
    
    
      mov ah,4ch
      int 21h
    
    
    print:
        
    
ends
    end start