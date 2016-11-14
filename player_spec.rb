module Codebreaker
  RSpec.describe Player do
    # The code-breaker propose a guess, and the system replies by marking the guess according to the marking algorithm.
    context 'player create' do
      let(:player) { Player.new }

      it 'saves a player name' do
        expect(player.instance_variable_get(:@name)).not_to be_empty
      end

      it 'saves attempt' do
        expect(player.instance_variable_get(:@attempt)).not_to be_empty
      end

      it 'saves variables attempt from 5 to 0' do
        expect(player.instance_variable_get(:@attempt)).to be_between(0, 5).inclusive
      end

    end

    # xcontext 'Code-breaker submits guess' do
    #   xit 'saves 4 number from player' do
    #   end
    # end
  end
end