require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(width){Array.new(height)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x, y)
      matrix[x][y]
    end
  end

  private

  def inbounds(x, y)
    x >= 0 && y >= 0 && x < width && y < height
  end

end
