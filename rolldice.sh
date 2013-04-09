#!/bin/bash

NUMBER_DIE=$1
SIZE_DIE=$2
MAX_ROLLS=500
LARGEST_DIE=100

[[ $SIZE_DIE -eq 2 ]] && echo "You might want to try flipcoin.sh" && exit 1
[[ $SIZE_DIE -le 1 ]] && echo "I don't have a die that small!" && exit 1
[[ $SIZE_DIE -gt $LARGEST_DIE ]] && echo "I don't have a die that big!" && exit 1
[[ $NUMBER_DIE -le 0 ]] && echo "Okay, I just won't roll any dice then." && exit 1
[[ $NUMBER_DIE -gt $MAX_ROLLS ]] && echo "My arm will get tired if I try to roll that many!" && exit 1

echo "Rolling ${NUMBER_DIE}d${SIZE_DIE}"

sum=0

for (( i = 1; i <= $NUMBER_DIE ; i++ ))
do
  roll=$RANDOM
  let "roll %= $SIZE_DIE" # leave it to be a d6
  let "roll += 1" # increment by one (there's no zero on a die)
  let "sum += roll"
  echo "Roll $i = $roll"
done

echo
echo "Total = $sum"
