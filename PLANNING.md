## Game

The Game class is responsible for managing the state of the game. This includes whose turn it is currently, and whether or not the game has been won yet. It will check this at the end of each player's turn. I don't think a Turn class is necessary... a turn doesn't need state, and its behaviour can be managed no problem by the game. Game is responsible for all non-question related i/o

## Player

The Player class will contain the number of lives a player has and the player's name. Player class is not responsible for i/o

## Question

The Question class will be responsible for generating random questions. It will have a method verify, which checks to see if a submitted answer is correct. It will be responsible for the i/o of a single question.