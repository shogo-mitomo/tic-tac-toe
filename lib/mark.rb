# frozen_string_literal: true

class Mark
  attr_accessor :char, :row, :col

  def initialize(char)
    @char = char
  end
end
