require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'player'
require 'boardcase'

class Application
  
 Game.new
  
end # Application

