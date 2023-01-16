! Copyright 2015 Fyodorov S. A
program reference_lab_1_4
   use Environment
   use Group_Process
   use Group_IO

   implicit none
   character(:), allocatable :: input_file,input_prof, output_file, data_file
   
   type(employes)              :: Group(AMOUNT)
   type(Doljnost)              :: Carier(DOLJNOST_LEN)
   input_file  = "../data/class.txt"
   input_prof  = "../data/prof.txt"
   output_file = "output.txt"
   data_file   = "class.dat"
   
   call Create_data_file(input_file, data_file)
   Carier = Read_doljnost_list(input_prof) 
   Group = Read_class_list(data_file)
   call Output_class_list(output_file, Group, "Исходный список:", "rewind")
   call Output_doljnost_list(output_file, Carier, "Должностя:", "append")

   

   call Sort_class_list(Group,Carier,Ubound (Group,1))
   call Output_class_list(output_file, Group, "Отсортированный список по должностям:", "append")

end program reference_lab_1_4
