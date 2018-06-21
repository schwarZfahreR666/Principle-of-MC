CODE SEGMENT
  MAIN   PROC   FAR
          ASSUME CS:CODE
  START: 
          MOV CH,4
          MOV BX,67BCH
  GET:    MOV CL,4
          ROL BX,CL
          MOV DL,BL
          AND DL,0FH
          CMP DL,0AH
          JNB WO
          ADD DL,30H
          MOV AH,2
          INT 21H
          JMP LOO
  WO:   
          ADD DL,37H
          MOV AH,2
          INT 21H
          JMP LOO
  LOO:    DEC CH
          JNZ GET
          MOV AH,4CH
          INT 21H
  MAIN  ENDP
 
      CODE   ENDS
             END   START
   