module Codebreaker
  describe Score do
    let(:player) { Player.new }
    let(:game)   { Game.new(player) }

    context '#score' do
      before { player.score = 0 }

      after { allow(subject).to receive(:puts) }

      it 'calculates score if win' do
        player.score += 250
        expect(player.score).to be(250)
      end

      it 'calculates score' do
        player.score += game.hint * 100 + game.attempts * 50
        expect(player.score).to be(450)
      end

      it 'calculates score if lose' do
        expect(player.score).to be(0)
      end
    end


    context '#save_score?' do
      it 'saves score if player agree' do
        allow(subject).to receive(:puts)
        save_score_file if player.agree?
        exit
      end
    end
  end
end
