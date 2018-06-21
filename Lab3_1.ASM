CODE  SEGMENT
              ASSUME    CS:CODE
      START  PROC
              CALL      DECBIN
              CALL      XIANSHI
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
              MUL       CX
              ADD       BX,AX
              JMP       LOP1
       EXIT:  RET
DECBIN  ENDP
    XIANSHI   PROC      NEAR  
              MOV       CX, 1000
              CALL       DEC_DIV
              MOV       CX, 100
              CALL       DEC_DIV
              MOV       CX, 10
              CALL       DEC_DIV
              MOV       CX, 1
              CALL       DEC_DIV
              MOV       AH, 4CH
              INT        21H
XIANSHI ENDP
   DEC_DIV  PROC       NEAR
              MOV       AX, BX
              MOV       DX, 0
              DIV        CX
              MOV       BX, DX
              MOV       DL, AL
              ADD       DL, 30H
              MOV       AH, 2
              INT        21H
              RET
   DEC_DIV  ENDP  

      CODE  ENDS
              END       START