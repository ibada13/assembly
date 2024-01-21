data segment
    t1 db 16,32,64,128,255
    t2 dw 16,32,64,128,255,2
    prod db 4 
    en db 5
    somt dw ?
    result dd ?
    buffer dw ?
    downbuffer dw ?
     upperbuffer dw ?
ends



code segment
    
     start:
       mov ax,data
       mov ds, ax
;       
;       
;       
;       
;       xor si,si
;       lea si,t1
;       
;       loop1:  
;      xor ax,ax
;      mov al,[si]
;      mul prod
;      add somt ,ax 
;      mov t2[si],ax
;       
;       
;       inc si
;       cmp  si,en
;       
;       jl loop1 
xor si,si    
xor ax,ax
      lea si,t2 
      mov ax , [si]
      mov upperbuffer,ax
      inc si
      inc si
      xor cl,cl  
      loop2:
      mov ax,upperbuffer
      mov bx,[si]
      mul bx
      mov upperbuffer,ax


      mov buffer,dx

      mov ax,downbuffer

      mul bx

      add ax,buffer 
      mov downbuffer,ax     

      ;mov buffer,dx 
      ;mov ax,dx   ;dx not gonna change 
       
       
       
       inc si  
       inc si
       inc cl
       cmp cl,5 
       jl loop2
      mov ax,upperbuffer
      mov result,ax
      mov ax , downbuffer
      mov result+2 ,ax
    
      mov ah,4ch
      int 21h

    
    
ends
  end start 