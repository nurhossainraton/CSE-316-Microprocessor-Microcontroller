.MODEL SMALL
.STACK 100H
.DATA

    NUM1 DB 49
    NUM2 DB 50
.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AH,1
     MOV CL,AL
     INT 21H
     
     MOV AH,2 
     CMP AL,'A'
     JNGE END_IF
     CMP AL,'Z'
     JNLE END_IF
     
     MOV DL,AL
     
     INT 21H
     
     JNBE ELSE_
     
     MOV AH,2
     MOV DL,NUM1 
     JMP DISPLAY
     
ELSE_:
      
     MOV DL,NUM1 
DISPLAY:
     INT 21H
END_IF:

      MOV AH,4CH
      INT 21H
      
MAIN ENDP
END MAIN