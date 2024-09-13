.MODEL SMALLL
.STACK 100H
.DATA 


.CODE
 MAIN PROC
    
   ; MOV CX,1
    ;MOV AH,2
    ;MOV DL,'a'
    MOV BL,48
    MOV AH,1
    INT 21H
    
;TOP:
    
    ;INT 21H
    ;LOOP TOP
    
    
    ;INT 21H
    ;DEC CX
    ;JNZ TOP
    
    
    
    
WHILE_:
     CMP AL,0DH
     JE END_WHILE
     INC BL 
     INT 21H
     LOOP WHILE_
END_WHILE: 
    
     
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
   
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    
     
      
     MOV AH,4CH
     INT 21H 
    
    
MAIN ENDP
 END MAIN