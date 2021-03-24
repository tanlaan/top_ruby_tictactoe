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

  it 'starts out empty' do
    foo = Board.new
    is_empty = true
    foo.board.each do |row|
      row.each do |space|
        is_empty = false if space != nil
      end
    end
    expect(is_empty).to be(true)
  end

  it 'can take a move' do
    foo = Board.new
    foo.move([0,0], 'X')
    expect(foo.board[0][0] == 'X').to be(true)
  end

  it 'can be printed' do
    foo = Board.new
    expectation = "  0 1 2\n0 * * *\n1 * * *\n2 * * *\n"
    expect(foo.to_s).to eq(expectation)

  end

end
