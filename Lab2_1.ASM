CODE  SEGMENT
              ASSUME    CS: CODE
      START:  MOV       BX, 0FFFH
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