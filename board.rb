class Board
  attr_accessor :size, :faces

  def initialize(size)
    @size  = size
    @faces = Array.new(@size) { Array.new(@size) }
  end

  def to_s
    filled = faces.flatten.map { |face| face || ' ' }
    filled.each_slice(size).map { |face| face.join('|') }.join("\n")
  end

  def filled?
    !faces.flatten.include?(nil)
  end

  def rows
    faces
  end

  def cols
    faces.transpose
  end

  def crosses
    indices = (0...size).to_a

    [faces, faces.reverse].map do |faces|
      indices.map { |i| faces.dig(i, i) }
    end
  end
end
