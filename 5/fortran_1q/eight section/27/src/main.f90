program exercise_8_22
   use Environment
   use Integral_IO
   use matrix_calculate 
   use overload

   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   real(R_), allocatable   :: A(:,:), Y(:),Summ(:)
   real(R_)                :: NormaY
   !dim$ attributes align :32 ::A,Y,Summ

   call ReadP(input_file, A, Y)
   
   call OutputP(output_file, A, Y)
   
   Summ = matrix_product(A, Y)
   NormaY = norma_Y(Y)

   call OutputIntegral(output_file, Summ, NormaY)
end program exercise_8_22
