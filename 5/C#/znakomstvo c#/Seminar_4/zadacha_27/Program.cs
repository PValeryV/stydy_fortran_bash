// See https://aka.ms/new-console-template for more information
int Length(int value)
{
       
    int i=0;
    for (;value>0;i++)
    {
        value=value/10;
    }
    
    return i;
}
void Massiv(ref int[]arr,int N)
{
    int lgth =Length(N);
    for (int i=0;i<lgth;i++)
    {
        arr[i]= N % 10;
        N = N / 10;
    }
}
int Summa(int[] arr){
    int summ=0;
    for (int i=0;i<arr.Length;i++)
    {
        summ += arr[i];
    }
    return summ;
}

Console.WriteLine("введите число");
int N = Convert.ToInt32(Console.ReadLine());
int [] arr = new int[Length(N)];
Massiv(ref arr,N);
Console.WriteLine(Summa(arr));



