! Copyright 2015 Fyodorov S. A.
module Group_Process
   ! Модуль с ЧИСТЫМИ процедурами обработки данных.
   use Environment
   use Group_IO

   implicit none

   interface operator(.equal.)
         module procedure equal
   end interface
contains








   pure recursive subroutine swap_F(List,Stud)
         type(student),allocatable,intent(inout)  ::Stud,List
         if(allocated(List))then   
            if(allocated(Stud))then 
               List%Surname   = Stud%Surname
               List%Initials  = Stud%Initials
               List%Sex       = Stud%Sex
               List%Marks     = Stud%Marks
               List%Aver_Mark = Stud%Aver_Mark
            
               call swap_F(List%next,Stud%next)
            end if
         endif

            end subroutine swap_F
      
   
      pure function equal(List1,List2)    result(temp)
         type(student),intent(in)    :: List1,List2
         logical temp
         temp = .false.
         if (List1%surname==List2%surname .and. List1%initials==List2%initials .and. &
            List1%sex==List2%sex .and. ALL(List1%Marks==List2%Marks) .and. List1%Aver_Mark==List2%Aver_Mark) temp = .true.

        end function equal
      
        end module Group_process
