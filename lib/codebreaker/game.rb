require_relative 'player'

module Codebreaker
  class Game
    attr_accessor :secret_code, :player
    def initialize(player)
      @secret_code = [rand(6),rand(6),rand(6),rand(6)].join
      @player = player  
    end

    def start
      puts '[Game]: You should to break a secret code ****. You have 5 attempts and 1 hint.'
      @player.submits_guess
    end
  end
end


# game = Codebreaker::Game.new(Codebreaker::Player.new)
# game.start