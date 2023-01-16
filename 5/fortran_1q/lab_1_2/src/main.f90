program reference_lab_1_2
   use Environment

   implicit none
   integer, parameter               :: AMOUNT =10, SURNAME_LEN = 15, POST_LEN = 15, DOLJNOST_LEN = 4
   character(kind=CH_), parameter   :: MALE = Char(1052, CH_) !CH__"\u1052" CH__"М"
   character(:), allocatable  :: input_file, input_prof, output_file

   ! Массивы фамилий, инициалов, полов, оценок и средних оценов и временные
   ! переменные для обменов при сортировке.
   character(kind=CH_)                ::  Surnames(SURNAME_LEN,AMOUNT) = ""
   character(kind=CH_)                ::  Post(Post_LEN,AMOUNT) = "",Doljnost(POST_LEN,DOLJNOST_LEN) = ""

   integer :: In, Out
   
   input_file = "../data/class.txt"
   input_prof = "../data/prof.txt"
   output_file = "output.txt"

   call Read_class_list(input_file, input_prof, Surnames, Post,Doljnost)
   call Output_class_list(output_file, Surnames, Post,"Исходный список:", "rewind") 
   call Output_doljnost_list(output_file, Doljnost,"должностя:", "append")
 
   call sort_employes_list(Surnames,Post,Doljnost)
   call Output_class_list(output_file, Surnames, Post,"Отсортированный по должностям:", "append")
contains
   subroutine Read_class_list(Input_File,Input_prof,Surnames, Post,Doljnost)
    character(*)         Input_File,Input_prof
    character(kind=CH_)  Surnames(:, :), Post(:,:),Doljnost(:,:)
    intent (in)          Input_File,Input_prof
    intent (out)         Surnames, Post,Doljnost

    integer In, IO, i
    character(:), allocatable  :: format

    open (file=Input_File, encoding=E_, newunit=In)
       format = '('//SURNAME_LEN//'a,1x,'//POST_LEN//'a)'
       read (In, format, iostat=IO) (Surnames(:, i), Post(:,i), i = 1, AMOUNT)
       call Handle_IO_status(IO, "reading employess list")
    close (In)

    open(file=Input_prof,encoding=E_,newunit=In)
      read(in,'('//Post_Len//'a)',iostat=IO) (Doljnost(:,i),i=1,DOLJNOST_LEN)
      call Handle_IO_status(IO, "reading doljnost list")
      close(In)
 end subroutine Read_class_list

 ! Вывод списка класса.
 subroutine Output_class_list(Output_File, Surnames, Post, List_name, Position)
    character(*)         Output_File, Position, List_name
    character(kind=CH_)  Surnames(:, :), Post(:,:)
    intent (in)          Output_File, Surnames, Post, List_name, Position

    integer                    :: Out, i, IO
    character(:), allocatable  :: format

    open (file=output_file, encoding=E_, position=position, newunit=Out)
       write (out, '(/a)') List_name
       format = '('//SURNAME_LEN//'a,1x,'//POST_LEN//'a)'
       write (Out, format, iostat=IO) &
                     (Surnames(:, i), Post(:,i) , i = 1, AMOUNT)
       call Handle_IO_status(IO, "writing " // List_name)
    close (Out)
 end subroutine Output_class_list


 subroutine Output_doljnost_list(Output_File, Doljnost, List_name, Position)
    character(*)         Output_File, Position, List_name
    character(kind=CH_)  Doljnost(:, :)
    intent (in)          Output_File, Doljnost, List_name, Position

    integer                    :: Out, i, IO
    character(:), allocatable  :: format

    open (file=output_file, encoding=E_, position=position, newunit=Out)
       write (out, '(/a)') List_name
       format = '('//POST_LEN//'a)'
       write (Out, format, iostat=IO) &
          (Doljnost(:,i) , i = 1, DOLJNOST_LEN)
       call Handle_IO_status(IO, "writing " // List_name)
    close (Out)
 end subroutine Output_doljnost_list

  pure subroutine sort_employes_list(Surnames,Post,Doljnost)
   character(kind=CH_)  Surnames(:,:),Post(:,:),Doljnost(:,:)
   intent(inout)  Surnames,Post,Doljnost
   character(kind=CH_) tmpSurname(SURNAME_LEN),tmpPost(POST_LEN)
   logical Swap
   integer i,j

   do i = AMOUNT, 1, -1
      ! Просматриваем список с начала, ставя в конец менее успешного.
      do j = 1, i-1
         Swap = .false.
          ! Проверка на то, стоит ли менять учащихся местами.
         Swap = swap_doljnost(Doljnost,Post(:,j),Post(:,j+1))
         if(.not. Swap .and. GT(Surnames(:,j),Surnames(:,j+1)) .and. All(Post(:,j)==Post(:,j+1))) Swap = .true.

         if (Swap) then
            tmpSurname        = Surnames(:,j+1)
            Surnames(:,j+1)   = Surnames(:,j)
            Surnames(:,j)     = tmpSurname

            tmpPost           = Post(:,j+1)
            Post(:,j+1)       = Post(:,j)
            Post(:,j)         = tmpPost

         end if
      end do
   end do

    end subroutine sort_employes_list

    pure logical function swap_doljnost(Doljnost,arr1,arr2)
      character (kind=CH_) arr1(:), Doljnost(:,:),arr2(:)
      intent (in) arr1,Doljnost,arr2
      integer i,j,k
      swap_doljnost = .false.
      j=0
      k=0
      do  i=1, DOLJNOST_LEN
         if (ALL(arr1(:)==Doljnost(:,i)))j=i
         if (ALL(arr2(:)==Doljnost(:,i)))k=i
      end do
      swap_doljnost = j>k
   end function swap_doljnost

   pure logical function GT(arr1, arr2)
    character(kind=CH_), intent(in) :: arr1(:), arr2(:)

    integer :: i

    ! Поиск первого отличного символа или остановка на последнем символе.
    do i = 1, Min(Size(arr1), Size(arr2)) - 1
       if (arr1(i) /= arr2(i)) &
          exit
    end do
    GT = arr1(i) > arr2(i)
 end function GT


   
end program reference_lab_1_2
