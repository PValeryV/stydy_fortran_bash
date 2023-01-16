! Copyright 2015 Fyodorov S. A.

program reference_lab_dop
   use Environment
   use Group_Process
   use Group_IO

   implicit none
   character(:), allocatable :: input_file,  output_file
   character(kind=CH_), parameter   :: MALE = Char(1052, CH_), FEMALE = Char(1046, CH_)
   ! MALE = 4_"М"
   ! MALE = "М"
   type(student), allocatable  :: Group_List
 

   input_file  = "../data/class.txt"
   output_file = "output.txt"
   
   Group_List = Read_class_list(input_file)
   if (allocated(Group_List)) then
      call Output_class_list(output_file, Group_List, "Исходный список:", "rewind")
      
  end if

end program reference_lab_dop
