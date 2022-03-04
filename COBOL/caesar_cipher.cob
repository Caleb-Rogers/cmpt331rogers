IDENTIFICATION DIVISION.
PROGRAM-ID. CAESARCIPHER.
AUTHOR. CALEB ROGERS.

ENVIRONMENT DIVISION.

WORKING-STORAGE SECTION.
DATA DIVISION.
    01 cipherStr PIC x(50) VALUE "Dude Wheres My Car".
    01 shift PIC 9(4) VALUE 4.
    01 loop PIC 9(8) VALUE 26.

    01  plaintext                 PIC X(50).
    01  offset                    PIC 99.
    01  encrypted-str             PIC X(50).

    01  i                         PIC 9(3).
    01 temp PIC x(50).


PROCEDURE DIVISION.
Begin.
    PERFORM Encrypt.
    PERFORM Decrypt.
    PERFORM Solve UNTIL Counter = 26.
    STOP RUN.


Encrypt.
    MOVE cipherStr TO temp
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(cipherStr)
       IF temp (i:1) IS ALPHABETIC-UPPER
           MOVE FUNCTION ORD("A") TO a
       ELSE   
           MOVE FUNCTION ORD("a") TO a
       END-IF

       MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(temp(i:1)) - a + shift, 26) 
           TO temp (i:1)

       MOVE temp to cipherStr
    END-PERFORM.


Decrypt.
    SUBTRACT 26 FROM shift GIVING 


Solve.
    ADD 1 TO Counter;
    ADD 1 TO offset;
    PERFORM Encrypt.
    STOP RUN.