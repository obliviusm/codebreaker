# file spec/codebreaker/game_spec.rb
 
require_relative '../spec_helper'
 
module Codebreaker
  describe Game do
  	let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start
      end
 
      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start
      end
    end

    describe "#generate_code" do
    	let(:code) { game.generate_code }
    	it "returns array of 4 things" do
    		game.generate.count.should == 4
    	end
    	it "returns array of 4 numbers" do
    		game.generate.all?{|x| x.is_a? Fixnum}.should be_true
    	end
    end
=begin
    describe "#mark" do
    	it "answer with ++++ if inputted_code == generated_code" do 
    		generated_code = "1111"
    		game.mark("1111").should == "++++" 
    	end
    end
=end
  end
end