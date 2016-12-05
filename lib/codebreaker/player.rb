module Codebreaker
  class Player
    attr_accessor :name, :player_code, :score
    def initialize(score = 0)
      @name = input_name
      @player_code = ''
      @score = score
    end

    def guess
      print 'Type your secret code or "hint": '
      @player_code = input_code
    end

    def agree?
      input =~ /^yes|y/i ? true : false
    end

    private

    def input
      gets.chomp
    end

    def input_name
      print 'Please, enter your name: '
      input
    end

    def input_code
      player_code = input
      if  player_code.size == Codebreaker::Game::CODE_SIZE ||
          player_code      == 'hint'
        player_code
      else
        puts 'You should type 4 numbers in code or "hint"!!!'
        input_code
      end
    end
  end
end
