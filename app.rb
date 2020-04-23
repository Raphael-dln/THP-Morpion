require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'player'
require 'board_case'
require 'game'
require 'board'

class Application
  def initialize
    tic_tac_toe = Game.new
    tic_tac_toe.go
  end
end # Application

Application.new