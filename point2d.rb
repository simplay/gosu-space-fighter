# Point2d is a 2d point, supporting besic vector algebra.
class Point2d

  attr_reader :x, :y

  # Define a new 2d point
  #
  # @param x [Float] x coordinate
  # @param y [Float] y coordinate
  def initialize(x, y)
    @x = x
    @y = y
  end

  # Add another 2d point to this point.
  #
  # @info: Updates the coordinates of this point.
  # @param p [Point2d] point to be added.
  # @return [Point2d] updated point.
  def add(p)
    @x = @x + p.x
    @y = @y + p.y
    self
  end

  # Scales this point by a given factor.
  #
  # @info: Updates the coordinates of this point.
  # @param f [Float] scale to be applied.
  # @return [Point2d] updated point.
  def scale(f)
    @x = f * @x
    @y = f * @y
    self
  end

  # Overwrite the coordinates of this points.
  #
  # @param x [Float] x coordinate
  # @param y [Float] y coordinate
  def update(x, y)
    @x = x
    @y = y
    self
  end

end
