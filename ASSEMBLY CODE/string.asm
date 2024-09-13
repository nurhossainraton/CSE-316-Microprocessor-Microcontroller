.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
    
    MOV BL,48
    WH:
    MOV AH,1
    INT 21H 
    INC BL
    
    CMP AL,0DH
    JE B
    
    LOOP WH
    
    B:
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    SUB BL,1
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN