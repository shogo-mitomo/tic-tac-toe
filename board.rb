class Board
  attr_accessor :size, :faces

  def initialize(size)
    @size  = size
    @faces = Array.new(@size) { Array.new(@size) }
  end

  def to_s
    filled = faces.map { |array| array.map { |face| face || ' ' } }
    filled.map { |face| face.join('|') }.join("\n")
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

  def cross
    indices = (0...size).to_a
    combis  = indices.zip(indices)

    [combis.map { |combi| faces.dig(*combi) },
     combis.map { |combi| faces.reverse.dig(*combi) }]
  end
end
