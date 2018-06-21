DATA SEGMENT
   ASS  DB   11,23,34,50,40,66,80,70,90,45
DATA ENDS
CODE SEGMENT
  MAIN   PROC   FAR
          ASSUME CS:CODE,DS:DATA
  START:  PUSH DS
          XOR AX,AX
          PUSH AX
          MOV AX,DATA
          MOV DS,AX
          MOV CX,10
          LEA SI,ASS
          MOV AL,[SI]
          CBW
  LOO:    INC SI
          CMP AL,[SI]
          JAE LOO2
          MOV AL,[SI]
          CBW
   LOO2:  DEC CX
          JNZ LOO
          MOV BX,AX   
          
  PRN:    CALL PRO1
          RET
  MAIN  ENDP
  PRO1   PROC   NEAR
         MOV       CX, 10
         CALL       DEC_DIV
         MOV       CX, 1
         CALL       DEC_DIV
         MOV       AH, 4CH
         INT        21H
         RET
  PRO1  ENDP
  DEC_DIV  PROC       NEAR
              MOV       AX, BX
              MOV       DX, 0
              DIV       CX
              MOV       BX, DX
              MOV       DL, AL
              ADD       DL, 30H
              MOV       AH, 2
              INT        21H
              RET
   DEC_DIV  ENDP
      CODE   ENDS
             END   START
   