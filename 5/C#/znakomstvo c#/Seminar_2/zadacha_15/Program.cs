// See https://aka.ms/new-console-template for more information
Console.WriteLine("Введите день недели");
int a = Convert.ToInt32(Console.ReadLine());
if ((a>7)||(a<1)){
    Console.WriteLine("дней в неделе 7");
    return;
}

bool den(int a){
    switch(a){
case 6:
    return true;
case 7:
    return true;
default:
    return false;
    }

}
if (den(a)){Console.WriteLine("да");}else{Console.WriteLine("нет");}
