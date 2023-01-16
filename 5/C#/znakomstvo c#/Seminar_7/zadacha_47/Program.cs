// See https://aka.ms/new-console-template for more information
int maxValue = 100;
int minValue = -100;
Console.WriteLine("введите m- количество строк");
int m = Convert.ToInt32(Console.ReadLine());
Console.WriteLine("введите n-количество столбцов");
int n = Convert.ToInt32(Console.ReadLine());
double[,] arr = new double[m,n];
Random rn = new Random();
for(int i=0; i<m;i++){

    for(int j=0; j<n;j++){
        arr[i,j]=
        rn.NextDouble()*(maxValue-minValue)+minValue;
        Console.Write(" {0:N1} ",arr[i,j]);
    }
    Console.WriteLine();
}
