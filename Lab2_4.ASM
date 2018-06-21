DATA SEGMENT
   ASS  DB   13,20,-36,-79,89,55,-46,98,-109,34
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
          LEA BX,ASS
  GET  :  MOV AL,[BX]
          CBW 
          CMP AX,0
          JL  FU
          ADD SI,AX
          JMP LO
  FU:     ADD DI,AX 
   LO:    INC BX
          DEC CX
          JNZ GET
          MOV BX,SI
          CALL PRO1
          MOV  AH,2
          MOV  DL,0AH
          INT 21H
          MOV BX,DI
          NEG BX
          AND BX,7FFFH
          MOV AH,2
          MOV DL,2DH
          INT 21H
          CALL PRO1  
          RET
  MAIN  ENDP
  PRO1   PROC   NEAR
         MOV       CX, 100
         CALL       DEC_DIV
         MOV       CX, 10
         CALL       DEC_DIV
         MOV       CX, 1
         CALL       DEC_DIV
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
   
