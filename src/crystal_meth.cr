require "crsfml"
require "crsfml/audio"
require "../src/Menus.cr"

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
FONT_PIXEL = SF::Font.from_file("fonts/VT323-Regular.ttf")
CURSOR_1 = SF::SoundBuffer.from_file("audio/Cursor1.wav")
SOUND_1 = SF::Sound.new
SOUND_1.buffer = CURSOR_1

# it works out of the box
GL.enable(GL::TEXTURE_2D)


  def self.run
    # Create a window
    window = SF::RenderWindow.new(SF::VideoMode.new(1100, 900), "Crystal Meth!", SF::Style::Fullscreen)
    window.vertical_sync_enabled = true 


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
        if event.is_a? SF::Event::KeyPressed
          if event.code == SF::Keyboard::Up
            SOUND_1.play
            
          end
        end
        # "close requested" event: we close the window
        if event.is_a? SF::Event::Closed
          window.close
        end
      end
      #draw stuff under here v
      this = window
      this2 = event
      Gui::Menus.drawmainmenu(window)
      CONTROLS::Menucontrols.arrows(window, event)

      window.display
    end
  end
end

# Run the program
CrystalMeth.run

