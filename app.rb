require 'bundler'
require 'pry'
require 'rspec'
Bundler.require

$:.unshift File.expand_path("./../lib/", __FILE__)

require 'player'
require 'board_case'
require 'board'
require 'game'
 
# Cette classe va nous permettre de lancer le jeu. 

Game.new.go


