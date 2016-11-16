module Codebreaker
  RSpec.describe Fortune do

    # The code-breaker propose a guess that matches the secret code exactly. The system responds by marking the guess with four + signs.
    context "Code-breaker wins game" do
      it 'congratuletes player with a messege'
    end

    # After some number of turns, the game tells the code-breaker that the game is over (need to decide how many turns and whether to reveal the code).
    context "Code-breaker loses game" do 
      it 'writes a pity messege'
      it 'offers to player to start new game'    
    end
  end
end