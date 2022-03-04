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
    01 solveStr      PIC x(50).
    01 tempStr      PIC x(50).
    01 i              PIC 9(3).
    01 j              PIC 9(3).
    01 tempJ PIC 9(2).
    01 a              PIC 9(3).
    01 chars          PIC x(1).


PROCEDURE DIVISION.
Begin.
    MOVE "Dude Wheres My Car" TO cipherStr
    MOVE "DUDE" TO solveStr
    
    DISPLAY "Welcome to Caesar Ciphers with COBOL!"

    PERFORM Encrypt.
    DISPLAY "Encrypted Cipher Value: " ciphered

    PERFORM Decrypt.
    DISPLAY "Decrypted Cipher Value: " deciphered

    PERFORM Solve.

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
					MOVE FUNCTION CHAR(FUNCTION ORD(chars) + shift) 
                    to ciphered (i:1)
				ELSE
					MOVE FUNCTION CHAR(FUNCTION ORD("A") 
					+ ((FUNCTION ORD(chars) + shift) - 1) - 
                    FUNCTION ORD("Z")) to ciphered (i:1)
				END-IF
			END-IF
		END-PERFORM
      .


Decrypt.
    MOVE Function Upper-case(cipherStr) to cipherStr
    ADD 26 TO shift GIVING negativeShift
    SUBTRACT negativeShift FROM shift GIVING shift

    IF shift >= 26
       MOVE FUNCTION MOD(shift, 26) to shift
    END-IF
		
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(cipherStr)
	 		IF cipherStr(i:1) IS NOT EQUAL TO SPACE
				MOVE cipherStr (i:1) to chars
				IF (FUNCTION ORD(chars) - shift) >= FUNCTION ORD("A")
					MOVE FUNCTION CHAR(FUNCTION ORD(chars) - shift) 
                    to deciphered (i:1)
				ELSE
					MOVE FUNCTION CHAR(FUNCTION ORD("Z") 
					- ((shift - 1) - (FUNCTION ORD(chars) - 
                    FUNCTION ORD("A")))) to deciphered (i:1)
				END-IF
			END-IF
		END-PERFORM
      .


Solve.
    PERFORM VARYING j FROM 0 BY 1 UNTIL j > 26
			MOVE j to tempJ
			MOVE solveStr to tempStr
			IF tempStr >= 26
                     		MOVE FUNCTION MOD(tempJ, 26) to tempJ 
                	END-IF
			PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(solveStr)
	 		IF tempStr(i:1) IS NOT EQUAL TO SPACE
				MOVE tempStr (i:1) to chars
				IF (FUNCTION ORD(chars) - tempJ) < FUNCTION ORD("A")
					MOVE FUNCTION CHAR(FUNCTION ORD("Z") - ((tempJ - 1) 
                    - (FUNCTION ORD(chars) - FUNCTION ORD("A")))) 
                    to tempStr (i:1)
				else
					MOVE FUNCTION CHAR(FUNCTION ORD(chars) - tempJ) 
                    to tempStr (i:1)			
				END-IF
			END-IF
			END-PERFORM
			DISPLAY "Caesar " j ": " tempStr
		END-PERFORM
        .