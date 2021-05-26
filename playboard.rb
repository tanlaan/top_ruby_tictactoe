#frozen_string_literal: true

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
      board_string += "#{index} #{row.map { |space| space.nil? ? '*' : space }.join(' ')}\n"
    end
    board_string
  end

  def winner?
    !!winner
  end

  def winner
    # return player's character (since we don't know their name at this level)
    horizontal(board) || vertical(board) || diagonal(board)
  end

  private

  def horizontal(board)
    board.each do |row|
      return row.uniq[0] if row_match(row)
    end
    nil
  end

  def vertical(board)
    board.transpose.each do |row|
      return row.uniq[0] if row_match(row)
    end
    nil
  end

  def diagonal(board)
    diagonals = [board[0][0], board[1][1], board[2][2]], [board[2][0], board[1][1], board[2][0]]
    diagonals.each do |row|
      return row.uniq[0] if row_match(row)
    end
    nil
  end

  def row_match(row)
    return true if !row.include?(nil) && row.uniq.length == 1
  end
end
