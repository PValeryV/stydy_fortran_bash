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

int translatTwoDec(int [] arr){
    int summ = 0;
    for( int i=0,foundation=1 ; i<arr.Length; i++,foundation *= 2)
    {
        summ += foundation*arr[i];
    }
    return summ;

}
Console.WriteLine("введите двоичное число");
int value = Convert.ToInt32(Console.ReadLine());
int [] arr = new int [Length(value)];
Massiv (ref arr,value);
Console.WriteLine(translatTwoDec(arr));
