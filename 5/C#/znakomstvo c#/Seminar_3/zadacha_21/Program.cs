// See https://aka.ms/new-console-template for more information

void Zero(ref int[] arr){
    for (int i=0;i<3;i++){
        arr[i]=0;
    }
}
void readXYZ(ref int[] arr){
string list = Console.ReadLine();
 list = list.Replace(" ", ",");
string[] tt = list.Split(",");
for (int i = 0; i < tt.Length; i++)
    {
         arr[i] = Convert.ToInt32(tt[i]);
    };

}

Double distance(int [] arrA, int [] arrB){
    int tempX=Math.Abs(arrA[0]-arrB[0]);
    int tempY=Math.Abs(arrA[1]-arrB[1]);
    int tempZ=Math.Abs(arrA[2]-arrB[2]);
    
    int distXY=(tempX*tempX)+(tempY*tempY);
    double dis2D=Math.Sqrt(distXY);
    double D=Math.Round(Math.Sqrt((tempZ*tempZ)+(dis2D*dis2D)),2);
    return D;

}

int []arrA = new int[3];
int []arrB = new int[3];
Zero(ref arrA);
Zero(ref arrB);

Console.WriteLine("Введите координаты точки A: X,Y,Z");
readXYZ(ref arrA);

Console.WriteLine("Введите координаты точки В: X,Y,Z");
readXYZ(ref arrB);



Console.WriteLine(distance(arrA,arrB));