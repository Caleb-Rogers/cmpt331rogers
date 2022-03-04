IDENTIFICATION DIVISION.
PROGRAM-ID. CAESARCIPHER.
AUTHOR. CALEB ROGERS.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
    01 cipherStr      PIC x(50).
    01 shift          PIC 9(4) VALUE 4.
    01 loop           PIC 9(8) VALUE 26.
    01 negativeShift  PIC 9(4) VALUE 4.
    01 temp           PIC x(50).
    01 i              PIC 9(3).
    01 a              PIC 9(3).
    01 chars          PIC 9(1).


PROCEDURE DIVISION.
Begin.
    MOVE "Dude Wheres My Car" TO cipherStr
    
    DISPLAY "Welcome to Caesar Ciphers with COBOL!"

    PERFORM Encrypt.
    DISPLAY "Encrypted Cipher Value: " cipherStr

    PERFORM Decrypt.
    DISPLAY "Decrypted Cipher Value: " cipherStr
    STOP RUN.


Encrypt.
    MOVE Function Upper-case(cipherStr) to cipherStr
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(cipherStr)
       IF cipherStr IS NOT EQUAL TO SPACE
           MOVE cipherStr (i:1) to chars
           IF (FUNCTION ORD(chars) + shift) <= FUNCTION ORD("Z")
                   MOVE FUNCTION CHAR(FUNCTION ORD(chars) + chars) to cipherStr 
               ELSE
                   MOVE FUNCTION CHAR(FUNCTION ORD("A") 
                   + ((FUNCTION ORD(chars) + shift) - 1) - FUNCTION ORD("Z")) to
		       END-IF
		    END-IF
		END-PERFORM
    STOP RUN.


Decrypt.
    SUBTRACT 26 FROM shift GIVING negativeShift
    MOVE Function Upper-case(cipherStr) to cipherStr
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(cipherStr)
       IF cipherStr IS NOT EQUAL TO SPACE
           MOVE cipherStr (i:1) to chars
           IF (FUNCTION ORD(chars) + negativeShift) <= FUNCTION ORD("Z")
                   MOVE FUNCTION CHAR(FUNCTION ORD(chars) + chars) to cipherStr 
               ELSE
                   MOVE FUNCTION CHAR(FUNCTION ORD("A") 
                   + ((FUNCTION ORD(chars) + negativeShift) - 1) - FUNCTION ORD(
		       END-IF
		    END-IF
		END-PERFORM
    STOP RUN.