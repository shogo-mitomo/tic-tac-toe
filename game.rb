class Game
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def move(mark)
    board.faces[mark.row][mark.col] = mark.char
  end
end
