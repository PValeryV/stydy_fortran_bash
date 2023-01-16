// See https://aka.ms/new-console-template for more information
int n = 200;//число элеметнов в массиве
int []  arr = new int[n];
int sumOdd=0;
Random rand = new Random();
for (int i =0; i<n;i++){
    
   arr[i] = rand.Next(200);
   int resh = rand.Next(0,2);
   if (resh==1)arr[i]*=(-1);
}

Console.Write("элементы массива [");
for (int i = 0;i<n;i++){
    if (i%2 == 1)sumOdd+=arr[i];
    Console.Write($"{arr[i]} ");
}
Console.WriteLine("]");
Console.WriteLine($"Сумма элементом находящихся на нечетных позициях массива = {sumOdd}");