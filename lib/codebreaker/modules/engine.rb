module Codebreaker
  module Engine
    def check_guess
      @player_code = @player.guess
      if @player_code == 'hint' && @hint.nonzero?
        puts 'Hint: Secret code contains: ' + @secret_code[rand(0..3)]
        @hint -= 1
        @attempts += 1
      end
      check_win
    end

    private

    def check_win
      if win?
        puts 'Congratulation! You win!'
      elsif @attempts.zero?
        puts "Game over! Secret code is #{@secret_code}."
        @hint = 0
      else
        puts((pluses + minuses).join)
        @attempts -= 1
        start
      end
    end

    def array_player_code
      @player_code.chars.to_a
    end

    def pluses
      array_player_code.map.with_index { |num, index| '+' if num == @secret_code[index] }.compact
    end

    def minuses
      secret_code = @secret_code.chars.to_a.sort
      array_player_code.sort.map.with_index { |num, index| '-' if num == secret_code[index] }.compact.drop(pluses.size)
    end

    def win?
      @secret_code == @player_code
    end
  end
end
