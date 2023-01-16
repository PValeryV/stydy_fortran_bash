// See https://aka.ms/new-console-template for more information
void print(int[,,] arr){
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++)
            for(int u=0; u<arr.GetLength(2);u++){
                    Console.WriteLine($" {arr[i,j,u]}({i},{j},{u})");
            }

    }
Console.WriteLine();
}

void fill(ref int [,,] arr){
    Random rn = new Random();
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++) 
            for(int u=0; u<arr.GetLength(2);u++) {
                Repeat:
                arr[i,j,u]=rn.Next(10,100);
                if (CheckRepeat(i,j,u,arr)) {
                        Console.WriteLine("repeat");
                        goto Repeat;

                }
            }
    }
}

bool CheckRepeat(int h,int x,int z, int[,,] arr){
    for(int i=0; i<arr.GetLength(0);i++){
        for(int j=0; j<arr.GetLength(1);j++) 
            for(int u=0; u<arr.GetLength(2);u++) 
              if ((arr[h,x,z]==arr[i,j,u])
                        && !((h==i)&&(x==j)&&(z==u)))
                        return true;
    }   
    return false;
}

int m = 2;
int[,,] arr = new int[m,m,m];

Console.WriteLine("Задан трехмерный массив массив:");
fill(ref arr);
print(arr);
