module Codebreaker
  describe ConsoleGame do
    subject(:game) { ConsoleGame.new }
    let(:name) { game.name = 'ConsoleGame'}

    before do
      expect { game }.to output('Please, enter your name: ').to_stdout
      allow(game).to receive(:puts)
    end

    context 'attributes #initialize' do

      it 'saves game name as String' do
        expect(game.instance_variable_get(:@name).class).to be(String)
      end

      it 'reads input game name' do
        expect(name).to be == 'ConsoleGame'
      end

      it 'saves game code as String' do
        expect(game.instance_variable_get(:@game_code).class).to be(String)
      end

      it 'writes game_code' do
        game.game_code = "1234"
        expect(game.game_code).to eq('1234')
      end

      it 'saves score as Fixnum' do
        expect(game.instance_variable_get(:@score).class).to be(Fixnum)
      end
    end

    context '#guess' do
      before do
        allow(game).to receive_message_chain(:gets, :chomp) { '1234' }
        game.guess
      end

      it 'sets game code' do
        expect(game.instance_variable_get(:@game_code)).to eq('1234')
      end

      it 'should not to be empty' do
        expect(game.instance_variable_get(:@game_code)).not_to be_empty
      end

      it 'saves 4 numbers game code' do
        expect(game.instance_variable_get(:@game_code)).to have_exactly(4).items
      end
    end

    context '#agree?' do
      it 'matches game input with agreement keyword' do
        allow(game).to receive_message_chain(:gets, :chomp) { 'y' or 'yes' }
        expect(game.agree?).to be true
      end

      it 'matches game input with wrong agreement keyword' do
        allow(game).to receive_message_chain(:gets, :chomp) { 'n' }
        expect(game.agree?).to be false
      end

      it 'matches empty game input with agreement keyword' do
        allow(game).to receive_message_chain(:gets, :chomp)
        expect(game.agree?).to be false
      end
    end
  end
end
