class Bullet

  def initialize(start_positing, angle, pace)
    @image = Gosu::Image.new("media/lazer.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @position = start_positing
    @angle = angle + 90
    alpha = @angle * (Math::PI / 180)
    @direction = Point2d.new(Math.cos(alpha), Math.sin(alpha))
    @beep.play
    @pace = pace
  end

  def move
    @position.sub(@direction.copy.scale(@pace))
  end

  def draw
    @image.draw_rot(@position.x, @position.y, LayerOrder::Bullet, @angle)
  end

end
