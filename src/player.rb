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

  def place(x, y)
    @position.update(x, y)
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def position
    @position.copy
  end

  def angle
    @angle
  end

  # Checks whether this player may again fire a bullet.
  # A player can fire a new bullet every 0.2 seconds.
  #
  # @return [Boolean] true if this player may fire another bullet,
  #   false otherwise.
  def may_fire?
    @t2 = @t1
    @t1 = Time.now
    return true if @t2.nil?
    elapsed_time = @t1 - @t2
    elapsed_time > 0.2
  end

  def accelerate
    dv = Point2d.new(
      Gosu::offset_x(@angle, 0.5),
      Gosu::offset_y(@angle, 0.5)
    )
    @velocity.add(dv)
  end

  def move
    @position.add(@velocity)
    @position.update(@position.x % Settings.width, @position.y % Settings.height)
    @velocity.scale(0.95)
  end

  def draw
    @image.draw_rot(@position.x, @position.y, LayerOrder::Player, @angle)
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
