! Copyright 2015 Fyodorov S. A.

module Group_IO
   use Environment

   implicit none
   integer, parameter :: AMOUNT        = 10
   integer, parameter :: SURNAME_LEN   = 15
   integer, parameter :: PROF_LEN      = 15
   integer, parameter :: DOLJNOST_LEN   = 4

   ! Структура данных для хранения данных о студенте.
   type Doljnost
      character(PROF_LEN,kind=CH_)        :: Dol                 = ""
   end type Doljnost
    
   type employes
      character(SURNAME_LEN, kind=CH_)    :: Surname              = ""
      character(PROF_LEN, kind=CH_)       :: Post                 = ""
   end type employes
   
contains
   ! Создание неформатированного файла данных.
   subroutine Create_data_file(Input_File, Data_File)
      character(*), intent(in)   :: Input_File, data_file
      
      type(employes)             :: stud
      integer                    :: In, Out, IO, i, recl
      character(:), allocatable  :: format

      
      open (file=Input_File, encoding=E_, newunit=In)
      recl = (SURNAME_LEN + PROF_LEN)*CH_
      open (file=Data_File, form='unformatted', newunit=Out, access='direct', recl=recl)
         format = '(2(a,1x))'
         do i = 1, AMOUNT
            read (In, format, iostat=IO) stud
            ! Можно явно указывать поля в записи при чтении (не рекомендуется):
            !read (In, format, iostat=IO) stud%Surname, stud%Initials, stud%Sex, &
            !   stud%Marks, stud%Aver_mark
            call Handle_IO_status(IO, "reading formatted class list, line " // i)
            
            write (Out, iostat=IO, rec=i) stud
            call Handle_IO_status(IO, "creating unformatted file with class list, record " // i)
         end do
      close (In)
      close (Out)
      
   end subroutine Create_data_file

   function Read_doljnost_list(Input_prof) result(job_title)
      character(*), intent(in)   :: Input_prof
      type(Doljnost)             :: job_title(DOLJNOST_LEN) 
      
      integer                    :: In, IO
      character(:), allocatable  :: format

      
      open (file=Input_prof, encoding=E_, newunit=In)
         format = '(a)'
            read (In, format, iostat=IO) job_title
            call Handle_IO_status(IO, "reading formatted doljnost list, line " )
            
      close (In)
      
   end function Read_doljnost_list
   ! Чтение списка класса: фамилии, инициалы, полы и оценки.
   function Read_class_list(Data_File) result(Group)
      type(employes)                 Group(AMOUNT)
      character(*), intent(in)   :: Data_File

      integer In, IO, recl
      
      recl = ((SURNAME_LEN + PROF_LEN)*CH_)*AMOUNT
      open (file=Data_File, form='unformatted', newunit=In, access='direct', recl=recl)
         read (In, iostat=IO, rec=1) Group
         call Handle_IO_status(IO, "reading unformatted class list")
      close (In)
   end function Read_class_list
 
   ! Вывод списка класса.
   subroutine Output_class_list(Output_File, Group, List_name, Position)
      character(*), intent(in)   :: Output_File, Position, List_name
      type(employes), intent(in)  :: Group(:)

      integer                    :: Out, IO
      character(:), allocatable  :: format
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/a)') List_name
         format = '(2(a, 1x))'
         write (Out, format, iostat=IO) Group
         call Handle_IO_status(IO, "writing " // List_name)
      close (Out)
   end subroutine Output_class_list
   
   subroutine Output_doljnost_list(Output_File, Carier, List_name, Position)
      character(*), intent(in)   :: Output_File, Position, List_name
      type(Doljnost), intent(in)  :: Carier(:)

      integer                    :: Out, IO
      character(:), allocatable  :: format
      
      open (file=Output_File, encoding=E_, position=Position, newunit=Out)
         write (out, '(/a)') List_name
         format = '(a)'
         write (Out, format, iostat=IO) Carier
         call Handle_IO_status(IO, "writing " // List_name)
      close (Out)
   end subroutine Output_doljnost_list
end module Group_IO 
