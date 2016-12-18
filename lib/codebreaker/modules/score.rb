module Codebreaker
  module Score
    def save_score
      puts 'Do you want to save your score in score file?(y/n)'
      save_score_file if agree?
      exit
    end

    private

    def save_score_file
      name = input_name
      path = File.expand_path('../../score/score.txt', __FILE__)
      File.open(path, 'a') { |file| file.puts "#{name}: #{@game.score} score on #{Time.now.asctime}" }
      puts "You score saved in file: #{path}"
    end
  end
end
