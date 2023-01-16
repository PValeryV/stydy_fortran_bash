// See https://aka.ms/new-console-template for more information
void vvod(ref int a, ref int b){
    Console.WriteLine("введите число и его степень");
    string? str=Console.ReadLine();
    str = str.Replace(" ",",");
    string[] arrStr = str.Split(",");
    a=Convert.ToInt32(arrStr[0]);
    b=Convert.ToInt32(arrStr[1]);
}

int vozvedenieStepen(int a,int b){
    int itog = a;
    for (int i=1;i<b;i++){
        itog*=a;
    }
    return itog;
}


int a=0;
int b=0;

vvod(ref a,ref b);

Console.Write(vozvedenieStepen(a,b));

