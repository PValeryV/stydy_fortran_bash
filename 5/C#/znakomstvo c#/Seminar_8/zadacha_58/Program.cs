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
            arr[i,j]=rn.Next(1,6);
    }
}

int [,] multiplication(int[,] arr1, int[,] arr2){
    int [,] tempArr = new int[arr1.GetLength(0),arr2.GetLength(1)];
    for(int i=0;i<tempArr.GetLength(0);i++)
        for(int j=0;j<tempArr.GetLength(0);j++){
            int temp = 0;
            for(int str=0;str<arr1.GetLength(1);str++)
                temp += (arr1[i,str]*arr2[str,j]);
            tempArr[i,j]=temp;
        }
    return tempArr;
}
int m = 3;
int n = 2;
int b = 3;
int[,] arr1 = new int[m,n];
int[,] arr2 = new int[n,b];
int[,] itogArr = new int[m,b];
Console.WriteLine("Произведение двух матриц");
Console.WriteLine("Задана матрица 1:");
fill(ref arr1);
print(arr1);

Console.WriteLine("Задана матрица 2:");
fill(ref arr2);
print(arr2);

Console.WriteLine("результирующая матрица");
if(arr1.GetLength(1)==arr2.GetLength(0)){
    itogArr = multiplication(arr1,arr2);
    print(itogArr);
}else{
    Console.WriteLine("Решения нет");
}