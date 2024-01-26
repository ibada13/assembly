data segment
    t1 db 16,32,64,128,255
    t2 dw 16,32,64,128,255
     
    en db 5
    somt dw ?
    result dd ?
    prod db 4 
    spcp dw ? 
    buffer dw ?
ends



code segment
    
     start:
       mov ax, data      ; Load data segment address into AX
       mov ds, ax        ; Initialize DS with the data segment
       
       xor bx, bx        ; Clear BX register
      
       lea bx, t1        ; Load effective address of t1 into BX
          ;exo 1 + 2 
       loop1:  
         xor ax, ax      ; Clear AX register
         mov al, [bx]    ; Load byte at address in BX into AL
         mul prod        ; Multiply AL by the value in prod
         add somt, ax    ; Add the result to somt
         mov t2[bx+bx], ax ; Store the result in t2 at offset bx+bx
         inc bx          ; Increment BX
         cmp bl, en      ; Compare BL with the value in en
         jl loop1        ; Jump to loop1 if BL is less than en

        ;exo 3
       xor ax, ax        ; Clear AX register

       xor bx, bx        ; Clear BX register
       mov al, t1[bx]    ; Load byte at address in BX into AL
       mov result, ax    ; Store the value in result

       inc bl            ; Increment BL
       
       loop2:
         mov ax, result   ; Load the upper word of result into AX
         mov cl, t1[bx]   ; Load byte at address in BX into CL
         xor ch, ch       ; Clear CH register
         mov spcp, cx     ; Store CX value in spcp
         mul spcp         ; Multiply AX by spcp
         mov result, ax   ; Store the result in upper word of result

         mov buffer, dx   ; Store the DX value in buffer

         mov ax, result + 2  ; Load the lower word of result into AX
         mul spcp            ; Multiply AX by spcp
         add ax, buffer      ; Add buffer to AX
         mov result + 2, ax  ; Store the result in the lower word of result

         inc bl             ; Increment BL
         cmp bl, en         ; Compare BL with en
         jl loop2           ; Jump to loop2 if BL is less than en

      mov ah, 4ch           ; DOS function to terminate program
      int 21h               ; Call DOS interrupt
ends
end start
