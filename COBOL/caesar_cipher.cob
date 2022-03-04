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
    01 ciphered           PIC x(50).
    01 deciphered           PIC x(50).
    01 i              PIC 9(3).
    01 a              PIC 9(3).
    01 chars          PIC x(1).


PROCEDURE DIVISION.
Begin.
    MOVE "Dude Wheres My Car" TO cipherStr
    
    DISPLAY "Welcome to Caesar Ciphers with COBOL!"

    PERFORM Encrypt.
    DISPLAY "Encrypted Cipher Value: " ciphered

    PERFORM Decrypt.
    DISPLAY "Decrypted Cipher Value: " ciphered
    STOP RUN.


Encrypt.
    MOVE Function Upper-case(cipherStr) to cipherStr

    IF shift >= 26
       MOVE FUNCTION MOD(shift, 26) to shift
    END-IF
		
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(cipherStr)
	     IF cipherStr(i:1) IS NOT EQUAL TO SPACE
				MOVE cipherStr (i:1) to chars
				IF (FUNCTION ORD(chars) + shift) <= FUNCTION ORD("Z")
					MOVE FUNCTION CHAR(FUNCTION ORD(chars) + shift) to ciphered (i:1)
				ELSE
					MOVE FUNCTION CHAR(FUNCTION ORD("A") 
					+ ((FUNCTION ORD(chars) + shift) - 1) - FUNCTION ORD("Z")) to ciphered (i:1
				END-IF
			END-IF
		END-PERFORM
      .


Decrypt.
    MOVE Function Upper-case(cipherStr) to cipherStr

    IF shift >= 26
       MOVE FUNCTION MOD(shift, 26) to shift
    END-IF
		
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(cipherStr)
	 		IF cipherStr(i:1) IS NOT EQUAL TO SPACE
				MOVE cipherStr (i:1) to c
				IF (FUNCTION ORD(c) - numShift) >= FUNCTION ORD("A")
					MOVE FUNCTION CHAR(FUNCTION ORD(c) - numShift) to deciphered (i:1)
				ELSE
					MOVE FUNCTION CHAR(FUNCTION ORD("Z") 
					- ((numShift - 1) - (FUNCTION ORD(c) - FUNCTION ORD("A")))) to deciphered (
				END-IF
			END-IF
		END-PERFORM
      .