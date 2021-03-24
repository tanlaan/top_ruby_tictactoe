# frozen_string_literal: true

# Playboard for tictactoe game
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def move(coordinate, character)
    x, y = coordinate
    board[x][y] = character
  end

  def to_s
    board_string = "  0 1 2\n"
    board.each.with_index do |row, index| 
      board_string += index.to_s + " " + row.map{|space| space.nil? ? '*' : space}.join(' ') + "\n"
    end
    board_string
  end

end

# Board class
#  * #play
#  * .players[]
#  * .winner
#  * .move_count
#  * self.is_winner?
#  * self.is_winner
# Player class
#  * #move
#  * .name
#  * self.isvalid
