#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"


if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    SEARCH=$($PSQL "select * from properties join elements using(atomic_number) join types using(type_id) where atomic_number=$1;")
  else
    SEARCH=$($PSQL "select * from properties join elements using(atomic_number) join types using(type_id) where symbol = '$1' or name = '$1';")
  fi
  if [[ -z $SEARCH ]]
  then
    echo -e "I could not find that element in the database."
  else
    echo $SEARCH | sed 's/|/ /g' | while read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
    do
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi
