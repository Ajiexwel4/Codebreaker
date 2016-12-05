module Codebreaker
  describe Player do
    subject(:player) { described_class.new }

    before do
      expect { player }.to output('Please, enter your name: ').to_stdout
      allow_any_instance_of(Player).to receive(:name).and_return('Player')
    end

    context 'attributes #initialize' do
      it 'saves player name as String' do
        expect(player.instance_variable_get(:@name).class).to be(String)
      end

      it 'reads input player name' do
        expect(player.name).to be == 'Player'
      end

      it 'saves player code as String' do
        expect(player.instance_variable_get(:@player_code).class).to be(String)
      end

      it 'writes player_code' do
        player.player_code = "1234"
        expect(player.player_code).to eq('1234')
      end

      it 'saves score as Fixnum' do
        expect(player.instance_variable_get(:@score).class).to be(Fixnum)
      end
    end

    context '#guess' do
      before do
        allow(player).to receive_message_chain(:gets, :chomp) { '1234' }
        allow(player).to receive(:print).with('Type your secret code or "hint": ')
        player.guess
      end

      it 'sets player code' do
        expect(player.instance_variable_get(:@player_code)).to eq('1234')
      end

      it 'should not to be empty' do
        expect(player.instance_variable_get(:@player_code)).not_to be_empty
      end

      it 'saves 4 numbers player code' do
        expect(player.instance_variable_get(:@player_code)).to have_exactly(4).items
      end
    end

    context '#agree?' do
      it 'matches player input with agreement keyword' do
        allow(player).to receive_message_chain(:gets, :chomp) { 'y' or 'yes' }
        expect(player.agree?).to be true
      end

      it 'matches player input with wrong agreement keyword' do
        allow(player).to receive_message_chain(:gets, :chomp) { 'n' }
        expect(player.agree?).to be false
      end

      it 'matches empty player input with agreement keyword' do
        allow(player).to receive_message_chain(:gets, :chomp)
        expect(player.agree?).to be false
      end
    end
  end
end
