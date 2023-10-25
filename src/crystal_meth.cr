require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Menus.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/Player_Character.cr"
require "x11"
require "crystal/system/time"
require "chipmunk/chipmunk_crsfml"
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

module Main
include Player_character
extend self
class Char_Value_variable #Nils are placeholders
  @@health_to_restore : Nil; @@health_to_remove : Nil; @@char_hp = Nil; @@char_Max_hp = Nil; @@Char_Model = SF::RectangleShape.new(SF.vector2(64, 32))
  @@Hair = SF::RectangleShape.new(SF.vector2(64, 32)); @@Skin = Nil; @@Face = SF::RectangleShape.new(SF.vector2(64, 32))
  @@Shirt = SF::RectangleShape.new(SF.vector2(64, 32)); @@Pants = SF::RectangleShape.new(SF.vector2(64, 32)); @@Shoes = SF::RectangleShape.new(SF.vector2(64, 32));
  @@CharAppearanceArray : Array(Nil.class | SF::RectangleShape); @@CharAppearanceArray = [@@Hair , @@Skin, @@Face, @@Shirt, @@Pants, @@Shoes]
end
class Main_routine < Char_Value_variable
  @@char_select_pointer_position : Int32 = 0

   def Main_routine.refresh(window, debug_draw) 
     case (@@menu)
    when "main"
    Gui::Menus.drawmainmenu(window)
    CONTROLS::Menucontrols.cursorFunc(window) 
    when "charselect"
    Gui::Menus.character_select(window)
    # CONFUSION.game_environment(window, debug_draw)
     else
      puts "something is very wrong"
     end
  end

  def self.run
    # Create a window
    window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen)
    window.vertical_sync_enabled = true 
    CONTROLS::Menucontrols.cursorFunc(window) 

    debug_draw = SFMLDebugDraw.new(window, SF::RenderStates.new(
    SF::Transform.new.translate(window.size / 2).scale(1, -1).scale(5, 5)
    ))
    # CONFUSION.game_environment(window, debug_draw)
    
    @@menu = "main"
    @@cursorposition = "up"
    @@char_select_pointer_position = 0
    
    # Main loop: run the program as long as the window is open
    while window.open?
      Main_routine.refresh(window, debug_draw)
      window.display
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
        # CONFUSION.game_environment(window, debug_draw)
        #Model.create_PC 
        break
        else
          puts "something is very wrong"
        end

        window.display
        this = window
        end

        if event.is_a? SF::Event::KeyPressed
            #escape
          case (event.code)

            #escape
          when SF::Keyboard::Escape
            SF::Event::Closed
            window.close

            #up
          when SF::Keyboard::Up
            case (@@menu)
            when "main"
              All_Audio::SFX.cursor1
              this = window
              CONTROLS::Menucontrols.arrowup (this)
              @@cursorposition = "up"
            end

             #down
          when SF::Keyboard::Down
            case (@@menu)
            when "main"
              All_Audio::SFX.cursor1
            this = window
            CONTROLS::Menucontrols.arrowdown(this)
            @@cursorposition = "down"
            end

             #left
          when SF::Keyboard::Left
            case (@@menu)
            when "main"

            when "charselect"
              if @@char_select_pointer_position > 0
             All_Audio::SFX.cursor1
             this = window
             @@char_select_pointer_position = @@char_select_pointer_position - 1
             this2 = @@char_select_pointer_position 
             CONTROLS::Menucontrols.charselectright(this2)
             Gui::Menus.slot_highlight(this, this2)
              end
            end
          when SF::Keyboard::Right
            case (@@menu)
            when "main"

            when "charselect"
              if @@char_select_pointer_position < 8
             All_Audio::SFX.cursor1
             this = window
             @@char_select_pointer_position = @@char_select_pointer_position + 1
             this2 = @@char_select_pointer_position 
             CONTROLS::Menucontrols.charselectright(this)
             Gui::Menus.slot_highlight(this, this2)
              end
            end

             #enter
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
          when "charselect"
            
          end
        end
      end
    end
  end
          def determine_menu
      

        if event.is_a? SF::Event::Closed
          window.close
        end
      end
      
     
    end
  end

Main::Main_routine.run
end
# TEST = SF::Texture.from_file("graphics/Cursor.png")
# class CONFUSION

# def CONFUSION.game_environment(window, debug_draw) 
#   space = CP::Space.new
#   space.iterations = 30
#   space.gravity = CP.v(0, -500)
#   space.sleep_time_threshold = 0.5
#   space.collision_slop = 0.5
#   # ground = CP::Segment.new(space.static_body, CP.v(-20, 5), CP.v(20, -5), 0.0)
#   # ground.friction = 1.0
#   # space.add(ground)
#   pc_body = CP::Body.new(32, 64)
#   pc_skin = CP::Box.new(pc_body, 16, 32,)
#   #SF::Texture.bind TEST
#   pc_chest = CP::Box.new(pc_body, 16, 32)
#   pc_head = CP::Box.new(pc_body, 16, 16)
#   pc_legs = CP::Box.new(pc_body, 16, 16)
#   pc_body.position = CP.v(-150, -10)
#   space.add(pc_body, pc_head, pc_chest, pc_skin, pc_legs) 
#   debug_draw.draw space
# end

# end
