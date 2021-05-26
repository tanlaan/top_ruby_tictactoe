require 'spec_helper'
require_relative '../player.rb'

RSpec.describe Player do
  it 'Has a name' do
    foo = Player.new
    expect(foo.name).to eq('Computer')
  end

  it 'Can tell if a player is a computer' do
    foo = Player.new
    expect(foo.computer?).to eq(true)
  end
  
  xit 'Can take a move from a player' do
  end

  it 'Can make a random move for a computer' do
    def is_valid_move(coordinates)
      coordinates.length == 2       &&
      coordinates[0].between?(0,2)  &&
      coordinates[1].between?(0,2)  
    end
    foo = Player.new()
    expect(is_valid_move(foo.move)).to be true
  end
  
end
