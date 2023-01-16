// See https://aka.ms/new-console-template for more information
int n = 4;//число элеметнов в массиве
int[]  arr = new int[n];
Random rand = new Random();
int counter = 0;
for (int i =0; i<n;i++){
    arr[i] = rand.Next(100,1000);
}
Console.Write("элементы массива [");
for (int i = 0;i<n;i++){
    if (arr[i]%2 == 0)counter+=1;

    Console.Write($"{arr[i]} ");
}
Console.WriteLine("]");
Console.WriteLine($"Количество четных элементов в массиве - {counter}");
