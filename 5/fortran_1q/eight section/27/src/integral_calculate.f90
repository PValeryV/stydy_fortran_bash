module matrix_calculate 
   use Environment
   use overload
   implicit none

contains
   function matrix_product(A,Y) result(Summ)
      real(R_), intent(out)              :: A(:,:), Y(:)
      real(R_),allocatable               :: Summ(:) ,a_k(:,:)
      Integer(I_)                        :: i=0
      !dir$ attributes align :32:: Summ,a_k
     a_k = A
     Summ=  a_k .mult. Y
     do i=1,4
        a_k = a_k .mult. A
        Summ = summ+(a_k .mult. Y)
     end do
    ! a_k = a
    ! дальше в цикле(1-4)
    ! a_k = matmul (A_k,a)
    ! s = s+a_k*y
   end function matrix_product

   ! Чистая вектор-функция от скаляра p и массива X в регулярном стиле.
   Real(R_) pure function norma_Y(Y)
      real(R_),intent(in)    :: Y(:)
      logical                :: Mask(Ubound(Y,1))
      real(R_)               :: temp(Ubound(Y,1))
      integer(I_)            :: i
      temp =0
      Mask = Y<0
      do concurrent (i=1:Ubound(Y,1))
         if (Mask(i)) then
            temp(i)=Y(i)*(-1)
         else
            temp(i)=Y(i)
         end if
      end do
      norma_Y=temp(1)
      do i=2,Ubound(temp,1)
         if (norma_Y<temp(i)) norma_Y=temp(i)
      end do
      !norma_Y = MaxVal(abs(Y))

   end function norma_Y
end module matrix_calculate 
