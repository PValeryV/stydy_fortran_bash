 !Copyright 2015 Fyodorov S. A.

module Group_Process
   ! Модуль с ЧИСТЫМИ процедурами обработки данных.
   use Environment
   use Group_IO

   implicit none
   
contains
   ! Сортировка списка класса по среднему баллу.
  pure recursive subroutine Sort_class_list(Group,Carier,N)
      type(employes), intent(inout)  :: Group(:)
      type(doljnost),intent(inout)   :: Carier(:)
      integer(I_),intent (in)        ::  N      
      call Drop_Down(Group,Carier,1, N-1)
      if (N >=3) &
      call Sort_class_list(Group,Carier,N-1)

   end subroutine Sort_class_list


  pure recursive subroutine Drop_down(Group, Carier,j, N)
    type(employes), intent(inout)  :: Group(:)
    type(doljnost),intent (inout)  :: Carier(:)
    integer, intent(in)            :: j, N

    if (Swap(Group, j,Carier)) &
       Group([j+1,j]) = Group([j,j+1])
    if (j < N) &
       call Drop_down(Group,Carier, j+1, N)
 end subroutine Drop_down


  pure logical function Swap(Group, j,Carier)
      type(employes), intent(in)  :: Group(:)
      type(doljnost), intent(in)  :: Carier(:)
      integer, intent(in)         :: j
   !   integer                    :: i,Pcar1,Pcar2
  Swap = .false. 
      !Pcar1=0
      !Pcar2=0

   !   do i=1,Size(Carier)
   !      
   !      if(Group(j)%Post == Carier(i)%Dol) Pcar1=i
   !      if(Group(j+1)%Post == Carier(i)%Dol) Pcar2=i
   !      if (Pcar1>0 .and. Pcar2>0) exit
   !   end do

   !   if (Pcar1>Pcar2) then
   if(FindLoc(Carier(:)%Dol,Group(j)%Post,dim=1) >  FindLoc(Carier(:)%dol,Group(j+1)%Post,dim =1))then
         Swap = .true.
      else if (Group(j)%Post == Group(j+1)%Post) then
         if (Group(j)%Surname > Group(j+1)%Surname) then
            Swap = .true.
         end if
      end if
   end function Swap
end module group_process
