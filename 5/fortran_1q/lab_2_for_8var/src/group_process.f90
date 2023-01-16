! Copyright 2015 Fyodorov S. A.
module Group_Process
   ! Модуль с ЧИСТЫМИ процедурами обработки данных.
   use Environment
   use Group_IO

   implicit none

contains
   ! Получение списков по полу.
   pure recursive subroutine Paste(Text, List_P, posit,P_len)
      type(simbol), allocatable,intent(inout)       :: Text
      type(simbol), allocatable,intent(inout)       :: List_P
      integer(I_), intent(in)                        :: P_len,posit

      type(simbol),allocatable                        :: temp


      if (posit>0 .and. allocated(Text))then
         if ((posit-1)>0) then
            call Paste(Text%next, List_P,posit-1,P_len)
         else
            call Move_alloc(text,temp)
            call move_alloc(list_P,Text)
            call paster(text,temp,P_len)
         end if
      end if

   end subroutine Paste
 
 pure recursive subroutine paster(text,past,P_len)   
      type(simbol),allocatable,intent (inout)      ::Text,past
      integer,intent(in)                        ::P_len

      type(simbol),allocatable :: temp

      if (allocated(text) .and. P_len-1>0) then
         call paster(text%next,past,P_len-1)
      else
         call move_alloc(past,text%next)
      end if
      
   end subroutine paster
 pure recursive subroutine slap(text,P_len)   
      type(simbol),allocatable,intent (inout)      ::Text
      integer,intent(in)                        ::P_len

      type(simbol),allocatable :: temp

      if (allocated(text) .and. P_len>0) then
         call  move_alloc(text%next,temp)
         call move_alloc(temp,Text)
         call Slap(text,P_len-1)
  

      end if
      
   end subroutine slap
      
pure recursive subroutine cut(text,Posit,X_len)
   type(simbol),allocatable,intent(inout)    :: text
   integer,intent(in) :: Posit,X_len
   type(simbol),allocatable :: temp,temp1
   if (allocated(text) .and. (Posit-1)>0)then
         call cut(text%next,Posit-1,X_len)
    else
         call move_alloc(text,temp)
         call slap(temp,X_len)
         call move_alloc(temp,text)


   end if
   end subroutine cut
 !    pure recursive subroutine swap(List,Stud,Move)
 !        type(student),allocatable,intent(inout)  ::Stud,List
 !        character,intent(in)                     :: Move
 !        select case (move)
 !           case ("F")
 !                 if (List .equal. Stud)then
 !                    call swap_F(list,stud%next)
 !                 else
 !                    call swap(List,Stud%next,Move)
 !                 end if
 !           case ("B")
 !                 if (allocated(stud%next))then
 !                    if (List .equal. Stud%next)then
 !                       call swap_F(List,stud)
 !                    else
 !                       call swap(List,Stud%next,Move)
 !                    end if
 !                 end if
 !          end select    
 !          

 !           end subroutine swap

 !    pure recursive subroutine swap_F(List,Stud)
 !        type(student),allocatable,intent(inout)  ::Stud,List
 !        if(allocated(List))then   
 !           if(allocated(Stud))then 
 !              List%Surname   = Stud%Surname
 !              List%Initials  = Stud%Initials
 !              List%Sex       = Stud%Sex
 !              List%Marks     = Stud%Marks
 !              List%Aver_Mark = Stud%Aver_Mark
 !              call swap_F(List%next,Stud%next)
 !           end if
 !        endif

 !           end subroutine swap_F
 !     
 !  
 !     pure function equal(List1,List2)    result(temp)
 !        type(student),intent(in)    :: List1,List2
 !        logical temp
 !        temp = .false.
 !        if (List1%surname==List2%surname .and. List1%initials==List2%initials .and. &
 !           List1%sex==List2%sex .and. ALL(List1%Marks==List2%Marks) .and. List1%Aver_Mark==List2%Aver_Mark) temp = .true.

 !       end function equal
      
        end module Group_process
