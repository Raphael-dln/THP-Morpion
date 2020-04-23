require 'bundler'
Bundler.require


class Player

  attr_accessor :player_name, :player_symbol
  @@all_players = []

  #player_symbol = X ou O
  def initialize(name, symbol)
    @player_name = name
    @player_symbol = symbol
    @@all_players << self
  end #initialize
  
  def self.get_all_players
    @@all_players
  end # get_all_players

end # Player

