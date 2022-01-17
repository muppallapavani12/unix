#!/usr/bin/env bash
# File: guessinggame.sh

function test_num()
{
  local offset=0
  local num=$(eval ls | wc -l)
  local high=`expr $num + 2`
  local low=`expr $num - 2`
  echo "test_num() guess number expected between $high and $low"

  if [[ $1 -eq $num ]]
  then
    echo "Congratulations, $1 number of files guess is correct"
  elif [[ $1 -le $num ]] && [[ $1 -ge $low ]]
  then
    echo "The Guess $1 is slightly off the mark"
    let offset=1
  elif [[ $1 -ge $num ]] && [[ $1 -le $high ]]
  then
    echo "The Guess $1 is slightly off the mark"
    let offset=1
  else
    echo "The guess $1 is long way off the mark"
    let offset=1
  fi
  return $offset
     
}

while [[ $1 -ge 0 ]]
do
  echo "Please input your no of files guess:"
  read guess
  echo "Main guess number is $guess"
  test_num $guess
  if [[ $? -eq 0 ]]
  then
    break
  fi
done