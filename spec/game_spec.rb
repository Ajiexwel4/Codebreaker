module Codebreaker
  describe Game do
    let(:player)   { Player.new }
    subject(:game) { described_class.new(player) }

    before do
      expect {game}.to output("Please, enter your name: ").to_stdout
    end

    context "sets game constants" do
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

    context 'game attributes #initialize' do
      before { allow(player).to receive(:print).with('Please, enter your name: ') }

      it 'saves secret code' do
        expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it 'saves secret code as string' do
        expect(game.instance_variable_get(:@secret_code).class).to be(String)
      end

      it 'saves secret code with 4 numbers from 1 to 6 in string' do
        expect(game.secret_code).to match(/^[1-6]{4}$/)
      end

      it 'saves player and it not to be nil' do
        expect(game.instance_variable_get(:@player)).not_to be_nil
      end

      it 'saves player as player object' do
        expect(game.instance_variable_get(:@player)).to be(player)
      end

      it 'saves player as object of class Codebreaker::Player' do
        expect(game.instance_variable_get(:@player).class).to eq(Codebreaker::Player)
      end

      it 'saves hint from constant HINT' do
        expect(game.instance_variable_get(:@hint)).to be(Game::HINT)
      end

      it 'saves attempt from constant ATTEMPTS' do
        expect(game.instance_variable_get(:@attempts)).to be(Game::ATTEMPTS)
      end
    end
  end
end
