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

random_number=$((RANDOM % 1001))

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