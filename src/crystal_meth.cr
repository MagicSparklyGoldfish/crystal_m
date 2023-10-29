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

 class Window_Class
#--------------------------------------------------------+
#========Window_Class Variables==========================+

  @@menu = "main"
  @@cursorposition = "up"
  @@char_select_pointer_position = 0
  @@save_file_slot : Int32 = 0

#========================================================+
#--------------------------------------------------------+
#=============Menu Renderers=============================+
 
#//////////////Main Menu/////////////////////////////////+
  def Window_Class.main_menu(window)
      window.clear(SF::Color::Black);
      window.draw(Text_Title); window.draw(Rectangle_Menu)
      window.draw(Rectangle_Opt1); window.draw(Text_Opt1)
      window.draw(Rectangle_Opt2); window.draw(Text_Opt2)
      window.draw(Cursor_opt1)
  end
#////////////Character Menu//////////////////////////////+
  def Window_Class.character_menu(window)
      window.clear(SF::Color::Blue)
      window.draw(Rectangle_Charmenu_Ground); window.draw(Rectangle_CharOuter_1); window.draw(Rectangle_CharOuter_2)
      window.draw(Rectangle_CharOuter_3); window.draw(Rectangle_CharOuter_4); window.draw(Rectangle_CharOuter_5)
      window.draw(Rectangle_CharOuter_6); window.draw(Rectangle_CharOuter_7)
      window.draw(Rectangle_CharInner_1); window.draw(Rectangle_CharInner_2); window.draw(Rectangle_CharInner_3)
      window.draw(Rectangle_CharInner_4); window.draw(Rectangle_CharInner_5); window.draw(Rectangle_CharInner_6)
      window.draw(Rectangle_CharInner_7); window.draw(Info_Block_1); window.draw(Info_Block_2); window.draw(Info_Block_3)
      window.draw(Info_Block_4); window.draw(Info_Block_5); window.draw(Info_Block_6); window.draw(Info_Block_7)
  end
#========================================================+
#--------------------------------------------------------+
#=========Window Functions===============================+
  def Window_Class.draw(window)
    case @@menu
   when "main"
     MenuElements.cursorFunc(window, @@menu)
     Window_Class.main_menu(window)
   when "charselect"
     Window_Class.character_menu(window)
     this = @@char_select_pointer_position 
     MenuElements.char_select_cursor(this, window)
   else begin 
     raise "ERROR! Invalid value for '@@menu'!"
   rescue
     @@menu == "main"
   end; end; end
   def Window_Class.keypresses(window)
    case @@menu
    when "main"
      Window_Class.main_menu_keypresses(window)
    when "charselect"
      Window_Class.char_select_menu_keypresses(window)
    end
   end
    def Window_Class.run
#---------------------------------------------------------------
#                       Initialization
#---------------------------------------------------------------
window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen) #initializes window
window.vertical_sync_enabled = false 

debug_draw = SFMLDebugDraw.new(window, SF::RenderStates.new( #--------------------------------initializes crystal chipmunk draw area
SF::Transform.new.translate(window.size / 2).scale(1, -1).scale(5, 5)
))

#---------------------------------------------------------------
#                 This runs every frame
#---------------------------------------------------------------
while window.open?
  Window_Class.keypresses(window)
  Window_Class.draw(window)
  window.display
  end
end
#_______________________________________________________________
 
#---------------------------------------------------------------
#               Main Menu Keypresses
#---------------------------------------------------------------
def Window_Class.main_menu_keypresses(window)
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
     if @@menu == "main"
      All_Audio::SFX.select1
     case (@@cursorposition)

     when "up" #----------------up
       @@menu = "charselect"
       #@@cursorposition = "File1"
       GC.collect
     when "down" #------------down
      SF::Event::Closed
      window.close 
      end; end; end; end; end; end
#_______________________________________________________________
 
#---------------------------------------------------------------
#               Char Select Keypresses
#---------------------------------------------------------------

def Window_Class.char_select_menu_keypresses(window)
  while (event = window.poll_event)
  case event
  when SF::Event::Closed
    window.close
  when SF::Event::KeyPressed
    case event.code
  when SF::Keyboard::Escape
      window.close
  when SF::Keyboard::Left
    if @@char_select_pointer_position > 0
      All_Audio::SFX.cursor1
      @@char_select_pointer_position = @@char_select_pointer_position - 1
      this = @@char_select_pointer_position 
      MenuElements.char_select_cursor(this, window)
      #CONTROLS::Menucontrols.charselectright(this2)
      #Gui::Menus.slot_highlight(this, this2)
       end
  when SF::Keyboard::Right
    if @@char_select_pointer_position < 8
   All_Audio::SFX.cursor1
   @@char_select_pointer_position = @@char_select_pointer_position + 1
   this = @@char_select_pointer_position 
   MenuElements.char_select_cursor(this, window)
   #CONTROLS::Menucontrols.charselectright(this)
   #Gui::Menus.slot_highlight(this, this2, event)
    end
  when SF::Keyboard::Enter
      All_Audio::SFX.select1
      save_file_slot = @@char_select_pointer_position
      SaveData.create_new_savegame (save_file_slot)
      # SF::Event::Closed
      # window.close 
      end; end; end; end;
  end
end


  class MenuElements < Gui::Window_Class
    @@cursorframe = 1
    @@char_select_blink = 1
     def MenuElements.cursorFunc(window, @@menu)

      if @@cursorframe == 1
        Cursor_opt1.texture_rect = SF.int_rect(62, 0, 62, 65); @@cursorframe = @@cursorframe + 1

      else if @@cursorframe == 2  
        Cursor_opt1.texture_rect = SF.int_rect(0, 0, 62, 65); @@cursorframe = @@cursorframe + 1
  
      else if @@cursorframe == 3 
        @@cursorframe = 1
      end
      window.draw(Cursor_opt1)
      Cursor_opt1.scale = SF.vector2(1, 1) 
      end; end; end  
    
     def MenuElements.char_select_cursor(this, window)

         case this
      when 1
           this2 = Rectangle_CharInner_1
      when 2
           this2 = Rectangle_CharInner_2
      #    end
      #    if this2.nil? 
      #     this2 = Rectangle_CharInner_0
      #  if @@char_select_blink == 1
      #   this2.move(SF.vector2(0, -5)); @@char_select_blink = @@char_select_blink + 1
      #  else if @@char_select_blink == 5
      #   this2.move(SF.vector2(0, 5)); @@char_select_blink = @@char_select_blink + 1
      #  else if @@char_select_blink > 9
      #   @@char_select_blink = 1
      #  else @@char_select_blink = @@char_select_blink + 1
      #   window.draw(this2)
      #  end; end; end; 
    end
     end
  end
#_______________________________________________________________
#---------------------------------------------------------------
#                         Runs the program
#---------------------------------------------------------------
Gui::Window_Class.run
end






# def run
#   while @window.open?
#     handle_events
#     update
#     draw
#   end
# end

# def handle_events
#   # Check events here, don't draw anything here
# end

# def update
#   # Put your logic here, also no drawing here
# end

# def draw
#   # Draw your stuff here - and nothing more
#   @window.display # Render the window as the last thing to do
# end
# end

# Game.new.run