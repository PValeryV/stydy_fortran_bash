program exercise_7_14b
   use Environment
   
   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: In = 0, Out = 0, N = 0, i = 0
   real(R_), allocatable   :: Z(:, :), Sums(:)
   real(R_)                :: s = 0

   open (file=input_file, newunit=In)
      read (In, *) N
      allocate (Z(N, N))
      read (In, *) (Z(i, :), i = 1, N)
   close (In)

   open (file=output_file, encoding=E_, newunit=Out)
      write (Out, '('//N//'f6.2)') (Z(i, :), i = 1, N)
   close (Out)

   allocate(Sums(N-1), source=0._R_)
   call UpperSum(Z, Sums, s)

   open (file=output_file, encoding=E_, newunit=Out, position='append')
      write (Out, '(a, T5, "= ", f9.6)') "Sum", s
      write (Out, '('//N//'f6.2)') Sums
   close (Out)

contains

   pure subroutine UpperSum(Z, Sums, s)
      real(R_)       s, Z(:, :), Sums(:)
      intent(in)     Z
      intent(inout)  Sums, s
      integer        j
      
      do concurrent (j = 1:N-1)
         Sums(1:j) = Sums(1:j) + Z(1:j,N-j) 
      end do

      !do concurrent (j = 2:N)
      !   Sums(1:j-1) = Sums(1:j-1) + Z(j,N:2:-1) 
      !end do
      s = Sum(Sums)
      
   end subroutine UpperSum
end program exercise_7_14b
