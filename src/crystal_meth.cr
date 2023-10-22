require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Menus.cr"
require "../src/Audio.cr"
require "x11"
#require "timer"

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


# it works out of the box
GL.enable(GL::TEXTURE_2D)
include X11

  def self.run
    # Create a window
    window = SF::RenderWindow.new(SF::VideoMode.new(1100, 900), "Crystal Meth!", SF::Style::Fullscreen)
    window.vertical_sync_enabled = true 


    # Main loop: run the program as long as the window is open
    while window.open?
      # Check all the window's events that were triggered since the last iteration of the loop
      while event = window.poll_event
        this = window
        this2 = event
        Gui::Menus.drawmainmenu(window)
        
  
        window.display
        CONTROLS::Menucontrols.cursorFunc (this) 

        if event.is_a? SF::Event::KeyPressed
          if event.code == SF::Keyboard::Escape
            SF::Event::Closed
            window.close
          end
        end
        if event.is_a? SF::Event::KeyPressed
          if event.code == SF::Keyboard::Up
            All_Audio::SFX.cursor1
            this = window
            CONTROLS::Menucontrols.arrowup (this)
            
            
          end
        end
        if event.is_a? SF::Event::KeyPressed
          if event.code == SF::Keyboard::Down
            All_Audio::SFX.cursor1
            this = window
            CONTROLS::Menucontrols.arrowdown(this)
          
        # "close requested" event: we close the window
        if event.is_a? SF::Event::Closed
          window.close
        end
      end
      
     
    end
  end
end
end
end
# Run the program
CrystalMeth.run

