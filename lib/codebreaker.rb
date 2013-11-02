# file lib/codebreaker.rb
require_relative "codebreaker/version"
require_relative 'codebreaker/game'

module Codebreaker
  class Game
  	attr_accessor :code

    def initialize(output, number_of_tries = 10)
      @output = output
      @n = number_of_tries
    end
 
    def start
        begin
        	generate
        	@output.puts 'Welcome to Codebreaker!'
        	process
        	@output.puts "Do you want to paly one more time? y/n"
    	end while(gets.chomp == "y")
    end
    
    def process
        i = 0
    	@n.times do
    	    i += 1
    	    @output.puts 'Enter guess:'
    	    self.guess = gets.chomp
    	    @output.puts "Answer: " + mark
    	    if mark == "++++"
    	        @output.puts "You won!"
    	        break
    	    elsif i < @n
    	        @output.puts "Not right. Try again!"
    	    else
    	        @output.puts "No more tries has left. You lost!"
    	        break
    	    end
    	end 
    end
    
    def guess= g
        @guess = g.split("").map(&:to_i)
        @guess
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


my_game = Codebreaker::Game.new(STDOUT,3)
my_game.start
#my_game.process
#my_game.guess = gets
#my_game.mark
