#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"


# FUNCTIONS

CHECK_USER_HISTORY(){
  local username="$1"
  local query="SELECT COUNT(*), MIN(num_guess)
               FROM games
               WHERE username='$username'
               GROUP BY user_id"
  $PSQL "$query"
}

INSERT_GAME_DETAILS(){
  local username="$1"
  local num_guess="$2"
  local query="INSERT INTO games(username, num_guess)
               VALUES('$username', $num_guess)"
  $PSQL "$query"
}



# MAIN

RANDOM_NUM=$((RANDOM % 1001))

echo "Enter your username:"
read USERNAME

USER_HISTORY="$(CHECK_USER_HISTORY "$USERNAME")"
read GAMES_PLAYED BAR NUM_GUESS_BEST <<< "$USER_HISTORY"

if [[ -z $USER_HISTORY ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $NUM_GUESS_BEST guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESSED=false
NUM_GUESS=0

while [ "$GUESSED" = false ]; do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS -gt $RANDOM_NUM ]]; then
    NUM_GUESS=$(($NUM_GUESS + 1))
    echo "It's lower than that, guess again:"
    read GUESS
  elif [[ $GUESS -lt $RANDOM_NUM ]]; then
    NUM_GUESS=$(($NUM_GUESS + 1))
    echo "It's higher than that, guess again:"
    read GUESS
  else
    NUM_GUESS=$((NUM_GUESS + 1))
    echo "You guessed it in $NUM_GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
    GUESSED=true
  fi
done