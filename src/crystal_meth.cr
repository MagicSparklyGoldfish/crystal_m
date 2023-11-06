require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Items.cr"
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
#----------------------------------------------------------------------------------------------------------------------------------------+
#====================================================Window_Class Variables==============================================================+
  @@item_type = "Consumable"
  @@menu = "main"
  @@popup = "none"
  @@cursorposition = "up"
  @@char_select_pointer_position = 0
  @@save_file_slot : Int32 = 0
  @@char_create_pointer_position = [1, 1]
  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new(@@player_character_model.texture)
  #HAIR_ARRAY : Array(SF::Sprite)

  @@current_hair = 0; @@current_display_hair = 0; @@current_display_hair_string = 0
  @@current_skin = 0; @@current_display_skin_string = 0; @@current_face = 0; @@current_shirt = 0; @@current_gloves = 0
  @@current_pants = 0; @@current_shoes = 0

#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#======================================================Character Model==================================================================+

#-----------------------------------------------------initialize models-----------------------------------------------------------------+
 def Window_Class.player_model_initialize 
   @@player_character_model.clear(SF::Color::Transparent)
   @@player_character_model.draw(SKIN_ARRAY[@@current_skin])
   @@player_character_model.draw(SHOES_ARRAY[@@current_shoes])
   @@player_character_model.draw(FACE_ARRAY[@@current_face])
   @@player_character_model.draw(HAIR_ARRAY[@@current_hair])
   @@player_character_model.draw(PANTS_ARRAY[@@current_pants])
   @@player_character_model.draw(SHIRT_ARRAY[@@current_shirt])
   @@player_character_model.draw(GLOVE_ARRAY[@@current_gloves])
   @@player_character_model.create(672, 512, false)
   @@player_character_model.display
   @@player_character_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
   @@player_character_rendered_model.position = SF.vector2(660, 515)
   @@player_character_rendered_model.scale = SF.vector2(3.0, 3.0)
   end
#--------------------------------------------------------draw models--------------------------------------------------------------------+
 def Window_Class.player_model_draw
   @@player_character_model.clear(SF::Color::Transparent)
   @@player_character_model.draw(SKIN_ARRAY[@@skin_slot])
   @@player_character_model.draw(SHOES_ARRAY[@@shoes_slot])
   @@player_character_model.draw(FACE_ARRAY[@@face_slot])
   @@player_character_model.draw(HAIR_ARRAY[@@hair_slot])
   @@player_character_model.draw(PANTS_ARRAY[@@pants_slot])
   @@player_character_model.draw(SHIRT_ARRAY[@@shirt_slot])
   @@player_character_model.draw(GLOVE_ARRAY[@@gloves_slot])
   @@player_character_model.create(672, 512, false)
   @@player_character_model.display
   @@player_character_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
   @@player_character_rendered_model.position = SF.vector2(660, 515)
   @@player_character_rendered_model.scale = SF.vector2(3.0, 3.0)
   end
#---------------------------------------------------customization functions-------------------------------------------------------------+
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
  window.draw(HAIR_ARRAY[@@current_hair])
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
def Window_Class.customize_shirt(window, direction)
  if direction == "right"
    @@current_shirt = @@current_shirt + 1
  else if direction == "left"
    @@current_shirt = @@current_shirt - 1
  end; end
    Shirt_Desc.string = SHIRT_DESC_ARRAY[@@current_shirt]
    Window_Class.player_model_initialize 
    window.draw(SHIRT_ARRAY[@@current_shirt])
end
def Window_Class.customize_gloves(window, direction)
  if direction == "right"
    @@current_gloves = @@current_gloves + 1
  else if direction == "left"
    @@current_gloves = @@current_gloves - 1
  end; end
  Glove_Desc.string = GLOVE_DESC_ARRAY[@@current_gloves]
    Window_Class.player_model_initialize 
    window.draw(GLOVE_ARRAY[@@current_gloves])
end
def Window_Class.customize_pants(window, direction)
  if direction == "right"
    @@current_pants = @@current_pants + 1
  else if direction == "left"
    @@current_pants = @@current_pants - 1
  end; end
  Pants_Desc.string = PANTS_DESC_ARRAY[@@current_pants]
    Window_Class.player_model_initialize 
    window.draw(PANTS_ARRAY[@@current_pants])
end
def Window_Class.customize_shoes(window, direction)
  if direction == "right"
    @@current_shoes = @@current_shoes + 1
  else if direction == "left"
    @@current_shoes = @@current_shoes - 1
  end; end
  Shoes_Desc.string = SHOES_DESC_ARRAY[@@current_shoes]
    Window_Class.player_model_initialize 
    window.draw(SHOES_ARRAY[@@current_shoes])
