// See https://aka.ms/new-console-template for more information
Console.WriteLine("Введите число");
int Length = Convert.ToInt32(Console.ReadLine());
int [] arr = new int [Length];
Random znach = new Random();
for (int i=0;i<Length;i++){
    arr[i]=znach.Next(0,2);
    Console.Write($"{arr[i]} ");
}



 