! Copyright 2015 Fyodorov S. A.

module Group_IO
   use Environment

   implicit none
   integer, parameter :: SURNAME_LEN   = 15
   integer, parameter :: INITIALS_LEN  = 5
   integer, parameter :: MARKS_AMOUNT  = 5
   integer, parameter :: str_len = 256

   ! Структура данных для хранения данных о студенте.
   type simbol
      character(kind=CH_)                ::letter               = ""
      type(simbol), allocatable          :: next
   end type simbol



contains
   ! Чтение списка класса: фамилии, инициалы, полы и оценки.
   function Read_class_list(Input_File) result(Class_List)
      type(simbol), allocatable     :: Class_List
      character(*), intent(in)   :: Input_File
      integer  In

      open (file=Input_File, encoding=E_, newunit=In)
         call Read_student(In,Class_List)
      close (In)

   end function Read_class_list

   subroutine Read_move_list(Input_file,mode,paste,N,M) 
      type(simbol), allocatable    :: paste,mode
      character(*), intent(in)   :: Input_file
      integer,intent(out)        :: N,M
      integer  In
      allocate (mode)

      open(file=input_file,encoding=E_,newunit=In)
         read (In,'(a1,2(i4))') mode%letter, N, M
         if (mode%letter == Char(80,CH_)) then
            call Read_student(In,paste)
         end if
      close(In)

   end subroutine Read_move_list
   ! Чтение следующего студента.
   recursive subroutine Read_student(In,string) 
      type(simbol), allocatable,intent(inout)  :: string 
      integer, intent(in)     :: In
 !     character(Len=str_len,kind=CH_)  :: strrr
      integer  IO
      allocate (string)
      read (In, '(a)', iostat=IO) string%letter
      call Handle_IO_status(IO, "reading line from file")
      if (IO == 0) then
          !call read_str(string,strrr,1)
          call Read_student(In,string%next)
      end if
   end subroutine Read_student

!   recursive subroutine Read_str(string,str,number_pos)
!      type(simbol),allocatable                         ::  string
!      character(Len=str_len,kind=CH_),intent(in)    ::  str
!      
!      integer, intent(in)                           ::   number_pos
!      
!      allocate(string)
!      if (number_pos<LEN_TRIM(str))then
!         string%letter = str(number_pos)
!         call Read_str(string%next,str,Number_pos+1)
!      else
!         deallocate(string)
!      end if
!
!      end subroutine Read_str
!


   ! Вывод списка класса со средним баллом или без него.
   subroutine Output_class_list(Output_File, Class_List, List_Name, Position)
      character(*), intent(in)   :: Output_File, Position, List_Name
      type(simbol), allocatable :: Class_List
      integer  :: Out
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(a)') List_Name
         call Output_student(Out, Class_List)
      close (Out)
   end subroutine Output_class_list

   recursive subroutine Output_student(Out, Stud)
      integer, intent(in)         :: Out
      type(simbol), allocatable  :: Stud
      
      integer  :: IO
      character(:), allocatable  :: format
      if (allocated (Stud)) then
         format = '((a))'
         write (Out, format, iostat=IO) Stud%letter
         call Handle_IO_status(IO, "writing student")
         call Output_student(Out, Stud%next)
      end if
   end subroutine Output_student
   
   subroutine Output_move_list(Output_File, Move,N,M, Change_list, List_Name, Position)
      character(*), intent(in)   :: Output_File, Position, List_Name,Move     
      type(simbol),allocatable,intent(in)::   Change_list
      integer  :: Out,N,M
      intent(in)    N,M
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/a)') List_Name
         write(out, '(a)')"Действие: ",Move
         write(out, '(2(a,i4))')"С какой позиции:", N,"  Сколько символов:",M
         if (Move == "Вставить")&
         call Output_student(out,Change_list)
      close (Out)
   end subroutine Output_move_list
   
end module Group_IO 