end
#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#=======================================================Menu Renderers==================================================================+
  
 #/////////////////////////////////////////////////////////Main Menu////////////////////////////////////////////////////////////////////+
   def Window_Class.main_menu(window)
       window.clear(SF::Color::Black);
       window.draw(Text_Title); window.draw(Rectangle_Menu)
       window.draw(Rectangle_Opt1); window.draw(Text_Opt1)
       window.draw(Rectangle_Opt2); window.draw(Text_Opt2)
       window.draw(Cursor_opt1)
   end
 #//////////////////////////////////////////////////////Character Menu//////////////////////////////////////////////////////////////////+
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
 #////////////////////////////////////////////////////Character Creation////////////////////////////////////////////////////////////////+

  def Window_Class.character_creation_menu(window)
     window.clear(SF::Color::White); window.draw(Rectangle_Charcreation_Backwall); window.draw(Rectangle_Charcreation_Ground) 
     window.draw(Rectangle_Dresser_01); window.draw(Rectangle_Dresser_02); window.draw(Rectangle_Cubby_01)
     window.draw(Rectangle_Cubby_02); window.draw(Rectangle_Cubby_03); window.draw(Rectangle_Cubby_04); window.draw(Rectangle_Cubby_05)
     window.draw(Rectangle_Cubby_06); window.draw(Rectangle_Cubby_07); window.draw(Cabinet_01); window.draw(Left_Black_Bar)
     window.draw(Right_Black_Bar); window.draw(Bottom_Black_Bar); window.draw(Char_Creat_Cursor); window.draw(@@player_character_rendered_model)
     window.draw(HAIR_DISPLAY_ARRAY[@@current_display_hair]); window.draw(Hair_Desc); window.draw(DISPLAY_SKIN_ARRAY[@@current_skin])
     window.draw(Skin_Desc); window.draw(DISPLAY_FACE_ARRAY[@@current_face]); window.draw(Face_Desc); window.draw(DISPLAY_SHIRT_ARRAY[@@current_shirt])
     window.draw(Shirt_Desc); window.draw(DISPLAY_GLOVE_ARRAY[@@current_gloves]); window.draw(Glove_Desc) 
     window.draw(DISPLAY_PANTS_ARRAY[@@current_pants]); window.draw(Pants_Desc); window.draw(DISPLAY_SHOES_ARRAY[@@current_shoes]); 
     window.draw(Shoes_Desc)
   end
  def Window_Class.character_creation_popup(window)
    window.draw(Char_Create_Popup_Box); window.draw(Char_Create_Popup_Option_01); window.draw(Char_Create_Popup_Option_02)
    window.draw(Text_Popup_01); window.draw(Text_Popup_01_Opt_01); window.draw(Text_Popup_01_Opt_02); window.draw(Cursor_opt1)
    
   end  
 #////////////////////////////////////////////////////////////HUD///////////////////////////////////////////////////////////////////////+
  
  def Window_Class.hud(window)
   Stats.bars
   window.clear(SF::Color::Black); window.draw(Bottom_HUD); window.draw(System_Menu); window.draw(Text_System_Menu)
   window.draw(LVL_Box); window.draw(LVL_Bar); window.draw(LVL_Bar_Color); window.draw(EXP_Label); window.draw(MP_Bar) 
   window.draw(MP_Bar_Color); window.draw(MP_Label); window.draw(HP_Bar); 
   window.draw(HP_Bar_Color); window.draw(HP_Label); window.draw(LVL_Label)
   end
  def Window_Class.system_popup(window)
    window.draw(System_Menu_Extended); window.draw(Text_System_Menu_Opt_01); window.draw(Text_System_Menu_Opt_02)
    window.draw(Text_System_Menu_Opt_03)
  end
  def Window_Class.quit_window(window)
    window.draw(Quit_Window); window.draw(Quit_Menu_Text); window.draw(Quit_Window_Opt_01); window.draw(Quit_Menu_Opt_01_Text)
    window.draw(Quit_Window_Opt_02); window.draw(Quit_Menu_Opt_02_Text)
  end
  def Window_Class.stat_window(window)
   Stats.stat_menu 
   window.draw(Stats_Window); window.draw(Stats_Window_Char_Box); window.draw(@@player_character_rendered_model); 
   window.draw(Stats_Window_Exit_Box); window.draw(Stats_Window_LVL_Text); window.draw(Stats_Window_LVL_Text_02);
   window.draw(Stats_Window_Str_Text); window.draw(Stats_Window_Dex_Text); window.draw(Stats_Window_Luk_Text)
   window.draw(Stats_Window_Int_Text)
  end
#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#========================================================Window Functions===============================================================+
#/////////////////////////////////////////////////////////////Draw//////////////////////////////////////////////////////////////////////+
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
     if @@popup == "Char_Popup_01"
      MenuElements.cursorFunc(window, @@menu)
      Window_Class.character_creation_popup(window)
     end
   when "HUD"
    Window_Class.hud(window)
    if @@popup == "System_Popup_Menu"
      Window_Class.system_popup(window)
     end
    if @@popup == "Quit_Menu"
      Window_Class.quit_window(window)
    end
    if @@popup == "Stats_Menu"
      Window_Class.stat_window(window)
    end
   else begin 
     raise "ERROR! Invalid value for '@@menu'!"
   rescue
     @@menu == "main"
   end; end; end
#//////////////////////////////////////////////////////////Keypresses///////////////////////////////////////////////////////////////////+
   def Window_Class.keypresses(window)
    case @@menu
    when "main"
      Window_Class.main_menu_keypresses(window)
    when "charselect"
      Window_Class.char_select_menu_keypresses(window)
    when "charcreate"
      Window_Class.char_creation_menu_keypresses(window)
    when "HUD"
      Window_Class.hud_keypresses(window)
    end
   end
