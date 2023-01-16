program exercise_7_34
   use Environment
   
   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: In = 0, Out = 0, N = 0, M = 0, i = 0, K = 0
   real(R_), allocatable   :: A(:,:)

   open (file=input_file, newunit=In)
      read (In, *) N
      allocate (A(N, N))
      read (In, *) A
   close (In)
   open (file=output_file, encoding=E_, position='rewind', newunit=Out)
       write (Out, '('//N//'f6.2)') A
   close (Out)
  
   call Zamena(A)
   
   open (file=output_file, encoding=E_, position='append', newunit=Out)
      write (Out, '(a)') "исправленный"
       write (Out, '('//N//'f6.2)') A
   close (Out)
contains
    pure subroutine Zamena(A)
    integer i,D
    Real(R_) A(:,:)
    intent (inout) A
    integer MaxValue(Size(A,2))
    D = Size(A,1)
    MaxValue = MaxLoc(A,dim =1 )
    do concurrent (i =1:D)
        if(i /= MaxValue(i))then 
            A([MaxValue(i),i],i) =A([i,MaxValue(i)],i)
         end if 
    end do
    end subroutine Zamena


end program exercise_7_34
