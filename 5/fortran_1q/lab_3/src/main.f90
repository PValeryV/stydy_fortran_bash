! Copyright 2015 Fyodorov S. A.


program reference_lab_3
   use Environment
   use Group_Process
   use Group_IO

   implicit none
   character(:), allocatable                       :: F1, F2
   character(SURNAME_LEN,kind=CH_)                 :: H =""

   type(student), allocatable                      :: S
 
   F1  = "../data/surname.txt"
   F2  = "output.txt"
   
   S = P1(F1,H)
   if (allocated(S)) then
      call P3(F2, S, "Исходный список:", "rewind")
      call Output_H(F2,H,"Фамилия которую надо удалить:", "append")
      call P2(S,H)
      call P3(F2, S, "После удаления похожих фамилий:", "append")
   end if

end program reference_lab_3
