// See https://aka.ms/new-console-template for more information
void vvod(ref int value, ref int foundation)
{
Console.WriteLine("введите десятичное представление и основание системы счисления в которую перевести, через запятую");
string? str = Console.ReadLine();
str = str.Replace(" ","");
string [] arrStr = str.Split(",");
value = Convert.ToInt32(arrStr[0]);
foundation = Convert.ToInt32(arrStr[1]);
}

int translateDecToAll(int value, int foundation){
    int temp=1;
    int length=0;
    int otvet = 0;
    for (;value>=temp;length++,temp *= foundation);
    temp /= foundation;
    int[]arr = new int[length];
    
    for(int i = length-1;i>=0;i--,temp/=foundation){
        
        arr[i]= value/temp;
        
   if (value>=temp){
    value -=temp;
        }

    }
        for(int i = 0;i<arr.Length;i++){
            Console.Write(arr[i]);
    }
    Console.WriteLine();
        for(int i = length-1;i>=0;i--){
            otvet += arr[i];
            if (i>0) otvet*=10;
    }
    return otvet;
} 

int value = 0;
int foundation = 0;

vvod(ref value, ref foundation);

Console.WriteLine(translateDecToAll(value,foundation));


