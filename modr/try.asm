.386
.model flat, stdcall



.data
    messageText db 'Hello from the function!', 0
    messageCaption db 'Message', 0

; Include the functions.asm file from the functions folder
INCLUDE  C:/Users/Dell/Desktop/projects/assembly/modr/functions/functions.asm


.code
start:

    ; Call the custom function with parameters
    invoke DisplayMessage, offset messageText, offset messageCaption

    ; Exit the program
    invoke ExitProcess, 0

end start
