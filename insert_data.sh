#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e '\nInsert data from games.csv'

$PSQL "truncate teams,games;"

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # found team id
    WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    # if not
    if [[ -z $WINNER_TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo 'Inserted teams: '$WINNER
      fi
      # get team id
      WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    fi
    # found team id
    OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    # if not
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo 'Inserted teams: '$OPPONENT
      fi
      # get team id
      OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    fi
    # insert game
    INSERT_GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo 'Inserted game: '$YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
    fi
        
  fi
done
