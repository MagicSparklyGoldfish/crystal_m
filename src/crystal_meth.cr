require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Menus.cr"
require "../src/Audio.cr"
require "x11"
require "crystal/system/time"
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
    window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen)
    window.vertical_sync_enabled = true 
    CONTROLS::Menucontrols.cursorFunc(window) 
    @@menu = "main"
    @@cursorposition = "up"

    # Main loop: run the program as long as the window is open
    while window.open?
      # Check all the window's events that were triggered since the last iteration of the loop
      while event = window.poll_event
        this = window
        this2 = event
        case (@@menu)
        when "main"
        Gui::Menus.drawmainmenu(window)
        break
        when "charselect"
          Gui::Menus.character_select(window)
        break
        else
          puts "something is very wrong"
        end

        window.display
        this = window
        end

        if event.is_a? SF::Event::KeyPressed
          
          case (event.code)
          when SF::Keyboard::Escape
            SF::Event::Closed
            window.close
          when SF::Keyboard::Up

            case (@@menu)
            when "main"
              All_Audio::SFX.cursor1
              this = window
              CONTROLS::Menucontrols.arrowup (this)
              @@cursorposition = "up"
            end
           
          when SF::Keyboard::Down
            case (@@menu)
            when "main"
              All_Audio::SFX.cursor1
            this = window
            CONTROLS::Menucontrols.arrowdown(this)
            @@cursorposition = "down"
            end
            
          when SF::Keyboard::Enter
            case (@@menu)
            when "main"
            All_Audio::SFX.select1
            this = window
            case (@@cursorposition)
            when "up"
            @@menu = "charselect"
            Gui::Menus.character_select(this)
            when "down"
            SF::Event::Closed
            window.close 
            end
          end
        end
      end

        # "close requested" event: we close the window
        if event.is_a? SF::Event::Closed
          window.close
        end
      end
      
     
    end
  end



# Run the program
CrystalMeth.run

