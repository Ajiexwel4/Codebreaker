require_relative 'codebreaker/version'
require_relative 'codebreaker/modules/score'
require_relative 'codebreaker/modules/engine'
require_relative 'codebreaker/game'
require_relative 'codebreaker/player'

module Codebreaker
  puts 'You should to break a secret code ****.'
  Game.new
end
