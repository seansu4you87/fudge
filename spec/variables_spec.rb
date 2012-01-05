#require File.dirname(__FILE__) + '/../fudge'
require '/Users/seanyu/Dropbox/Developer/GitHub/fudge/lib/variable'
require 'rspec/autorun'

#rspec variables_spec.rb --color --format doc

class Game
  def roll(pins)
  end

  def score
    0
  end
end

describe Variable do
  describe  "#score" do
    it "returns 0 for all gutter game" do
      var = Variable.new 'NSString*', 'name'
      var.score.should == 0
    end
  end
end

describe Game do
  describe "#score" do
    it "returns 0 for all gutter game" do
      game = Game.new
      20.times { game.roll(0) }
      game.score.should == 1
    end
  end
end