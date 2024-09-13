.MODEL SMALL
.STACK 100H

.DATA

ACC DW 'VALID PASS $'
NO DW 'INVALID PASS $'

A DB 0
B DB 0
C DB 0

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LOOP_HERE:
     MOV AH,1
     INT 21H
     
     CAPITAL:
     
     CMP AL,41H
     JNGE SMALL
     CMP AL,5AH
     JNLE SMALL
     MOV A,1
     JMP LOOP_HERE
     
     SMALL:
     
     CMP AL,61H
     JNGE DIGIT
     CMP AL,7AH  
     JNLE DIGIT
     MOV B,1
     JMP LOOP_HERE
     
     DIGIT:
     
     CMP AL,30H
     JNGE DEFAULT
     CMP AL,39H
     JNLE DEFAULT
     
     MOV C,1
     JMP LOOP_HERE
     
     DEFAULT:
     CMP AL,21H
     JNGE BREAK
     CMP AL,7EH
     JNLE BREAK
     JMP LOOP_HERE
     
     BREAK:
     
     MOV AH,2
     
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
     
     CMP A,1
     JNE INVALID
     CMP B,1
     JNE INVALID
     CMP C,1
     JNE INVALID 
     
     MOV AH,09H
     LEA DX,ACC
     INT 21H
     JMP EXIT
     
     INVALID:
     MOV AH,09H 
     LEA DX,NO
     INT 21H   
     JMP EXIT
     
     EXIT:
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN
     
    
     
     