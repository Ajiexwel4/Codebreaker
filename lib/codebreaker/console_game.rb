require_relative 'modules/console'
require_relative 'modules/score'

module Codebreaker
  class ConsoleGame
    include Console
    include Score

    def initialize
      @game = Game.new
    end

    def play
      puts 'You should to break a secret code ****.'
      puts @game.check_guess(input_code) until @game.win? || @game.game_start == false
      @game.score_count
      puts "Your score: #{@game.score}!"
      puts 'Do you want to start new game?(y/n)'
      new_game ? play : save_score
    end
  end
end
