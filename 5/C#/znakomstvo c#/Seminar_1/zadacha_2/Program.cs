// See https://aka.ms/new-console-template for more information


Console.WriteLine("Введите 1-ое число");
int a = Convert.ToInt32(Console.ReadLine());

Console.WriteLine("Введите 2-ое число");

int b = Convert.ToInt32(Console.ReadLine());

if (a > b){
    Console.WriteLine($"max =  {a}");
}else{
    Console.WriteLine($"max =  {b} ");
}
