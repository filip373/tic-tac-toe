require './game'
require './player'

Game.new([
  Player.new('First','x'), Player.new('Second','o'), Player.new('Third','v')
  ]).start
