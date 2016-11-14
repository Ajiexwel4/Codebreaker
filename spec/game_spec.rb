module Codebreaker
  RSpec.describe Game do
    let(:player) { Codebreaker::Player.new }
    subject(:game) { Game.new(player) }

    context '#initialize' do
      
      it 'saves secret code' do
        expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it 'saves 4 numbers secret code' do      
        expect(game.instance_variable_get(:@secret_code)).to have(4).items
      end
      
      it 'saves secret code with numbers from 1 to 6' do        
        expect(game.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
      end

      it 'saves object player' do
        expect(game.instance_variable_get(:@player)).not_to be_nil
      end
    end

    before do
      game.start
    end


    context '#start' do
      
      # it 'receives msg from #submits_guess' do
      #   expect(instance_variable_get(:@player))       
      # end
    end
   

    
    # After the game is won or lost, the system prompts the code-breaker to play again. If the code-breaker indicates yes, a new game begins. If the code-breaker indicates no, the system shuts down.
    # xcontext "Code-breaker plays again"
  end
end
