             data segment 
    fin db 9 
tab db 9 dup(?)        
carry db ?
    sum db 0
    
        min db ?
            max db ?
                msg db "hello world $"
                    msg3 db "enter the value : $"
                        msg2 db "the number you entred is : $"
ends

code segment 
    start:
         mov ax,data
            mov ds,ax
                xor ax,ax
                    xor cx,cx
                        inc cx
    full:
        mov tab[si],cl
            inc cl
                inc si
                    cmp cl,fin
                        jle full
    mov cl,1
    xor si,si
                    
   print:
          mov ah,02h
            mov dl,tab[si]
                add dl,48
                    int 21h
                    
             mov ah,02h
                mov dl,20h
                    int 21h
                        inc si
                            inc cl
                                cmp cl,fin
                                    jle print
  xor si,si
  xor cl,cl
 ; jmp calcmoyen
  mov dl , tab[0]
  mov max,dl
  mov min,dl                          
  somme:
  mov dl,tab[si]
  
     add sum,dl                       
                cmp dl,min
                   jl updatemin  
                cmp dl,max
                   jg updatemax         
                jmp increment
                
                
  updatemin:
         mov min,dl
         
  updatemax:
         mov max ,dl
         
         
  increment:
         inc si
         inc cl
         cmp cl,fin
            jl somme
                        
  mov ah,02h
    mov dl,0ah
        int 21h
  mov ah,02h
    mov dl,sum
    add dl,48
        int 21h
        
        
  mov ah,02h
  mov dl,min
  add dl,48
  int 21h
  mov ah,02h
    mov dl,0ah
        int 21h
  mov ah,02h
  mov dl,max
  add dl,48
  int 21h
  
                       
                              
  mov ah,4ch
  int 21h
  
ends
    end start