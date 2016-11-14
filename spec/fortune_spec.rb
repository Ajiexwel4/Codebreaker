module Codebreaker
  RSpec.describe Fortune do

    # The code-breaker propose a guess that matches the secret code exactly. The system responds by marking the guess with four + signs.
    xcontext "Code-breaker wins game"

    # After some number of turns, the game tells the code-breaker that the game is over (need to decide how many turns and whether to reveal the code).
    xcontext "Code-breaker loses game"
    
  end
end