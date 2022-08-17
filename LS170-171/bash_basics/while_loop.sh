#!/bin/bash

counter=10
end=0

while [ $counter -ge $end ]
do
  if [[ $counter -gt $end ]]
  then 
    echo $counter to blastoff
  else
    echo BLASTOFF!
  fi
  ((counter--))
done