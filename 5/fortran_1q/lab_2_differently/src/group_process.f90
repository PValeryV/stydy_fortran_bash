! Copyright 2015 Fyodorov S. A.
module Group_Process
   ! Модуль с ЧИСТЫМИ процедурами обработки данных.
   use Environment
   use Group_IO

   implicit none

contains
   ! Получение списков по полу.
   pure recursive subroutine Get_list_by_scrolling(Stud, Before_List, List_len)
      type(student), allocatable,intent(inout)       :: Stud
      type(student), allocatable,intent(inout)       :: Before_list
      integer(I_), intent(in)                        :: List_len
      
      type(student),allocatable                      :: temp


         
    if (list_len == 1)&
         call move_alloc(Stud%next,Before_list)

     if ((List_len-1>0)) &
            call Get_list_by_scrolling(Stud%next, before_list,List_len-1)

   end subroutine Get_list_by_scrolling
 
    recursive subroutine movement_list(Before_list,Up_list,Stud,Move_list,List_Len,output_file)
      type(student),allocatable,intent (inout)  ::Stud,Before_list,Up_list
      character(*),intent(inout)                ::output_file
      type(move),allocatable,intent(inout)      ::Move_list
      integer,intent(inout)                        ::List_Len
      if (allocated(Move_List)) then
            call swap(before_list,up_list,Stud,Move_list%step,list_len)
            call Output_class_list(output_file, Stud, Move_List%step, "append")
            
            call movement_list(Before_list,Up_list,Stud,Move_list%next,List_Len,output_file)
      end if
      
   end subroutine movement_list
      

     pure recursive subroutine swap(before_list,Up_list,Stud,Move,list_len)
         type(student),allocatable,intent(inout)  :: Stud,before_list,up_list
         character,intent(in)                     :: Move
         integer, intent(In)                      :: List_len
         
         type(student),allocatable                :: temp
         select case (move)
            case ("F")
                     if (allocated(Before_list))then
                       call grid(before_list,stud)
                       if (List_len>1)then
                        call move_alloc(stud,temp)
                        call move_alloc(temp%next,Stud)
                        call grid(temp,Up_list)

                     end if

                     call swap_F(Before_list,stud,List_len)
                  end if
            case ("B")
                  if (allocated(Up_list))then
                        call swap_B(Up_list,stud)

                  end if
           end select    
           

            end subroutine swap
pure recursive subroutine grid(List_out,List_in)
         type(student),allocatable,intent(inout)  :: List_out,List_in
         if (allocated(List_in%next))then
            call grid(List_out,List_in%next)
         else
            call move_alloc(List_out, List_in%next)
         end if 
   end subroutine grid
     pure recursive subroutine swap_F(Before_list,Stud,i)
         type(student),allocatable,intent(inout)  :: Stud,before_List
         integer,intent(in)                       :: i

               if (i>0 .and. allocated(stud%next))&
               call swap_F(Before_list,Stud%next,i-1)

            if (i==0)call move_alloc(stud,before_list)

            end subroutine swap_F
            
     pure recursive subroutine swap_B(List,Stud)
         type(student),allocatable,intent(inout)  ::Stud,List
         if(allocated(List))then   
            if(allocated(Stud))then 
               
               call swap_B(List%next,Stud%next)
            end if
         endif

            end subroutine swap_B
      
      
   
      
        end module Group_process
