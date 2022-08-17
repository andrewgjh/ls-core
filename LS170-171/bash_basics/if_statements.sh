#!/bin/bash

integer=15
my_name="Andrew"
my_age=31

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi


if [ $my_name="Andrew" ] && [ $my_age=31 ]
then
  echo I am alive.
fi

friends_name="John"
friends_age=33

if [[ -z $friends_name ]] || [[ $my_age -eq 32 ]]
then 
  echo $friends_name rocks!
elif [[ $my_age -lt $friends_age ]]
then
  echo "Feel greats to be alive!"
fi