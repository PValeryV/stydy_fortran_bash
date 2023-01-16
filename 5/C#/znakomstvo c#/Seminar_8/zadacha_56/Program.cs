// See https://aka.ms/new-console-template for more information
void print(int[,] arr){
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++)
            Console.Write($" {arr[i,j]} ");
        Console.WriteLine();
    }
Console.WriteLine();
}

void fill(ref int [,] arr){
    Random rn = new Random();
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++) 
            arr[i,j]=rn.Next(300);
    }
}
int smallSum(int[,] arr){
    int minSum=0;
    int sequenceNumb=0;
    for(int i=0; i<arr.GetLength(0);i++){
        int temp =0;
        for(int j=0; j<arr.GetLength(1);j++)
                temp+=arr[i,j];

        if((i==0)||(minSum>temp)){
                minSum=temp;
                sequenceNumb=i+1;
        }
    }
    return sequenceNumb;
}

int m = 6;
int n = 5;
int[,] arr = new int[m,n];

Console.WriteLine("Задан прямоугольный массив:");
fill(ref arr);
print(arr);
Console.WriteLine("Программа считает сумму элементов в каждой строке и выдаёт "+
        $"номер строки с наименьшей суммой элементов: {smallSum(arr)} строка.");
