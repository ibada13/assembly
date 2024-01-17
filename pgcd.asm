data segment
       a db 5 
       b db 5
       msg db "you should know that pgcd(a,0)= a  $"
ends


stack segment
    
    
ends 


code segment
    start:
       mov ax,data 
       mov ds,ax
       mov al,a
       mov bl,b
       
       cmp al,bl
        jl less
        endless:
        je end 
       cmp al,0 
        je if0
       loop1:
       loop2:
            sub al,bl
            
       
        

            cmp al,bl
            jg loop2
          cmp al,0
            je end
        mov dl,al
        mov al,bl
        mov bl,dl
        jmp loop1
        end:
    
     mov ah,4ch
     int 21h
    if0:
        lea dx,msg
        mov ah,09h
        int 21h 

        jmp end
        
    less:
        mov dl , al
        mov al,bl
        mov bl,dl
    jmp endless

    
ends      
    end start