#//////////////////////////////////////////////////////Character Creation///////////////////////////////////////////////////////////////+

    def Window_Class.run
#---------------------------------------------------------------------------------------------------------------------------------------+
#                                                        Initialization
#---------------------------------------------------------------------------------------------------------------------------------------+
 window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen) #initializes window
 window.vertical_sync_enabled = false 


 debug_draw = SFMLDebugDraw.new(window, SF::RenderStates.new( #--------------------------------initializes crystal chipmunk draw area
 SF::Transform.new.translate(window.size / 2).scale(1, -1).scale(5, 5)
 ))

#----------------------------------------------------------------------------------------------------------------------------------------+
#                                                    This runs every frame
#----------------------------------------------------------------------------------------------------------------------------------------+
 while window.open?
   Window_Class.keypresses(window)
   Window_Class.draw(window)
   window.display
   end
 end
#________________________________________________________________________________________________________________________________________+
 
#----------------------------------------------------------------------------------------------------------------------------------------+
#                                                     Main Menu Keypresses
#----------------------------------------------------------------------------------------------------------------------------------------+
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
  when SF::Keyboard::H #---------------for testing purposes, remove when testing done
    @@menu = "HUD"
  when SF::Keyboard::W #---------------for testing purposes, remove when testing done
    Data_Manager.load_savegame
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
#__________________________________________________________________________________________________________________________________________+
 
#------------------------------------------------------------------------------------------------------------------------------------------+
#                                                        Char Select Keypresses
#------------------------------------------------------------------------------------------------------------------------------------------+

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
#__________________________________________________________________________________________________________________________________________+
#------------------------------------------------------------------------------------------------------------------------------------------+
#                                                       Char Creation Keypresses
#------------------------------------------------------------------------------------------------------------------------------------------+
def Window_Class.char_creation_menu_keypresses(window)
  while (event = window.poll_event)
    case event
    when SF::Event::Closed
      window.close
    when SF::Event::KeyPressed
      case event.code

#****************************************************************Escape********************************************************************
    when SF::Keyboard::Escape
        window.close
    
#*****************************************************************Down*********************************************************************        
    when SF::Keyboard::Down
      All_Audio::SFX.char_create_down
      @@char_create_pointer_position[1] = 0
      if @@char_create_pointer_position[0] != 8
      @@char_create_pointer_position[0] = @@char_create_pointer_position[0] + 1
      else if @@char_create_pointer_position[0] = 8
        @@char_create_pointer_position[0] = 1
      end; end
#******************************************************************Up**********************************************************************
    when SF::Keyboard::Up
      All_Audio::SFX.char_create_up
      @@char_create_pointer_position[1] = 0
      if @@char_create_pointer_position[0] != 0
         @@char_create_pointer_position[0] = @@char_create_pointer_position[0] - 1
      else if @@char_create_pointer_position[0] = 0
         @@char_create_pointer_position[0] = 7
    end; end;
#****************************************************************Enter*********************************************************************  
    when SF::Keyboard::Enter
      if @@popup == "none"
        Cursor_opt1.position = SF.vector2(600, 405)
        @@popup = "Char_Popup_01"
        @@cursorposition = "left"
      else if @@popup == "Char_Popup_01" && @@cursorposition == "left"
        Player_Data::Clothing_Outfit_Slot.save_outfit(@@current_hair, @@current_skin, @@current_face, @@current_shirt, @@current_gloves, @@current_pants, @@current_shoes)
        @@menu = "HUD"
        #Data_Manager.create_new_savegame
      else if @@popup == "Char_Popup_01" && @@cursorposition == "right"
        @@popup = "None"
      end  
      end
 end
#****************************************************************Left**********************************************************************  
  when SF::Keyboard::Left
   All_Audio::SFX.char_create_sideways
   if @@popup == "Char_Popup_01"
    Cursor_opt1.position = SF.vector2(600, 405)
    @@cursorposition = "left"
   end
   if @@popup != "Char_Popup_01" 
     case @@char_create_pointer_position[0]
   
       when 1 #hair
           direction = "left"
          if @@current_hair != -1
             Window_Class.customize_hair(window, direction)
             @@char_create_pointer_position[1] -= 1
          else @@current_hair = 11; @@char_create_pointer_position[1] = 11
             Window_Class.customize_hair(window, direction)
         end
       when 2 #skin
           direction = "left"
           if @@current_skin != -1
           Window_Class.customize_skin(window, direction)
           @@char_create_pointer_position[1] -= 1
           else 
           @@current_skin = 6; @@char_create_pointer_position[1] = 6
           Window_Class.customize_skin(window, direction)
          end
       when 3 #face
         direction = "left"
         if @@current_face != -1
         Window_Class.customize_face(window, direction)
         @@char_create_pointer_position[1] -= 1
         else 
         @@current_face = 18; @@char_create_pointer_position[1] = 18
         Window_Class.customize_face(window, direction)
         end
       when 4 #shirt
         direction = "left"
         if @@current_shirt != -1
         Window_Class.customize_shirt(window, direction)
         @@char_create_pointer_position[1] -= 1
         else 
         @@current_shirt = 5; @@char_create_pointer_position[1] = 5
         Window_Class.customize_shirt(window, direction)
         end
       when 5 #gloves
         direction = "left"
         if @@current_gloves != -1
           Window_Class.customize_gloves(window, direction)
         @@char_create_pointer_position[1] -= 1
         else 
           @@current_gloves = 2; @@char_create_pointer_position[1] = 2
         Window_Class.customize_gloves(window, direction)
         end
       when 6 #pants
         direction = "left"
         if @@current_pants != -1
           Window_Class.customize_pants(window, direction)
         @@char_create_pointer_position[1] -= 1
         else 
           @@current_pants = 2; @@char_create_pointer_position[1] = 2
           Window_Class.customize_pants(window, direction)
         end
       when 7 #shoes
        direction = "left"
        if @@current_shoes != -1
        Window_Class.customize_shoes(window, direction)
        @@char_create_pointer_position[1] -= 1
        else 
        @@current_shoes = 2; @@char_create_pointer_position[1] = 2
        Window_Class.customize_shoes(window, direction)
      end
      end
      end
