# Solution

### Project Structure (solution/)

- `solution/`
  - `main.rb`: Driver function
  - `lib/`
    - `match.rb`: middleware for user input conversion and mapping to match set
    - `match_set.rb`: game and score management class 
    - `player.rb`: player class to store game score
    - `game_type/`
      - `base_game.rb`: abstract class for game implementation
      - `default_game.rb`: default game class
      - `tie_break_game.rb`: tie breaker game class
- `spec/`: Similar structure to `lib` folder with tests around it.

### Enhancements

- I couldn't use the best practices around rspec, if I had more time I could have utilized mocking of classes, avoid repetition of code by using fixtures and factory code.
- `winner` logic for `MatchSet` hasn't been tested properly. I could have built more test cases around it.
- `MatchSet` class could be extended to have multiple sets as well.