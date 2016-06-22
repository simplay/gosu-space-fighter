class Star

  # @param animation [Gosu::Image]
  def initialize(animation)
    @animation = animation
    @color = Gosu::Color.new(0xff_000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @position = Point2d.new(rand * Settings.width, rand * Settings.height)
    @offset = rand * 1000
  end

  def x
    @position.x
  end

  def y
    @position.y
  end

  def draw
    dt = (@offset + Gosu::milliseconds) / 100
    img = @animation[dt % @animation.size];
    img.draw(@position.x - img.width / 2.0, @position.y - img.height / 2.0,
        ZOrder::Stars, 1, 1, @color, :add)
  end
end
