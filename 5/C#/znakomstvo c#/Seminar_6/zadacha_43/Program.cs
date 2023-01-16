// See https://aka.ms/new-console-template for more information
double b1 = 0;
double k1 = 0;
double b2 = 0;
double k2 = 0;
Console.WriteLine("введите b1");
b1=Convert.ToDouble(Console.ReadLine());
Console.WriteLine("введите k1");
k1=Convert.ToDouble(Console.ReadLine());

Console.WriteLine("введите b2");
b2=Convert.ToDouble(Console.ReadLine());
Console.WriteLine("введите k2");
k2=Convert.ToDouble(Console.ReadLine());

double x = ((b2-b1)/(k1-k2));
double y = (k1*x)+b1;
Console.WriteLine($"({x}; {y} )");

