// See https://aka.ms/new-console-template for more information
Console.WriteLine("ведите N");
int value = Convert.ToInt32(Console.ReadLine());
if (value>=1){
    for(int i=1;value>=i;i++){
        Console.Write($"{i*i*i} ");
    }

}else{
    Console.WriteLine("Неверное значение N");
}
