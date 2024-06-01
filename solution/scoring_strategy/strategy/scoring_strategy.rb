module ScoringStrategy
    def point_won_by(player)
      raise NotImplementedError, "This method should be overridden"
    end
  
    def score(player1, player2)
      raise NotImplementedError, "This method should be overridden"
    end
  
    def winner(player1, player2)
      raise NotImplementedError, "This method should be overridden"
    end
end