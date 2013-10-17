# file lib/codebreaker.rb
require_relative "codebreaker/version"
require_relative 'codebreaker/game'

module Codebreaker
  class Game
  	attr_accessor :code

    def initialize(output)
      @output = output
    end
 
    def start
    	generate
      	@output.puts 'Welcome to Codebreaker!'
      	@output.puts 'Enter guess:'
    end

    def enter input
    	@input = input
    end

    def mark 
    	@output.puts @input
    end
  end
end

my_game = Codebreaker::Game.new (IO.new STDOUT.fileno)
my_game.start
my_game.enter gets
my_game.mark
