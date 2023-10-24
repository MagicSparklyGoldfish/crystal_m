require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Menus.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
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

GL.enable(GL::TEXTURE_2D)
include X11


module Window
  @@window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen)
  @@window.vertical_sync_enabled = true

  def Window.meth_window
    @@window
  end
end

module System_Variables
  @@current_menu : String = "main"

  def self.initialize
    @@current_menu = "main"
  end
end

class Render_Loop_Manager
  include Window
  include System_Variables
  include Gui

  def self.meth_init
    System_Variables.initialize
  end

  def self.render_loop_main
    meth_init
    # this = Window.meth_window

    while Window.meth_window.open? && @@current_menu == "main"
      while event = Window.meth_window.poll_event
    
        if SF::Event::Closed
          Window.meth_window.close
        if SF::Event::KeyPressed
          if SF::Keyboard::Escape
            Window.meth_window.close
      end

      # Redraw your UI or game elements here
      Window.meth_window.clear
      meth_window = Window.meth_window
      Menus.drawmainmenu(meth_window)
      Window.meth_window.display
    
    end
  end
end
end
end

  def Render_Loop_Manager.start
    render_loop_main
    puts @@current_menu
  end
  Render_Loop_Manager.start
end
end




