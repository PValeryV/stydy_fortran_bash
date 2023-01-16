#!/bin/bash

if [[ -z $1 || -z $2 || -z $3 ]]
then
   echo "Not enough parameterst"
else
res=$1
shift 1

while [ $# -ge 2 ]
do
   case $1 in
      "+") res=$(echo "scale=6;$res + $2" | bc);;
      "-") res=$(echo "scale=6;$res - $2" | bc);;
      "*") res=$(echo "scale=6;$res * $2" | bc);;
      "/") if [[ $2 =~ 0.[0]* ]]
           then 
              echo Division by zero
              exit 0
           else
              res=$(echo "scale=6;$res / $2" | bc)
           fi;;
      *) echo Error! Wrong operator!
   esac
   shift 2
done
   echo $res
fi
