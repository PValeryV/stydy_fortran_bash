// See https://aka.ms/new-console-template for more information
int A(int m, int n){
    int summ =0;
    if (m==0) {
                n=n+1;
            return n;
    }
    if ((m>0)&&(n==0)){
            summ +=A(m-1, 1);
    }
      if ((m>0)&&(n>0)){
        summ +=A(m-1, A(m, n-1));
    }
    return summ;
}

Console.WriteLine("Введите M");
int M = Convert.ToInt32(Console.ReadLine());

Console.WriteLine("Введите N");
int N = Convert.ToInt32(Console.ReadLine());
Console.WriteLine($"{A(M,N)}");