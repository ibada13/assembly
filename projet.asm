 data segment
    t1 db 16,32,64,128,255,4
    t2 dw 16,32,64,128,255,2
    prod db 4 
    en db 6
    somt dw ?
    result dd ?
    buffer dw ?
ends



code segment
    
     start:
       mov ax,data
       mov ds, ax
       
       
       
       
       xor bx,bx
       lea bx,t1
       
       loop1:  
      xor ax,ax
      mov al,[bx]
      mul prod
      add somt ,ax 
      mov t2[bx+bx],ax
       
       
       inc bx
       cmp  bl,en
       
       jl loop1 
    xor si,si    
        xor ax,ax
   ;   lea si,t2 
      mov al , t1[si]
      mov upperbuffer,ax
      inc si

      xor cl,cl
       inc cl 
      loop2:
      mov ax,upperbuffer
      mov bl,t1[si]
      xor bh,bh
      mul bx
      mov upperbuffer,ax


      mov buffer,dx

      mov ax,lowerbuffer

      mul bx

      add ax,buffer 
      mov lowerbuffer,ax     


       
       
       
       inc si  

       inc cl
       cmp cl,en
       jl loop2
      mov ax,upperbuffer
      mov result,ax
      mov ax , lowerbuffer
      mov result+2 ,ax
    
      mov ah,4ch
      int 21h

    
    
ends
  end start 