// See https://aka.ms/new-console-template for more information
int n = 5;//число элеметнов в массиве
int []  arr = new int[n];
int DifLastFirst=0;

Random rand = new Random();
for (int i =0; i<n;i++){
    
   arr[i] = rand.Next(200);
}
int max=arr[0];
int min=arr[0];
Console.Write("элементы массива [");
for (int i = 0;i<n;i++){
    Console.Write($"{arr[i]} ");
    if (arr[i]>max) 
    {
        max= arr[i];
    }
        if (arr[i]<min) 
    {
        min= arr[i];
    }
}
DifLastFirst=max-min;
Console.WriteLine("]");
Console.WriteLine($"Разница между максимальным и минимальным значениями массива = {DifLastFirst}");