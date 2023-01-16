! Copyright 2015 Fyodorov S. A.

module Group_IO
   use Environment

   implicit none
   character(kind=CH_), parameter   :: MALE = Char(1052, CH_), FEMALE = Char(1046, CH_)
   integer, parameter :: SURNAME_LEN   = 15
   integer, parameter :: INITIALS_LEN  = 5
   integer, parameter :: MARKS_AMOUNT  = 5

   ! Структура данных для хранения данных о студенте.
   type student
      character(SURNAME_LEN, kind=CH_)    :: Surname              = ""
      character(INITIALS_LEN, kind=CH_)   :: Initials             = ""
      character(kind=CH_)                 :: Sex                  = ""
      integer                             :: Marks(MARKS_AMOUNT)  = 0
      real(R_)                            :: Aver_Mark            = 0
      type(student), allocatable          :: next
   end type student

   type move
      character                           :: step                 =""
      type (move), allocatable            :: next  
   end type move


contains
   ! Чтение списка класса: фамилии, инициалы, полы и оценки.
   function Read_class_list(Input_File) result(Class_List)
      type(student), allocatable     :: Class_List
      character(*), intent(in)   :: Input_File
      integer  In

      open (file=Input_File, encoding=E_, newunit=In)
         call Read_student(In,Class_List)
      close (In)

   end function Read_class_list

   function Read_move_list(Input_file_step,List_Len) result(Move_List)
      type(move), allocatable    :: Move_List
      character(*), intent(in)   :: Input_file_step
      integer,intent(out)        :: List_Len
      integer  In

      open(file=input_file_step,encoding=E_,newunit=In)
         read (In,'(i4)') List_Len
         call Read_move(In,Move_List)
      close(In)

   end function Read_move_list
   ! Чтение следующего студента.
   recursive subroutine Read_student(In,Stud) 
      type(student), allocatable  :: Stud,temp
      integer, intent(in)     :: In
      integer  IO
      character(:), allocatable  :: format
      
      allocate (Stud)
      format = '(3(a, 1x), ' // MARKS_AMOUNT // 'i1, f5.2)'
      read (In, format, iostat=IO) stud%Surname, stud%Initials, stud%Sex, stud%Marks, stud%Aver_Mark
      call Handle_IO_status(IO, "reading line from file")

      if (IO == 0) then
      if(stud%sex ==MALE) then
         call Move_alloc(stud,temp)
         allocate(stud)
         call Move_alloc(temp,stud%next)

          call Read_student(In,Stud%next%next)
       else
          call Read_student(In,Stud%next)
       end if
      else
         deallocate (Stud)
      end if
   end subroutine Read_student

   recursive subroutine Read_move(In,mover)
      type(move), allocatable  :: mover
      integer, intent(in)     :: In
      integer  IO
      character(:), allocatable  :: format
      
      allocate (mover)
      format = '(a)'
      read (In, format, iostat=IO) mover%step
      call Handle_IO_status(IO, "reading line from file")
      if (IO == 0) then
          call Read_move(In,mover%next)
      else
         deallocate (mover)
      end if
   end subroutine Read_move
   ! Вывод списка класса со средним баллом или без него.
   subroutine Output_class_list(Output_File, Class_List, List_Name, Position)
      character(*), intent(in)   :: Output_File, Position, List_Name
      type(student), allocatable :: Class_List
      integer  :: Out
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/a)') List_Name
         call Output_student(Out, Class_List)
      close (Out)
   end subroutine Output_class_list

   recursive subroutine Output_student(Out, Stud)
      integer, intent(in)         :: Out
      type(student), allocatable  :: Stud
      
      integer  :: IO
      character(:), allocatable  :: format
      if (allocated (Stud)) then
         format = '(3(a, 1x), ' // MARKS_AMOUNT // 'i1, f5.2)'
         write (Out, format, iostat=IO) Stud%Surname, Stud%Initials, Stud%Sex, Stud%Marks, Stud%Aver_Mark
         call Handle_IO_status(IO, "writing student")
         call Output_student(Out, Stud%next)
      end if
   end subroutine Output_student
   
   subroutine Output_move_list(Output_File, Move_List, List_Name, Position)
      character(*), intent(in)   :: Output_File, Position, List_Name
      type(move), allocatable  :: Move_List
      integer  :: Out
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/a)') List_Name
         call Output_move(Out, Move_List)
      close (Out)
   end subroutine Output_move_list
   
   recursive subroutine Output_move(Out, mover)
      integer, intent(in)        :: Out
      type(move), allocatable  :: mover
      
      integer  :: IO
      character(:), allocatable  :: format
      if (allocated (mover))then
         format = '(a)'
         write (Out, format, iostat=IO) mover%step 
         call Handle_IO_status(IO, "writing student")
         call Output_move(Out, mover%next)
      end if
   end subroutine Output_move
end module Group_IO 