#****************************************************************Right*********************************************************************  
  when SF::Keyboard::Right
   All_Audio::SFX.char_create_sideways
   if @@popup == "Char_Popup_01"
    Cursor_opt1.position = SF.vector2(870, 405)
    @@cursorposition = "right"
    end
   if @@popup != "Char_Popup_01" 
   case @@char_create_pointer_position[0]

    when 1 #hair
        direction = "right"
      if @@current_hair != 11
      Window_Class.customize_hair(window, direction) 
      @@char_create_pointer_position[1] += 1
      else @@current_hair = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_hair(window, direction)
      end
    when 2 #skin
      direction = "right"
      if @@current_skin != 6
      Window_Class.customize_skin(window, direction) 
      else
      @@current_skin = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_skin(window, direction)  
      end
    when 3 #face
      direction = "right"
      if @@current_face != 18
      Window_Class.customize_face(window, direction)
      else
      @@current_face = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_face(window, direction)
      end
    when 4 #shirt
      direction = "right"
      if @@current_shirt != 5
      Window_Class.customize_shirt(window, direction)
      else
      @@current_shirt = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_shirt(window, direction)
      end
    when 5 #gloves
      direction = "right"
      if @@current_gloves != 2
        Window_Class.customize_gloves(window, direction)
      else
        @@current_gloves = -1; @@char_create_pointer_position[1] = 0
      Window_Class.customize_gloves(window, direction)
      end
    when 6 #pants
      direction = "right"
      if @@current_pants != 2
        Window_Class.customize_pants(window, direction)
      else
        @@current_pants = -1; @@char_create_pointer_position[1] = 0
        Window_Class.customize_pants(window, direction)
      end
    when 7 #shoes
      direction = "right"
      if @@current_shoes != 2
        Window_Class.customize_shoes(window, direction)
      else
        @@current_shoes = -1; @@char_create_pointer_position[1] = 0
        Window_Class.customize_shoes(window, direction)
      end; end; end; end; end; end; end

#------------------------------------------------------------------------------------------------------------------------------------------+
#                                                            HUD Keypresses
#------------------------------------------------------------------------------------------------------------------------------------------+
def Window_Class.hud_keypresses(window)
  while (event = window.poll_event)
    if SF::Mouse.button_pressed?(SF::Mouse::Left)
      mouse_position = SF::Mouse.position
      x = mouse_position.x
      y = mouse_position.y
      puts "x", x
      puts "y", y
      if (x >= 1700 && x <= 1850) && (y >= 960 && y <= 1010)
        case @@popup
         when "none" 
           All_Audio::SFX.char_create_down; @@popup = "System_Popup_Menu"
         when "System_Popup_Menu" 
           @@popup = "none"
        end
        end
      if (x >= 1700 && x <= 1850) && (y >= 910 && y <= 960)
         case @@popup
         when "System_Popup_Menu" 
          All_Audio::SFX.char_create_sideways
          @@popup = "Quit_Menu"
         when "none"
         end
         end  
      if (x >= 1700 && x <= 1850) && (y >= 860 && y <= 910)
        case @@popup
        when "System_Popup_Menu" 
          Gui::Window_Class.player_model_initialize 
          @@player_character_rendered_model.position = SF.vector2(690, 200)
          @@player_character_rendered_model.scale = SF.vector2(1.5, 1.5)
          @@popup = "Stats_Menu"
        when "none"
         end
         end
      if (x >= 1700 && x <= 1850) && (y >= 810 && y <= 860)
          case @@popup
          when "System_Popup_Menu" 
            All_Audio::SFX.select1
            puts "system"
        when "none"
          end
          end
      if (x >= 710 && x <= 880) && (y >= 490 && y <= 590)
        case @@popup
          when "Quit_Menu" 
            window.close
          when "none"
            end
            end
      if (x >= 1020 && x <= 1200) && (y >= 490 && y <= 590)
        case @@popup
          when "Quit_Menu" 
            @@popup = "none"
          when "none"
            end
            end
      if (x >= 1240 && x <= 1290) && (y >= 210 && y <= 260) && @@popup == "Stats_Menu"
        @@popup = "none"
      end
        end
    case event
    when SF::Event::Closed
      window.close
    when SF::Event::KeyPressed
      case event.code

