program exercise_7_20
   use Environment
   
   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: In = 0, Out = 0, N = 0, M = 0, i = 0
   Real(R_), allocatable   :: C(:, :)
   Real(R_), allocatable   :: B(:)
   !dir$ attributes align : 32 :: B,C

   open (file=input_file, newunit=In)
      read (In, *) N, M
      allocate (C(N, M))
      read (In, *) (C(i,:),i=1,N)
   close (In)
   allocate (B((N*M)/2))
   if ((MOD(N,2)) /= 0) then
      call Odd(C,B)
   else
     call Even(C,B)
   end if
   
   open (file=output_file, encoding=E_, newunit=Out)
      write (Out, '('//M//'f6.2)') (C(i, :), i = 1, N) 
      write (Out, '(a)') "Итоговый массив:" 
      write (Out, '('//Size(B)//'f6.2)') (B(i), i = 1, Size(B))
   close (Out)

   
   open (file=output_file, encoding=E_, newunit=Out, position='append')
   close (Out)
   
contains

!1 2 3 4 
!1 2 3 4
!1 2 3 4
     subroutine Odd(C,B) 
      Real(R_),contiguous,target :: C(:,:)
      real        ::B(:)
      real,contiguous,pointer::mat(:)
      intent(inout)  C,B
      mat(1:Size(C)) =>C
      B = mat(1:Size(mat):2)
  end subroutine Odd

!1 2 3 4 
!1 2 3 4
!1 2 3 4
!1 2 3 4
     subroutine Even(C,B)
      Real(R_),contiguous,target :: C(:,:)
      real        ::B(:)
      intent(inout)  C,B
      integer(I_) i
     B = [(C(::2,i),C(2::2,i+1),i=1,Ubound(C,dim=2)-1,2)]

     end subroutine Even
end program exercise_7_20
