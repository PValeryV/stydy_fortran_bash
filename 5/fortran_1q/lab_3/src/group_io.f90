! Copyright 2015 Fyodorov S. A.

module Group_IO
   use Environment

   implicit none
   integer, parameter :: SURNAME_LEN   = 10

   ! Структура данных для хранения данных о студенте.
   type student
      character(SURNAME_LEN, kind=CH_)    :: Surname              = ""
      type(student), allocatable          :: next
   end type student



contains
   ! Чтение списка класса: фамилии, инициалы, полы и оценки.
   function P1(F1,H) result(S)
      type(student), allocatable                               :: S
      character(*), intent(in)                                 :: F1
      character(SURNAME_LEN,kind =CH_), intent(inout)          :: H
      integer  In

      open (file=F1, encoding=E_, newunit=In)
         call Read_student(In,S)
         call cut_H(S,H) 
      close (In)

   end function P1

   ! Чтение следующего студента.
   recursive subroutine Read_student(In,S) 
      type(student),allocatable           :: S
      integer, intent(in)                 :: In
      integer  IO
      character(:), allocatable           :: format
      
      allocate (S)
      format = '(a)'
      read (In, format, iostat=IO) S%Surname
      call Handle_IO_status(IO, "reading line from file")
      if (IO == 0) then
          call Read_student(In,S%next)
      else
         deallocate (S)
      end if
   end subroutine Read_student

   recursive subroutine cut_H(S,H)
      type(student), allocatable                               :: S
      character(SURNAME_LEN,kind=CH_), intent(inout)           :: H
      
      if (allocated(S%next))then
            call cut_H(S%next,H)
         else
            H = S%Surname
            deallocate(S)
         end if
         

      end subroutine cut_H
   ! Вывод списка класса со средним баллом или без него.
   subroutine P3(Output_File, Class_List, List_Name, Position)
      character(*), intent(in)            :: Output_File, Position, List_Name
      type(student), allocatable          :: Class_List
      integer                             :: Out
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/a)') List_Name
         call Output_student(Out, Class_List,1)
      close (Out)
   end subroutine P3

   recursive subroutine Output_student(Out, Stud,i)
      integer, intent(in)            :: Out,i
      type(student), allocatable     :: Stud
      integer                        :: IO
      character(:), allocatable      :: format

      if (allocated (Stud)) then
         format = '(i0,")",T5, a)'
         write (Out, format, iostat=IO) i, Stud%Surname
         call Handle_IO_status(IO, "writing student")
         call Output_student(Out, Stud%next,i+1)
      end if
   end subroutine Output_student
   
   subroutine Output_H(Output_File, H, List_Name, Position)
      character(*), intent(in)                      :: Output_File, Position, List_Name
      character(SURNAME_LEN,kind=CH_), intent(in)   :: H
      integer  :: Out
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/2a)') List_Name, H
      close (Out)
   end subroutine Output_H
end module Group_IO 
