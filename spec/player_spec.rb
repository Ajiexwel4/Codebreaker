module Codebreaker
  RSpec.describe Player do
    let(:player) { Player.new }
    context 'player #initialize' do

      it 'saves a player name' do
        expect(player.instance_variable_get(:@name)).not_to be_empty
      end

      it 'saves attempt' do
        expect(player.instance_variable_get(:@attempt).class).to be(Fixnum)        
      end

      it 'saves variables attempt from 5 to 0' do
        expect(player.instance_variable_get(:@attempt)).to be_between(0, 5).inclusive
      end

      it 'saves a player name' do
        expect(player.instance_variable_get(:@player_code)).to be_empty
      end
    end

    context 'Code-breaker #submits guess' do
      before do
        player.submits_guess
      end

      it 'saves 4 number from player' do
        expect(player.instance_variable_get(:@player_code)).not_to be_empty
      end

      it 'saves 4 numbers player code' do      
        expect(player.instance_variable_get(:@player_code)).to have(4).items
      end     

      it 'saves "hint" in player code' do 
        player.player_code = 'hint'
        expect(player.instance_variable_get(:@player_code)).to eq("hint")
      end


    end
  end
end