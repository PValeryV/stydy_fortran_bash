program exersize_4
   use environment
   
   implicit none
   character(*),parameter        :: input_file = "../data/input.txt", output_file = "output.txt"
   real(R_)                      :: A = 0
   integer                       :: In = 0, Out=0
   real, allocatable             :: Var(:) 
   integer,parameter             :: arrLen = 4
   
   open (file=input_file,newunit=In)
      read (In,*) A
   close(In)

   allocate (Var(arrLen))
   call prog(A,Var)

   open (file=output_file,newunit=Out)
      write(Out, '(3(a,T22," = " ,f5.3/))') "Слагаемое 1", Var(1), "Слагаемое 2", Var(2), "Слагаемое 3", Var(3)
      write(Out, '(a,T18," = ", f5.3)') "Ответ", Var(4)
   close(Out)

contains

   pure subroutine prog(A,Var)
      real(R_),intent(in out)   :: A,Var(:)
      integer                   :: I, N
      real(R_)                  :: numerator, denominator
      
      Var(:)=0 
      I=0
      numerator = 1
      denominator = 1
      do N = 1 ,5,2 
         do while (I<N)
            numerator = numerator*A
            denominator = denominator*(4+A)
            I=I+1
         end do
       Var(N) = numerator/denominator/N
            
      end do
      Var(4) = 0.693147+(2*(Var(1)+Var(2)+Var(3)))
   end subroutine prog


end program exersize_4
