// See https://aka.ms/new-console-template for more information
Double[] arithMean(int [,]arr){
    double[] arithArr = new double [arr.GetLength(1)];
for(int i=0;i<arr.GetLength(1);i++){
    for(int j=0;j<arr.GetLength(0);j++){
        arithArr[i]+= Convert.ToDouble(arr[j,i]);
    }
    arithArr[i]/=Convert.ToDouble(arr.GetLength(0));
}
return arithArr;
}

void print(Double[] arr){
    Console.Write("Среднее Арифметическое каждого столбца: ");
    for (int i=0;i<arr.Length;i++){
        Console.Write($" {arr[i]}");
        if (i+1==arr.Length){
            Console.Write(".");
        }else{
            Console.Write(";");
        }
    }
}




int m = 2;
int n = 5;
int[,] arr = new int[m,n];
Random rn = new Random();
for(int i=0; i<m;i++){

    for(int j=0; j<n;j++){
        arr[i,j]=rn.Next(300);
        Console.Write($" {arr[i,j]} ");
    }
    Console.WriteLine();
}
print(arithMean(arr));