#********************************************************Escape**********************************************************************
  when SF::Keyboard::Escape
    window.close
end; end; end; end; end; end



#-----------------------------------------------------Menu Elements------------------------------------------------------------------+

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
      end; end
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
#____________________________________________________________________________________________________________________________________+
#------------------------------------------------------------------------------------------------------------------------------------+
#                                                   Character Inventory                                                             #+
#------------------------------------------------------------------------------------------------------------------------------------+

 module Player_Data  
 include Gui; 
 @@hair_slot : (Int32 | Nil ); @@skin_slot : (Int32 | Nil ); @@face_slot : (Int32 | Nil )
 @@shirt_slot : (Int32 | Nil ); @@gloves_slot : (Int32 | Nil ); @@pants_slot : (Int32 | Nil )
 @@shoes_slot : (Int32 | Nil ); @@outfit_array : Array(Int32 | Nil) = [@@hair_slot, @@skin_slot, @@face_slot, @@shirt_slot, @@gloves_slot, @@pants_slot, @@shoes_slot]
 

   def add_item(@@item_type, item)
     if item.is_owned == false 
     case @@item_type
     when "Clothing" || "Quest"
       item.is_owned = true
     when "Consumable" || "Equipment"
     end; end; end
  class Clothing_Wardrobe_Slot
   end
  class Clothing_Outfit_Slot < Window_Class
    include Player_Data  

    def Clothing_Outfit_Slot.save_outfit(@@current_hair, @@current_skin, @@current_face, @@current_shirt, @@current_gloves, @@current_pants, @@current_shoes)
     @@hair_slot = @@current_hair
     @@skin_slot = @@current_skin
     @@face_slot = @@current_face
     @@shirt_slot = @@current_shirt
     @@gloves_slot = @@current_gloves
     @@pants_slot = @@current_pants
     @@shoes_slot = @@current_shoes
     @@outfit_array = [@@hair_slot, @@skin_slot, @@face_slot, @@shirt_slot, @@gloves_slot, @@pants_slot, @@shoes_slot]
     puts @@hair_slot; puts @@current_hair; puts @@outfit_array
     Data_Manager.create_new_savegame(@@outfit_array) 
      end
    def import_outfit

     end
     end
   end
  class Consumables_Slot
   end
  class Equipment_Slop
   end
  class Quest_Item_Slot
   end                  
  class Stats
   @@name : (String); @@name = "Some Rando"
   @@lvl : (Int32); @@exp : (Int32); @@exp_scale : (Int32 | Float64); @@exp_cap : (Int32 | Float64); @@lvl_points : (Int32)
   @@lvl_hp : (Int32); @@equip_hp : (Int32); @@current_max_hp : (Int32); @@current_hp : (Int32)
   @@lvl_mp : (Int32); @@equip_mp : (Int32); @@current_max_mp : (Int32); @@current_mp : (Int32)
   @@lvl_str : (Int32); @@equip_str : (Int32); @@current_str : (Int32); @@lvl_dex : (Int32); @@equip_dex : (Int32); @@current_dex : (Int32)
   @@lvl_luk : (Int32); @@equip_luk : (Int32); @@current_luk : (Int32); @@lvl_int : (Int32); @@equip_int : (Int32); @@current_int : (Int32)
   Base_HP = 100; Base_MP = 100; Base_Str = 1; Base_Dex = 1; Base_Luk = 1; Base_Int = 1
   @@lvl_hp = @@lvl; @@lvl_mp = @@lvl; @@lvl_str = 0; @@lvl_dex = 0; @@lvl_luk = 0; @@lvl_int = 0; @@lvl_points = 0
   @@equip_hp = 0; @@equip_mp = 0; @@equip_str = 0; @@equip_dex = 0; @@equip_luk = 0; @@equip_int = 0
   @@current_max_hp = Base_HP + @@lvl_hp + @@equip_hp; @@current_hp = 100
   @@current_max_mp = Base_MP + @@lvl_mp + @@equip_mp; @@current_mp = 100
   @@current_str = Base_Str + @@lvl_str + @@equip_str; @@current_dex = Base_Dex + @@lvl_dex + @@equip_dex 
   @@current_luk = Base_Luk + @@lvl_luk + @@equip_luk; @@current_int = Base_Int + @@lvl_int + @@equip_int
   @@lvl = 1; @@exp = 0; @@exp_cap = @@lvl * Math.sqrt(100) ; @@exp_scale = @@exp / @@exp_cap

   def Stats.bars
    HP_Bar_Color.scale = SF.vector2(@@current_hp * 0.005, 1); HP_Bar.scale = SF.vector2(@@current_max_hp * 0.005, 1)
    LVL_Bar_Color.scale = SF.vector2(@@exp_scale * 0.01, 1); 
    MP_Bar_Color.scale = SF.vector2(@@current_mp * 0.005, 1); MP_Bar.scale = SF.vector2(@@current_max_mp * 0.005, 1)
     if @@exp >= @@exp_cap
      @@lvl += 1; @@exp = 0; @@lvl_points + 5
     end
  end
    def Stats.stat_menu
     exp = @@exp.to_s + "/" + @@exp_cap.to_s; lvl = "Lvl: " + @@lvl.to_s;
     Stats_Window_LVL_Text.string = exp; Stats_Window_LVL_Text_02.string = lvl; 
     str = "STR: " + @@current_str.to_s; Stats_Window_Str_Text.string = str
     dex = "DEX: " + @@current_dex.to_s; Stats_Window_Dex_Text.string = dex
     luk = "LUK: " + @@current_luk.to_s; Stats_Window_Luk_Text.string = luk
     int = "INT: " + @@current_int.to_s; Stats_Window_Int_Text.string = int
   end
  end




   
