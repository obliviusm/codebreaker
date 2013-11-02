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
    
    def guess= g
        @guess = g.split("").map(&:to_i)
    end
    
    def guess
        @guess 
    end

    def mark
        answer = ""
    	guess.each do |x|
    	    if code.include? x
	            answer += "+"
    	    else
    	        answer += "-"
    	    end
    	end
    	answer.split("").sort.join
    end
    
    def generate
        @code = (1..6).to_a.sample(4)
    end
  end
end


my_game = Codebreaker::Game.new (STDOUT)
p my_game.generate
#my_game.start
#my_game.guess = gets
#my_game.mark
