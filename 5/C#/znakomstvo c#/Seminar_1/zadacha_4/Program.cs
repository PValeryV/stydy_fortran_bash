
Console.WriteLine("Введите 3 числа");
string list = Console.ReadLine();
 list = list.Replace(" ", ",");
string[] tt = list.Split(",");
int[] arr = new int[tt.Length];

for (int i = 0; i < tt.Length; i++)
    {
         arr[i] = Convert.ToInt32(tt[i]);
    };
int max = arr[0];
if (max<arr[1]) max = arr[1];
if (max<arr[2]) max = arr[2];

Console.WriteLine($"max = {max}");