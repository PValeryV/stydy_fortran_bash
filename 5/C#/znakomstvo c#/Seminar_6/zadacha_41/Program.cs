// See https://aka.ms/new-console-template for more information
Console.WriteLine("Введите числа, через запятую");
string? str = Console.ReadLine();
str = str.Replace(" ","");
string[] arrStr = str.Split(",");
int[] arr = new int[arrStr.Length];
for (int i=0;i<arrStr.Length;i++){
    arr[i] = Convert.ToInt32(arrStr[i]);
}
int count =0;
for (int i=0;i<arr.Length;i++){
    if (arr[i]>0)count+=1;
}
Console.WriteLine(count);