module Codebreaker
  describe ConsoleGame do
    let(:game) { Codebreaker::Game.new }

    context '#play' do
      context '#input_code' do
        it 'should 4 chars or hint in input code' do
          allow(subject).to receive(:input_code).and_return(/^[1-6]{4}|hint$/)
          expect(subject.input_code).to eq(/^[1-6]{4}|hint$/)
        end

        it 'returns #input_code if wrong player input' do
          allow(subject).to receive(:input_code).and_return(:input_code)
          expect(subject.input_code).to eq(:input_code)
        end
      end

      context '#agree?' do
        it 'matches to pattern' do
          allow(subject).to receive(:input).and_return('y')
          expect(subject.agree?).to be true
        end

        it 'matches to pattern' do
          allow(subject).to receive(:input).and_return('yes')
          expect(subject.agree?).to be true
        end

        it 'matches to pattern' do
          allow(subject).to receive(:input).and_return('')
          expect(subject.agree?).to be false
        end

        it 'matches to pattern' do
          allow(subject).to receive(:input).and_return('n')
          expect(subject.agree?).to be false
        end
      end

      context 'if player agree' do
        before { allow(subject).to receive(:agree?).and_return(true) }

        context '#new_game' do
          let(:game_new) { Codebreaker::Game.new(game.score) }
          it 'starts new game if player agree' do
            subject.new_game
            expect(game).not_to be(game_new)
          end
        end

        context '#save_score' do
          it 'saves score if player agree' do
            allow(subject).to receive(:save_score_file)
            exit
          end
        end
      end

      it '#gets input name' do
        allow(subject).to receive(:input_name).and_return('Alex')
        expect(subject.input_name).to eq('Alex')
      end
    end
  end
end
