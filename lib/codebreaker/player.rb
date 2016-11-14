module Codebreaker
  class Player
    attr_accessor :player_code, :name, :attempt
    def initialize
      print '[Game]: Please, enter your name: '
      @name = gets.chomp
      @attempt = 5
      @player_code = ""
    end

    def submits_guess
      print '[Game]: Type your secret code or "hint": '
      @player_code = gets(4)
    end
  end
end