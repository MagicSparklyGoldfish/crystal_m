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
require "file_utils"
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
  @@char_create_pointer_position = [1, 1]
  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new(@@player_character_model.texture)
  @@hair_array : Array(SF::Sprite)
  @@hair_array = [SHOUNEN_HAIR_01, SHOUNEN_HAIR_02, SHOUNEN_HAIR_03, SHOUNEN_HAIR_04, SHOUNEN_HAIR_05, SHOUNEN_HAIR_06]
  @@hair_display_array = [SHOUNEN_DISPLAY_HAIR_01, SHOUNEN_DISPLAY_HAIR_02, SHOUNEN_DISPLAY_HAIR_03, SHOUNEN_DISPLAY_HAIR_04, 
  SHOUNEN_DISPLAY_HAIR_05, SHOUNEN_DISPLAY_HAIR_06] 
  @@current_hair = 0; @@current_display_hair = 0; @@current_display_hair_string = 0
  @@current_skin = 0; @@current_display_skin_string = 0; @@current_face = 0

#========================================================+
#--------------------------------------------------------+
#=============Character Model============================+

#-------------initialize models--------------------------+
def Window_Class.player_model_initialize 
  @@player_character_model.draw(SKIN_ARRAY[@@current_skin])
  @@player_character_model.draw(RAIN_BOOTS_01)
  @@player_character_model.draw(FACE_ARRAY[@@current_face])
  @@player_character_model.draw(@@hair_array[@@current_hair])
  @@player_character_model.draw(SHORTS_01)
  @@player_character_model.draw(T_SHIRT)
  @@player_character_model.draw(FINGERLESS_GLOVE_01)
  @@player_character_model.create(672, 512, false)
  @@player_character_model.display
  @@player_character_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
  @@player_character_rendered_model.position = SF.vector2(660, 515)
  @@player_character_rendered_model.scale = SF.vector2(3.0, 3.0)
  end
#---------customization functions------------------------+
def Window_Class.customize_hair(window, direction)
  if direction == "right"
  @@current_hair = @@current_hair + 1; @@current_display_hair = @@current_hair
  @@current_display_hair_string = @@current_hair
  else if direction == "left"
  @@current_hair = @@current_hair - 1; @@current_display_hair = @@current_hair
  @@current_display_hair_string = @@current_hair
  end; end
  Hair_Desc.string = HAIR_DESC_ARRAY[@@current_display_hair_string]
  Window_Class.player_model_initialize 
  window.draw(@@hair_array[@@current_hair])
end
def Window_Class.customize_skin(window, direction)
  if direction == "right"
    @@current_skin = @@current_skin + 1
  else if direction == "left"
    @@current_skin = @@current_skin - 1
  end; end
    Skin_Desc.string = SKIN_DESC_ARRAY[@@current_skin]
    Window_Class.player_model_initialize 
    window.draw(SKIN_ARRAY[@@current_skin])
end
def Window_Class.customize_face(window, direction)
  if direction == "right"
    @@current_face = @@current_face + 1
  else if direction == "left"
    @@current_face = @@current_face - 1
  end; end
    Face_Desc.string = FACE_DESC_ARRAY[@@current_face]
    Window_Class.player_model_initialize 
    window.draw(FACE_ARRAY[@@current_face])
end
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
#//////////Character Creation////////////////////////////+
def Window_Class.character_creation_menu(window)
    window.clear(SF::Color::White); window.draw(Rectangle_Charcreation_Backwall); window.draw(Rectangle_Charcreation_Ground) 
    window.draw(Rectangle_Dresser_01); window.draw(Rectangle_Dresser_02); window.draw(Rectangle_Cubby_01)
    window.draw(Rectangle_Cubby_02); window.draw(Rectangle_Cubby_03); window.draw(Rectangle_Cubby_04); window.draw(Rectangle_Cubby_05)
    window.draw(Rectangle_Cubby_06); window.draw(Rectangle_Cubby_07); window.draw(Cabinet_01); window.draw(Left_Black_Bar)
    window.draw(Right_Black_Bar); window.draw(Bottom_Black_Bar); window.draw(Char_Creat_Cursor); window.draw(@@player_character_rendered_model)
    window.draw(@@hair_display_array[@@current_display_hair]); window.draw(Hair_Desc); window.draw(DISPLAY_SKIN_ARRAY[@@current_skin])
    window.draw(Skin_Desc); window.draw(DISPLAY_FACE_ARRAY[@@current_face]); window.draw(Face_Desc)
end
#========================================================+
#--------------------------------------------------------+
#=========Window Functions===============================+
#//////////////Draw//////////////////////////////////////+
  def Window_Class.draw(window)
    case @@menu
   when "main"
     MenuElements.cursorFunc(window, @@menu)
     Window_Class.main_menu(window)
   when "charselect"
     Window_Class.character_menu(window)
     this = @@char_select_pointer_position 
     MenuElements.char_select_cursor(this, window)
   when "charcreate"
    MenuElements.charcreatebreatheFunc(window, @@menu, @@player_character_rendered_model)
    MenuElements.charcreatecursorFunc(window, @@menu)
    MenuElements.charcreatecursorMoveFunc(window, @@char_create_pointer_position)
    Window_Class.character_creation_menu(window)
   else begin 
     raise "ERROR! Invalid value for '@@menu'!"
   rescue
     @@menu == "main"
   end; end; end
