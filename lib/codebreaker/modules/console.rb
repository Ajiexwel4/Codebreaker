module Codebreaker
  module Console
    def input
      gets.chomp
    end

    def input_name
      print 'Please, enter your name: '
      input
    end

    def input_code
      puts "You have #{@game.attempts} attempts and #{@game.hint} hint."
      print 'Type your secret code or "hint": '
      player_code = input
      if player_code =~ /^[1-6]{4}|hint$/
        player_code
      else
        puts 'You should type 4 numbers in code or "hint"!!!'
        input_code
      end
    end

    def agree?
      input =~ /^(yes|y)$/i ? true : false
    end

    def new_game
      @game = Game.new(@game.score) if agree?
    end
  end
end
