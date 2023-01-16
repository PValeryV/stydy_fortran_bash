program exercise_7_46
   use Environment

   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: In = 0, Out = 0, N = 0, M = 0, i = 0, Num =0
   real(R_), allocatable   :: X(:),Y(:)
   !dir$ attributes align : 32 :: X,Y



   open (file=input_file, newunit=In)
      read (In, *) N
      allocate (X(N),Y(N))
      do i=1,N
         read (In, '(2(f6.2))') X(i),Y(i)
      end do
   close (In)
   
   open (file=output_file, encoding=E_, newunit=Out)
      do i=1,N
         write (Out, '(i0,")",'//2//'f6.2)') i, X(i),Y(i) 
      end do
   close (Out)
   
   Num= farthestPoint(X,Y)
  
   open (file=output_file, encoding=E_, newunit=Out, position='append')
      write(Out, '(a,i2)') "farthest point = ", Num
   close (Out)
contains
   Integer(I_) function farthestPoint(X,Y)
      real(R_) X(:),Y(:)
      intent(inout) X,Y
      integer(i_) i
      real(R_),allocatable :: Len(:)

      !dir$ attributes align : 32 :: Len

      allocate (Len(Size(X)))
      Len = (X*X)+(Y*Y)
        
      farthestPoint = MaxLoc(Len,dim =1)


      end function farthestPoint

end program exercise_7_46
