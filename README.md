# PactFlow Ruby Coding Test
## Overview

Welcome to this Ruby coding test. This test is designed to assess your ability to write clean, well-structured, and maintainable code. You will be tasked to create a solution for a specific requirement outline below.

We will be looking for the following aspects:

1.  The readability and clarity of your code; including aspects such as:
    -   Naming conventions
    -   Code structure
    -   Comments
    -   Documentation
2.  The correctness of your code; including aspects such as:
    -   Handling of edge cases
    -   Error handling
    -   Testing
3.  The maintainability of your code; including aspects such as:
    -   Modularity
    -   Extensibility
    -   Reusability
4.  Your familiarity with standard development tools and practices; including
    aspects such as:
    -   Version control
    -   Creating and using virtual environments
    -   Documenting PRs and commits

## Submission

- Please fork this repository and submit your solution as a Pull Request.
- Write your solution in the solution folder, we expect to see several commits, as you implement the solution.
- Your solution should have proof that it passes the requirements by using rspec.
- Don't spend more than 2 hours maximum.
- If you run out of time, please add details of what you would have done better given more time on your Pull Request.
- When you've finished, send through the link to your Pull Request.

## The Requirement

World Tennis Association (WTA) is hosting a tennis tournament. To aid with this, we're developing a scoring system.

The scoring system for tennis works like this.

* A match has one set and a set has many games

* A game is won by the first player to have won at least 4 points in total and at least 2 points more than the opponent.

  * The running score of each game is described in a manner peculiar to tennis: scores from zero to three points are described as 0, 15, 30, 40, respectively

 * If at least 3 points have been scored by each player, and the scores are equal, the score is "deuce".

 * If at least 3 points have been scored by each side and a player has one more point than his opponent, the score of the game is "advantage" for the player in the lead.

* There are many games to a set in tennis

 * A player wins a set by winning at least 6 games and at least 2 games more than the opponent.
 
 * If one player has won six games and the opponent five, an additional game is played. If the leading player wins that game, the player wins the set 7–5. If the trailing player wins the game, a tie-break is played.
 
 * A tie-break, played under a separate set of rules, allows one player to win one more game and thus the set, to give a final set score of 7–6. A tie-break is scored one point at a time. The tie-break game continues until one player wins seven points by a margin of two or more points. Instead of being scored from 0, 15, 30, 40 like regular games, the score for a tie breaker goes up incrementally from 0 by 1. i.e a player's score will go  from 0 to 1 to 2 to 3 …etc.
 
* Add a score method that will return the current set score followed by the current game score 

* Add a pointWonBy method that indicates who won the point

### Constraints

* Only worry about 1 set
* Don't worry about validation, assume the client passes in correct data

More information on tennis scoring can be found here https://en.wikipedia.org/wiki/Tennis_scoring_system

### Example Interface

The interface should look something like this in Java:

```

  Match match = new Match("player 1", "player 2");
  match.pointWonBy("player 1");
  match.pointWonBy("player 2");
  // this will return "0-0, 15-15"
  match.score();

  match.pointWonBy("player 1");
  match.pointWonBy("player 1");
  // this will return "0-0, 40-15"
  match.score();
  
  match.pointWonBy("player 2");
  match.pointWonBy("player 2");
  // this will return "0-0, Deuce"
  match.score();
  
  match.pointWonBy("player 1");
  // this will return "0-0, Advantage player 1"
  match.score();
  
  match.pointWonBy("player 1");
  // this will return "1-0"
  match.score();
 
```

### Implementation Notes

- Use Ruby 3.x.x
- Don't build GUIs, we're more interested in your approach to solving the given task, not how shiny it looks.
- Don't worry about making a command line interface to the application.
- Don't use any frameworks (rails), or any external gems (unless it's for testing or build/dependency management)
- Use as many commits as you need, remember, we want to see how you approached the solution, not just the end result in one commit
- Happy coding!