// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

void print(int[]arr, int element)//печать элементов массива
{
    Console.Write("[");
    for (int i=0;i<element;i++){
    Console.Write($"{arr[i]}");
    if ((i+1)<element)Console.Write(",");
    }
    Console.Write("]");
}

void randValue(ref int[]arr, int element)//заполняю массив рандомными значениями
{
    Random rnd = new Random();
    for (int i=0;i<element;i++){
        arr[i]= rnd.Next(1,101);
    }
}


int element = 8;
int [] arr = new int[element];
randValue(ref arr,element);
print(arr,element);


