require_relative 'modules/marker'

module Codebreaker
  class Game
    include Marker

    ATTEMPTS  = 6
    HINT      = 1

    attr_reader :secret_code, :hint, :attempts, :score, :game_start
    def initialize(score = 0)
      @secret_code = Array.new(4) { rand(1..6) }.join
      @player_code = ''
      @hint        = HINT
      @attempts    = ATTEMPTS
      @score       = score
      @game_start  = true
    end

    def check_guess(guess)
      @player_code = guess
      if @player_code == 'hint' && @hint.nonzero?
        @attempts += 1
        @hint -= 1
        puts "Hint: Secret code contains: #{@secret_code[rand(0..3)]}"
      end
      check_win
    end

    def score_count
      @score += 250 if win?
      @score += @hint * 100 + @attempts * 50
    end
  end
end
