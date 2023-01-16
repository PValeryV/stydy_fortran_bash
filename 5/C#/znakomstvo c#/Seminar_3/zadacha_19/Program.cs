// See https://aka.ms/new-console-template for more information
int lengthA(int value){
    int lengthA=0;
    for (;value>0;++lengthA){
        value/=10;
    }
return lengthA;
}
void mas(ref int[] arr,int a, int len){
for (int i=0;i<len;i++){
    arr[i]=a%10;
    a/=10;
}
}

bool proverka(int[] arr,int len){
bool temp=true;
for (int i=0; i<len;i++,len--){
    if (arr[i]!=arr[len-1]){
        temp=false;
        break;
    }
}
return temp;
}
Console.WriteLine("Введите шестизначное число");
int a = Convert.ToInt32(Console.ReadLine());
int [] arr = new int [lengthA(a)];
mas(ref arr,a,lengthA(a));
if (proverka(arr,lengthA(a))){
    Console.WriteLine("да");
}else{
    Console.WriteLine("нет");
}
