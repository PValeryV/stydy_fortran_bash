// See https://aka.ms/new-console-template for more information
int summRowNum(int m, int n){
if ((m<1)&&(n<1)){
    Console.Write("В ряду нет натуральных чисел. ");
    return 0;
}
if (m<=0) m =1;
if (n<=0) n =1;
int summ = 0;
if(m<n){
    for(;m<=n;m++){
        summ+=m;
    }  
}else{
        for(;m>=n;m--){
        summ+=m;
    }  
}
return summ;
}


Console.WriteLine("Введите M");
int M = Convert.ToInt32(Console.ReadLine());

Console.WriteLine("Введите N");
int N = Convert.ToInt32(Console.ReadLine());

Console.WriteLine($"{summRowNum(M,N)}");