#///////Keypresses///////////////////////////////////////+
   def Window_Class.keypresses(window)
    case @@menu
    when "main"
      Window_Class.main_menu_keypresses(window)
    when "charselect"
      Window_Class.char_select_menu_keypresses(window)
    when "charcreate"
      Window_Class.char_creation_menu_keypresses(window)
    end
   end
#//////Character Creation///////////////////////////////+
    def Window_Class.character_creation_logic

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
  when SF::Keyboard::C #---------------for testing purposes, remove when testing done
    Window_Class.player_model_initialize
    @@menu = "charcreate"
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
      case @@char_select_pointer_position

      when 1
      if File.exists?("Saves/Slot1/save01.yml") == false
        SaveData.create_new_savegame
        Window_Class.player_model_initialize
        @@menu = "charcreate"
      else puts "loadgame"
      # SF::Event::Closed
      # window.close 
      end; end; end; end; end; end;
#________________________________________________________________
#----------------------------------------------------------------
#               Char Creation Keypresses
#----------------------------------------------------------------
def Window_Class.char_creation_menu_keypresses(window)
  while (event = window.poll_event)
    case event
    when SF::Event::Closed
      window.close
    when SF::Event::KeyPressed
      case event.code

#*********************Escape************************************
    when SF::Keyboard::Escape
        window.close
    
#*********************Down**************************************        
    when SF::Keyboard::Down
      All_Audio::SFX.char_create_down
      @@char_create_pointer_position[1] = 0
      if @@char_create_pointer_position[0] != 8
      @@char_create_pointer_position[0] = @@char_create_pointer_position[0] + 1
      else if @@char_create_pointer_position[0] = 8
        @@char_create_pointer_position[0] = 1
      end; end
#**********************Up***************************************
    when SF::Keyboard::Up
      All_Audio::SFX.char_create_up
      @@char_create_pointer_position[1] = 0
      if @@char_create_pointer_position[0] != 0
         @@char_create_pointer_position[0] = @@char_create_pointer_position[0] - 1
      else if @@char_create_pointer_position[0] = 0
         @@char_create_pointer_position[0] = 7
    end; end;
#********************Enter**************************************  
    when SF::Keyboard::Enter
#********************Left***************************************  
    when SF::Keyboard::Left
      All_Audio::SFX.char_create_sideways
      case @@char_create_pointer_position[0]

      when 1
        direction = "left"
       if @@current_hair != -1
          Window_Class.customize_hair(window, direction)
          @@char_create_pointer_position[1] -= 1
       else @@current_hair = 5; @@char_create_pointer_position[1] = 5
          Window_Class.customize_hair(window, direction)
      end
      when 2
        direction = "left"
        if @@current_skin != -1
        Window_Class.customize_skin(window, direction)
        @@char_create_pointer_position[1] -= 1
        else 
        @@current_skin = 6; @@char_create_pointer_position[1] = 6
        Window_Class.customize_skin(window, direction)
      end
    when 3
      direction = "left"
      if @@current_face != -1
      Window_Class.customize_face(window, direction)
      @@char_create_pointer_position[1] -= 1
      else 
      @@current_face = 5; @@char_create_pointer_position[1] = 6
      Window_Class.customize_face(window, direction)
      end
      end
#********************Right***************************************  
    when SF::Keyboard::Right
      All_Audio::SFX.char_create_sideways
      case @@char_create_pointer_position[0]

      when 1
        direction = "right"
      if @@current_hair != 5
      Window_Class.customize_hair(window, direction) 
      @@char_create_pointer_position[1] += 1
      else @@current_hair = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_hair(window, direction)
      end
      when 2
      direction = "right"
      if @@current_skin != 6
      Window_Class.customize_skin(window, direction) 
      else
      @@current_skin = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_skin(window, direction)  
      end
    when 3
      direction = "right"
      if @@current_face != 5
      Window_Class.customize_face(window, direction)
      else
      @@current_face = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_face(window, direction)
      end
end; end; end; end; end; end
end


