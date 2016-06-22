class Player
  attr_reader :score

  def initialize
    @image = Gosu::Image.new("media/starfighter.bmp")
    @beep = Gosu::Sample.new("media/beep.wav")
    @velocity = Point2d.new(0, 0)
    @position = Point2d.new(0, 0)
    @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @position.update(x, y)
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    p_t = Point2d.new(
      Gosu::offset_x(@angle, 0.5),
      Gosu::offset_y(@angle, 0.5)
    )
    @velocity.add(p_t)
  end

  def move
    @position.add(@velocity)
    @position.update(@position.x % 640, @position.y % 480)
    @velocity.scale(0.95)
  end

  def draw
    @image.draw_rot(@position.x, @position.y, 1, @angle)
  end

  def score
    @score
  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@position.x, @position.y, star.x, star.y) < 35 then
        @score += 10
        @beep.play
        true
      else
        false
      end
    end
  end

end