module Data_Manager 
extend self
include Player_Data

def Data_Manager.create_new_savegame(@@outfit_array) 

   puts @@outfit_array; puts @@hair_slot

    File.open("Saves/Slot1/save01.yml", "w") { |f| YAML.dump({Is_Owned_Hair_Array, @@outfit_array}, f) }
    YAML.dump({Is_Owned_Hair_Array, @@outfit_array})

 end 
 def Data_Manager.load_savegame
    data = File.read ("Saves/Slot1/save01.yml")
    parsed_data = YAML.parse(data)
    puts parsed_data[1]
 end
end

  #  data = File.read ("Saves/Slot1/save01.yml")
  #  parsed_data = YAML.parse(data)
  #  puts parsed_data
#-----------------------------------------------------------------------------------------------------------------------------------------------+
#                         Runs the program
#-----------------------------------------------------------------------------------------------------------------------------------------------+
Gui::Window_Class.run




#================================================================================================================================================
#                                                           Player Inventory                                                                    #
#================================================================================================================================================




#=================================================================================================================================================
#                                                              Clothing                                                                          #
#=================================================================================================================================================
 
 module Skin
  #properties
   property is_owned : Bool
   property char_sprite : SF::Sprite
   property display_sprite : SF::Sprite
   property id : String
   property name : String
  class Human
     Light = new.Human(false, PLAYER_CHAR, PLAYER_CHAR_DISPLAY, "SH001", "Light") 
     Tan = new.Human(false, PLAYER_CHAR_2, PLAYER_CHAR_DISPLAY_2, "SH002", "Tan")
     Dark = new.Human(false, PLAYER_CHAR_3, PLAYER_CHAR_DISPLAY_3, "SH003", "Dark")
     Jaundiced = new.Human(false, PLAYER_CHAR_7, PLAYER_CHAR_DISPLAY_7, "SH004", "Jaundiced")
   end
  class Spooky
    Ghostly = new.Spooky(false, PLAYER_CHAR_4, PLAYER_CHAR_DISPLAY_4, "SS001", "Ghostly")
    Blue = new.Spooky(false, PLAYER_CHAR_5, PLAYER_CHAR_DISPLAY_5, "SS002", "Blue")
    Purple = new.Spooky(false, PLAYER_CHAR_6, PLAYER_CHAR_DISPLAY_6, "SS003", "Purple")
   end
   end
#HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH 
#H                                                           Hair                                                                            H
#HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
  #Key: [0]: isOwned?; [1]: character sprite; [2]: display sprite; [3]: ID; [4]: name; [5]: color; [6]: length
 #*******************************************************Shounen Hair************************************************************************* 
   Shounen_Hair_Black = [false, "SHOUNEN_HAIR_01", "SHOUNEN_DISPLAY_HAIR_01", "HSH001", "Black Shounen Hair", "black", "medium"]
   Shounen_Hair_Green = [false, "SHOUNEN_HAIR_02", "SHOUNEN_DISPLAY_HAIR_02", "HSH002", "Green Shounen Hair", "green", "medium"]
   Shounen_Hair_Blue = [false, "SHOUNEN_HAIR_03", "SHOUNEN_DISPLAY_HAIR_03", "HSH003", "Blue Shounen Hair", "blue", "medium"]
   Shounen_Hair_Red = [false, "SHOUNEN_HAIR_04", "SHOUNEN_DISPLAY_HAIR_04", "HSH004", "Red Shounen Hair", "red", "medium"]
   Shounen_Hair_Yellow = [false, "SHOUNEN_HAIR_05", "SHOUNEN_DISPLAY_HAIR_05", "HSH005", "Yellow Shounen Hair", "yellow", "medium"]
   Shounen_Hair_Purple = [false, "SHOUNEN_HAIR_06", "SHOUNEN_DISPLAY_HAIR_06", "HSH006", "Purple Shounen Hair", "purple", "medium"]
 #*********************************************************Ponytail***************************************************************************
   Grey_Ponytail = [false, "PONYTAIL_01", "DISPLAY_PONYTAIL_HAIR_01", "HPT001", "Grey Ponytail", "grey", "long"]
   Blonde_Ponytail = [false, "PONYTAIL_02", "DISPLAY_PONYTAIL_HAIR_02", "HPT002", "Blonde Ponytail", "yellow", "long"]
   Red_Ponytail = [false, "PONYTAIL_03", "DISPLAY_PONYTAIL_HAIR_03", "HPT003", "Red Ponytail", "red", "long"]
   Brown_Ponytail = [false, "PONYTAIL_04", "DISPLAY_PONYTAIL_HAIR_04", "HPT004", "Brown Ponytail", "brown", "long"]
   Pink_Ponytail = [false, "PONYTAIL_05", "DISPLAY_PONYTAIL_HAIR_05", "HPT005", "Pink Ponytail", "pink", "long"]
   Blue_Ponytail = [false, "PONYTAIL_06", "DISPLAY_PONYTAIL_HAIR_06", "HPT006", "Blue Ponytail", "blue", "long"]
 #***********************************************************Array****************************************************************************
    @[YAML::Field(key: 0)]
    
    Is_Owned_Hair_Array = [Shounen_Hair_Black[0], Shounen_Hair_Green[0], Shounen_Hair_Blue[0], Shounen_Hair_Red[0], Shounen_Hair_Yellow[0], 
    Shounen_Hair_Purple[0], Grey_Ponytail[0], Blonde_Ponytail[0], Red_Ponytail[0], Brown_Ponytail[0], Pink_Ponytail[0], Blue_Ponytail[0]]

    
  
 module Face
   #properties
    property is_owned : Bool
    property char_sprite : SF::Sprite
    property display_sprite : SF::Sprite
    property id : String
    property name : String
    property eye_color : String
    property does_blink : Bool
   class Button_Face
    Blue_Button_Eyes = new.Button_Face(false, BUTTON_FACE_01, BUTTON_DISPLAY_FACE_01, "FFBE001", "Blue Button Eyes", "blue", false)
    Red_Button_Eyes = new.Button_Face(false, BUTTON_FACE_02, BUTTON_DISPLAY_FACE_02, "FFBE002", "Red Button Eyes", "red", false)
    Purple_Button_Eyes = new.Button_Face(false, BUTTON_FACE_03, BUTTON_DISPLAY_FACE_03, "FFBE003", "Purple Button Eyes", "purple", false)
    Green_Button_Eyes = new.Button_Face(false, BUTTON_FACE_04, BUTTON_DISPLAY_FACE_04, "FFBE004", "Green Button Eyes", "green", false)
    Yellow_Button_Eyes = new.Button_Face(false, BUTTON_FACE_05, BUTTON_DISPLAY_FACE_05, "FFBE005", "Yellow Button Eyes", "yellow", false)
    Brown_Button_Eyes = new.Button_Face(false, BUTTON_FACE_06, BUTTON_DISPLAY_FACE_06, "FFBE006", "Brown Button Eyes", "brown", false)
    end
   class Shounen_Face
    Grey_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_01, SHOUNEN_DISPLAY_FACE_01, "FSF001", "Grey Shounen Face", "grey", true)
    Blue_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_02, SHOUNEN_DISPLAY_FACE_02, "FSF002", "Blue Shounen Face", "blue", true)
    Green_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_03, SHOUNEN_DISPLAY_FACE_03, "FSF003", "Green Shounen Face", "green", true)
    Brown_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_04, SHOUNEN_DISPLAY_FACE_04, "FSF004", "Brown Shounen Face", "brown", true)
    Purple_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_05, SHOUNEN_DISPLAY_FACE_05, "FSF005", "Purple Shounen Face", "purple", true)
    Yellow_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_06, SHOUNEN_DISPLAY_FACE_06, "FSF006", "Yellow Shounen Face", "yellow", true)
    end
   class Tired_Face
    Grey_Tired_Face = new.Tired_Face(false, TIRED_FACE_01, TIRED_DISPLAY_FACE_01, "FTF001", "Grey Tired Face", "grey", true)
    Blue_Tired_Face = new.Tired_Face(false, TIRED_FACE_02, TIRED_DISPLAY_FACE_02, "FTF002", "Blue Tired Face", "blue", true)
    Brown_Tired_Face = new.Tired_Face(false, TIRED_FACE_03, TIRED_DISPLAY_FACE_03, "FTF003", "Brown Tired Face", "brown", true)
    Green_Tired_Face = new.Tired_Face(false, TIRED_FACE_04, TIRED_DISPLAY_FACE_04, "FTF004", "Green Tired Face", "green", true)
    Red_Tired_Face = new.Tired_Face(false, TIRED_FACE_05, TIRED_DISPLAY_FACE_05, "FTF005", "Red Tired Face", "red", true)
    Yellow_Tired_Face = new.Tired_Face(false, TIRED_FACE_06, TIRED_DISPLAY_FACE_06, "FTF006", "Yellow Tired Face", "yellow", true)
    end
   class Smiley_Face
     Smiley_Face = new.Smiley_Face(false, SMILEY_FACE_01, SMILEY_DISPLAY_FACE_01, "FSFL001", "Smiley Face", "black", false)
   end
  end
  
 module Gloves
  #properties
   property is_owned : Bool
   property char_sprite : SF::Sprite
   property display_sprite : SF::Sprite
   property id : String
   property name : String
   property color : String
  class Fingerless_Gloves
   Black_Fingerless_Gloves = new.Fingerless_Gloves(false, FINGERLESS_GLOVE_01, DISPLAY_FINGERLESS_GLOVE_01, "GFG001", "Black Fingerless Gloves", "black")
   Red_Fingerless_Gloves = new.Fingerless_Gloves(false, FINGERLESS_GLOVE_02, DISPLAY_FINGERLESS_GLOVE_02, "GFG002", "Red Fingerless Gloves", "red")
   Blue_Fingerless_Gloves = new.Fingerless_Gloves(false, FINGERLESS_GLOVE_03, DISPLAY_FINGERLESS_GLOVE_03, "GFG003", "Blue Fingerless Gloves", "blue")  
   end
  end
 module Shirts
  #properties
   property is_owned : Bool
   property char_sprite : SF::Sprite
   property display_sprite : SF::Sprite
   property id : String
   property name : String
   property color : String
   property sleeve_length : String
   property midriff_exposed : Bool
  class T_Shirts
   White_T_Shirt = new.T_Shirts(false, T_SHIRT_01, DISPLAY_T_SHIRT_01, "STS001", "White T-Shirt", "white", "short", false)  
   Blue_T_Shirt = new.T_Shirts(false, T_SHIRT_02, DISPLAY_T_SHIRT_02, "STS002", "Blue T-Shirt", "blue", "short", false)
   Red_T_Shirt = new.T_Shirts(false, T_SHIRT_03, DISPLAY_T_SHIRT_03, "STS003", "Red T-Shirt", "red", "short", false)
   Green_T_Shirt = new.T_Shirts(false, T_SHIRT_04, DISPLAY_T_SHIRT_04, "STS004", "Green T-Shirt", "green", "short", false)
   Purple_T_Shirt = new.T_Shirts(false, T_SHIRT_05, DISPLAY_T_SHIRT_05, "STS005", "Purple T-Shirt", "purple", "short", false) 
   Black_T_Shirt = new.T_Shirts(false, T_SHIRT_06, DISPLAY_T_SHIRT_06, "STS006", "Black T-Shirt", "black", "short", false) 
   end 
  end
 module Pants
  #properties
   property is_owned : Bool
   property char_sprite : SF::Sprite
   property display_sprite : SF::Sprite
   property id : String
   property name : String
   property color : String
   property length : String
  class Shorts
   Blue_Shorts = new.Shorts(false, SHORTS_01, DISPLAY_SHORTS_01, "PS001", "Blue_Shorts", "blue", "short")
   Brown_Shorts = new.Shorts(false, SHORTS_02, DISPLAY_SHORTS_02, "PS002", "Brown_Shorts", "brown", "short")
   Black_Shorts = new.Shorts(false, SHORTS_03, DISPLAY_SHORTS_03, "PS003", "Black_Shorts", "black", "short")
   end
  end
 module Shoes
  #properties  
   property is_owned : Bool
   property char_sprite : SF::Sprite
   property display_sprite : SF::Sprite
   property id : String
   property name : String
   property color : String
   property is_waterproof : Bool
  class Boots
   Black_Rain_Boots = new.Boots(false, RAIN_BOOTS_01, DISPLAY_RAIN_BOOTS_01, "SRB001", "Black Rain Boots", "black", true)
   Red_Rain_Boots = new.Boots(false, RAIN_BOOTS_02, DISPLAY_RAIN_BOOTS_02, "SRB002", "Red Rain Boots", "red", true)
   Blue_Rain_Boots = new.Boots(false, RAIN_BOOTS_03, DISPLAY_RAIN_BOOTS_03, "SRB003", "Blue Rain Boots", "blue", true)
   end
  end
  

  

 




















