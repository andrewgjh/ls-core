#!/bin/bash

age=3

until [[ $age -ge 18 ]]
do
  echo You are only $age and you cannot buy lottery tickets!
  ((age++))
done