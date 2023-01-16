program reference_lab_1_1
   use Environment

   implicit none
   integer, parameter               :: AMOUNT = 6, SURNAME_LEN = 15, POST_LEN = 15, DOLJNOST_LEN = 4
   character(kind=CH_), parameter   :: MALE = Char(1052, CH_) !CH__"\u1052" CH__"М"
   character(:), allocatable  :: input_file, input_prof, output_file, format

   ! Массивы фамилий, инициалов, полов, оценок и средних оценов и временные
   ! переменные для обменов при сортировке.
   character(SURNAME_LEN, kind=CH_)                :: tmpSurname = "", Surnames(AMOUNT) = ""
   
   character(POST_LEN, kind=CH_)                   :: tmpPost = "", Post(AMOUNT) = "",Doljnost(4) = ""

   integer :: In, Out, IO, i, j
   logical :: Swap
   
   input_file = "../data/class.txt"
   input_prof = "../data/prof.txt"
   output_file = "output.txt"
   ! Чтение списка класса: фамилии, инициалы, полы, оценки и средний.
   open (file=input_file, encoding=E_, newunit=In)
      format = '(2(a, 1x))'
      read (In, format, iostat=IO) (Surnames(i), post(i), i = 1, AMOUNT)
   close (In)

   open (file=input_prof, encoding=E_, newunit=In)
   read (In, '(a)', iostat=IO) (Doljnost(i), i = 1, DOLJNOST_LEN)
   close (In)
 
   ! Обработка статуса чтения.
   Out = OUTPUT_UNIT
   open (Out, encoding=E_)
   select case(IO)
      case(0)
      case(IOSTAT_END)
         write (Out, '(a)') "End of file has been reached while reading class list."
      case(1:)
         write (Out, '(a)') "Error while reading class list: ", IO
      case default
         write (Out, '(a)') "Undetermined error has been reached while reading class list: ", io
   end select

   ! Вывод списка класса.
   open (file=output_file, encoding=E_, newunit=Out)
      write (Out, '(a)') "Список должнотей, в порядке подчиненности:"
      write (Out, '(a)', iostat=IO) (DOLJNOST(i), i=1,DOLJNOST_LEN)
      write (out,'(/,a)') "Исходный список:"
      ! Пояснения к записи те же, что и к чтению.
      write (Out, format, iostat=IO) (Surnames(i), post(i), i = 1, AMOUNT)
   close (Out)
   ! Обработка статуса записи.
   Out = OUTPUT_UNIT
   open (Out, encoding=E_)
   select case(io)
      case(0)
      case(IOSTAT_END)
         write (Out, '(a)') "End of file has been reached while writing class list."
      case(1:)
         write (Out, '(a)') "Error while writing class list: ", io
      case default
         write (Out, '(a)') "Undetermined error has been reached while writing class list: ", io
   end select

   ! Сортировка списка девушек по среднему баллу методом пузырька.i
   do i = AMOUNT, 1, -1
      ! Просматриваем список с начала, ставя в конец менее успешного.
      do j = 1, i-1
         Swap = .false.
         ! Проверка на то, стоит ли менять учащихся местами.
         if (FindLoc(Doljnost,Post(j),dim=1)>Findloc(Doljnost,Post(j+1),dim =1)) then
            Swap = .true.
            else if (Surnames(j)>Surnames(j+1) .and. Post(j) == Post(j+1)) then
               Swap = .true.
         end if

         if (Swap) then
            tmpSurname      = Surnames(j+1)
            Surnames(j+1)   = Surnames(j)
            Surnames(j)     = tmpSurname

            tmpPost         = Post(j+1)
            Post(j+1)       = Post(j)
            Post(j)         = tmpPost

         end if
      end do
      if (.not. Swap) exit 
   end do

   ! Вывод отсортированного списка юношей со средним баллом.
   open (file=output_file, encoding=E_, position='append', newunit=Out)
      write (out, '(/a)') "Отсортированный по должностям:"
      write (Out, format, iostat=IO) (Surnames(i), Post(i), i = 1, Amount)
   close (Out)
   ! Обработка статуса записи.
   Out = OUTPUT_UNIT
   open (Out, encoding=E_)
   select case(io)
      case(0)
      case(IOSTAT_END)
         write (Out, '(a)') "End of file has been reached while writing sorted boys list."
      case(1:)
         write (Out, '(a)') "Error while writing sorted boys list: ", io
      case default
         write (Out, '(a)') "Undetermined error has been reached while writing sorted boys list: ", io
   end select
   
end program reference_lab_1_1
