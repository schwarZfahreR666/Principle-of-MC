CODE  SEGMENT
              ASSUME    CS:CODE
      START  PROC
              CALL      DECBIN
              CALL      XIANSHI
              MOV   DL,'H'
              MOV AH,2
              INT 21H
              MOV       AH,4CH
              INT       21H
       START  ENDP

      DECBIN  PROC      NEAR
              MOV       CX,10
              MOV       BX,0
       LOP1:  MOV       AH,1
              INT       21H
              CMP       AL,30H
              JL        EXIT
              CMP       AL,39H
              JG        EXIT
              SUB       AL,30H
              MOV       AH,00H
              XCHG      AX,BX
               MUL      CX
              ADD       BX,AX
              JMP       LOP1
       EXIT:  RET
DECBIN  ENDP
    XIANSHI   PROC      NEAR  
          MOV CH,4
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
          RET 
          
XIANSHI ENDP
    

      CODE  ENDS
              END       START