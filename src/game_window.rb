class GameWindow < Gosu::Window
  def initialize
    super(Settings.width, Settings.height)
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true)

    @player = Player.new
    @player.place(Settings.width / 2, Settings.height / 2)

    @star_anim = Gosu::Image::load_tiles("media/star.png", 25, 25)
    @stars = Array.new

    @font = Gosu::Font.new(20)
  end

  # Is called 60 times per second (by default)
  # and should contain the main game logic:
  # move objects, handle collisions, etc.)
  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft
      @player.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight
      @player.turn_right
    end
    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0
      @player.accelerate
    end

    @player.move
    @player.collect_stars(@stars)

    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
    end
  end

  # is called after #update and whenever the window needs redrawing
  # for other reasons, and may also be skipped every other time
  # if the FPS go too low. It should contain the code
  # to redraw the whole screen, but no updates to the game's state.
  def draw
    @background_image.draw(0, 0, LayerOrder::Background)
    @player.draw
    @stars.each(&:draw)
    @font.draw("Score: #{@player.score}", 10, 10, LayerOrder::UI, 1.0, 1.0, 0xff_ffff00)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
