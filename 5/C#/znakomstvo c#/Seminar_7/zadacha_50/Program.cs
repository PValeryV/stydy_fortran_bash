// See https://aka.ms/new-console-template for more information
void element(int value,int[,] arr){
if ((arr.GetLength(0)*arr.GetLength(1))<value){
    Console.WriteLine("такого элемента в массиве нет");
}else{
    
    int pozM = arr.GetLength(0);
    while (value<=(pozM*arr.GetLength(1)))pozM-=1;
    
    int pozN = value-(pozM*arr.GetLength(1));
        Console.WriteLine(pozM);
        Console.WriteLine(pozN);

    Console.WriteLine($"{arr[pozM,pozN-1]}");
}
}




int m = 10;
int n = 10;
int[,] arr = new int[m,n];
Random rn = new Random();
for(int i=0; i<m;i++){

    for(int j=0; j<n;j++){
        arr[i,j]=rn.Next(300);
        Console.Write($" {arr[i,j]} ");
    }
    Console.WriteLine();
}
Console.WriteLine("Введите позицию элемента который необходимо вывести");
int value = Convert.ToInt32(Console.ReadLine());
element(value,arr);



