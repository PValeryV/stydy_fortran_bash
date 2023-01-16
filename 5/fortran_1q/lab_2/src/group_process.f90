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
   ! Получение списков по полу.
   pure recursive subroutine Get_list_by_scrolling(Stud, List, List_len)
      type(student), allocatable,intent(inout)       :: Stud
      type(student), allocatable,intent(inout)       :: List
      integer(I_), intent(in)                        :: List_len


      if (List_len>0 .and. allocated(Stud))then
     allocate(List)
         List%Surname = Stud%Surname
         List%Initials =Stud%Initials
         List%Sex     = Stud%Sex
         List%Marks     =Stud%Marks
         List%Aver_Mark =Stud%Aver_Mark
         if ((List_len-1)>0) &
            call Get_list_by_scrolling(Stud%next, List%next,List_len-1)
      end if

   end subroutine Get_list_by_scrolling
 
    recursive subroutine movement_list(Stud,List,Move_list,List_Len,output_file)
      type(student),allocatable,intent (inout)  ::Stud
      character(*),intent(inout)                ::output_file
      type(student),allocatable,intent (inout)  ::List
      type(move),allocatable,intent(inout)      ::Move_list
      integer,intent(in)                        ::List_Len
      if (allocated(Move_List)) then
            call swap(List,Stud,Move_list%step)
            call Output_class_list(output_file, List, Move_List%step, "append")
            
            call movement_list(Stud,List,Move_list%next,List_Len,output_file)
      end if
      
   end subroutine movement_list
      

     pure recursive subroutine swap(List,Stud,Move)
         type(student),allocatable,intent(inout)  ::Stud,List
         character,intent(in)                     :: Move
         select case (move)
            case ("F")
                  if (List .equal. Stud)then
                     call swap_F(list,stud%next)
                  else
                     call swap(List,Stud%next,Move)
                  end if
            case ("B")
                  if (allocated(stud%next))then
                     if (List .equal. Stud%next)then
                        call swap_F(List,stud)
                     else
                        call swap(List,Stud%next,Move)
                     end if
                  end if
           end select    
           

            end subroutine swap

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
