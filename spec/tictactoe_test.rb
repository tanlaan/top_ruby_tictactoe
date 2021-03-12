require 'spec_helper'
require_relative '../tictactoe.rb'

RSpec.describe Board do

  it 'exists!' do
    expect{Board}.not_to raise_error
  end

  it 'represents a two dimensional array' do
    foo = Board.new
    expect{foo.board[0][0]}.not_to raise_error
  end

  it 'can take a move'do
    foo = Board.new
    foo.move([0,0], 'X')
    expect(foo.board[0][0] == 'X').to be(true)
  end

end
