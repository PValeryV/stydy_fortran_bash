program exercise_6
   use Environment
   
   implicit none
   character(*), parameter :: input_file = "../data/input.txt", output_file = "output.txt"
   integer                 :: In = 0, Out = 0
   real(R_)                :: level_x = 0, x = 0, a = 0        ! создал переменную level_x для (принять решение) 

   open (file=input_file, newunit=In)
      read (In, *) x,a
   close (In)
   
   level_x = LevelX(x,a) ! вызвал функцю levelX и присвоил значение в level_x

   open (file=output_file, encoding=E_, newunit=Out)
      write (Out, '(5(a, T16, "= ", e13.6/))') 'x', x,"a",a ,"a^x", level_x, "Fortran a^x", a**x, "Error", level_x - (a**x)
   close (Out)

contains
   real(R_) pure function LevelX(x,a)
      real(R_), intent(in) :: x,a
      real(R_) R(4), Numerators(4), Denominators(4), n_fact, x_s, x_8
      integer  Ns(4)

      x_s = x*LOG(a)
      
      Numerators = x_s ** [1, 2, 3, 4]

      
      x_8 = Numerators(4)
      
      Denominators = [1, 2 , 2*3, 2*3*4]
      Ns = [1, 2, 3, 4]

      R = Numerators / Denominators ! ВЕКТОРИЗАЦИЯ

      LevelX =1  + Sum(R)
      
      do while (LevelX + R(4) /= LevelX)
         Numerators = Numerators * x_8

         n_fact = Denominators(4)
      
         Ns = Ns + 4
         
         Denominators = Ns(1:4)  ! ВЕКТОРИЗАЦИЯ
         Denominators(1) = n_fact * Denominators(1)
         Denominators(2) = Denominators(1) * Denominators(2) ! == (n+4)! == (n+2)! * (n+3)*(n+4)
         Denominators(3) = Denominators(2) * Denominators(3) ! == (n+6)! == (n+4)! * (n+5)*(n+6)
         Denominators(4) = Denominators(3) * Denominators(4) ! == (n+8)! == (n+6)! * (n+7)*(n+8)
         
         R = Numerators / Denominators

         LevelX = LevelX + Sum(R)
      end do
   end function LevelX 
end program exercise_6
