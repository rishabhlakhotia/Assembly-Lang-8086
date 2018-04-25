;9b.b.	Generate the Sine Wave using DAC interface (The output of the DAC is to be displayed on the CRO).
;@author Mohammed Ataaur Rahaman
 
.MODEL SMALL
.DATA
TABLE DB 127,144,161,177,191,204,214,225,227,225,221,214,204,191,177,161,144,127,110,93,77,63,50,40,33,29,27,29,33,40,50,63,77,93,110,127
PA EQU 0D800H
PB EQU 0D801H
PC EQU 0D802H
CW EQU 0D803H

.CODE
MOV AX,@DATA
MOV DS,AX

MOV DX,CW
MOV AL,80H
OUT DX,AL

L2:
	MOV CX,37D
	MOV DX,PA
	LEA SI,TABLE
	
	L1:
		MOV AL,[SI]
		OUT DX,AL
		INC SI
	LOOP L1
	
JMP L2

MOV AH,4CH
INT 21H
END
