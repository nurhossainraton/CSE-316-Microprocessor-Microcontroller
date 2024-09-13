.MODEL SMALL
.STACK 100H
.DATA  
  NUM DB 49
  CHAR DB 'R'
  MSG DB "My name  is khan $"
  
.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H 
    
    
   
    MOV AH,2 
    MOV DL,AL  
    INT 21H
    
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,NUM
    INT 21H
    
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    MOV DL,CHAR
    INT 21H
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,09H
    LEA DX,MSG
    INT 21H  
    
     
    
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
