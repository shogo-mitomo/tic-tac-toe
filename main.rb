# frozen_string_literal: true

require './lib/game.rb'
require './lib/board.rb'
require './lib/mark.rb'

BOARD_SIZE = 3
CHARS      = %w[o x].freeze

board = Board.new(BOARD_SIZE)
game  = Game.new(board)

puts '===   GAME START   ==='

CHARS.cycle do |char|
  puts board.to_s

  mark = Mark.new(char)

  print "Enter #{char}'s row position [0-#{BOARD_SIZE.pred}] > "
  mark.row = gets.chomp.to_i

  print "Enter #{char}'s col position [0-#{BOARD_SIZE.pred}] > "
  mark.col = gets.chomp.to_i

  game.move(mark)

  break if game.over?
end

puts '===   GAME OVER   ==='
puts board.to_s
