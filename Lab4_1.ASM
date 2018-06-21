DATA  SEGMENT
            STR1  DB        'HELLO',0DH,0AH,'$'
            STR2  DB        'YES',0DH,0AH,'$'
            STR3  DB        'NO',0DH,0AH,'$'
            STR4  DB        '1 2 3 0 4 5 A B a=! ?',00H
            DATA  ENDS
CODE  SEGMENT
                   ASSUME    CS:CODE,DS:DATA
           START  PROC      FAR
              PUSH DS
              MOV AX,0
              PUSH AX
              MOV AX,DATA
              MOV DS,AX
              MOV DX,0
              LEA  DX,STR1
                                        
              MOV       AH,9
              INT        21H
      LOOP1:  MOV      AH,1
              INT        21H
              MOV       BX,OFFSET STR4
        GON:  MOV      AH,[BX]
              CMP       AH,0
              JZ         NO
              INC       BX
              CMP       AH,AL
              JNZ       GON
         YES:LEA    DX, STR2
              JMP   GO
              
                                        
         GO:  MOV      AH,9
              INT       21H
              JMP       LOOP1
         NO:  MOV      DX,OFFSET STR3
              JMP       GO
              RET
      START  ENDP
       CODE  ENDS
              END      START