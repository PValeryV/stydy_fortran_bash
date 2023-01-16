 !Copyright 2015 Fyodorov S. A.

module Group_Process
   ! Модуль с ЧИСТЫМИ процедурами обработки данных.
   use Environment
   use Group_IO

   implicit none
   
contains
   ! Сортировка списка класса по среднему баллу.
   pure subroutine Sort_class_list(Group,Carier)
      type(employes), intent(inout)  :: Group(:)
      type(doljnost),intent(inout)  :: Carier(:)
      integer        :: i, j
      type(employes)  :: tmp_stud

      ! Сортировка списка класса по среднему баллу методом пузырька.
      do i = Size(Group), 2, -1
         ! Просматриваем список с начала, ставя в конец менее успешного.
         do j = 1, i-1
            ! Проверка на то, стоит ли менять учащихся местами.
            if (Swap(Group, j,Carier)) then
               ! Перестановка местами двух эелементов списка, начиная с текущего.
               tmp_stud = Group(j+1)
               Group(j+1) = Group(j)
               Group(j) = tmp_stud
			   ! Group(j:j+1) = Group(j+1:j:-1)
            end if
         end do
      end do
   end subroutine Sort_class_list

   ! Проверка того, стоит ли менять местами текущего учащегося со следующим.
   pure logical function Swap(Group, j,Carier)
      type(employes), intent(in)  :: Group(:)
      type(doljnost), intent(in)  :: Carier(:)
      integer, intent(in)        :: j
      integer                    :: i,Pcar1,Pcar2
      Swap = .false. 
      do Concurrent (i=1:Size(Carier))
         if(Group(j)%Post == Carier(i)%Dol) Pcar1=i
         if(Group(j+1)%Post == Carier(i)%Dol) Pcar2=i
      end do

      if (Pcar1>Pcar2) then
         Swap = .true.
      else if (Group(j)%Post == Group(j+1)%Post) then
         if (Group(j)%Surname > Group(j+1)%Surname) then
            Swap = .true.
         end if
      end if
   end function Swap
end module group_process
