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

  def over?
    win? || !faces.flatten.include?(nil)
  end

  private

  def win?
    same_rows? || same_cols? || same_cross?
  end

  def same?(array)
    array.uniq.one? && !array.include?(nil)
  end

  def same_rows?
    faces.any? { |row| same?(row) }
  end

  def same_cols?
    faces.transpose.any? { |col| same?(col) }
  end

  def same_cross?
    indices = (0...size).to_a
    combi   = indices.zip(indices)
    crosses = [combi.map { |a| faces.dig(*a) },
               combi.map { |a| faces.reverse.dig(*a) }]
    crosses.any? { |cross| same?(cross) }
  end
end
