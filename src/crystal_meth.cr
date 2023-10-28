require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/Fonts.cr"
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


CURSOR_TEXTURE_1 = SF::Texture.from_file("graphics/Cursor.png")
Cursor_opt1.texture_rect = SF.int_rect(0, 0, 62, 65)
Cursor_opt1.position = SF.vector2(750, 610)
Cursor_opt1 = SF::Sprite.new(CURSOR_TEXTURE_1) 

CHAR_SKIN = SF::Texture.from_file("graphics/Char_Skin.png")
Char_Skin01.texture_rect = SF.int_rect(0, 0, 96, 128)
Char_Skin01 = SF::Sprite.new(CHAR_SKIN)

Player_Character_Model = SF::RenderTexture.new(672, 512)  
Player_Character_Model.draw(PLAYER_CHAR)
Player_Character_Model.draw(T_SHIRT)
Player_Character_Model.display
Player_Character_Model.create(672, 512, false)
Player_Char_Rendered_Model = SF::Sprite.new(Player_Character_Model.texture)
Player_Char_Rendered_Model.texture_rect = SF.int_rect(0, 0, 96, 128)
Player_Char_Rendered_Model.position = SF.vector2(150, 515)

# it works out of the box
GL.enable(GL::TEXTURE_2D)
include X11

module Gui
  extend self
  @@menu : String | Nil; @@cursorposition : String | Nil
  class Window
    def Window.run
#---------------------------------------------------------------
#                       Initialization
#---------------------------------------------------------------
window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen) #initializes window
window.vertical_sync_enabled = true 
CONTROLS::Menucontrols.cursorFunc(window) 

debug_draw = SFMLDebugDraw.new(window, SF::RenderStates.new( #--------------------------------initializes crystal chipmunk draw area
SF::Transform.new.translate(window.size / 2).scale(1, -1).scale(5, 5)
))

@@menu = "main"; @@cursorposition = "up"  #---------------------------------------------------initializes variables

#---------------------------------------------------------------
#                 This runs every frame
#---------------------------------------------------------------
while window.open?
  if @@menu == "main"
    window.clear(SF::Color::Black);
    window.draw(Text_Title); window.draw(Rectangle_Menu)
    window.draw(Rectangle_Opt1); window.draw(Text_Opt1)
    window.draw(Rectangle_Opt2); window.draw(Text_Opt2)
    window.draw(Cursor_opt1); MenuElements.cursorFunc(window, @@menu)
    window.display
  if @@menu == "charselect"
    window.clear(SF::Color::Blue)
    window.draw(Rectangle_Charmenu_Ground); window.draw(Rectangle_CharOuter_1); window.draw(Rectangle_CharOuter_2)
    window.draw(Rectangle_CharOuter_3); window.draw(Rectangle_CharOuter_4); window.draw(Rectangle_CharOuter_5)
    window.draw(Rectangle_CharOuter_6); window.draw(Rectangle_CharOuter_7)
    window.draw(Rectangle_CharInner_1); window.draw(Rectangle_CharInner_2); window.draw(Rectangle_CharInner_3)
    window.draw(Rectangle_CharInner_4); window.draw(Rectangle_CharInner_5); window.draw(Rectangle_CharInner_6)
    window.draw(Rectangle_CharInner_7); window.draw(Info_Block_1); window.draw(Info_Block_2); window.draw(Info_Block_3)
    window.draw(Info_Block_4); window.draw(Info_Block_5); window.draw(Info_Block_6); window.draw(Info_Block_7)
  else begin 
    raise "ERROR! Invalid value for '@@menu'!"
  rescue
    @@menu == "main"
  end
  end
#_______________________________________________________________
 
#---------------------------------------------------------------
#               This runs every key press 
#---------------------------------------------------------------
  while (event = window.poll_event)
  case event
  when SF::Event::Closed
    window.close
  when SF::Event::KeyPressed
    case event.code
  when SF::Keyboard::Escape
      window.close
  when SF::Keyboard::Up
    if @@menu == "main"
      All_Audio::SFX.cursor1
      Cursor_opt1.position = SF.vector2(750, 610)
      window.draw(Cursor_opt1)
      window.display
      @@cursorposition = "up"
    end
  when SF::Keyboard::Down
    if @@menu == "main"
      All_Audio::SFX.cursor1
      Cursor_opt1.position = SF.vector2(750,730)
      window.draw(Cursor_opt1)
      @@cursorposition = "down"
      window.display
    end
  when SF::Keyboard::Enter
    puts "enter"
    # if @@menu == "main"
      All_Audio::SFX.select1
     case (@@cursorposition)

     when "up" #----------------up
    #   @@menu = "charselect"
       @@cursorposition = "File1"
       window.clear(SF::Color::Blue)
       window.draw(Rectangle_Charmenu_Ground)
    #   GC.collect
     when "down" #------------down
      SF::Event::Closed
      window.close 
      end
    end
  end
end
end
end
end

  class MenuElements <Window
    def MenuElements.cursorFunc(window, @@menu)
      spawn do
        blinking = true
        loop do
          if blinking
            Cursor_opt1.texture_rect = SF.int_rect(62, 0, 62, 65)
        
          else
            Cursor_opt1.texture_rect = SF.int_rect(0, 0, 62, 65)
            if @@menu != "main"
              break
            end
          end
          blinking = !blinking
          if window.open?
            Cursor_opt1.scale = SF.vector2(1, 1) 
          #CURSOR_TEXTURE_1.update(this)
           
          sleep 2.seconds 
          end
        end
      end
      Fiber.yield
    end
end
#_______________________________________________________________
#---------------------------------------------------------------
#                         Runs the program
#---------------------------------------------------------------
Gui::Window.run
end
end
end




# ... (previous code)

# while window.open?
#   case (@@menu)
#   when "main"
#     window.draw(Text_Title)
#     window.draw(Rectangle_Menu)
#     # You should have more code here to update the game state based on user input.
#   end

#   window.display

#   while (event = window.poll_event)
#     case event
#     when SF::Event::Closed
#       window.close
#     when SF::Event::KeyPressed
#       case event.code
#       when SF::Keyboard::Escape
#         window.close
#       end
#     end
#   end
# end

# ... (rest of your code)
