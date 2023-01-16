Module overload
  use environment 
   implicit none
   type :: mytipe
      real(R_),allocatable    :: P(:,:)
   end type mytipe



   interface operator (.mult.)
      module procedure matrix_vector
      module procedure matrix
   end interface

contains
   pure function matrix_vector(matrix,vector)   result(res)
      real(R_),intent(in)                 :: matrix(:,:),vector(:)
      real(R_)                            :: res(Ubound(vector,1)),temp(Ubound(matrix,1),Ubound(matrix,2))
      integer(I_)                         :: i,j
      !dir$ attributes align :32:: res,temp
      res=0
       j=(Ubound(vector,1))
       !temp =reshape([(matrix(:,i)*vector(i),i=1,Ubound(matrix,dim=2))],(/j,j/)) 

      do i=1,j
         res = res+matrix(:,i)*vector(i)
      end do
   end function matrix_vector

   pure function matrix(Matrix1,Matrix2) result(res)
      Real(R_),intent(in)              :: matrix1(:,:),matrix2(:,:)
      Real(R_)                         :: res(Ubound(matrix2,1),Ubound(matrix2,2))
      Integer(I_)                      :: i,j,N,k
      !dir$ attributes align :32:: res,temp
      res = 0
       N=(Ubound(matrix2,dim=1))
      do j=1, Ubound (matrix1,dim=2)
         do k=1,Ubound(matrix1,dim=2)
            do i=1,N
               res(i,j) = res(i,j)+ (matrix1(i,k) * matrix2(k,j))
            end do
         end do
      end do

!  do concurrent(j=1:Ubound(matrix2,dim=2))
!       temp =reshape([(matrix1(:,i)*matrix2(i,j),i=1,Ubound(matrix1,dim=2))],(/N,N/))
!         do i=1,N
!            res(:,j) = res(:,j)+temp(:,i)
!         end do
!       end do
!      res = matmul(matrix1,matrix2)
   end function matrix
end module overload
