// See https://aka.ms/new-console-template for more information

Console.WriteLine("Введите число");
double n = Convert.ToDouble(Console.ReadLine());

 for (int i=2;i<=n;i+=2){
        Console.Write($"{i} " );
 }
