#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"
#$($PSQL "truncate games,users;")

echo -e "\nEnter your username:"
read USER_NAME

USER_ID=$($PSQL "select user_id from users where name='$USER_NAME';")

if [[ -z $USER_ID ]]
then
  # insert new user
  INSERT_RESULT=$($PSQL "insert into users(name) values('$USER_NAME');")
  # get user id
  USER_ID=$($PSQL "select user_id from users where name='$USER_NAME';")
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
else
  # welcome user with games_played and best_game infor
  RESULT=$($PSQL "select count(*), min(number_of_guesses) from games where user_id=$USER_ID;")
  echo "$RESULT" | sed 's/|/ /g' | while read GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

NUMBER_OF_GUESSES=0

GUESS_GAME() {
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  else
    echo -e "\nGuess the secret number between 1 and 1000:"
  fi
  read GUESS_NUMBER
  (( NUMBER_OF_GUESSES++ ))
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    GUESS_GAME "That is not an integer, guess again:"
  else
    if [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
    then
      GUESS_GAME "It's higher than that, guess again:"
    elif [[ $GUESS_NUMBER -lt $SECRET_NUMBER ]]
    then
      GUESS_GAME "It's lower than that, guess again:"
    else
      RESULT=$($PSQL "insert into games(user_id, number_of_guesses) values ($USER_ID, $NUMBER_OF_GUESSES);")
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    fi
  fi
}

GUESS_GAME
