#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"


# FUNCTIONS


# Function of getting the user's history in the database
CHECK_USER_HISTORY(){
  local username="$1"
  local query="SELECT COUNT(*), MIN(num_guess)
               FROM games
               WHERE username='$username'
               GROUP BY user_id"
  $PSQL "$query"
}


# Function of adding game user's game details to the database
INSERT_GAME_DETAILS(){
  local username="$1"
  local num_guess="$2"
  local query="INSERT INTO games(username, num_guess)
               VALUES('$username', $num_guess)"
  $PSQL "$query"
}



# MAIN


# Getting the username
echo "Enter your username:"
read USERNAME


# Getting user history if present
USER_HISTORY="$(CHECK_USER_HISTORY "$USERNAME")"
read GAMES_PLAYED BAR NUM_GUESS_BEST <<< "$USER_HISTORY"


# Message whether or not user history is present
if [[ -z $USER_HISTORY ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $NUM_GUESS_BEST guesses."
fi


# Initializing the number guessing game
echo "Guess the secret number between 1 and 1000:"
read GUESS
RANDOM_NUM=$((RANDOM % 1001))
GUESSED=false
NUM_GUESS=0


# Loop for number guessing game
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


# Add the game details to database
ADD_TO_DATABASE="$(INSERT_GAME_DETAILS "$USERNAME" $NUM_GUESS)"