end






# class SpriteInfo
 #   property position : {Float64, Float64}
 #   property texture_filename : String
 
 #   def initialize(@position : {Float64, Float64}, @texture_filename : String)
 #   end
 
 #   # Define a custom to_json method for serialization
 #   def to_json(io : IO)
 #     JSON.build do
 #       io.write "{\"position\": #{@position.to_json}, \"texture_filename\": #{@texture_filename.to_json}}"
 #     end
 #   end
 # end
 
 # # Create a SpriteInfo object
 # sprite_info = SpriteInfo.new({10.0, 20.0}, "sprite.png")
 
 # # Serialize the SpriteInfo object to JSON
 # json_data = sprite_info.to_json(STDOUT)

# #initialize
  #  def initialize(@slot_name : String, @clothing_item : Hash(String, Shounen_Hair))
  #   @slot_name = ""
  #  end
  #  def self.hair_slot
  #   new("Hair", Shounen_Hair_Hash)
  #   end
  #   shounen_Hair_Hash = Hash(String, Shounen_Hair).new
  #   shounen_Hair_Hash["Black"] = Shounen_Hair.shounen_hair_black
  # #properties
  #  (property slot_name : String
  #  property clothing_item : Hash(String, Shounen_Hair))
  # #slots
  #  hair_slot = Clothing_Outfit_Slot.new("Hair", shounen_Hair_Hash("Black" : Shounen_Hair.shounen_hair_black))
  #  #skin_slot = Clothing_Outfit_Slot.new("skin", "PLAYER_CHAR")
# require "yaml"

 # # Replace "your_file.yaml" with the path to your YAML file.
 # yaml_data = File.read("your_file.yaml")
 
 # # Parse the YAML data into a Crystal data structure.
 # parsed_data = YAML.parse(yaml_data)
 
 # # Access data from the parsed YAML structure.
 # puts parsed_data["key_name"] # Replace "key_name" with the key you want to access.

# io = File.open("output.txt", "w")
 # MyModule.write_data_to_io(io)
 # io.close
# class Person
 #   def initialize(@name : String)
 #     @age = 0
 #   end
 
 #   def age
 #     @age
 #   end
 # end


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