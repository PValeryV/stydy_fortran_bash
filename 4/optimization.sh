#!/bin/bash
read -p "Enter file name:" file
if [ -f "$file" ]; then
   opt[0]="-O0" 
   opt[1]="-Os" 
   opt[2]="-O1" 
   opt[3]="-O2" 
   opt[4]="-O3" 
   opt[5]="-O2 -march=native"
   opt[6]="-O3 -march=native"
   opt[7]="-O2 -march=native -funroll-loops"
   opt[8]="-flto" 
   opt[9]="-O3 -flto -march=native"
   opt[10]="-fipa-cp-clone"
   opt[11]="-fipa-reference"
   opt[12]="-fipa-pta"
   opt[13]="-O3 -march=native -fipa-reference"
   opt[14]="-fprofile-generate"
   opt[15]="-O3 -march=native -fprofile-generate"
   opt[16]="-fprofile-use"
   opt[17]="-O3 -march=native -fprofile-use"
   for (( i=0; i <= 17; i++ ))
   do
      echo "Optimization name: ${opt[$i]}"
      gcc -Wall ${opt[$i]} $file -o code$i -lm 
      time ./code$i
      du -b ./code$i
   done
else
   echo "$file does not exist"
fi
