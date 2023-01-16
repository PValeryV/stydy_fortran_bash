program exercise_5
   use Environment
   
   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: In = 0, Out = 0, N = 0,i=0,M=0
   integer                 :: S = 0
   integer, allocatable    :: Z(:),Result(:)
   !dir$ attrebutes align : 32 :: Z, Result

   open (file=input_file, newunit=In)
      read (In, *) N
      allocate (Z(N))
      read (In, *) Z
   close (In)

   Result = PACK([(i, i=1,N)],Z>0)
   M=Size(Result)

   open (file=output_file, encoding=E_, newunit=Out)
      write (Out, "(i0)") N
      write (Out, "("//N//"(i0, 1x))") Z
      write (Out,"(a," //M // "i5)")'Индексы массива:', Result
   close (Out)

end program exercise_5
