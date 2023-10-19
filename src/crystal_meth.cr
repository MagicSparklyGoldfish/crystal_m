require "crsfml"

module CrystalMeth
  VERSION = "0.1.0"
  @[Link("GL")] # Use @[Link(framework: "OpenGL")] on Mac OSX
lib GL
  fun enable = glEnable(cap : Int32)
    fun viewport = glViewport(x : Int32, y : Int32, width : Int32, height : Int32)
      fun clear = glClear(mask : Int32)
      TEXTURE_2D       =  3553
      COLOR_BUFFER_BIT = 16384
      DEPTH_BUFFER_BIT =   256
end

FONT_TITLE = SF::Font.from_file("fonts/PermanentMarker-Regular.ttf")
FONT_COMMON = SF::Font.from_file("fonts/Changa/Changa-VariableFont_wght.ttf")
FONT_FUTURE = SF::Font.from_file("fonts/Orbitron/Orbitron-VariableFont_wght.ttf")

# it works out of the box
GL.enable(GL::TEXTURE_2D)


  def self.run
    # Create a window
    window = SF::RenderWindow.new(SF::VideoMode.new(1100, 900), "Crystal Meth!", SF::Style::Fullscreen)
    window.vertical_sync_enabled = true 
    #create title text
    text_title = SF::Text.new
    text_title.font = FONT_TITLE
    text_title.string = "Crystal Meth!"
    text_title.character_size = 80
    text_title.color = SF::Color::White
    text_title.style = (SF::Text::Bold)
    text_title.position = SF.vector2(650, 50)
    #create menu body
    rectangle_menu = SF::RectangleShape.new(SF.vector2(650, 300))
    rectangle_menu.fill_color = SF.color(150, 50, 50)
    rectangle_menu.outline_thickness = 7
    rectangle_menu.outline_color = SF.color(150, 150, 150)
    rectangle_menu.position = SF.vector2(625, 550)
    #create menu option 1
    rectangle_opt1= SF::RectangleShape.new(SF.vector2(500, 100))
    rectangle_opt1.fill_color = SF.color(100, 50, 50)
    rectangle_opt1.outline_thickness = 5
    rectangle_opt1.outline_color = SF.color(150, 150, 150)
    rectangle_opt1.position = SF.vector2(700, 590)
    text_opt1 = SF::Text.new
    text_opt1.font = FONT_TITLE
    text_opt1.string = "Play"
    text_opt1.character_size = 50
    text_opt1.color = SF::Color::White
    text_opt1.style = (SF::Text::Bold)
    text_opt1.position = SF.vector2(880, 610)
    #create menu option 2
    rectangle_opt2= SF::RectangleShape.new(SF.vector2(500, 100))
    rectangle_opt2.fill_color = SF.color(100, 50, 50)
    rectangle_opt2.outline_thickness = 5
    rectangle_opt2.outline_color = SF.color(150, 150, 150)
    rectangle_opt2.position = SF.vector2(700, 710)
    text_opt2 = SF::Text.new
    text_opt2.font = FONT_TITLE
    text_opt2.string = "Quit"
    text_opt2.character_size = 50
    text_opt2.color = SF::Color::White
    text_opt2.style = (SF::Text::Bold)
    text_opt2.position = SF.vector2(880, 730)
 

    # Main loop: run the program as long as the window is open
    while window.open?
      # Check all the window's events that were triggered since the last iteration of the loop
      while event = window.poll_event

        

        if event.is_a? SF::Event::KeyPressed
          if event.code == SF::Keyboard::Escape
            SF::Event::Closed
            window.close
          end
        end
        # "close requested" event: we close the window
        if event.is_a? SF::Event::Closed
          window.close
        end
      end
      #draw stuff under here v
      window.clear(SF::Color::Black)
window.draw(text_title)
window.draw(rectangle_menu)
window.draw(rectangle_opt1)
window.draw(text_opt1)
window.draw(rectangle_opt2)
window.draw(text_opt2)

      window.display
    end
  end
end

# Run the program
CrystalMeth.run

