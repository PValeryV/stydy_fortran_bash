module Integral_IO
   use Environment

   implicit none
contains
   ! Чтение параметра p.
   subroutine ReadP(input_file, A, Y)
      character(*), intent(in) :: input_file
      real(R_), allocatable,intent(out)    :: A(:,:), Y(:)
      integer :: In = 0,N = 0, i=0,k
      N= Ubound(Y,dim = 1)
      k= Mod(N,4)
    
      open (file=input_file, newunit=In)
         read (In, *) N
         allocate(A(N+k,N),Y(N+k))
         read (In, *) (A(i,:),i=1,N),Y
      close (In)
   end subroutine ReadP
  
   ! Вывод параметра p.
   subroutine OutputP(output_file, A,Y)
      character(*), intent(in) :: output_file
      real(R_), intent(in)     :: A(:,:), Y(:)
      integer :: Out = 0,i=0, N=0
      N= Ubound(Y,dim = 1)

      open (file=output_file, encoding=E_, newunit=Out)
            write (Out, '(a,i0,"x",i0)')"Матрица A ",N,N
            write (Out,'('//N//'(3x,f0.2))')(A(i,:),i=1,N)
        
            write (Out, '(a,i0,"x",i0)')"Вектор Y: "
            write (Out,'('//N//'(3x,f0.2))') Y
      close (Out)
   end subroutine OutputP
   
   ! Вывод значений интеграла для разных p.
   subroutine OutputIntegral(output_file, Summ, NormaY)
      character(*), intent(in) :: output_file
      real(R_), intent(in) :: Summ(:), NormaY

      integer :: Out = 0
   
      open (file=output_file, encoding=E_, newunit=Out, position='append')
         write (Out,'(a)') "Ответ"
         write (Out,'('//3//'(4X,f0.2))') Summ
         
         write (Out,'(a,f0.2)') "Норма вектора =", NormaY 
      close (Out)
   end subroutine OutputIntegral
end module Integral_IO
