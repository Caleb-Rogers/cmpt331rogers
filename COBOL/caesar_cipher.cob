IDENTIFICATION DIVISION.
PROGRAM-ID. CAESARCIPHER.
AUTHOR. CALEB ROGERS.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
    01 cipherStr PIC x(4).
    01 originalStr PIC x(4).
    01 ciphered PIC x(4).
    01 shift PIC 99.
    01 counter PIC 99.
    01 i PIC 9(3).
    01 c PIC x(1).


PROCEDURE DIVISION.
Begin.
    SET cipherStr TO "DUDE";
    SET originalStr TO cipherStr;
    SET shift TO 4;

    DISPLAY FUNCTION CONCATENATE("Decrypted Cipher Value: " cipherStr)
    PERFORM Encrypt.
    SET ciphered TO cipherStr;
    PERFORM Decrypt.

    SET counter TO 0;
    SET shift TO 0;
    DISPLAY "Solve:"
    PERFORM Solve UNTIL counter = 26.

    STOP RUN.


Encrypt.
    MOVE Function Upper-case(originalStr) TO originalStr
    IF shift >= 26
        MOVE FUNCTION MOD(shift, 26) TO shift
    END-IF

    PERFORM Varying i FROM 1 BY 1 UNTIL > FUNCTION LENGTH(originalStr)
        IF originalTxt(i:1) IS NOT EQUAL TO SPACE
            MOVE originalStr(i:1) TO c
            IF (FUNCTION ORD(c) + shift) <= FUNCTION ORD("Z")
                MOVE FUNCTION CHAR(FUNCTION ORD(c) + shift) TO cipherStr(i:1)
            ELSE
                MOVE FUNCTION CHAR(FUNCTION ORD("A") + ((FUNCTION ORD(c) + shift) - 1) - FUNCTION ORD("Z")) to cipherStr(i:1)
            END-IF
        END_IF
    END-PERFORM

    DISPLAY FUNCTION CONCATENATE("Encrypted Cipher Value: " cipherStr).


Decrypt.
    MOVE Function Upper-case(cipherStr) TO cipherStr
    IF shift >= 26
        MOVE FUNCTION MOD(shift, 26) TO shift
    END-IF

    PERFORM Varying i FROM 1 BY 1 UNTIL > FUNCTION LENGTH(originalStr)
        IF originalTxt(i:1) IS NOT EQUAL TO SPACE
            MOVE originalStr(i:1) TO c
            IF (FUNCTION ORD(c) + shift) <= FUNCTION ORD("Z")
                MOVE FUNCTION CHAR(FUNCTION ORD(c) + shift) TO cipherStr(i:1)
            ELSE
                MOVE FUNCTION CHAR(FUNCTION ORD("A") + ((FUNCTION ORD(c) + shift) - 1) - FUNCTION ORD("Z")) to cipherStr(i:1)
            END-IF
        END_IF
    END-PERFORM

    DISPLAY FUNCTION CONCATENATE("Decrypted Cipher Value: " cipherStr).


Solve.
    ADD 1 counter;
    ADD 1 to shift;
    PERFORM Encrypt.
    STOP RUN.