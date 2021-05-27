#frozen_string_literal: true

# Get classes we will use in the future
require_relative('player.rb')
require_relative('playboard.rb')

# Initialize Board
game_board = Board.new()
computer = Computer.new('O')
game_over = false

puts 'What is your name?'
player_name = gets().chomp
player = Human.new(player_name, 'X')
player_turn = true

until game_over do

    print game_board

    if player_turn
        valid_move = false
        move = []
        until valid_move do
            move = player.move()
            valid_move = game_board.valid_move?(move)
        end
        game_board.move(move, player.character)
    else
        valid_move = false
        move = []
        until valid_move do
            move = computer.move()
            valid_move = game_board.valid_move?(move)
        end
        game_board.move(move, computer.character)
    end

    if game_board.winner?
        game_over = true
        print game_board
        print game_board.winner + " wins!\n"
    end

    player_turn = !player_turn
end