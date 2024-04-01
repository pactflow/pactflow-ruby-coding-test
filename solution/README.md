# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.0.2

* Run the following command to execute the script:  ruby match.rb

* You'll see the output displaying the current score of the match.
  
  Here's an example of how to use the `Match` class:

   	match = Match.new("player 1", "player 2")
	match.point_won_by("player 1")
	match.point_won_by("player 2")

	match.point_won_by("player 1")
	match.point_won_by("player 1")

	match.point_won_by("player 2")
	match.point_won_by("player 2")
	match.point_won_by("player 1")
	match.point_won_by("player 1")

	puts match.score # This will output the current score of the match