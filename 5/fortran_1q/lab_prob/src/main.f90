! Copyright 2015 Fyodorov S. A.

program reference_lab_1_2
   use Environment

   implicit none
   integer, parameter               :: STUD_AMOUNT = 5, SURNAME_LEN = 15, INITIALS_LEN = 5, MARKS_AMOUNT = 5, STEP_LEN=3
   character(kind=CH_), parameter   :: MALE = Char(1052, CH_), FEMALE = Char(1046, CH_)
   character(:), allocatable        :: input_file,input_file_step, output_file

   ! Массивы фамилий, инициалов, полов, оценок и средних оценов.
   character(kind=CH_)  :: Surnames(STUD_AMOUNT, SURNAME_LEN)  = "", &
                           Initials(STUD_AMOUNT, INITIALS_LEN) = "", &
                           Genders(STUD_AMOUNT)                   = ""
   character, allocatable :: step(:)
   integer              :: Marks(STUD_AMOUNT, MARKS_AMOUNT) = 0, i = 0,List_Len = 0
   real(R_)             :: Aver_Marks(STUD_AMOUNT) = 0
   integer(I_),allocatable :: List(:)

   input_file  = "../data/class.txt"
   input_file_step = "../data/step.txt"
   output_file = "output.txt"
   
   call Read_class_list(input_file, Surnames, Initials, Genders, Marks, Aver_Marks,step,List_Len)

   call Output_class_list(output_file, Surnames, Initials, Genders, Marks, Aver_Marks, &
      "Исходный список:", "rewind")
  
   List = [((i), i = 1,List_Len)]

   i=1
   
   call scrolling_list(List,step,i) 
contains
   ! Чтение списка класса: фамилии, инициалы, полы, оценки и средний.
   subroutine Read_class_list(Input_File, Surnames, Initials, Genders, Marks, Aver_Marks,step,List_Len)
      character(*)         Input_File
      character(kind=CH_)  Surnames(:, :), Initials(:, :), Genders(:)
      character,allocatable :: step(:)
      integer              Marks(:, :),List_Len
      real(R_)             Aver_Marks(:)
      intent (in)          Input_File
      intent (out)         Surnames, Initials, Genders, Marks, Aver_Marks, step, List_Len

      integer In, IO, i,counter
      character(:), allocatable  :: format
      character test
      
      open (file=Input_File, encoding=E_, newunit=In)
         format = '(' // SURNAME_LEN // 'a1, 1x, ' // INITIALS_LEN // 'a1, 1x, a, 1x, ' // &
            MARKS_AMOUNT // 'i1, f5.2)'
         read (In, format, iostat=IO) (Surnames(i, :), Initials(i, :), Genders(i), Marks(i, :), Aver_Marks(i), &
            i = 1, STUD_AMOUNT)
         call Handle_IO_status(IO, "reading class list")
      close (In)
      allocate(step(STEP_LEN))
      open(file=input_file_step,encoding=E_,newunit=In)
         read (In,'(i4)') List_Len
         read (In, '(a)')(step(i),i=1,STEP_LEN)
        close(In)
   end subroutine Read_class_list

   ! Вывод списка класса.
   subroutine Output_class_list(Output_File, Surnames, Initials, Genders, Marks, Aver_Marks, List_name, Position)
      character(*)         Output_File, Position, List_name
      character(kind=CH_)  Surnames(:, :), Initials(:, :), Genders(:)
      integer              Marks(:, :)
      real(R_)             Aver_Marks(:)
      intent (in)          Output_File, Surnames, Initials, Genders, Marks, Aver_Marks, List_name, Position

      integer                    :: Out, i, IO
      character(:), allocatable  :: format
      open (file=output_file, encoding=E_, position=position, newunit=Out)
         write (out, '(/a)') List_name
         format = '(' // SURNAME_LEN // 'a1, 1x, ' // INITIALS_LEN // 'a1, 1x, a, 1x, ' // &
            MARKS_AMOUNT // 'i1, f5.2)'
         write (Out, format, iostat=IO) &
            (Surnames(i, :), Initials(i, :), Genders(i), Marks(i, :), Aver_Marks(i), i = 1, UBound(Aver_Marks, 1))
         call Handle_IO_status(IO, "writing " // List_name)
      close (Out)
   end subroutine Output_class_list

   subroutine Output_class_list_scroll(Output_File, Surnames, Initials, Genders, Marks, Aver_Marks, List_name, Position,List)
      character(*)         Output_File, Position, List_name
      character(kind=CH_)  Surnames(:, :), Initials(:, :), Genders(:)
      integer              Marks(:, :),List(:)
      real(R_)             Aver_Marks(:)
      intent (in)          Output_File, Surnames, Initials, Genders, Marks, Aver_Marks, List_name, Position,List

      integer                    :: Out, i, IO
      character(:), allocatable  :: format
      open (file=output_file, encoding=E_, position=position, newunit=Out)
         write (out, '(/a)') List_name
         format = '(' // SURNAME_LEN // 'a1, 1x, ' // INITIALS_LEN // 'a1, 1x, a, 1x, ' // &
            MARKS_AMOUNT // 'i1, f5.2)'
         write (Out, format, iostat=IO) &
            (Surnames(i, :), Initials(i, :), Genders(i), Marks(i, :), Aver_Marks(i), i = List(1),List(UBound(List, 1)))
         call Handle_IO_status(IO, "writing " // List_name)
      close (Out)
   end subroutine Output_class_list_scroll
   
    recursive subroutine scrolling_list(List,step,i)
      integer  List(:),i
      character step(:)
      intent (in) i
      intent (out)List,step
      character(:), allocatable :: header
!Char(1052, CH_)

      header = step(i-1)
       if(i==1) header = 'Пролистывание'
      call Output_class_list_scroll(output_file, Surnames, Initials, Genders, Marks, Aver_Marks, &
      header, "append",List)
   
      if ("F" == step(i) .AND. List(Ubound(List,dim=1))<STUD_AMOUNT)then   !(F - forward
         List=List+1
      else if("B" == step(i) .AND. List(1)>1 )then  !B -  backspace
         List=List-1
      end if
      if (i-1/= Ubound(step,1))then
         call scrolling_list(List,step,i+1)
      end if
      end subroutine scrolling_list


end program reference_lab_1_2
