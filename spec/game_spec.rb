module Codebreaker
  describe Game do
    context "sets subject constants" do
      it "contains constant with 7 attempts" do
        expect(Codebreaker::Game::ATTEMPTS).to eq(7)
      end

      it "contains constant with 1 hint" do
        expect(Codebreaker::Game::HINT).to eq(1)
      end

      it "contains constant with 4 numbers of secret code" do
        expect(Codebreaker::Game::CODE_SIZE).to eq(4)
      end

      it "contains constant with numbers range from 1 to 6" do
        expect(Codebreaker::Game::RANGE).to eq(1..6)
      end
    end

    context 'subject attributes #initialize' do

      it 'saves secret code' do
        expect(subject.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it 'saves secret code as string' do
        expect(subject.instance_variable_get(:@secret_code).class).to be(String)
      end

      it 'saves secret code with 4 numbers from 1 to 6 in string' do
        expect(subject.instance_variable_get(:@secret_code)).to match(/^[1-6]{4}$/)
      end

      it 'saves player code as String' do
        expect(subject.instance_variable_get(:@player_code).class).to be(String)
      end

      it 'writes player code' do
        subject.player_code = "1234"
        expect(subject.player_code).to eq('1234')
      end

      it 'saves score and it not to be nil' do
        expect(subject.instance_variable_get(:@score)).not_to be_nil
      end

      it 'saves score as 0' do
        expect(subject.instance_variable_get(:@score)).to be(0)
      end

      it 'saves hint from constant HINT' do
        expect(subject.instance_variable_get(:@hint)).to be(Game::HINT)
      end

      it 'saves attempt from constant ATTEMPTS' do
        expect(subject.instance_variable_get(:@attempts)).to be(Game::ATTEMPTS)
      end
    end

    context '#check_guess' do
      before do
        subject.instance_variable_set(:@secret_code,"1234")
      end

      it 'returns win message' do
        subject.instance_variable_set(:@player_code,"1234")
        expect(@secret_code).to eq(@player_code)
      end

      it 'returns "subject over" and hint should be 0' do
        subject.instance_variable_set = 0
        expect(subject.hint).to be_zero
        expect { subject }.to output("Game over! Secret code is #{@secret_code}.").to_output
      end

      it 'returns nothing to output' do
        ["5555","5656","6666","5566","6565","6655","5665"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('').to_stdout
        end
      end

      it 'returns "+"' do
        ["1555","1666","1556","1111","2222","3333","4444"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('+').to_stdout
        end
      end

      it 'returns "++"' do
        ["1255","1266","1256","1211","2232","3334","1444"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('++').to_stdout
        end
      end

      it 'returns "+++"' do
        ["1235","1264","1236","1634","5234","1634","1444"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('+++').to_stdout
        end
      end

      it 'returns "++-"' do
        ["1245","1524","5231","6134","1624","1264","1246"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('++-').to_stdout
        end
      end

      it 'returns "++--"' do
        ["2134","1243","1324","1432"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('++--').to_stdout
        end
      end

      it 'returns "+---"' do
        ["1423","4213","2431","2314"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('+---').to_stdout
        end
      end

      it 'returns "----"' do
        ["3142","2143","4123","3412"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('---').to_stdout
        end
      end

      it 'returns "---"' do
        ["5342","6423","3541","3642","4152","4326"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('---').to_stdout
        end
      end

      it 'returns "--"' do
        ["5125","3662","3561","3652","4652","4526"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('--').to_stdout
        end
      end

      it 'returns "-"' do
        ["5111","5511","5551","6222","6622","6662"].each do |player_input|
          let(:player_code) { player_input }
          expect { subject }.to output('-').to_stdout
        end
      end

      context 'secret code has same numbers' do
        let(:secret_code) { "1122" }

        it 'returns "----"' do
          let(:player_code) { "2211" }
          expect { subject }.to output('----').to_stdout
        end

        it 'returns "---"' do
          let(:player_code) { "2213" }
          expect { subject }.to output('----').to_stdout
        end

        it 'returns "+--"' do
          let(:player_code) { "2212" }
          expect { subject }.to output('+--').to_stdout
        end
      end
    end

      context '#score' do
        before { allow(subject).to receive(:check_guess) }
        after  { allow(subject).to receive (:new_subject?)  }

        it 'calculates score if win' do
          player.score += 250
          expect(player.score).to be(250)
        end

        it 'calculates score' do
          player.score += subject.hint * 100 + subject.attempts * 50
          expect(player.score).to be(450)
        end

        it 'calculates score if lose' do
          expect(player.score).to be(0)
        end

        context '#save_score?' do
          it 'saves score if player agree' do
            allow(subject).to receive(:puts)
            save_score_file if player.agree?
            exit
          end
        end
      end

      context '#new_subject?' do
        before do
          allow(subject).to receive(:puts)
          let(:agree) { player.agree? = true }
        end
        it 'starts new subject if player agree' do
          expect{ subject.start } if agree
        end

        it 'ask player to save score' do
          expect{subject}.to receive(:save_score?) if !agree
        end
      end
    end
  end
end
