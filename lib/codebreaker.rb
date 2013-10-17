# file lib/codebreaker.rb
require "codebreaker/version"
require 'codebreaker/game'

module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end
 
    def start
      @output.puts 'Welcome to Codebreaker!'
    end
  end
end
