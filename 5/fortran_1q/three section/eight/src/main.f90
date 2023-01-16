program exersize_8

   use environment

   implicit none

   character(*),parameter     :: input_file = "../data/input.txt", output_file = "output.txt"
   integer, allocatable       :: ARR(:,:), ReadyARR(:) 
   integer(I_)                :: LenArr = 0, In,Out,Sled=0, i = 0, temp= 0
   character(:), allocatable  :: fmt


   open (file = input_file, newunit=In)
      read (In,*) LenArr
      allocate (ARR(LenArr,LenArr), ReadyARR(LenArr))

      read (In, *) (ARR(i, :),i=1,LenArr)
   close (In)
   
   do temp=1, size(ReadyARR)
         ReadyARR(temp) = ARR(temp,temp)
   end do

   open(file = output_file, encoding= E_, newunit=Out)
      write(Out, '("Массив:")')
   fmt = "(" // LenArr // "i6)"
      write(Out, fmt) (ARR(i, :), i=1, LenArr)
   close(Out)

   Sled = sum(ReadyARR)

   open (file = output_file,encoding=E_, newunit=Out,position = 'append')
      write (Out, '("массив значений:")')
      write (Out, fmt) ReadyArr
      write (Out, "(a,i0)") "След ТrA = ", Sled
   close (Out)
end program exersize_8
