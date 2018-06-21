PROG   SEGMENT
 ASSUME    CS:PROG
 MOV       DL, 'A'
 MOV       AH, 2
 INT        21H            
 MOV       AH, 4CH
 INT        21H   
  PROG    ENDS
              END