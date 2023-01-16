!Дано значение целое значение K. Проверить является ли оно четным!?
program exercise_11
   use Environment

   implicit none
   character(*),parameter  :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: K = 0, In, Out
   character(len = 40)     :: str

   open ( file = input_file, newunit = In)
      read (in, *) K
   close (In)
   
      call Com(K,str)
   
   open ( file = output_file, newunit = Out )
      write (Out, '(i0,"-", a)') K, str
   close (Out)


contains
   pure subroutine Com(K, str)
      integer        K
      character(*)   str
      intent(in)     K
      intent(out)    str

      if (mod(K,2)==1)then
         str = "Это число нечетное"
      else
         str = "это число четное"
      end if

   end subroutine Com
end program exercise_11
