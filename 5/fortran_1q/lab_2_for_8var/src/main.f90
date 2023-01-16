! Copyright 2015 Fyodorov S. A.

program reference_lab_2
   use Environment
   use Group_Process
   use Group_IO

   implicit none
   character(:), allocatable :: input_file, input_file_step, output_file
   type(simbol), allocatable  :: Group_List,Change_List,mode
 
   integer(I_)                 :: N = 0,M = 0

   input_file  = "../data/class1.txt"
   input_file_step  = "../data/step.txt"
   output_file = "output.txt"
   
   Group_List = Read_class_list(input_file)
   call Read_move_list(input_file_step,mode,Change_list,N,M)
   if (allocated(Group_List)) then
      call Output_class_list(output_file, Group_List, "Исходный список:", "rewind")
      if (mode%letter == char(80,CH_)) then
         call Output_move_list(output_file, "Вставить",N,M,Change_List, "Что делать:", "append")
         call Paste(Group_List, Change_list,N,M)
      else 
         call Output_move_list(output_file, "Вырезать",N,M,Change_List, "Что делать:", "append")
         call cut(group_List,N,M)
      end if 

      call Output_class_list(output_file, Group_List, "Готовое:", "append")
   end if

end program reference_lab_2
