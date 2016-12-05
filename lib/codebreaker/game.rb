module Codebreaker
  class Game
    include Engine
    include Score

    ATTEMPTS  = 7
    HINT      = 1
    CODE_SIZE = 4
    RANGE     = 1..6

    attr_accessor :secret_code, :player, :hint, :attempts
    def initialize(player = Player.new)
      @secret_code = Array.new(CODE_SIZE) { rand(RANGE) }.join
      @player  = player
      @hint    = HINT
      @attempts = ATTEMPTS

      start
    end

    def start
      puts "You have #{@attempts} attempts and #{@hint} hint."
      check_guess
      score
      new_game? ? start : save_score?
    end

    private

    def new_game?
      puts 'Do you want to start new game?(y/n)'
      Game.new(@player) if @player.agree?
    end
  end
end
