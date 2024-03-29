program Caesar_Cipher
  implicit none
 
  ! Initialization
  character(43) :: cipherStr = "Dude Wheres My Car"
  integer :: shift = 4  
 
  write(*, "(2a)") "Welcome to Caesar Ciphers with Fortran!"
  
  ! Call Caesar Cipher Encryption Method
  call encrypt(cipherStr, shift)
  write(*, "(2a)") "Encrypted Cipher Value: ", cipherStr
  
  ! Call Caesar Cipher Decryption Method
  call decrypt(cipherStr, shift)
  write(*, "(2a)") "Decrypted Cipher Value: ", cipherStr
  
  ! Call Caesar Cipher Solve Method
  call solve("DUDE", 26)
 
contains

 
subroutine encrypt(toCipher, shift)
  implicit none
  character(*) :: toCipher
  integer :: shift
  integer :: i
 
  do i = 1, len(toCipher)
    select case(toCipher(i:i))
      ! Account for uppercase letters
      case ('A':'Z')
        toCipher(i:i) = achar(modulo(iachar(toCipher(i:i)) - 65 + shift, 26) + 65)
      ! Account for lowercase letters
      case ('a':'z')
        toCipher(i:i) = achar(modulo(iachar(toCipher(i:i)) - 97 + shift, 26) + 97)
    end select
  end do
end subroutine
 
 
subroutine decrypt(ciphered, shift)
  implicit none
  character(*) :: ciphered
  integer :: shift
  integer :: reverse
  
  reverse = (shift * (-1))
  call encrypt(ciphered, reverse)
  
end subroutine


subroutine solve(cipher, loop)
  implicit none
  character(4) :: cipher
  integer :: loop
  character(4) :: newCiphered
  integer :: i
  
  do i = 0, loop
    ! Breaks without reassign
    newCiphered = cipher
    call encrypt(newCiphered, i)
    write(*, *) "Caesar ", i, ": ", newCiphered
  end do
  
end subroutine


end program Caesar_Cipher