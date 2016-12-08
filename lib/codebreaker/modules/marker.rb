module Codebreaker
  module Marker
    def check_win
      if win?
        puts 'Congratulation! You win!'
      elsif @attempts == 0
        puts "Game over! Secret code is #{@secret_code}."
        @hint = 0
      else
        puts "+"*pluses + '-'*(minuses-pluses)
        @attempts -= 1
      end
    end

    def pluses
      @player_code.chars.to_a.map.with_index { |num, index| '+' if num == @secret_code[index] }.compact.size
    end

    def minuses
      secret_code = @secret_code.chars.to_a
      @player_code.chars.to_a.map{ |num| secret_code[secret_code.find_index(num)] = '-' if secret_code.include?(num) }.count('-')
    end

    def win?
      @secret_code == @player_code
    end
  end
end
