! Copyright 2015 Fyodorov S. A.

program reference_lab_2
   use Environment
  ! use Group_Process
   use Group_IO

   implicit none
   character(:), allocatable :: input_file, input_file_step, output_file
   ! MALE = 4_"М"
   ! MALE = "М"
   type(student), allocatable  :: Group_List,Scrolling_List
 
   type(move),allocatable      :: Move_list
   integer(I_)                 :: List_len = 0

   input_file  = "../data/class.txt"
   input_file_step  = "../data/step.txt"
   output_file = "output.txt"
   
   Group_List = Read_class_list(input_file)
   Move_List = Read_move_list(input_file_step,List_len)
   if (allocated(Group_List)) then
      call Output_class_list(output_file, Group_List, "Исходный список:", "rewind")
      
   end if

end program reference_lab_2
