! Copyright 2015 Fyodorov S. A.
module Group_Process
!   ! Модуль с ЧИСТЫМИ процедурами обработки данных.
   use Environment
   use Group_IO

   implicit none

contains
 recursive subroutine P2(S,H)
    type(student), allocatable,intent(inout)    :: S
    character(SURNAME_LEN,kind=CH_),intent(in)              :: H
     
    type(student), allocatable                  :: temp
    if (allocated(S))then
      if (S%Surname == H)then
         call move_alloc(S%next,temp)
         call move_alloc(temp,S)
      end if
         call P2(S%next,H)
    end if
    end subroutine P2
end module Group_process
