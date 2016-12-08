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
      checking
      @game.score_count
      puts "Your score: #{@game.score}!"
      puts 'Do you want to start new game?(y/n)'
      new_game ? play : save_score
    end

    private
    def checking
      until @game.win?
        @game.check_guess(input_code)
        return @game.check_win if @game.attempts.zero?
      end
    end

    def new_game
      @game = Game.new(@game.score) if agree?
    end
  end
end
