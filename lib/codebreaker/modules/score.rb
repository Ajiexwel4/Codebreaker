module Codebreaker
  module Score
    def score
      @player.score += 250 if win?
      @player.score += @hint * 100 + @attempts * 50
      puts "#{player.name}, your score: #{@player.score}!"
    end

    def save_score?
      puts 'Do you want to save your score in score file?(y/n)'
      save_score_file if @player.agree?
      exit
    end

    private

    def save_score_file
      File.open("lib/codebreaker/score/#{@player.name}_score.txt", 'a') do |file|
        file.puts "#{@player.score} - #{Time.now.asctime}"
      end
    end
  end
end
