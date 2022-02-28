program caesar_cipher
  implicit none
  
  ! Initializations
  character :: cipherStr = "DUDE"
  integer :: shift = 4

  print *, "Welcome to Caesar Ciphers with Fortran!"

  ! Call Caesar Cipher Encryption Method
  call encrypt(cipherStr, shift)
  print *, "Encrypted Cipher Value: ", cipherStr

  ! Call Caesar Cipher Decryption Method
  call decrypt(cipherStr, shift)
  print *, "Decrypted Cipher Value: ", cipherStr

  ! Call Caesar Cipher Solve Method
  call solve(cipherStr, 26)

end program caesar_cipher


subroutine encrypt(toCipher, shift) 
  implicit none

  character :: toCipher
  integer :: shift
  integer :: i

  do i=1, len(toCipher)
    if (iachar(toCipher(i:i)) == 32) then
      toCipher(i:i) = achar(32)
    else
      toCipher(i:i) = achar(modulo(iachar(toCipher(i:i)) - 65 + shift, 26) + 65)
    end if
  end do
  
end subroutine encrypt


subroutine decrypt(ciphered, shift) 
  implicit none

  character :: ciphered 
  integer :: shift
  integer :: reverse

  reverse = (shift * (-1))
	call encrypt(ciphered, reverse)

end subroutine decrypt


subroutine solve(cipher, shiftLoop)
  implicit none

  character :: cipher
  integer :: shiftLoop
  character :: newCiphered
  integer :: i
  
  do i = 0, shiftLoop
    newCiphered = cipher
    call encrypt(newCiphered, i)
    write(*, *) "Caesar ", i, ": ", newCiphered
  end do
end subroutine
