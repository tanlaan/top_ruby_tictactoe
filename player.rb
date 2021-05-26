#frozen_string_literal: true

# Player for tictactoe game
class Player
  attr_reader :name 
  attr_accessor :character

  def initialize(name, character)
    @name = name
    @character = character
  end

  def to_s
    name
  end
  
  def move
    return random_coordinate()
  end

  def random_coordinate
    [rand(0..2), rand(0..2)]
  end
end

class Human < Player
  def initialize(name, character)
    super(name, character)
  end

  def move
    coordinates = []
    loop do
      get_move_message()
      coordinates = gets.chomp.split(',').map(&:to_i)
      break if is_valid_move(coordinates)
      bad_move_message()
    end
    coordinates
  end

  def get_move_message
    puts "Your move: "
  end

  def is_valid_move(coordinates)
    coordinates.length == 2       &&
    coordinates[0].between?(0,2)  && 
    coordinates[1].between?(0,2)
  end
  
  def bad_move_message
    puts "It has to be in '0,1' format and between 0 and 2."
  end
end

class Computer < Player
  def initialize(character)
    super('Computer', character)
  end
end