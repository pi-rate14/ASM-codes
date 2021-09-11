DATA SEGMENT
X DB 01H, 09H, 0BH, 0CH, 0EH, 07H,
Y DB 02H, 0EH, 0CH, 01H, 03H, 08H
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS: DATA

START: MOV AX, DATA
MOV DS, AX
MOV CX, 05H; Load the counter
LEA SI, X; SI pointed to the source location x
LEA DI, Y; DI pointed to the destination location y
UP: MOV BL,[SI] ; Move the SI content to BL register
MOV AL, [DI]; Move the DI content to AL register
MOV [SI], AL; Move AL register content to content of SI
MOV [DI], BL; Move BL register content to content of DI
INC SI; Update SI and DI
INC DI
DEC CX; Decrement the counter till it becomes zero
JNZ UP
MOV AH, 4CH
INT 21H
CODE ENDS
END START
