// See https://aka.ms/new-console-template for more information
void print(int[,] arr){
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++)
            Console.Write($" {arr[i,j]} ");
        Console.WriteLine();
    }
Console.WriteLine();
}

void regulate(ref int [,] arr){
    for(int turnover=0; turnover<arr.GetLength(1); turnover++)
        for(int i=0; i<arr.GetLength(0);i++){
            for(int j=1; j<arr.GetLength(1);j++)
                if(arr[i,j-1]<arr[i,j]) {
                    int temp = arr[i,j-1];
                    arr[i,j-1] = arr[i,j];
                    arr[i,j] = temp;
                }
        }
}

void fill(ref int [,] arr){
    Random rn = new Random();
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++) 
            arr[i,j]=rn.Next(300);
    }
}

int m = 10;
int n = 10;
int[,] arr = new int[m,n];

Console.WriteLine("Задан массив:");
fill(ref arr);
print(arr);

Console.WriteLine("Упорядоченный массив:");
regulate(ref arr);
print(arr);
