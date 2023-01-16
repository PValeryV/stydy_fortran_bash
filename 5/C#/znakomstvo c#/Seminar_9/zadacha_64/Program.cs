// See https://aka.ms/new-console-template for more information
void rowNum(int m, int n){
Console.Write("\"");
if ((m<1)&&(n<1)){
    Console.Write("В ряду нет натуральных чисел");
    return;
}
if (m<=0) m =1;
if (n<=0) n =1;

if(m<n){
    for(;m<=n;m++){
        Console.Write($"{m}");
        if(m!=n)Console.Write(",");
    }  
}else{
        for(;m>=n;m--){
        Console.Write($"{m}");
        if(m!=n)Console.Write(",");
    }  
}
Console.Write("\"");
}


Console.WriteLine("Введите M");
int M = Convert.ToInt32(Console.ReadLine());

Console.WriteLine("Введите N");
int N = Convert.ToInt32(Console.ReadLine());
rowNum(M,N);


