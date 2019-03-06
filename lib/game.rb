# frozen_string_literal: true

class Game
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def progress(mark)
    board.faces[mark.row][mark.col] = mark.char
  end

  def over?
    win? || board.filled?
  end

  def win?
    lines = [board.rows, board.cols, board.crosses]
    lines.flatten(1).any? { |array| same?(array) }
  end

  private

  def same?(array)
    array.uniq.one? && !array.include?(nil)
  end
end