#----------------Menu Elements___________________________________

  class MenuElements < Gui::Window_Class
    @@cursorframe = 1
    @@char_select_blink = 1
    @@char_create_breathe = 1
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
     def MenuElements.charcreatecursorFunc(window, @@menu)

      if @@cursorframe > 0 && @@cursorframe < 101
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 0, 295, 25); @@cursorframe = @@cursorframe + 1

      else if  @@cursorframe > 100 && @@cursorframe <201
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 25, 295, 25); @@cursorframe = @@cursorframe + 1
  
       else if @@cursorframe > 200 && @@cursorframe < 201
         Char_Creat_Cursor.texture_rect = SF.int_rect(0, 50, 295, 25); @@cursorframe = @@cursorframe + 1

       else if  @@cursorframe > 200 && @@cursorframe < 301
         Char_Creat_Cursor.texture_rect = SF.int_rect(0, 75, 295, 25); @@cursorframe = @@cursorframe + 1

       else if @@cursorframe > 300 && @@cursorframe < 401
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 100, 295, 25); @@cursorframe = @@cursorframe + 1

       else if @@cursorframe > 400 && @@cursorframe < 501
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 125, 295, 25); @@cursorframe = @@cursorframe + 1

       else if @@cursorframe > 500 && @@cursorframe < 601
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 100, 295, 25); @@cursorframe = @@cursorframe + 1

       else if  @@cursorframe > 600 && @@cursorframe < 701
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 75, 295, 25); @@cursorframe = @@cursorframe + 1

       else if @@cursorframe > 700 && @@cursorframe < 801
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 50, 295, 25); @@cursorframe = @@cursorframe + 1

       else if  @@cursorframe > 800 && @@cursorframe < 901
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 25, 295, 25); @@cursorframe = @@cursorframe + 1

       else if  @@cursorframe > 900 && @@cursorframe < 1001
        Char_Creat_Cursor.texture_rect = SF.int_rect(0, 25, 295, 25); @@cursorframe = @@cursorframe + 1
  
      else if @@cursorframe == 1001 
        @@cursorframe = 1
      end
      window.draw(Cursor_opt1)
      Cursor_opt1.scale = SF.vector2(1, 1) 
      end; end; end; end; end; end; end; end; end; end; end; end  

      def MenuElements.charcreatecursorMoveFunc(window, @@char_create_pointer_position)
        
        case @@char_create_pointer_position[0]
        when 1 
          Char_Creat_Cursor.position = SF.vector2(225, 285) 
        when 2
          Char_Creat_Cursor.position = SF.vector2(225, 565) 
        when 3
          Char_Creat_Cursor.position = SF.vector2(225, 845) 
        when 4
          Char_Creat_Cursor.position = SF.vector2(1145, 845)
        when 5
          Char_Creat_Cursor.position = SF.vector2(1425, 285)
        when 6
          Char_Creat_Cursor.position = SF.vector2(1425, 565) 
        when 7
          Char_Creat_Cursor.position = SF.vector2(1425, 845) 

      end; end

      def MenuElements.charcreatebreatheFunc(window, @@menu, @@player_character_rendered_model)

        if @@char_create_breathe  > 0 && @@char_create_breathe  < 1001
          @@player_character_rendered_model.texture_rect = SF.int_rect(0, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
        else if  @@char_create_breathe  > 1000 && @@char_create_breathe  <2001
          @@player_character_rendered_model.texture_rect = SF.int_rect(96, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
    
         else if @@char_create_breathe  > 2000 && @@char_create_breathe  < 3001
          @@player_character_rendered_model.texture_rect = SF.int_rect(192, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if  @@char_create_breathe  > 3000 && @@char_create_breathe  < 4001
           @@player_character_rendered_model.texture_rect = SF.int_rect(288, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if @@char_create_breathe  > 4000 && @@char_create_breathe  < 5001
          @@player_character_rendered_model.texture_rect = SF.int_rect(384, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if @@char_create_breathe  > 5000 && @@char_create_breathe  < 6001
          @@player_character_rendered_model.texture_rect = SF.int_rect(480, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if @@char_create_breathe  > 6000 && @@char_create_breathe  < 7001
          @@player_character_rendered_model.texture_rect = SF.int_rect(576, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if  @@char_create_breathe  > 7000 && @@char_create_breathe  < 8001
          @@player_character_rendered_model.texture_rect = SF.int_rect(480, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if @@char_create_breathe  > 8000 && @@char_create_breathe  < 9001
          @@player_character_rendered_model.texture_rect = SF.int_rect(384, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if  @@char_create_breathe  > 9000 && @@char_create_breathe  < 10001
          @@player_character_rendered_model.texture_rect = SF.int_rect(288, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
  
         else if  @@char_create_breathe  > 10000 && @@char_create_breathe  < 11001
          @@player_character_rendered_model.texture_rect = SF.int_rect(192, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1

        else if  @@char_create_breathe  > 11000 && @@char_create_breathe  < 12001
          @@player_character_rendered_model.texture_rect = SF.int_rect(96, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1

        else if  @@char_create_breathe  > 12000 && @@char_create_breathe  < 13001
          @@player_character_rendered_model.texture_rect = SF.int_rect(0, 256, 96, 128); @@char_create_breathe  = @@char_create_breathe  + 1
    
        else if @@char_create_breathe  == 13001 
          @@char_create_breathe  = 1
        end
        window.draw(@@player_character_rendered_model)
        #@@player_character_rendered_model.scale = SF.vector2(1, 1) 
        end; end; end; end; end; end; end; end; end; end; end; end; end; end
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