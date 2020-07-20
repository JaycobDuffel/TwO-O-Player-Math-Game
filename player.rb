class Player
  attr_accessor :lives, :name, :turn
  @@number_of_players = 0
  def initialize(lives = 3, turn = false, name = "Player #{@@number_of_players + 1}")
    @@number_of_players += 1
    @turn = turn
    @lives = lives
    @name = name
  end

  def check_lives
    @lives > 0
  end
end