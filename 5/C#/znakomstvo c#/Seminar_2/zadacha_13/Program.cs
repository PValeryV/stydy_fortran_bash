// See https://aka.ms/new-console-template for more information
int len(int a){
    string temp = Convert.ToString(a);
    int temp_1=temp.Length;
    return temp_1;
}
int fun(int a,int n){
    
    
    
    int temp = len(a)-n;
    a=a%Convert.ToInt32((Math.Pow(10,temp+1)));
    
    int temp_1=a/Convert.ToInt32((Math.Pow(10,temp)));
    
    return temp_1;
}



Console.WriteLine("Введите число");
int a = Convert.ToInt32(Console.ReadLine());
int n = 3;//порядковый номер цифры которую нужно вывести

if (len(a)<3){
    Console.WriteLine("Третьей цифры Нет");
    return;
}

Console.WriteLine(fun(a,n));
