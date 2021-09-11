DATA SEGMENT
DATA1 DB 19H,0BH,0CH,0EH,21H,38H
DATA2 DW 19BCH
DATA3 DB 0H
DATA4 DW 0H
DATA5 DW 2345H, 6789H
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS: DATA
;Reg No = 19BCE238 APOORVA SRIVASTAVA
START: MOV AX, DATA;       Initialize DS to point to start of the memory
MOV DS, AX;                          set aside for storing of data
MOV AL, 25H;                        copy 25H into 8 bit AL register
MOV AX, 2345H;                  copy 2345H into 16 bit AX register
MOV BX, AX;                          copy the content of AX into BX register (16 bit)
MOV CL, AL;                           copy the content of AL into CL register
MOV AL, DATA1;                  copies the byte contents of data segment memory ; Location DATA1 into 8 bit AL
MOV AX, DATA2;                 copies the word contents of data segment memory ; Location DATA2 into 16 bit AX
MOV DATA3, AL;                copies the AL content into the byte contents of data ; Segment memory location DATA3
MOV DATA4, AX;                copies the AX content into the word contents of ; Data segment memory location DATA4
MOV BX, OFFSET DATA5;    The 16 bit offset address of DS memeory location ; DATA5 is copied into BX
MOV AX, [BX];                       copies the word content of data segment ; Memory location addressed by BX into ; AX (register indirect addressing)
MOV DI, 02H;                             address element
MOV AX, [BX+DI};                          copies the word content of data segment ; Memory location addressed by BX+DI into ; AX (base plus indirect addressing)
MOV AX, [BX+0002H];                   copies the word content of data segment ;( 16 bit)
MOV AL, [DI+2];                              register relative addressing
MOV AX, [BX+DI+0002H];              copies the word content of data segment ; Memory location addressed by BX+DI+0002H ; Into AX (16 bit)
MOV AH, 4CH;                                 Exit to DOS with function call 4CH
INT 21H
CODE ENDS;                                    Assembler stop reading
END START