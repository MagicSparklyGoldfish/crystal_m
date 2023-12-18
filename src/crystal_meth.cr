require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Items.cr"
require "../src/Custom_Body.cr"
require "../src/enemies.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/Fonts.cr"
require "../src/level_test.cr"
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
include Equipment
include Map_Geometry
extend self

 class Window_Class < Teleporter
#----------------------------------------------------------------------------------------------------------------------------------------+
#====================================================Window_Class Variables==============================================================+
  @@item_type = "Consumable"
 #-------------------------------------------------------Location Variables--------------------------------------------------------------+
  @@menu = "main"
  @@popup = "none"
  @@tab = "none"
  @@map = "none"
  @@area = "none"
  @@salon = "none"
  @@page : Int32 = 1; @@page_02 : Int32 = 1; @@page_03 : Int32 = 1
  @@category = "ore"
  @@info_box = "none"
 #_______________________________________________________________________________________________________________________________________+
 #-------------------------------------------------------Game State Variables------------------------------------------------------------+
  @@dialog : Bool; @@dialog = false;
  @@case_frame = 0
 #_______________________________________________________________________________________________________________________________________+
 #---------------------------------------------------------Cursor Variables--------------------------------------------------------------+
  @@cursorposition = "up"
  @@char_select_pointer_position = 0
  @@char_create_pointer_position = [1, 1]
 #_______________________________________________________________________________________________________________________________________+
 #-----------------------------------------------------Character State Variables---------------------------------------------------------+
  @@has_weapon : Bool; @@has_weapon = false
  @@idle : Bool; @@idle = true 
  @@attacking : Bool; @@attacking = false
  @@idleframes = 0
  @@idle_animation_frames = 0
  @@is_walking : Bool; @@is_walking = false
  WALK_TIMER = SF::Clock.new
  IDLE_TIMER = SF::Clock.new
  @@airborn : Bool; @@airborn = false
  @@is_on_ladder : Bool; @@is_on_ladder = false
 #_______________________________________________________________________________________________________________________________________+
 #-----------------------------------------------------Character Model Variables---------------------------------------------------------+
  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new(@@player_character_model.texture)
  @@hair_choice : Int32; @@hair_choice = 0
  @@current_hair = 0; @@current_display_hair = 0; @@current_display_hair_string = 0
  @@current_skin = 0; @@current_display_skin_string = 0; @@current_face = 0; @@current_shirt = 0; @@current_gloves = 0
  @@current_pants = 0; @@current_shoes = 0; @@current_weapon = 0; @@current_direction : String; @@current_direction = "right"
 #_______________________________________________________________________________________________________________________________________+
 #-----------------------------------------------------------Save Variables--------------------------------------------------------------+
  @@save_file_slot : Int32 = 0
 #_______________________________________________________________________________________________________________________________________+

 

#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#======================================================Character Model==================================================================+
 #-----------------------------------------------------initialize models----------------------------------------------------------------+
  def Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
    @@player_character_model.clear(SF::Color::Transparent) #@note player customization happens here
    @@player_character_model.draw(SKIN_ARRAY[@@current_skin])
    if @@has_weapon == true && @@current_direction == "left"
      player = @@player_character_model
      Crafted_Items::Weapon.draw_current_weapon(player)
      #Equipment.draw_current_weapon(player)
      #@@player_character_model.draw(WEAPON_ARRAY[@@current_weapon])
    end
    @@player_character_model.draw(SHOES_ARRAY[@@current_shoes])
    @@player_character_model.draw(FACE_ARRAY[@@current_face])
    @@player_character_model.draw(HAIR_ARRAY[@@current_hair])
    @@player_character_model.draw(PANTS_ARRAY[@@current_pants])
    @@player_character_model.draw(SHIRT_ARRAY[@@current_shirt])
    @@player_character_model.draw(GLOVE_ARRAY[@@current_gloves])
    if @@has_weapon == true && @@current_direction == "right"
      player = @@player_character_model
      Crafted_Items::Weapon.draw_current_weapon(player)
      #Equipment.draw_current_weapon(player)
      #@@player_character_model.draw(WEAPON_ARRAY[@@current_weapon])
    end
    @@player_character_model.create(672, 1024, false)
    @@player_character_model.display
    @@player_character_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
    if @@menu == "charcreate"
    @@player_character_rendered_model.position = SF.vector2(660, 515)
    @@player_character_rendered_model.scale = SF.vector2(3.0, 3.0)
    end
    end
 
 #---------------------------------------------------customization functions------------------------------------------------------------+
 def Window_Class.customize_hair(window, direction)
   if direction == "right"
   @@current_hair = @@current_hair + 1; @@current_display_hair = @@current_hair
   @@current_display_hair_string = @@current_hair
   else if direction == "left"
   @@current_hair = @@current_hair - 1; @@current_display_hair = @@current_hair
   @@current_display_hair_string = @@current_hair
   end; end
   Hair_Desc.string = HAIR_DESC_ARRAY[@@current_display_hair_string]
   Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
   window.draw(HAIR_ARRAY[@@current_hair])
 end
 def Window_Class.customize_skin(window, direction)
   if direction == "right"
     @@current_skin = @@current_skin + 1
   else if direction == "left"
     @@current_skin = @@current_skin - 1
   end; end
     Skin_Desc.string = SKIN_DESC_ARRAY[@@current_skin]
     Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
     window.draw(SKIN_ARRAY[@@current_skin])
 end
 def Window_Class.customize_face(window, direction)
   if direction == "right"
     @@current_face = @@current_face + 1
   else if direction == "left"
     @@current_face = @@current_face - 1
   end; end
     Face_Desc.string = FACE_DESC_ARRAY[@@current_face]
     Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
     window.draw(FACE_ARRAY[@@current_face])
 end
 def Window_Class.customize_shirt(window, direction)
   if direction == "right"
     @@current_shirt = @@current_shirt + 1
   else if direction == "left"
     @@current_shirt = @@current_shirt - 1
   end; end
     Shirt_Desc.string = SHIRT_DESC_ARRAY[@@current_shirt]
     Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
     window.draw(SHIRT_ARRAY[@@current_shirt])
 end
 def Window_Class.customize_gloves(window, direction)
   if direction == "right"
     @@current_gloves = @@current_gloves + 1
   else if direction == "left"
     @@current_gloves = @@current_gloves - 1
   end; end
   Glove_Desc.string = GLOVE_DESC_ARRAY[@@current_gloves]
   Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
     window.draw(GLOVE_ARRAY[@@current_gloves])
 end
 def Window_Class.customize_pants(window, direction)
   if direction == "right"
     @@current_pants = @@current_pants + 1
   else if direction == "left"
     @@current_pants = @@current_pants - 1
   end; end
   Pants_Desc.string = PANTS_DESC_ARRAY[@@current_pants]
   Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
     window.draw(PANTS_ARRAY[@@current_pants])
 end
 def Window_Class.customize_shoes(window, direction)
   if direction == "right"
     @@current_shoes = @@current_shoes + 1
   else if direction == "left"
     @@current_shoes = @@current_shoes - 1
   end; end
   Shoes_Desc.string = SHOES_DESC_ARRAY[@@current_shoes]
   Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
     window.draw(SHOES_ARRAY[@@current_shoes])
 end
#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#=======================================================Menu Renderers==================================================================+ @note menu renderers
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
   view2 = SF::View.new(SF.float_rect(0, 950, 1890, 140))
   view2.viewport = SF.float_rect(0, 0.85, 1, 0.15)
   window.view = view2
   Player_Data::Stats.bars 
   window.draw(Bottom_HUD); window.draw(System_Menu); window.draw(Text_System_Menu)
   window.draw(LVL_Box); window.draw(LVL_Bar); window.draw(LVL_Bar_Color); window.draw(EXP_Label); window.draw(MP_Bar) 
   window.draw(MP_Bar_Color); window.draw(MP_Label); window.draw(HP_Bar); 
   window.draw(HP_Bar_Color); window.draw(HP_Label); window.draw(LVL_Label)
   if @@idle == true && @@airborn == false
    idletime = IDLE_TIMER.elapsed_time
    @@idleframes += 1
    if SF::Keyboard.key_pressed?(SF::Keyboard::D) || SF::Keyboard.key_pressed?(SF::Keyboard::A) || SF::Keyboard.key_pressed?(SF::Keyboard::W) 
      IDLE_TIMER.restart
    end
    if idletime > SF.seconds(0.25) && @@current_direction == "right"
      Harvestables::Ore.stop_attack
      Harvestables::Herbs.stop_attack
      @@is_walking = false
    Window_Class.idle_animation_right(window)
    else if idletime > SF.seconds(0.25) && @@current_direction == "left"
      Harvestables::Ore.stop_attack
      Harvestables::Herbs.stop_attack
      @@is_walking = false
      Window_Class.idle_animation_left(window)
    end
    end
  end
   end
  def Window_Class.system_popup(window)
    view4 = SF::View.new(SF.float_rect(1700, 810, 150, 150))
    view4.viewport = SF.float_rect(0.899, 0.771, 0.08, 0.09)
    window.view = view4
    window.draw(System_Menu_Extended); window.draw(Text_System_Menu_Opt_01); window.draw(Text_System_Menu_Opt_02)
    window.draw(Text_System_Menu_Opt_03)

   end
  def Window_Class.quit_window(window)
    view5 = SF::View.new(SF.float_rect(0, 0, 1920, 1080))
    view5.viewport = SF.float_rect(0, 0, 1, 1)
    window.view = view5
    window.draw(Quit_Window); window.draw(Quit_Menu_Text); window.draw(Quit_Window_Opt_01); window.draw(Quit_Menu_Opt_01_Text)
    window.draw(Quit_Window_Opt_02); window.draw(Quit_Menu_Opt_02_Text)
   end
  def Window_Class.stat_window(window)
    view5 = SF::View.new(SF.float_rect(0, 0, 1920, 1080))
    view5.viewport = SF.float_rect(0, 0, 1, 1)
    window.view = view5
    Player_Data::Stats.stat_menu; 
   window.draw(Stats_Window); window.draw(Stats_Window_Char_Box); #window.draw(@@player_character_rendered_model); 
   window.draw(Stats_Window_Exit_Box); window.draw(Stats_Window_LVL_Text); window.draw(Stats_Window_LVL_Text_02);
   window.draw(Stats_Window_Str_Text); window.draw(Stats_Window_Dex_Text); window.draw(Stats_Window_Luk_Text)
   window.draw(Stats_Window_Int_Text); window.draw(Stats_Window_HP_Text); window.draw(Stats_Window_MP_Text)
   window.draw(Inventory_Box); window.draw(Stats_Window_Name_Text); window.draw(Inventory_Tab_01); window.draw(Inventory_Tab_Text_01)
   window.draw(Inventory_Tab_02); window.draw(Inventory_Tab_Text_02); window.draw(Inventory_Tab_03); window.draw(Inventory_Tab_Text_03)
   window.draw(Inventory_Tab_04); window.draw(Inventory_Tab_Text_04); window.draw(Inventory_arrow_up); window.draw(Inventory_arrow_down)
   player = SF::Sprite.new(@@player_character_rendered_model)
   player.position = SF.vector2(690, 200); player.scale = SF.vector2(1.5, 1.5); window.draw(player) 
   end
  def Window_Class.shirt_tab(window)
    Inventory_Tab_01.texture_rect = SF.int_rect(0, 35, 140, 35)
    Inventory_Tab_02.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_03.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_04.texture_rect = SF.int_rect(0, 0, 140, 35)
    Window_Class.stat_window(window)
   end
  def Window_Class.gloves_tab(window)
    Inventory_Tab_01.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_02.texture_rect = SF.int_rect(0, 35, 140, 35)
    Inventory_Tab_03.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_04.texture_rect = SF.int_rect(0, 0, 140, 35)
    Window_Class.stat_window(window)
   end
  def Window_Class.pants_tab(window)
    Inventory_Tab_01.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_02.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_03.texture_rect = SF.int_rect(0, 35, 140, 35)
    Inventory_Tab_04.texture_rect = SF.int_rect(0, 0, 140, 35)
    Window_Class.stat_window(window)
   end
  def Window_Class.shoes_tab(window)
    Inventory_Tab_01.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_02.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_03.texture_rect = SF.int_rect(0, 0, 140, 35)
    Inventory_Tab_04.texture_rect = SF.int_rect(0, 35, 140, 35)
    Window_Class.stat_window(window)
   end
  def Window_Class.test(window)
    window.clear(SF::Color::Black);
    window.draw(Text_Title); window.draw(Rectangle_Menu)
    window.draw(Rectangle_Opt1); window.draw(Text_Opt1)
    window.draw(Rectangle_Opt2); window.draw(Text_Opt2)
    window.draw(Cursor_opt1)
   end
  def Window_Class.salon(window)
    view5 = SF::View.new(SF.float_rect(0, 0, 1920, 1080))
    view5.viewport = SF.float_rect(0, 0, 1, 1)
    window.view = view5
    exit_box = Stats_Window_Exit_Box.dup; exit_box.position = SF.vector2(1320, 205)
    window.draw(Salon_Box); window.draw(exit_box); window.draw(Salon_Confirm_Box); window.draw(Salon_Confirm_Box_Text)
    player = SF::Sprite.new(@@player_character_rendered_model)
    player.position = SF.vector2(600, 200); player.scale = SF.vector2(1.5, 1.5); window.draw(player) 
    this = @@salon
    Hair.display_offered_hair(this, window)
   end
  def Window_Class.salon_confirm_tab(window)
    Window_Class.salon(window)
    salon_confirm_box = Choice_Box.dup; salon_confirm_box.position = SF.vector2(735, 390); salon_confirm_box.scale = SF.vector2(1.5, 1.5)
    salon_option_1 = Choice_Box_Option.dup; salon_option_1.position = SF.vector2(750, 525); salon_option_1.scale = SF.vector2(1.5, 1.5)
    salon_option_2 = salon_option_1.dup; salon_option_1.position = SF.vector2(1020, 525); salon_confirm_text = Dialog_Box_Text.dup
    salon_confirm_text.character_size = 40
    salon_confirm_text.position = SF.vector2(805, 390); salon_confirm_text.string = "Would you like this \n    hair style?"
    salon_confirm_option_1 = salon_confirm_text.dup; salon_confirm_option_1.position = SF.vector2(795, 530)
    salon_confirm_option_1.string = "Yes               No"
    window.draw(salon_confirm_box); window.draw(salon_option_1); window.draw(salon_option_2); window.draw(salon_confirm_text)
    window.draw(salon_confirm_option_1)
   end
  def Window_Class.inventory(window)
   view5 = SF::View.new(SF.float_rect(0, 0, 1920, 1080))
   view5.viewport = SF.float_rect(0, 0, 1, 1)
   window.view = view5
   window.draw(Inventory_Window); window.draw(Weapon_Tab); window.draw(Use_Tab); window.draw(Etc_Tab)
   window.draw(Weapon_Tab_Text); window.draw(Use_Tab_Text); window.draw(Etc_Tab_Text); window.draw(Inventory_arrow_up2)
   window.draw(Inventory_arrow_down2)
   if @@tab == "Equipment"
    page = @@page
    Crafted_Items::Weapon.display_equipment_inventory(window, page)
    if @@info_box == "equipment"
      window.draw(Weapon_Info_Box);  window.draw(Weapon_Info_Text)
    end
     #Equipment::Stick.test(window, page)
   else if @@tab == "Use"
    window.draw(Ingredient_Button); window.draw(Ingredient_Button_Text)
    page = @@page
    case @@category
      when "Ingredients"
       Use::Ingredients.display_inventory(window, page)
     end
   else if @@tab == "Etc"
     window.draw(Ore_Button); window.draw(Ore_Button_Text); window.draw(Ingot_Button); window.draw(Ingot_Button_Text)
     window.draw(Gem_Button); window.draw(Gem_Button_Text)
     page = @@page
     case @@category
      when "ore"
       Etc::Inventory_Ore.display_ore(window, page) 
      when "ingot"
       Etc::Inventory_Ingot.display_ingot(window, page)
      when "gem"
       Etc::Gem.display_gem(window, page)
       if @@info_box == "gem"
        window.draw(Gem_Info_Box);  window.draw(Gem_Info_Text)
      end
  end; end; end
  end
 end
 def Window_Class.weapon_tab(window)
   Weapon_Tab.texture_rect = SF.int_rect(200, 0, 200, 70)
   Use_Tab.texture_rect = SF.int_rect(0, 0, 200, 70)
   Etc_Tab.texture_rect = SF.int_rect(0, 0, 200, 70);
  end
 def Window_Class.use_tab(window)
   Weapon_Tab.texture_rect = SF.int_rect(0, 0, 200, 70)
   Use_Tab.texture_rect = SF.int_rect(200, 0, 200, 70)
   Etc_Tab.texture_rect = SF.int_rect(0, 0, 200, 70);
  end
 def Window_Class.etc_tab(window)
   Weapon_Tab.texture_rect = SF.int_rect(0, 0, 200, 70)
   Use_Tab.texture_rect = SF.int_rect(0, 0, 200, 70)
   Etc_Tab.texture_rect = SF.int_rect(200, 0, 200, 70);
  end
  def Window_Class.player_attack_bounding_box(window) 
    if @@current_direction == "right"
     Player_Attack_Bounding_Box.position = @@player_character_rendered_model.position + SF.vector2(65, 25)
    end
    if @@current_direction == "left"
      Player_Attack_Bounding_Box.position = @@player_character_rendered_model.position + SF.vector2(-65, 25)
     end
    if @@attacking == true
    window.draw(Player_Attack_Bounding_Box)
    end
   end
#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#========================================================Map Renderer===================================================================+
 #---------------------------------------------------------Draw Map----------------------------------------------------------------------
   def Window_Class.draw_map(window)
     window.clear(SF::Color::Transparent);
     b = @@player_character_rendered_model.position
     x = b[0]; y = b[1]
     view1 = SF::View.new(SF.float_rect(0, 0, 1900, 700))
     view1.center = SF.vector2(x, y)
     view1.viewport = SF.float_rect(0, 0, 1, 0.85)
     window.view = view1
     if @@attacking == true
      Window_Class.player_attack_bounding_box(window)
      end
     map = @@map
     area = @@area
     Window_Class.wall_collision
     Map_Geometry::Wall.position(window, area, map)
     Map_Geometry::Misc_Decor.position(window, area, map)
     Map_Geometry::Teleporter.position_teleporters(area, map)
     Map_Geometry::Platform.set_positions(area, map)
     Map_Geometry::Ladder.position(map, area)
     Map_Geometry::Wall.display(window, area, map)
     Map_Geometry::Misc_Decor.display(window, area, map)
     Map_Geometry::Teleporter.display_teleporters(window, area, map)
     Map_Geometry::Platform.display(area, map, window)
     Map_Geometry::Ladder.display_ladders(window, map, area)
     Regular_Enemies.display(window, map, area)
     window.draw(@@player_character_rendered_model); 
     Harvestables::Ore.draw_ores(window, map)
     Harvestables::Herbs.display(window, map)
     window.draw(Ground); 
   
    end
 #-------------------------------------------------------teleporters---------------------------------------------------------------------
  def Window_Class.teleport(window, map, area)
    Teleporter_Array.map { |i| bounding_box1 = @@player_character_rendered_model.global_bounds
    bounding_box2 = i.sprite.global_bounds
    if bounding_box1.intersects? bounding_box2
      @@area = i.destination_area
      puts @@area
      @@map = i.destination_map 
      puts @@map
      Map_Geometry::Teleporter.position_teleporters(area, map)
      Map_Geometry::Ladder.position(map, area)
      Map_Geometry::Platform.set_positions(area, map)
    end}
   end 
 #-----------------------------------------------------------Walls----------------------------------------------------------------------
  def Window_Class.wall_collision
    Wall_Array.map { |i| bounding_box1 = @@player_character_rendered_model.global_bounds
    bounding_box2 = i.bounding_rectangle.global_bounds
    if bounding_box1.intersects? bounding_box2
     if @@player_character_rendered_model.position.x > i.bounding_rectangle.position.x
      y = @@player_character_rendered_model.position.y
      x = i.bounding_rectangle.position.x + i.length
      @@player_character_rendered_model.position = SF.vector2(x, y)
     else if @@player_character_rendered_model.position.x < i.bounding_rectangle.position.x
      y = @@player_character_rendered_model.position.y
      x = i.bounding_rectangle.position.x - 100
      @@player_character_rendered_model.position = SF.vector2(x, y)
    end; end; end}
   end
  
#---------------------------------------------------------------------------------------------------------------------------------------+
#==========================================================Animations===================================================================+
   #====================================================Idle Animations=================================================================+
    def Window_Class.idle_animation_right(window)
      @@idle_animation_frames += 1
      @@attacking = false
      if @@idle_animation_frames >= 6000 && @@case_frame <= 5
        @@case_frame += 1
        @@idle_animation_frames = 0
      else if @@idle_animation_frames >= 6000 && @@case_frame >= 6
        @@case_frame = 0
        @@idle_animation_frames = 0
      end; end
     case @@case_frame
      when 0
        @@player_character_rendered_model.texture_rect = SF.int_rect(0, 256, 96, 128)
      when 1
        @@player_character_rendered_model.texture_rect = SF.int_rect(96, 256, 96, 128)
      when 2
        @@player_character_rendered_model.texture_rect = SF.int_rect(192, 256, 96, 128)
      when 3
        @@player_character_rendered_model.texture_rect = SF.int_rect(288, 256, 96, 128)
      when 4
        @@player_character_rendered_model.texture_rect = SF.int_rect(384, 256, 96, 128)
      when 5
        @@player_character_rendered_model.texture_rect = SF.int_rect(480, 256, 96, 128)
      when 6
        @@player_character_rendered_model.texture_rect = SF.int_rect(576, 256, 96, 128)
      end
     end
    def Window_Class.idle_animation_left(window) 
      @@idle_animation_frames += 1
      @@attacking = false
      if @@idle_animation_frames >= 6000 && @@case_frame <= 5
        @@case_frame += 1
        @@idle_animation_frames = 0
      else if @@idle_animation_frames >= 6000 && @@case_frame >= 6
        @@case_frame = 0
        @@idle_animation_frames = 0
      end; end
     case @@case_frame
      when 0
        @@player_character_rendered_model.texture_rect = SF.int_rect(0, 384, 96, 128)
      when 1
        @@player_character_rendered_model.texture_rect = SF.int_rect(96, 384, 96, 128)
      when 2
        @@player_character_rendered_model.texture_rect = SF.int_rect(192, 384, 96, 128)
      when 3
        @@player_character_rendered_model.texture_rect = SF.int_rect(288, 384, 96, 128)
      when 4
        @@player_character_rendered_model.texture_rect = SF.int_rect(384, 384, 96, 128)
      when 5
        @@player_character_rendered_model.texture_rect = SF.int_rect(480, 384, 96, 128)
      when 6
        @@player_character_rendered_model.texture_rect = SF.int_rect(576, 384, 96, 128)
      end
     end
   #====================================================================================================================================+
   #====================================================Attack Animations===============================================================+
    #------------------------------------------------------Left Swing------------------------------------------------------------------+
     @@frame = 0
     def Window_Class.attack_swing_left(@@player_character_rendered_model, window)
      @@frame += 1
      if @@frame  > 0 && @@frame  < 2
       Crafted_Items::Weapon.play_swing_sound
        @@player_character_rendered_model.texture_rect = SF.int_rect(0, 768, 96, 128)
      else if @@frame  > 3 && @@frame  < 5
        @@player_character_rendered_model.texture_rect = SF.int_rect(96, 768, 96, 128)
      else if @@frame  > 6 && @@frame  < 8
        @@player_character_rendered_model.texture_rect = SF.int_rect(192, 768, 96, 128)
      else if @@frame  > 9 && @@frame  < 11
        @@player_character_rendered_model.texture_rect = SF.int_rect(288, 768, 96, 128)
      else if @@frame  > 11
        @@frame = 0
      end; end; end; end; end
     end        
    #----------------------------------------------------------------------------------------------------------------------------------+
    #------------------------------------------------------Right Swing-----------------------------------------------------------------+
     @@frame = 0
     def Window_Class.attack_swing_right(@@player_character_rendered_model, window)
      @@frame += 1
      if @@frame  > 0 && @@frame  < 2
        Crafted_Items::Weapon.play_swing_sound
        @@player_character_rendered_model.texture_rect = SF.int_rect(0, 512, 96, 128)
      else if @@frame  > 3 && @@frame  < 5
        @@player_character_rendered_model.texture_rect = SF.int_rect(96, 512, 96, 128)
      else if @@frame  > 6 && @@frame  < 8
        @@player_character_rendered_model.texture_rect = SF.int_rect(192, 512, 96, 128)
      else if @@frame  > 9 && @@frame  < 11
        @@player_character_rendered_model.texture_rect = SF.int_rect(288, 512, 96, 128)
      else if @@frame  > 11
        @@frame = 0
      end; end; end; end; end
     end
    #----------------------------------------------------------------------------------------------------------------------------------+
#=======================================================================================================================================+
#---------------------------------------------------------------------------------------------------------------------------------------+
#========================================================Window Functions===============================================================+
#////////////////////////////////////////////////////////Change_Variables///////////////////////////////////////////////////////////////+ #@note change window variables
  def Window_Class.change_popup(this)
    @@popup = this
   end
  def Window_Class.change_salon(this)
    @@salon = this
   end 
  def Window_Class.change_direction(this)
    @@current_direction = this
    Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
   end
  def Window_Class.equip_weapon(this2)
    @@current_weapon = this2
    puts this2
    @@has_weapon = true
    Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
  end
  def Window_Class.check_attacking(event)
    Player_Data::Stats.check_attack
    if @@attacking == true
      attack = true
    end
    if @@attacking == false
      attack = false
    end
   end
 def Window_Class.is_walking(walking)
   @@is_walking = walking
  end
 def Window_Class.is_airborn(airborn)
  @@airborn = airborn
 end
 def Window_Class.is_on_ladder(bool)
  @@is_on_ladder = bool
 end
#/////////////////////////////////////////////////////////////Draw//////////////////////////////////////////////////////////////////////+

  def Window_Class.map(window) #@note player movement
    walk_time = WALK_TIMER.elapsed_time
   if @@map != "none" && @@is_walking == true && walk_time > SF.seconds(0.025)
    case @@current_direction
      when "right"
        Player_Data::Player_Physics.wasd_right(@@player_character_rendered_model)
        WALK_TIMER.restart
      when "left"
        Player_Data::Player_Physics.wasd_left(@@player_character_rendered_model)
        WALK_TIMER.restart
     end
   if @@popup == "gem_cutter"
    page = @@page
    tab = @@tab
    Etc::Gem.display_gem_cutter(window, page, tab)
    end
   if @@popup == "upgrade_table"
      page = @@page; page_02 = @@page_02; page_03 = @@page_03
      tab = @@tab
      Crafted_Items::Upgrade_Table.display_upgrade_table(window)
      Crafted_Items::Upgrade_Table.display_weapon_upgrade_table(window, page, page_02, page_03)
      Etc::Gem.display_upgrade_gems(window, page_02)
      end
    Window_Class.hud(window)
  end
   end
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
    Window_Class.draw_map(window)
    Window_Class.hud(window)
    Player_Data::Player_Physics.gravity(@@player_character_rendered_model, window)
    if @@popup == "Salon"
      Window_Class.salon(window)
      if @@tab == "salon_confirm"
        Window_Class.salon_confirm_tab(window)
      end
    end
    if @@popup == "Inventory"
      Window_Class.inventory(window)

    end
    if @@popup == "System_Popup_Menu"
      Window_Class.system_popup(window)
     end
    if @@popup == "Quit_Menu"
      Window_Class.quit_window(window)
     end
    if @@popup == "Stats_Menu"
      Window_Class.stat_window(window)
      case @@tab
       when "shirt"
        Window_Class.shirt_tab(window)
        Clothing::Shirt.draw(window, @@page)
       when "gloves"
        Window_Class.gloves_tab(window)
        Clothing::Gloves.draw(window)
       when "pants"
        Window_Class.pants_tab(window)
        Clothing::Pants.draw(window, @@page)
       when "shoes"
        Window_Class.shoes_tab(window)
        Clothing::Shoes.draw(window)
       end
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
      Window_Class.check_if_idle(window)
      if @@dialog == true
       end
    end
   end
   def Window_Class.check_if_idle(window)
    if SF::Event::KeyPressed == true
      @@idle = false
      @@idleframes = 0
    else
      @@idle = true
      #@@attacking = false
    end
   end
#//////////////////////////////////////////////////////Character Creation///////////////////////////////////////////////////////////////+

    def Window_Class.run
#---------------------------------------------------------------------------------------------------------------------------------------+
#                                                        Initialization
#---------------------------------------------------------------------------------------------------------------------------------------+
 window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen) #@note initializes window
 window.vertical_sync_enabled = false; #window.framerate_limit = 120

 Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 

#----------------------------------------------------------------------------------------------------------------------------------------+
#                                                        This runs every frame
#----------------------------------------------------------------------------------------------------------------------------------------+
 while window.open?
   Window_Class.keypresses(window)
   Window_Class.map(window)
   Window_Class.draw(window)
   
   window.display()
   end
 end
#__________________________________________________________________________________________________________________________________________+
 
#------------------------------------------------------------------------------------------------------------------------------------------+
#                                                        Main Menu Keypresses
#------------------------------------------------------------------------------------------------------------------------------------------+
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
    @@map = "test"
    @@area = "test"
    area = @@area
    map = @@map
    @@player_character_rendered_model.position = SF.vector2(0, 600)
    Map_Geometry::Teleporter.position_teleporters(area, map)
    Map_Geometry::Ladder.position(map, area)
    Map_Geometry::Platform.set_positions(area, map)
    @@player_character_rendered_model.scale = SF.vector2(1.0, 1.0)
    All_Audio::MUSIC.test_song
    #view2 = SF::View.new(SF.vector2(350, 300), SF.vector2(300, 200))
  when SF::Keyboard::W #---------------for testing purposes, remove when testing done
    Data_Manager.load_savegame
  when SF::Keyboard::C #---------------for testing purposes, remove when testing done
    Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
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
        Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
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
#                                                        @note HUD Mouse clicks
#------------------------------------------------------------------------------------------------------------------------------------------+
def Window_Class.hud_keypresses(window)
  while (event = window.poll_event)
   #-------------------------------------------------------------Right Mouse Button---------------------------------------------------------
    if SF::Mouse.button_pressed?(SF::Mouse::Right)
      mouse_position = SF::Mouse.position
      x = mouse_position.x
      y = mouse_position.y
    case @@tab
     when "Etc"  #----------------------------------Gem Info Boxes
      case @@category
       when "gem"
       if (x >= 555 && x <= 710) && (y >= 310 && y <= 460) #--slot one
        Gem_Info_Box.position = SF.vector2(500, 460) 
        Gem_Info_Text.position = Gem_Info_Box.position 
        if @@info_box != "gem"
         @@info_box = "gem"
         slot = 0
         case @@page
          when 1
           slot = 0
          when 2
           slot = 18
          when 3
            slot = 36
          when 4
            slot = 54  
          end
         Etc::Gem.check_stats(slot)
        else if @@info_box == "gem"
         @@info_box = "none"
        end; end; end
       if (x >= 710 && x <= 865) && (y >= 310 && y <= 460) #--slot two
        Gem_Info_Box.position = SF.vector2(655, 460) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
          @@info_box = "gem"
          slot = 0
          case @@page
           when 1
            slot = 1
           when 2
            slot = 19
           when 3
            slot = 37
           when 4
            slot = 55  
           end
          Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
          @@info_box = "none"
          end; end; end
       if (x >= 865 && x <= 1020) && (y >= 310 && y <= 460) #--slot three
        Gem_Info_Box.position = SF.vector2(800, 460) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
          @@info_box = "gem"
          slot = 0
          case @@page
           when 1
            slot = 2
           when 2
            slot = 20
           when 3
            slot = 38    
           when 4
            slot = 56         
           end
          Etc::Gem.check_stats(slot)
        else if @@info_box == "gem"
          @@info_box = "none"
          end; end; end
       if (x >= 1020 && x <= 1175) && (y >= 310 && y <= 460) #--slot four
        Gem_Info_Box.position = SF.vector2(945, 460) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 3
            when 2
             slot = 21
            when 3
              slot = 39 
            when 4
              slot = 57     
            end
           Etc::Gem.check_stats(slot)
           else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 1175 && x <= 1330) && (y >= 310 && y <= 460) #--slot five
        Gem_Info_Box.position = SF.vector2(1100, 460) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 4
            when 2
             slot = 22
            when 3
             slot = 40 
            when 4
             slot = 58     
            end
           Etc::Gem.check_stats(slot)
           else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 1330 && x <= 1485) && (y >= 310 && y <= 460) #--slot six
        Gem_Info_Box.position = SF.vector2(1265, 460) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 5
            when 2
             slot = 23
            when 3
             slot = 41  
            when 4
             slot = 59    
            end
           Etc::Gem.check_stats(slot)
           else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 555 && x <= 710) && (y >= 460 && y <= 610) #--slot seven
        Gem_Info_Box.position = SF.vector2(500, 610) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 6
            when 2
             slot = 24
            when 3
             slot = 42 
            when 4
             slot = 60     
            end
           Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 710 && x <= 865) && (y >= 460 && y <= 610) #--slot eight
        Gem_Info_Box.position = SF.vector2(655, 610) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 7
            when 2
             slot = 25
            when 3
             slot = 43  
            when 4
             slot = 61 
            end
           Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 865 && x <= 1020) && (y >= 460 && y <= 610) #--slot nine
        Gem_Info_Box.position = SF.vector2(800, 610) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 8
            when 2
              slot = 26
            when 3
              slot = 44 
            when 4
              slot = 62  
            end
           Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 1020 && x <= 1175) && (y >= 460 && y <= 610) #--slot ten
        Gem_Info_Box.position = SF.vector2(945, 610) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 9
            when 2
              slot = 27
            when 3
              slot = 45  
            when 4
              slot = 63 
            end
           Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 1175 && x <= 1330) && (y >= 460 && y <= 610) #--slot eleven
        Gem_Info_Box.position = SF.vector2(1100, 610) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
          @@info_box = "gem"
          slot = 0
          case @@page
           when 1
            slot = 10
           when 2
            slot = 28
           when 3
            slot = 46  
           when 4
            slot = 64 
           end
          Etc::Gem.check_stats(slot)
          else if @@info_box == "gem"
          @@info_box = "none"
          end; end; end
       if (x >= 1330 && x <= 1485) && (y >= 460 && y <= 610) #--slot twelve
        Gem_Info_Box.position = SF.vector2(1265, 610) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 11
            when 2
             slot = 29
            when 3
             slot = 47 
            when 4
             slot = 65  
            end
           Etc::Gem.check_stats(slot)
           else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 555 && x <= 710) && (y >= 610 && y <= 760) #--slot thirteen
        Gem_Info_Box.position = SF.vector2(500, 760) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 12
            when 2
             slot = 30
            when 3
             slot = 48  
            when 4
             slot = 66 
            end
           Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 710 && x <= 865) && (y >= 610 && y <= 760) #--slot fourteen
        Gem_Info_Box.position = SF.vector2(655, 760) 
        Gem_Info_Text.position = Gem_Info_Box.position 
         if @@info_box != "gem"
           @@info_box = "gem"
           slot = 0
           case @@page
            when 1
             slot = 13
            when 2
              slot = 31
            when 3
              slot = 49  
            when 4
              slot = 67 
            end
           Etc::Gem.check_stats(slot)
         else if @@info_box == "gem"
           @@info_box = "none"
           end; end; end
       if (x >= 865 && x <= 1020) && (y >= 610 && y <= 760) #--slot fifteen
         Gem_Info_Box.position = SF.vector2(800, 760) 
         Gem_Info_Text.position = Gem_Info_Box.position 
          if @@info_box != "gem"
            @@info_box = "gem"
            slot = 0
            case @@page
             when 1
              slot = 14
             when 2
              slot = 32
             when 3
              slot = 50  
             when 4
              slot = 68 
             end
            Etc::Gem.check_stats(slot)
          else if @@info_box == "gem"
            @@info_box = "none"
            end; end; end
       if (x >= 1020 && x <= 1175) && (y >= 610 && y <= 760) #--slot sixteen
         Gem_Info_Box.position = SF.vector2(945, 760) 
         Gem_Info_Text.position = Gem_Info_Box.position 
          if @@info_box != "gem"
            @@info_box = "gem"
            slot = 0
            case @@page
             when 1
              slot = 15
             when 2
              slot = 33
             when 3
              slot = 51  
             when 4
              slot = 69
             end
            Etc::Gem.check_stats(slot)
          else if @@info_box == "gem"
            @@info_box = "none"
            end; end; end
       if (x >= 1175 && x <= 1330) && (y >= 610 && y <= 760) #--slot seventeen
         Gem_Info_Box.position = SF.vector2(1100, 760) 
         Gem_Info_Text.position = Gem_Info_Box.position 
          if @@info_box != "gem"
            @@info_box = "gem"
            slot = 0
            case @@page
             when 1
              slot = 16
             when 2
              slot = 34
             when 3
              slot = 52  
             when 4
              slot = 70 
             end
            Etc::Gem.check_stats(slot)
          else if @@info_box == "gem"
            @@info_box = "none"
            end; end; end
       if (x >= 1330 && x <= 1485) && (y >= 610 && y <= 760) #--slot eighteen
         Gem_Info_Box.position = SF.vector2(1265, 760) 
         Gem_Info_Text.position = Gem_Info_Box.position 
          if @@info_box != "gem"
            @@info_box = "gem"
            slot = 0
            case @@page
             when 1
              slot = 17
             when 2
              slot = 35
             when 3
              slot = 53 
             when 4
              slot = 71  
             end
            Etc::Gem.check_stats(slot)
          else if @@info_box == "gem"
            @@info_box = "none"
            end; end; end
       end
    when "Equipment" #----------------------------Weapon info boxes
     #---------------------Slot 1------------------------------
      if (x >= 555 && x <= 710) && (y >= 310 && y <= 460)
        Weapon_Info_Box.position = SF.vector2(475, 460) 
        Weapon_Info_Text.position = Weapon_Info_Box.position 
       if @@info_box != "equipment"
        @@info_box = "equipment"
        slot = 0
        Crafted_Items::Weapon.check_stats(slot)
       else if @@info_box == "equipment"
        @@info_box = "none"
       end; end; end
     #---------------------Slot 2------------------------------
      if (x >= 710 && x <= 855) && (y >= 310 && y <= 460)
        Weapon_Info_Box.position = SF.vector2(630, 460) 
        Weapon_Info_Text.position = Weapon_Info_Box.position 
       if @@info_box != "equipment"
        @@info_box = "equipment"
        slot = 1
        Crafted_Items::Weapon.check_stats(slot)
       else if @@info_box == "equipment"
        @@info_box = "none"
       end; end; end
     #---------------------Slot 3------------------------------
      if (x >= 855 && x <= 1005) && (y >= 310 && y <= 460)
        Weapon_Info_Box.position = SF.vector2(780, 460) 
        Weapon_Info_Text.position = Weapon_Info_Box.position 
       if @@info_box != "equipment"
        @@info_box = "equipment"
        slot = 2
        Crafted_Items::Weapon.check_stats(slot)
       else if @@info_box == "equipment"
        @@info_box = "none"
       end; end; end
     #---------------------Slot 4------------------------------
      if (x >= 1005 && x <= 1155) && (y >= 310 && y <= 460)
       Weapon_Info_Box.position = SF.vector2(930, 460) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 3
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 5------------------------------
      if (x >= 1155 && x <= 1310) && (y >= 310 && y <= 460)
       Weapon_Info_Box.position = SF.vector2(1070, 460) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 4
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 6------------------------------
      if (x >= 1310 && x <= 1420) && (y >= 310 && y <= 460)
       Weapon_Info_Box.position = SF.vector2(1225, 460) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 5
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 7------------------------------
      if (x >= 555 && x <= 710) && (y >= 460 && y <= 610)
       Weapon_Info_Box.position = SF.vector2(475, 610) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 6
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 8------------------------------
      if (x >= 710 && x <= 855) && (y >= 460 && y <= 610)
       Weapon_Info_Box.position = SF.vector2(630, 610) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 7
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 9------------------------------
      if (x >= 855 && x <= 1005) && (y >= 460 && y <= 610)
       Weapon_Info_Box.position = SF.vector2(780, 610) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 8
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 10------------------------------
      if (x >= 1005 && x <= 1155) && (y >= 460 && y <= 610)
       Weapon_Info_Box.position = SF.vector2(930, 610) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 9
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 11------------------------------
      if (x >= 1155 && x <= 1310) && (y >= 460 && y <= 610)
       Weapon_Info_Box.position = SF.vector2(1070, 610) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 10
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 12------------------------------
      if (x >= 1310 && x <= 1420) && (y >= 460 && y <= 610)
       Weapon_Info_Box.position = SF.vector2(1225, 610) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 11
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 13------------------------------
      if (x >= 555 && x <= 710) && (y >= 610 && y <= 760)
       Weapon_Info_Box.position = SF.vector2(475, 760) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 12
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 14------------------------------
      if (x >= 710 && x <= 855) && (y >= 610 && y <= 760)
       Weapon_Info_Box.position = SF.vector2(630, 760) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 13
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 15------------------------------
      if (x >= 855 && x <= 1005) && (y >= 610 && y <= 760)
       Weapon_Info_Box.position = SF.vector2(780, 760) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 14
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 16------------------------------
      if (x >= 1005 && x <= 1155) && (y >= 610 && y <= 760)
       Weapon_Info_Box.position = SF.vector2(930, 760) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 14
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 17------------------------------
      if (x >= 1155 && x <= 1310) && (y >= 610 && y <= 760)
       Weapon_Info_Box.position = SF.vector2(1070, 760) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 14
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
     #---------------------Slot 18------------------------------
      if (x >= 1310 && x <= 1420) && (y >= 610 && y <= 760)
       Weapon_Info_Box.position = SF.vector2(1225, 760) 
       Weapon_Info_Text.position = Weapon_Info_Box.position 
      if @@info_box != "equipment"
       @@info_box = "equipment"
       slot = 14
       Crafted_Items::Weapon.check_stats(slot)
      else if @@info_box == "equipment"
       @@info_box = "none"
      end; end; end
    end
    end
    if SF::Mouse.button_pressed?(SF::Mouse::Left)
      mouse_position = SF::Mouse.position
      x = mouse_position.x
      y = mouse_position.y
      puts "x", x
      puts "y", y
     case @@popup
      when "Inventory" #--------------------------------------------------------Inventory clicks
        if (x >= 400 && x <= 450) && (y >= 400 && y <= 490) #----page down
          if @@page > 1
            @@page -= 1
          All_Audio::SFX.select1
          else
            All_Audio::SFX.char_create_down
          end
         end
        if (x >= 400 && x <= 450) && (y >= 550 && y <= 640) #----page up
        case @@tab
         when "Etc"
           if @@page < 6
             @@page += 1
           All_Audio::SFX.select1
           else
             All_Audio::SFX.char_create_down
           end
         when "Use"
           if @@page < 6
             @@page += 1
           All_Audio::SFX.select1
           else
             All_Audio::SFX.char_create_down
           end
         when "Equipment"
          if @@page < 3
            @@page += 1
          All_Audio::SFX.select1
          else
            All_Audio::SFX.char_create_down
         end; end; end
        if (x >= 800 && x <= 1000) && (y >= 160 && y <= 230)
          All_Audio::SFX.select1
          Window_Class.weapon_tab(window)
          @@tab = "Equipment"; @@page = 1
         end
        if (x >= 1010 && x <= 1210) && (y >= 160 && y <= 230)
          All_Audio::SFX.select1
          Window_Class.use_tab(window)
          @@tab = "Use"; @@page = 1
         end
        if (x >= 1220 && x <= 1420) && (y >= 160 && y <= 230)
          All_Audio::SFX.select1
          Window_Class.etc_tab(window)
          @@tab = "Etc"; @@page = 1
         end
      case @@tab
      when "Equipment"
        if (x >= 555 && x <= 710) && (y >= 310 && y <= 460)
          All_Audio::SFX.light_bonk
          this = 0
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
          puts @@current_weapon
         end
        if (x >= 710 && x <= 855) && (y >= 310 && y <= 460)
          All_Audio::SFX.light_bonk
          this = 1
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
          puts @@current_weapon
         end
        if (x >= 855 && x <= 1005) && (y >= 310 && y <= 460)
          All_Audio::SFX.light_bonk
          this = 2
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
          puts @@current_weapon
         end
        if (x >= 1005 && x <= 1155) && (y >= 310 && y <= 460)
          All_Audio::SFX.light_bonk
          this = 3
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
          puts @@current_weapon
         end
        if (x >= 1155 && x <= 1305) && (y >= 310 && y <= 460)
          All_Audio::SFX.light_bonk
          this = 4
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
         end
         if (x >= 1305 && x <= 1455) && (y >= 310 && y <= 460)
          All_Audio::SFX.light_bonk
          this = 5
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
         end
        if (x >= 555 && x <= 710) && (y >= 460 && y <= 610)
          All_Audio::SFX.light_bonk
          this = 6
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
         end
        if (x >= 710 && x <= 855) && (y >= 460 && y <= 610)
          All_Audio::SFX.light_bonk
          this = 7
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
          end
         if (x >= 855 && x <= 1005) && (y >= 460 && y <= 610)
          All_Audio::SFX.light_bonk
          this = 8
          Crafted_Items::Weapon.equip_weapon(this)
          this2 = @@current_weapon
          Gui::Window_Class.equip_weapon(this2)
          end
      when "Use"
       if (x >= 555 && x <= 680) && (y >= 245 && y <= 295)
        All_Audio::SFX.light_bonk
        Use::Ingredients.initialize_inventory
        @@page = 1
        @@category = "Ingredients"
       end
      when "Etc"
        if (x >= 555 && x <= 645) && (y >= 245 && y <= 295)
          All_Audio::SFX.light_bonk
          @@page = 1
          @@category = "ore"
         end
        if (x >= 655 && x <= 745) && (y >= 245 && y <= 295)
          All_Audio::SFX.light_bonk
          Etc::Inventory_Ingot.initialize_inventory
          @@page = 1
          @@category = "ingot"
         end
        if (x >= 755 && x <= 845) && (y >= 245 && y <= 295)
          All_Audio::SFX.light_bonk
          Etc::Gem.initialize_gem_inventory
          @@page = 1
          @@category = "gem"
         end
      end
      when "Salon" #-------------------------------------------------------------Salon clicks   
        if (x >= 750 && x <= 900) && (y >= 530 && y <= 600) && @@tab == "salon_confirm" #yes
          All_Audio::SFX.select_2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
          @@popup = "none"
          @@tab = "none"
          Player_Data::Player_Physics.mobilize_player
          NPCS::Test_Npcs.nullify_npc_scene
          Player_Data::Player_Physics.nullify_quest
         end
        if (x >= 1020 && x <= 1170) && (y >= 530 && y <= 600) && @@tab == "salon_confirm" #no
          All_Audio::SFX.select_2
          NPCS::Test_Npcs.revert_hair(window)
          @@tab = "none"
         end
        if (x >= 1320 && x <= 1370) && (y >= 200 && y <= 250) && @@tab != "salon_confirm" #exit salon
          @@popup = "none"
          @@tab = "none"
          Player_Data::Player_Physics.mobilize_player
          NPCS::Test_Npcs.nullify_npc_scene
          Player_Data::Player_Physics.nullify_quest
          NPCS::Test_Npcs.revert_hair(window)
         end
        if (x >= 745 && x <= 845) && (y >= 350 && y <= 400) && @@tab != "salon_confirm" #confirm button
          @@tab = "salon_confirm"
         end
        if (x >= 640 && x <= 760) && (y >= 420 && y <= 540) && @@tab != "salon_confirm" #hair 0
          @@hair_choice = 0
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 790 && x <= 910) && (y >= 420 && y <= 540) && @@tab != "salon_confirm" #hair 1
          @@hair_choice = 1
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 940 && x <= 1060) && (y >= 420 && y <= 540) && @@tab != "salon_confirm" #hair 2
          @@hair_choice = 2
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 1090 && x <= 1200) && (y >= 420 && y <= 540) && @@tab != "salon_confirm" #hair 3
          @@hair_choice = 3
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 1240 && x <= 1330) && (y >= 420 && y <= 540) && @@tab != "salon_confirm" #hair 4
          @@hair_choice = 4
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 640 && x <= 760) && (y >= 570 && y <= 720) && @@tab != "salon_confirm" #hair 5
          @@hair_choice = 5
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 790 && x <= 910) && (y >= 570 && y <= 720) && @@tab != "salon_confirm" #hair 6
          @@hair_choice = 6
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 940 && x <= 1060) && (y >= 570 && y <= 720) && @@tab != "salon_confirm" #hair 7
          @@hair_choice = 7
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 1090 && x <= 1200) && (y >= 570 && y <= 720) && @@tab != "salon_confirm" #hair 8
          @@hair_choice = 8
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
        if (x >= 1240 && x <= 1330) && (y >= 570 && y <= 720) && @@tab != "salon_confirm" #hair 9
          @@hair_choice = 9
          All_Audio::SFX.cursor2
          hair_slot = @@hair_choice
          Player_Data::Clothing_Outfit_Slot.change_hair(hair_slot, window)
         end
      when "none"  #--------------------------------------------------------------none clicks
        if (x >= 1730 && x <= 1880) && (y >= 930 && y <= 990)
           All_Audio::SFX.char_create_down; @@popup = "System_Popup_Menu"
          end
      when "System_Popup_Menu" #-------------------------------------------------System clicks
          if (x >= 1730 && x <= 1880) && (y >= 930 && y <= 990)
           @@popup = "none"
           end
          if (x >= 1730 && x <= 1880) && (y >= 900 && y <= 940)
            All_Audio::SFX.char_create_sideways
            @@popup = "Quit_Menu"
           end
          if (x >= 1730 && x <= 1850) && (y >= 870 && y <= 900)
            player = SF::Sprite.new(@@player_character_rendered_model)
            player.position = SF.vector2(790, 200)
            player.scale = SF.vector2(1.5, 1.5)
            window.draw(player)
            @@popup = "Stats_Menu"
            Clothing::Shirt.gather_owned(window)
            @@tab = "shirt"
            Player_Data::Clothing_Wardrobe_Slot.pull_arrays
           end
          if (x >= 1700 && x <= 1850) && (y >= 810 && y <= 860)
            All_Audio::SFX.select1
            puts "system"
           end
      when "Quit_Menu" #----------------------------------------------------------Quit Menu
        if (x >= 710 && x <= 880) && (y >= 490 && y <= 590)
            window.close
           end
        if (x >= 1020 && x <= 1190) && (y >= 490 && y <= 590)
          @@popup = "none"
           end
      when "smelter"  #---------------------------------------------------------Smelter Menu
        if (x >= 1280 && x <= 1330) && (y >= 140 && y <= 200)
          Harvestables::Ore.stop_smelt
          Etc::Inventory_Ore.initialize_smelter
          @@popup = "none"     
          Player_Data::Player_Physics.mobilize_player
         end
        if (x >= 760 && x <= 950) && (y >= 625 && y <= 690)
          All_Audio::SFX.select1
          Etc::Inventory_Ore.initialize_smelter
        end
        if (x >= 970 && x <= 1160) && (y >= 625 && y <= 690)
          All_Audio::SFX.smelter_01 #All_Audio::SFX.select1
          Etc::Inventory_Ore.smelt
          sleep 1.seconds
        end
        if (x >= 585 && x <= 635) && (y >= 140 && y <= 200)
          All_Audio::SFX.dig_02
          cubby_number = 0
          Etc::Inventory_Ore.select_ore_one(window, cubby_number)
         end
        if (x >= 635 && x <= 685) && (y >= 140 && y <= 200)
          All_Audio::SFX.dig_02
          cubby_number = 1
          Etc::Inventory_Ore.select_ore_one(window, cubby_number)
         end
         if (x >= 685 && x <= 735) && (y >= 140 && y <= 200)
          All_Audio::SFX.dig_02
          cubby_number = 2
          Etc::Inventory_Ore.select_ore_one(window, cubby_number)
         end
         if (x >= 735 && x <= 785) && (y >= 140 && y <= 200)
          All_Audio::SFX.dig_02
          cubby_number = 3
          Etc::Inventory_Ore.select_ore_one(window, cubby_number)
         end
         if (x >= 785 && x <= 835) && (y >= 140 && y <= 200)
          All_Audio::SFX.dig_02
          cubby_number = 4
          Etc::Inventory_Ore.select_ore_one(window, cubby_number)
         end
      when "forge" #--------------------------------------------------------------Forge Menu
        if (x >= 400 && x <= 560) && (y >= 555 && y <= 630) #clear
          All_Audio::SFX.light_bonk
        end
        if (x >= 805 && x <= 960) && (y >= 555 && y <= 630) #forge
          All_Audio::SFX.forge_01
          Crafted_Items::Forge.forge_weapon
          sleep 1.seconds
        end
        if (x >= 1010 && x <= 1120) && (y >= 160 && y <= 230) #molds
          if @@tab != "mold"
          All_Audio::SFX.light_bonk
          @@tab = "mold"
          sleep 1.seconds
        else if @@tab == "mold"
            All_Audio::SFX.light_bonk
            @@tab = "none"
            sleep 1.seconds
            end; end
        end
        if (x >= 1010 && x <= 1120) && (y >= 230 && y <= 300) #stick mold
          All_Audio::SFX.light_bonk
          mold = 1
          Crafted_Items::Forge.choose_mold(mold)
        end
        if (x >= 1125 && x <= 1150) && (y >= 110 && y <= 140) #exit
          @@popup = "none"
          Player_Data::Player_Physics.mobilize_player
        end
       #........................slot 1.............................
        if (x >= 405 && x <= 455) && (y >= 160 && y <= 230)
          slot = 0
          Etc::Inventory_Ingot.select_forge_ingot(slot)
         end
       #........................slot 2.............................
       if (x >= 455 && x <= 505) && (y >= 160 && y <= 230)
         slot = 1
         Etc::Inventory_Ingot.select_forge_ingot(slot)
        end
       #........................slot 3.............................
       if (x >= 505 && x <= 555) && (y >= 160 && y <= 230)
         slot = 2
         Etc::Inventory_Ingot.select_forge_ingot(slot)
        end
       #........................slot 4.............................
       if (x >= 555 && x <= 605) && (y >= 160 && y <= 230)
         slot = 3
         Etc::Inventory_Ingot.select_forge_ingot(slot)
        end
       #........................slot 5.............................
       if (x >= 605 && x <= 655) && (y >= 160 && y <= 230)
         slot = 4
         Etc::Inventory_Ingot.select_forge_ingot(slot)
        end
       #........................slot 6.............................
       if (x >= 405 && x <= 455) && (y >= 230 && y <= 300)
         slot = 5
         Etc::Inventory_Ingot.select_forge_ingot(slot)
        end
       #........................slot 7.............................
       if (x >= 455 && x <= 505) && (y >= 230 && y <= 300)
         slot = 6
         Etc::Inventory_Ingot.select_forge_ingot(slot)
        end
      when "gem_cutter" #---------------------------------------------------------gem cutter
        if (x >= 1320 && x <= 1350) && (y >= 120 && y <= 155) #--------exit
          @@popup = "none"
          @@tab = "none"
          @@page = 1
          Etc::Gem.initialize_gem_cutter
          Player_Data::Player_Physics.mobilize_player
         end
        if (x >= 1210 && x <= 1320) && (y >= 160 && y <= 230) #--------cuts
          All_Audio::SFX.light_bonk
          if @@tab == "none"
            @@tab = "cuts"
          else
            @@tab = "none"
          end
         end
       if (x >= 600 && x <= 760) && (y >= 550 && y <= 625) #--------clear
          All_Audio::SFX.light_bonk
          Etc::Gem.initialize_gem_cutter
         end
        if (x >= 460 && x <= 510) && (y >= 160 && y <= 280) #--------page up
          if @@page > 1
           @@page -= 1
          else
           All_Audio::SFX.light_bonk
          end
         end
        if (x >= 460 && x <= 510) && (y >= 280 && y <= 370) #-------page down
           if @@page < 2
            @@page += 1
           else
            All_Audio::SFX.light_bonk
           end
          end
       #---------------------------------------------------------
       #-                      Select Cut                       -
       #---------------------------------------------------------
        if (x >= 1215 && x <= 1315) && (y >= 240 && y <= 300) && @@tab == "cuts"
         cut = 0
         Etc::Gem.select_cutter_cut(cut)
         end
        if (x >= 1215 && x <= 1315) && (y >= 300 && y <= 360) && @@tab == "cuts"
         cut = 1
         Etc::Gem.select_cutter_cut(cut)
         end
        if (x >= 1215 && x <= 1315) && (y >= 360 && y <= 420) && @@tab == "cuts"
         cut = 2
         Etc::Gem.select_cutter_cut(cut)
         end
        if (x >= 1215 && x <= 1315) && (y >= 420 && y <= 480) && @@tab == "cuts"
         cut = 3
         Etc::Gem.select_cutter_cut(cut)
         end
        if (x >= 1215 && x <= 1315) && (y >= 480 && y <= 540) && @@tab == "cuts"
         cut = 4
         Etc::Gem.select_cutter_cut(cut)
         end
       #---------------------------------------------------------
       #-                         Cut!                          -
       #---------------------------------------------------------
        if (x >= 1010 && x <= 1165) && (y >= 550 && y <= 630)
          Etc::Gem.cut_gem
          sleep 0.25.seconds
          @@player_character_rendered_model.position = SF.vector2(800, 75)
         end
       #---------------------------------------------------------
       #-                 Select Crafting Gem                   -
       #---------------------------------------------------------
        #.....................Cubby One..........................
           if (x >= 605 && x <= 655) && (y >= 160 && y <= 230)
             case @@page
             when 1           
               gem = 0
               Etc::Gem.select_cutter_gem(gem)
             when 2           
               gem = 44
               Etc::Gem.select_cutter_gem(gem)
             end
            end
        #.....................Cubby Two..........................
           if (x >= 655 && x <= 705) && (y >= 160 && y <= 230)
             case @@page
             when 1           
               gem = 1
               Etc::Gem.select_cutter_gem(gem)
             when 2           
               gem = 45
               Etc::Gem.select_cutter_gem(gem)
             end
            end
        #....................Cubby Three.........................
           if (x >= 705 && x <= 755) && (y >= 160 && y <= 230)
             case @@page
             when 1           
               gem = 2
               Etc::Gem.select_cutter_gem(gem)
             when 2           
               gem = 46
               Etc::Gem.select_cutter_gem(gem)
             end
            end
        #....................Cubby Four..........................
           if (x >= 755 && x <= 805) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 3
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 47
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #....................Cubby Five..........................
           if (x >= 805 && x <= 855) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 4
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 48
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #.....................Cubby Six..........................
           if (x >= 855 && x <= 905) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 5
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 49
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #....................Cubby Seven.........................
           if (x >= 905 && x <= 955) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 6
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 50
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #....................Cubby Eight.........................
           if (x >= 955 && x <= 1005) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 7
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 51
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #....................Cubby Nine..........................
           if (x >= 1005 && x <= 1055) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 8
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 52
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #.....................Cubby Ten..........................
           if (x >= 1055 && x <= 1105) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 9
              Etc::Gem.select_cutter_gem(gem)
             when 2           
               gem = 53
               Etc::Gem.select_cutter_gem(gem)
            end
           end
        #....................Cubby Eleven........................
           if (x >= 1105 && x <= 1155) && (y >= 160 && y <= 230)
            case @@page
            when 1           
              gem = 10
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 54
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #....................Cubby Twelve........................
           if (x >= 605 && x <= 655) && (y >= 230 && y <= 290)
             case @@page
             when 1           
               gem = 11
               Etc::Gem.select_cutter_gem(gem)
             when 2           
               gem = 55
               Etc::Gem.select_cutter_gem(gem)
             end
            end
        #...................Cubby Thirteen.......................
           if (x >= 655 && x <= 705) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 12
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 56
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...................Cubby Fourteen.......................
           if (x >= 705 && x <= 755) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 13
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 57
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...................Cubby Fifteen........................
           if (x >= 755 && x <= 805) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 14
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 58
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...................Cubby Sixteen........................
           if (x >= 805 && x <= 855) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 15
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 59
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #..................Cubby Seventeen.......................
           if (x >= 855 && x <= 905) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 16
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 60
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #..................Cubby Eighteen........................
           if (x >= 905 && x <= 955) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 17
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 61
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #..................Cubby Nineteen........................
           if (x >= 955 && x <= 1005) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 18
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 62
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...................Cubby Twenty.........................
           if (x >= 1005 && x <= 1055) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 19
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 63
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #.................Cubby Twenty-One.......................
           if (x >= 1055 && x <= 1105) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 20
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 64
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #.................Cubby Twenty-Two.......................
           if (x >= 1105 && x <= 1155) && (y >= 230 && y <= 290)
            case @@page
            when 1           
              gem = 21
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 65
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Twenty-Three......................
           if (x >= 605 && x <= 655) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 22
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 66
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Twenty-Four.......................
           if (x >= 655 && x <= 705) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 23
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 67
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Twenty-Five.......................
           if (x >= 705 && x <= 755) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 24
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 68
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Twenty-Six........................
           if (x >= 755 && x <= 805) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 25
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 69
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...............Cubby Twenty-Seven.......................
           if (x >= 805 && x <= 855) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 26
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 70
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...............Cubby Twenty-Eight.......................
           if (x >= 855 && x <= 905) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 27
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 71
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #...............Cubby Twenty-Nine........................
           if (x >= 905 && x <= 955) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 28
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 72
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #.................Cubby Thirty...........................
           if (x >= 955 && x <= 1005) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 29
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 73
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-One........................
           if (x >= 1005 && x <= 1055) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 30
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 74
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Two........................
           if (x >= 1055 && x <= 1105) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 31
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 75
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Three........................
           if (x >= 1105 && x <= 1155) && (y >= 290 && y <= 360)
            case @@page
            when 1           
              gem = 32
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 76
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Four......................
           if (x >= 605 && x <= 655) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 33
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 77
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Five......................
           if (x >= 655 && x <= 705) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 34
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 78
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Six......................
           if (x >= 705 && x <= 755) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 35
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 79
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Seven......................
           if (x >= 755 && x <= 805) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 36
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 80
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Eight......................
           if (x >= 805 && x <= 855) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 37
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 81
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Thirty-Nine......................
           if (x >= 855 && x <= 905) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 38
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 82
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Forty......................
           if (x >= 905 && x <= 955) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 39
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 83
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Forty-One......................
           if (x >= 955 && x <= 1005) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 40
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 84
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Forty-Two......................
           if (x >= 1005 && x <= 1055) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 41
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 85
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Forty-Three......................
           if (x >= 1055 && x <= 1105) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 42
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 86
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #................Cubby Forty-Four......................
           if (x >= 1105 && x <= 1155) && (y >= 360 && y <= 430)
            case @@page
            when 1           
              gem = 43
              Etc::Gem.select_cutter_gem(gem)
            when 2           
              gem = 87
              Etc::Gem.select_cutter_gem(gem)
            end
           end
        #_______________________________________________________
      when "upgrade_table" #---------------------------------------------------------upgrade table
       if (x >= 1120 && x <= 1145) && (y >= 125 && y <= 150) #--------exit
         @@popup = "none"
         @@tab = "none"
         @@page = 1; @@page_02 = 1; @@page_03 = 1
         Player_Data::Player_Physics.mobilize_player
         Crafted_Items::Upgrade_Table.initialize_upgrade_table
        end
       if (x >= 430 && x <= 580) && (y >= 620 && y <= 690) #--------clear
         Crafted_Items::Upgrade_Table.initialize_upgrade_table
        end
       if (x >= 430 && x <= 580) && (y >= 485 && y <= 560) #--------upgrade
         Crafted_Items::Upgrade_Table.upgrade
        end
        if (x >= 280 && x <= 330) && (y >= 165 && y <= 260) #--------up arrow 1
          if @@page > 1
            All_Audio::SFX.light_bonk
          @@page -= 1
          else
            All_Audio::SFX.char_create_up
          end
         end
        if (x >= 280 && x <= 330) && (y >= 330 && y <= 425) #--------down arrow 1
          if @@page < 4
            All_Audio::SFX.light_bonk
          @@page += 1
          else
            All_Audio::SFX.char_create_up
          end
         end
        if (x >= 1190 && x <= 1240) && (y >= 165 && y <= 260) #--------up arrow 2
         if @@page_02 > 1
           All_Audio::SFX.light_bonk
         @@page_02 -= 1
         else
           All_Audio::SFX.char_create_up
         end
         end
        if (x >= 1190 && x <= 1240) && (y >= 330 && y <= 425) #--------down arrow 2
          if @@page_02 < 4
            All_Audio::SFX.light_bonk
          @@page_02 += 1
          else
            All_Audio::SFX.char_create_up
          end
          end
      #--------------------Select Weapon----------------------
        if (x >= 405 && x <= 455) && (y >= 160 && y <= 230)#------select weapon
          weapon = 0
         case @@page
          when 1
           weapon = 0
          when 2
           weapon = 16
          when 3
           weapon = 32
          when 4
           weapon = 48
           end
           Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 455 && x <= 505) && (y >= 160 && y <= 230)
          weapon = 0
          case @@page
           when 1
            weapon = 1
          when 2
            weapon = 17
          when 3
            weapon = 33
          when 4
            weapon = 49
          end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 505 && x <= 555) && (y >= 160 && y <= 230)
          weapon = 0
          case @@page
           when 1
            weapon = 2
           when 2
            weapon = 18
           when 3
            weapon = 34
           when 4
            weapon = 50
          end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 555 && x <= 605) && (y >= 160 && y <= 230)
          weapon = 0
          case @@page
           when 1
            weapon = 3
           when 2
            weapon = 19
           when 3
            weapon = 35
           when 4
            weapon = 51
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 405 && x <= 455) && (y >= 230 && y <= 300)
          weapon = 0
          case @@page
           when 1
            weapon = 4
           when 2
             weapon = 20
           when 3
             weapon = 36
           when 4
             weapon = 52
          end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 455 && x <= 505) && (y >= 230 && y <= 300)
          weapon = 0
          case @@page
           when 1
            weapon = 5
           when 2
            weapon = 21
           when 3
            weapon = 37
           when 4
            weapon = 53
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 505 && x <= 555) && (y >= 230 && y <= 300)
          weapon = 0
          case @@page
           when 1
            weapon = 6
           when 2
            weapon = 22
           when 3
            weapon = 38
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 555 && x <= 605) && (y >= 230 && y <= 300)
          weapon = 0
          case @@page
           when 1
            weapon = 7
           when 2
            weapon = 23
           when 3
            weapon = 39
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 405 && x <= 455) && (y >= 300 && y <= 370)
          weapon = 0
          case @@page
           when 1
            weapon = 8
           when 2 
            weapon = 24
           when 3
            weapon = 40
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 455 && x <= 505) && (y >= 300 && y <= 370)
          weapon = 0
          case @@page
           when 1
            weapon = 9
           when 2
            weapon = 25
           when 3
            weapon = 41
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 505 && x <= 555) && (y >= 300 && y <= 370)
          weapon = 0
          case @@page
           when 1
            weapon = 10
           when 2
            weapon = 26
           when 3
            weapon = 42
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 555 && x <= 605) && (y >= 300 && y <= 370)
          weapon = 0
          case @@page
           when 1
            weapon = 11
           when 2
            weapon = 27
           when 3
            weapon = 43
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 405 && x <= 455) && (y >= 370 && y <= 440)
          weapon = 0
          case @@page
           when 1
            weapon = 12
           when 2
            weapon = 28
           when 3
            weapon = 44
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 455 && x <= 505) && (y >= 370 && y <= 440)
          weapon = 0
          case @@page
           when 1
            weapon = 13
           when 2
            weapon = 29
           when 3
            weapon = 45
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 505 && x <= 555) && (y >= 370 && y <= 440)
          weapon = 0
          case @@page
           when 1
            weapon = 14
           when 2
            weapon = 30
           when 3
            weapon = 46
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
        if (x >= 555 && x <= 605) && (y >= 370 && y <= 440)
          weapon = 0
          case @@page
           when 1
            weapon = 15
           when 2
            weapon = 31
           when 3
            weapon = 47
           end
          Crafted_Items::Upgrade_Table.choose_upgrade_weapon(weapon)
         end
      #---------------------Select Gem------------------------
       if (x >= 910 && x <= 960) && (y >= 160 && y <= 230)#------select gem
         gem = 0
         case @@page_02
          when 1
           gem = 0
           Crafted_Items::Upgrade_Table.select_gem(gem)
          end
         end
       if (x >= 960 && x <= 1010) && (y >= 160 && y <= 230)#------select gem
        gem = 0
        case @@page_02
         when 1
          gem = 1
          Crafted_Items::Upgrade_Table.select_gem(gem)
         end
        end
       if (x >= 1010 && x <= 1060) && (y >= 160 && y <= 230)#------select gem
        gem = 0
        case @@page_02
         when 1
          gem = 2
          Crafted_Items::Upgrade_Table.select_gem(gem)
         end
        end
       if (x >= 1060 && x <= 1110) && (y >= 160 && y <= 230)#------select gem
         gem = 0
         case @@page_02
          when 1
           gem = 3
           Crafted_Items::Upgrade_Table.select_gem(gem)
          end
         end
      #_______________________________________________________
      when "Stats_Menu" #---------------------------------------------------------Stats Menu
        if (x >= 1280 && x <= 1330) && (y >= 210 && y <= 260)
          @@popup = "none"
          @@tab = "none"
          @@player_character_rendered_model.scale = SF.vector2(1.0, 1.0)
        end

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#|                                                 shirt tab @note shirt control tab                                                       |
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 

      if (x >= 713 && x <= 853) && (y >= 450 && y <= 485)
         All_Audio::SFX.select1
         @@tab = "shirt"
         Clothing::Shirt.gather_owned(window)
        end
      if (x >= 670 && x <= 690) && (y >= 550 && y <= 590)
        if @@page > 1
          @@page -= 1
        All_Audio::SFX.select1
        else
          All_Audio::SFX.char_create_down
        end
       end
      if (x >= 670 && x <= 690) && (y >= 650 && y <= 690)
        if @@page < 6
          @@page += 1
        All_Audio::SFX.select1
        else
          All_Audio::SFX.char_create_down
        end
       end
 #-------------------------------------------------------------row one---------------------------------------------------------------------
      if (x >= 710 && x <= 825) && (y >= 470 && y <= 590) && @@tab == "shirt"
       case @@page
        when 1
         this = 0
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 15
          Clothing::Shirt.determine_array_length(window, this)
        end; end
      if (x >= 830 && x <= 950) && (y >= 490 && y <= 590) && @@tab == "shirt"
       case @@page
        when 1
         this = 1
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 16
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 940 && x <= 1060) && (y >= 490 && y <= 590) && @@tab == "shirt"
       case @@page
        when 1
         this = 2
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 17
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 1030 && x <= 1180) && (y >= 490 && y <= 590) && @@tab == "shirt"
       case @@page
        when 1
         this = 3
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 18
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 1175 && x <= 1290) && (y >= 490 && y <= 590) && @@tab == "shirt"
       case @@page
        when 1
         this = 4
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 19
          Clothing::Shirt.determine_array_length(window, this)
       end; end
 #-------------------------------------------------------------row two---------------------------------------------------------------------
      if (x >= 710 && x <= 825) && (y >= 590 && y <= 690) && @@tab == "shirt"
       case @@page
        when 1
         this = 5
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 20
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 830 && x <= 950) && (y >= 590 && y <= 690) && @@tab == "shirt"
       case @@page
        when 1
         this = 6
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 21
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 940 && x <= 1060) && (y >= 590 && y <= 690) && @@tab == "shirt"
       case @@page
        when 1
         this = 7
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 22
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 1030 && x <= 1180) && (y >= 590 && y <= 690) && @@tab == "shirt"
       case @@page
        when 1
         this = 8
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 23
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 1175 && x <= 1290) && (y >= 590 && y <= 690) && @@tab == "shirt"
       case @@page
        when 1
         this = 9
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 24
          Clothing::Shirt.determine_array_length(window, this)
       end; end
 #------------------------------------------------------------row three---------------------------------------------------------------------
      if (x >= 710 && x <= 825) && (y >= 690 && y <= 790) && @@tab == "shirt"
       case @@page
         when 1
          this = 10
          Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 25
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 830 && x <= 950) && (y >= 690 && y <= 790) && @@tab == "shirt"
       case @@page
        when 1
         this = 11
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 26
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 940 && x <= 1060) && (y >= 690 && y <= 790) && @@tab == "shirt"
       case @@page
        when 1
         this = 12
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 27
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 1030 && x <= 1180) && (y >= 690 && y <= 790) && @@tab == "shirt"
       case @@page
        when 1
         this = 13
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 28
          Clothing::Shirt.determine_array_length(window, this)
       end; end
      if (x >= 1175 && x <= 1290) && (y >= 690 && y <= 790) && @@tab == "shirt"
       case @@page
        when 1
         this = 14
         Clothing::Shirt.determine_array_length(window, this)
        when 2
          this = 29
          Clothing::Shirt.determine_array_length(window, this)
       end; end; end
#___________________________________________________________________________________________________________________________________________
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#|                                                            gloves tab                                                                   |
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||        
      if (x >= 857 && x <= 993) && (y >= 450 && y <= 485) && @@popup == "Stats_Menu"
         All_Audio::SFX.select1
         @@tab = "gloves"
         Clothing::Gloves.gather_owned(window)
      end
 #-------------------------------------------------------------row one---------------------------------------------------------------------
      if (x >= 710 && x <= 825) && (y >= 470 && y <= 590) && @@tab == "gloves"
        this = 0
        Clothing::Gloves.determine_array_length(window, this)
       end
      if (x >= 830 && x <= 950) && (y >= 490 && y <= 590) && @@tab == "gloves"
        this = 1
        Clothing::Gloves.determine_array_length(window, this)
       end
       if (x >= 940 && x <= 1060) && (y >= 490 && y <= 590) && @@tab == "gloves"
         this = 2
         Clothing::Gloves.determine_array_length(window, this)
       end
      if (x >= 1050 && x <= 1180) && (y >= 490 && y <= 590) && @@tab == "gloves"
        this = 3
        Clothing::Gloves.determine_array_length(window, this)
       end
      if (x >= 1160 && x <= 1300) && (y >= 490 && y <= 590) && @@tab == "gloves"
        this = 4
        Clothing::Gloves.determine_array_length(window, this)
       end
 #-------------------------------------------------------------row two---------------------------------------------------------------------
      if (x >= 710 && x <= 825) && (y >= 590 && y <= 690) && @@tab == "gloves"
       this = 5
       Clothing::Gloves.determine_array_length(window, this)
      end
     if (x >= 830 && x <= 950) && (y >= 590 && y <= 690) && @@tab == "gloves"
       this = 6
       Clothing::Gloves.determine_array_length(window, this)
      end
      if (x >= 940 && x <= 1060) && (y >= 590 && y <= 690) && @@tab == "gloves"
        this = 7
        Clothing::Gloves.determine_array_length(window, this)
      end
     if (x >= 1050 && x <= 1180) && (y >= 590 && y <= 690) && @@tab == "gloves"
       this = 8
       Clothing::Gloves.determine_array_length(window, this)
      end
     if (x >= 1160 && x <= 1300) && (y >= 590 && y <= 690) && @@tab == "gloves"
       this = 9
       Clothing::Gloves.determine_array_length(window, this)
      end
#___________________________________________________________________________________________________________________________________________

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#|                                                             shoes tab                                                                   |
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
      if (x >= 1146 && x <= 1286) && (y >= 450 && y <= 485) && @@popup == "Stats_Menu"
         All_Audio::SFX.select1
         @@tab = "shoes"  
         Clothing::Shoes.gather_owned(window) #Shoes.select(window, @@player_character_model, selected_shoe)
      end
 #-------------------------------------------------------------row one---------------------------------------------------------------------
      if (x >= 710 && x <= 825) && (y >= 470 && y <= 590) && @@tab == "shoes"
        this = 0
        Clothing::Shoes.determine_array_length(window, this)
      end
      if (x >= 830 && x <= 950) && (y >= 490 && y <= 590) && @@tab == "shoes"
        this = 1
        Clothing::Shoes.determine_array_length(window, this)
      end
      if (x >= 940 && x <= 1060) && (y >= 490 && y <= 590) && @@tab == "shoes"
         this = 2
         Clothing::Shoes.determine_array_length(window, this)
      end
      if (x >= 1030 && x <= 1180) && (y >= 490 && y <= 590) && @@tab == "shoes"
        this = 3
        Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 1175 && x <= 1290) && (y >= 490 && y <= 590) && @@tab == "shoes"
      this = 4
      Clothing::Shoes.determine_array_length(window, this)
     end
 #-------------------------------------------------------------row two---------------------------------------------------------------------
     if (x >= 710 && x <= 825) && (y >= 590 && y <= 690) && @@tab == "shoes"
      this = 5
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 830 && x <= 950) && (y >= 590 && y <= 690) && @@tab == "shoes"
      this = 6
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 940 && x <= 1060) && (y >= 590 && y <= 690) && @@tab == "shoes"
      this = 7
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 1030 && x <= 1180) && (y >= 590 && y <= 690) && @@tab == "shoes"
      this = 8
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 1175 && x <= 1290) && (y >= 590 && y <= 690) && @@tab == "shoes"
      this = 9
      Clothing::Shoes.determine_array_length(window, this)
     end
 #------------------------------------------------------------row three--------------------------------------------------------------------
     if (x >= 710 && x <= 825) && (y >= 690 && y <= 790) && @@tab == "shoes"
      this = 10
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 830 && x <= 950) && (y >= 690 && y <= 790) && @@tab == "shoes"
      this = 11
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 940 && x <= 1060) && (y >= 690 && y <= 790) && @@tab == "shoes"
      this = 12
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 1030 && x <= 1180) && (y >= 690 && y <= 790) && @@tab == "shoes"
      this = 12
      Clothing::Shoes.determine_array_length(window, this)
     end
     if (x >= 1175 && x <= 1290) && (y >= 690 && y <= 790) && @@tab == "shoes"
      this = 12
      Clothing::Shoes.determine_array_length(window, this)
     end
#___________________________________________________________________________________________________________________________________________
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#|                                                       @note pants control tab                                                           |
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 
 if (x >= 1001 && x <= 1141) && (y >= 450 && y <= 485) && @@popup == "Stats_Menu"
   All_Audio::SFX.select1
   @@tab = "pants"
   Clothing::Pants.gather_owned(window)
  end
 #-------------------------------------------------------------row one---------------------------------------------------------------------
  if (x >= 710 && x <= 825) && (y >= 470 && y <= 590) && @@tab == "pants"
   case @@page
    when 1
     this = 0
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 15
      Clothing::Pants.determine_array_length(window, this)
    end; end
  if (x >= 830 && x <= 950) && (y >= 490 && y <= 590) && @@tab == "pants"
   case @@page
    when 1
     this = 1
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 16
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 940 && x <= 1060) && (y >= 490 && y <= 590) && @@tab == "pants"
   case @@page
    when 1
     this = 2
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 17
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 1030 && x <= 1180) && (y >= 490 && y <= 590) && @@tab == "pants"
   case @@page
    when 1
     this = 3
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 18
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 1175 && x <= 1290) && (y >= 490 && y <= 590) && @@tab == "pants"
   case @@page
    when 1
     this = 4
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 19
      Clothing::Pants.determine_array_length(window, this)
   end; end
 #-------------------------------------------------------------row two---------------------------------------------------------------------
  if (x >= 710 && x <= 825) && (y >= 590 && y <= 690) && @@tab == "pants"
   case @@page
    when 1
     this = 5
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 20
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 830 && x <= 950) && (y >= 590 && y <= 690) && @@tab == "pants"
   case @@page
    when 1
     this = 6
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 21
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 940 && x <= 1060) && (y >= 590 && y <= 690) && @@tab == "pants"
   case @@page
    when 1
     this = 7
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 22
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 1030 && x <= 1180) && (y >= 590 && y <= 690) && @@tab == "pants"
   case @@page
    when 1
     this = 8
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 23
      Clothing::Pants.determine_array_length(window, this)
   end; end
  if (x >= 1175 && x <= 1290) && (y >= 590 && y <= 690) && @@tab == "pants"
   case @@page
    when 1
     this = 9
     Clothing::Pants.determine_array_length(window, this)
    when 2
      this = 24
      Clothing::Pants.determine_array_length(window, this)
   end; end
 #------------------------------------------------------------row three--------------------------------------------------------------------
 if (x >= 710 && x <= 825) && (y >= 690 && y <= 790) && @@tab == "pants"
  case @@page
    when 1
     this = 10
     Clothing::Pants.determine_array_length(window, this)
   when 2
     this = 25
     Clothing::Pants.determine_array_length(window, this)
  end; end
 if (x >= 830 && x <= 950) && (y >= 690 && y <= 790) && @@tab == "pants"
  case @@page
   when 1
    this = 11
    Clothing::Pants.determine_array_length(window, this)
   when 2
     this = 26
     Clothing::Pants.determine_array_length(window, this)
  end; end
 if (x >= 940 && x <= 1060) && (y >= 690 && y <= 790) && @@tab == "pants"
  case @@page
   when 1
    this = 12
    Clothing::Pants.determine_array_length(window, this)
   when 2
     this = 27
     Clothing::Pants.determine_array_length(window, this)
  end; end
 if (x >= 1030 && x <= 1180) && (y >= 690 && y <= 790) && @@tab == "pants"
  case @@page
   when 1
    this = 13
    Clothing::Pants.determine_array_length(window, this)
   when 2
     this = 28
     Clothing::Pants.determine_array_length(window, this)
  end; end
 if (x >= 1175 && x <= 1290) && (y >= 690 && y <= 790) && @@tab == "pants"
  case @@page
   when 1
    this = 14
    Clothing::Pants.determine_array_length(window, this)
   when 2
     this = 29
     Clothing::Pants.determine_array_length(window, this)
  end; end; end
#___________________________________________________________________________________________________________________________________________
  
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#|                                                       @note player control tab                                                          |
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 

    case event
    when SF::Event::Closed
      window.close
    when SF::Event::KeyPressed
      case event.code
    when SF::Keyboard::Backspace
      @@popup = "none"

    when SF::Keyboard::Enter
      @@attacking = true
      @@idleframes = 0
      if @@has_weapon == true && WEAPON_OBJECT_ARRAY[@@current_weapon].can_swing == true
        IDLE_TIMER.restart
        case @@current_direction
      when "left"
        @@attacking = true
        Window_Class.attack_swing_left(@@player_character_rendered_model, window)
        attack = @@attacking
        Regular_Enemies.attack(attack)
        Harvestables::Ore.harvest(attack)
        Harvestables::Herbs.harvest(attack)
      when "right"
        @@attacking = true
        Window_Class.attack_swing_right(@@player_character_rendered_model, window)
        attack = @@attacking
        Regular_Enemies.attack(attack)
        Harvestables::Ore.harvest(attack)
        Harvestables::Herbs.harvest(attack)
      end; end

      when SF::Keyboard::Space
        @@attacking = false
        map = @@map
        area = @@area
        Window_Class.teleport(window, map, area)
     #   case @@map
         #===========================================================================================================================================
         #=                                                            Doll Factory                                                                 =
         #===========================================================================================================================================
          #---------------------------------------------------------Doll Factory Map 1---------------------------------------------------------------
        #    when "factory_map_01"

        # when "test"
        #   NPCS::Test_Npcs.click(window, @@player_character_rendered_model)
        #   Window_Class.space_test_map
        #   Window_Class.teleport_test_garden
        #   Window_Class.teleport_doll_factory_01
        # when "test_garden"
        #   Window_Class.teleport_test_garden_map
        #   Window_Class.ladder_test_garden_map
        # when "test_ore"
        #   player = @@player_character_rendered_model.global_bounds
        #   Window_Class.teleport_test_ore_map; Window_Class.ladder_test_ore_map
        #   Harvestables::Ore.smelt(window, player)
        #   if player.intersects? Test_Smelter.global_bounds
        #     Player_Data::Player_Physics.immobilize_player
        #     @@popup = "smelter"
        #     @@player_character_rendered_model.position = SF.vector2(400, 75)
        # else if player.intersects? Test_Forge.global_bounds
        #     Player_Data::Player_Physics.immobilize_player
        #     @@popup = "forge"
        #     Etc::Inventory_Ingot.initialize_inventory
        #     @@player_character_rendered_model.position = SF.vector2(600, 75)
        # else if player.intersects? Test_Gem_Cutter.global_bounds
        #     Player_Data::Player_Physics.immobilize_player
        #     @@popup = "gem_cutter"
        #     @@page = 1
        #     Etc::Gem.initialize_gem_inventory
        #     Etc::Gem.initialize_gem_cutter_ore_display
        #     @@player_character_rendered_model.position = SF.vector2(800, 75)
        #     Etc::Gem.initialize_gem_cutter_cut_display
        # else if player.intersects? Test_Upgrade_Table_Menu.global_bounds
        #      Player_Data::Player_Physics.immobilize_player
        #      @@player_character_rendered_model.position = SF.vector2(1000, 75)
        #      @@popup = "upgrade_table"
        #    end; end; end; end
       # end
      when SF::Keyboard::D
        if @@is_on_ladder == false
        Wall_Array.map { |i| bounding_box1 = @@player_character_rendered_model.global_bounds
        bounding_box2 = i.bounding_rectangle.global_bounds
        if bounding_box1.intersects? bounding_box2
          All_Audio::SFX.char_create_up
        else
          @@idleframes = 0
          @@attacking = false
          walking = true
          IDLE_TIMER.restart
          Gui::Window_Class.is_walking(walking)
          if @@current_direction == "left"
          this = "right"
          Window_Class.change_direction(this)
          end
          window.draw(@@player_character_rendered_model)
        end}
      end
      when SF::Keyboard::A
       if @@is_on_ladder == false
        Wall_Array.map { |i| bounding_box1 = @@player_character_rendered_model.global_bounds
        bounding_box2 = i.bounding_rectangle.global_bounds
       if bounding_box1.intersects? bounding_box2
         All_Audio::SFX.char_create_up
       else
        @@idleframes = 0
        @@attacking = false
        walking = true
        IDLE_TIMER.restart
        Gui::Window_Class.is_walking(walking)
        if @@current_direction == "right"
        this = "left"
        Window_Class.change_direction(this)
        end
        window.draw(@@player_character_rendered_model)
         end}
        end
      when SF::Keyboard::W
        if @@is_on_ladder == false
          walking = false
          Gui::Window_Class.is_walking(walking)
          Ladder_Array.map { |i| if @@player_character_rendered_model.global_bounds.intersects? i.sprite.global_bounds
          @@is_on_ladder = true
          gravity_bool = false
          Player_Data::Player_Physics.gravity_toggle(gravity_bool)
          x = i.sprite.position.x - 25
          y = @@player_character_rendered_model.position.y += -10
          @@player_character_rendered_model.position = SF.vector2(x, y)
         else
           @@is_on_ladder = false
           gravity_bool = true
           Player_Data::Player_Physics.gravity_toggle(gravity_bool)
           @@idleframes = 0
           @@attacking = false
           airborn = true
           IDLE_TIMER.restart
           Gui::Window_Class.is_airborn(airborn)
           Player_Data::Player_Physics.wasd_up(@@player_character_rendered_model, window)
         end}
        else
          @@is_on_ladder = false
          gravity_bool = true
          Player_Data::Player_Physics.gravity_toggle(gravity_bool)
        end
      when SF::Keyboard::S
        @@idleframes = 0
        @@attacking = false
        Player_Data::Player_Physics.wasd_down(@@player_character_rendered_model, window)

        
      when SF::Keyboard::W && SF::Keyboard::D
        Player_Data::Player_Physics.wasd_up(@@player_character_rendered_model, window)

#___________________________________________________________________________________________________________________________________________
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#|                                                       @note menu shortcuts                                                              |
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 
      when SF::Keyboard::I
        if @@popup != "Inventory"
        @@popup = "Inventory"
        @@tab = "Equipment"
        Gui::Window_Class.weapon_tab(window)
        else if @@popup == "Inventory"
          @@popup = "none"
        end; end
#___________________________________________________________________________________________________________________________________________
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
#                                                   Character Data                                                                   +
#------------------------------------------------------------------------------------------------------------------------------------+

   module Player_Data #@note Player data is stored here 
   include Gui;       #@todo fix all the classes
   extend self
   @@hair_slot = 0; @@skin_slot = 0; @@face_slot = 0; @@shirt_slot = 0; @@gloves_slot = 0; @@pants_slot = 0; @@shoes_slot = 0
   @@hair_slot : (Int32); @@skin_slot : (Int32); @@face_slot : (Int32); @@shirt_slot : (Int32); @@gloves_slot : (Int32); @@pants_slot : (Int32)
   @@shoes_slot : (Int32); @@outfit_array : Array(Int32) = [@@hair_slot, @@skin_slot, @@face_slot, @@shirt_slot, @@gloves_slot, @@pants_slot, @@shoes_slot]
   property = @@hair_slot 
 
   def add_item(@@item_type, item)
     if item.is_owned == false 
     case @@item_type
     when "Clothing" || "Quest"
       item.is_owned = true
     when "Consumable" || "Equipment"
     end; end; end
  class Clothing_Wardrobe_Slot
   #-------------------------------------------------properties---------------------------------------------------------------------------------

      #[0] = tab, [1] = isowned, [2] = texture, [3] = display_texture, [4] = worn

    White_T_Shirt = [1, false, 1, 1, false]; Blue_T_Shirt = [1, false, 1, 1, false]
    SHIRT_ARRAY_WARDROBE = [White_T_Shirt, Blue_T_Shirt]
    def Clothing_Wardrobe_Slot.pull_arrays
      if SHIRT_ARRAY_WARDROBE[0][1] == false
       puts SHIRT_ARRAY_WARDROBE[0][1]
      end
      puts SHIRT_ARRAY_WARDROBE
    end
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
    def Clothing_Outfit_Slot.change_shoes(shoes_slot, window)
        @@shoes_slot = shoes_slot
        @@current_shoes = shoes_slot
        Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
        @@player_character_model.draw(SHOES_ARRAY[@@shoes_slot])
        window.draw(SHOES_ARRAY[@@shoes_slot])
      end
     def Clothing_Outfit_Slot.change_gloves(gloves_slot, window)
       @@gloves_slot = gloves_slot
       @@current_gloves = gloves_slot
       Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
       @@player_character_model.draw(GLOVE_ARRAY[@@gloves_slot])
       window.draw(GLOVE_ARRAY[@@gloves_slot])
     end
    def Clothing_Outfit_Slot.change_shirt(shirt_slot, window)
      @@shirt_slot = shirt_slot
      @@current_shirt = shirt_slot
      Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
      @@player_character_model.draw(SHIRT_ARRAY[@@shirt_slot])
      window.draw(SHIRT_ARRAY[@@shirt_slot])
     end
    def Clothing_Outfit_Slot.change_pants(pants_slot, window)
      @@pants_slot = pants_slot
      @@current_pants = pants_slot
      Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
      @@player_character_model.draw(PANTS_ARRAY[@@current_pants])
      window.draw(PANTS_ARRAY[@@current_pants])
     end
    def Clothing_Outfit_Slot.change_hair(hair_slot, window)
      @@hair_slot = hair_slot
      @@current_hair = hair_slot
      Window_Class.player_model_initialize(@@current_shoes, @@current_gloves, @@current_shirt, @@current_pants, @@current_hair) 
      @@player_character_model.draw(HAIR_ARRAY[@@current_hair])
      window.draw(HAIR_ARRAY[@@current_hair])
     end
  class Consumables_Slot
   end
  class Equipment_Slot
   end
  class Quest_Item_Slot
   end                  
  class Stats < Window_Class
   #----------------------------------------------Class Variables------------------------------------------------------------------------- 
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
    @@speed : Int32; @@speed = @@current_dex + @@equip_speed + 3; @@equip_speed : Int32; @@equip_speed = 0

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
     hp = "HP: " + @@current_hp.to_s + "/" + @@current_max_hp.to_s; Stats_Window_HP_Text.string = hp
     mp = "MP: " + @@current_mp.to_s + "/" + @@current_max_mp.to_s; Stats_Window_MP_Text.string = mp
     LVL_Label.string = @@lvl.to_s;
     Stats_Window_Name_Text.string = @@name
    end
   def Stats.check_attack
    base_attack = 10 + @@current_str
    Crafted_Items::Weapon.attack_strength(base_attack)
   end
   end
  class Player_Physics < Stats
   #==========================================Class Variables=========================================================================+
    @@is_player_airborne : Bool; @@is_player_airborne = false; @@fall_rate : Int32 | Nil; @@fallrate = 0
    @@player_bounding_box : SF::Rect(Float32); @@player_bounding_box = @@player_character_rendered_model.global_bounds
    @@player_jumped : Bool; @@player_jumped = false; @@player_direction : String; @@player_direction = "right"
    property == @@player_bounding_box; @@can_player_move_at_all : Bool; @@can_player_move_at_all = true
    @@current_quest : String; @@current_quest = "none"
   #==================================================================================================================================+

   #============================================Walk Cycle============================================================================+
    #----------------------------------------------Left-------------------------------------------------------------------------------+
     @@frame = 0
     def Player_Physics.walk_cycle_left(@@player_character_rendered_model)
     @@frame += 1
      if @@frame  > 0 && @@frame  < 11
       @@player_character_rendered_model.texture_rect = SF.int_rect(96, 128, 96, 128)
      else if @@frame  > 11 && @@frame  < 21
       @@player_character_rendered_model.texture_rect = SF.int_rect(192, 128, 96, 128)
      else if @@frame  > 21 && @@frame  < 31
        @@player_character_rendered_model.texture_rect = SF.int_rect(288, 128, 96, 128)
      else if @@frame  > 31 && @@frame  < 41
        @@player_character_rendered_model.texture_rect = SF.int_rect(384, 128, 96, 128)
      else if @@frame  > 41 && @@frame  < 51
        @@player_character_rendered_model.texture_rect = SF.int_rect(480, 128, 96, 128)
      else if @@frame  > 51 && @@frame  < 61
        @@player_character_rendered_model.texture_rect = SF.int_rect(576, 128, 96, 128)
       @@frame = 0
      end; end; end; end; end; end
     end
    #---------------------------------------------------------------------------------------------------------------------------------+
    #----------------------------------------------Right------------------------------------------------------------------------------+
     def Player_Physics.walk_cycle_right(@@player_character_rendered_model)
       @@frame += 1
        if @@frame  > 0 && @@frame  < 11
         @@player_character_rendered_model.texture_rect = SF.int_rect(96, 0, 96, 128)
        else if @@frame  > 11 && @@frame  < 21
         @@player_character_rendered_model.texture_rect = SF.int_rect(192, 0, 96, 128)
        else if @@frame  > 21 && @@frame  < 31
          @@player_character_rendered_model.texture_rect = SF.int_rect(288, 0, 96, 128)
        else if @@frame  > 31 && @@frame  < 41
          @@player_character_rendered_model.texture_rect = SF.int_rect(384, 0, 96, 128)
        else if @@frame  > 41 && @@frame  < 51
          @@player_character_rendered_model.texture_rect = SF.int_rect(480, 0, 96, 128)
        else if @@frame  > 51 && @@frame  < 61
          @@player_character_rendered_model.texture_rect = SF.int_rect(576, 0, 96, 128)
         @@frame = 0
        end; end; end; end; end; end
       end
    #---------------------------------------------------------------------------------------------------------------------------------+
   #==================================================================================================================================+

   #==================================================================================================================================+

   #=============================================Gravity==============================================================================+
    @@gravity_iterator : Int32; @@gravity_iterator = 0; @@gravity_clock = SF::Clock.new; @@jump_clock = SF::Clock.new;
    @@gravity_is_on : Bool; @@gravity_is_on = true
    def Player_Physics.gravity_toggle(gravity_bool)
      @@gravity_is_on = gravity_bool
    end
    def Player_Physics.gravity(@@player_character_rendered_model, window)
       gravity = @@gravity_clock.elapsed_time
     #-------------------------------------------Variables-----------------------------------------------------------------------------+  
      ground_box = Ground.global_bounds; test_platform_box = Test_Platform_01.global_bounds
      test_platform_box_2 = Test_Platform_02.global_bounds
      test_platform_box_3 = Test_Platform_03.global_bounds
      test_platform_box_4 = Short_Platform_01.global_bounds
      test_platform_box_5 = Medium_Platform_01.global_bounds
      @@player_bounding_box = Feet_Bounding_Box.global_bounds
      Feet_Bounding_Box.position = @@player_character_rendered_model.position + SF.vector2(25, 120)
      test_platform_array = [ground_box, test_platform_box, test_platform_box_2, test_platform_box_3, test_platform_box_4, test_platform_box_5]
     #---------------------------------------------------------------------------------------------------------------------------------+

     if @@player_bounding_box.intersects? test_platform_array[@@gravity_iterator]
       airborn = false
       Gui::Window_Class.is_airborn(airborn)
       @@player_jumped = false
       @@is_player_airborne = false
       @@fallrate = 0  
       @@gravity_clock.restart    
     else
       @@is_player_airborne = true 
       airborn = true
       Gui::Window_Class.is_airborn(airborn)
       if gravity >= SF.seconds(0.01) && @@gravity_is_on == true
         @@player_character_rendered_model.position += SF.vector2(0, 1.95)
         if SF::Keyboard.key_pressed?(SF::Keyboard::A)
          IDLE_TIMER.restart
          Player_Physics.wasd_left(@@player_character_rendered_model)
         end
         if SF::Keyboard.key_pressed?(SF::Keyboard::D)
          IDLE_TIMER.restart
           Player_Physics.wasd_right(@@player_character_rendered_model)
         end
         @@gravity_clock.restart
         @@fallrate = 0  
       else
         @@fallrate += 1
       end; end
       if @@gravity_iterator >= test_platform_array.size - 1
        @@gravity_iterator = 0
       else
        @@gravity_iterator += 1
       end
      end
   #==================================================================================================================================+

   #=============================================Movement=============================================================================+
    #----------------------------------------------Left-------------------------------------------------------------------------------+
     def Player_Physics.wasd_left(@@player_character_rendered_model)
      if @@can_player_move_at_all == true
     @@player_character_rendered_model.position -= SF.vector2(@@speed, 0)
     Player_Physics.walk_cycle_left(@@player_character_rendered_model)
     @@player_direction = "left"
      else if @@current_quest != "none"
        case @@current_quest
         when "test"
          NPCS::Test_Npcs.dialogue_menu_left
         end; end
       end
     end
    #---------------------------------------------------------------------------------------------------------------------------------+   
    #---------------------------------------------Right-------------------------------------------------------------------------------+
     def Player_Physics.wasd_right(@@player_character_rendered_model)
      if @@can_player_move_at_all == true
     @@player_character_rendered_model.position += SF.vector2(@@speed, 0)
     Player_Physics.walk_cycle_right(@@player_character_rendered_model)
     @@player_direction = "right"
    else if @@current_quest != "none"
      case @@current_quest
       when "test"
        NPCS::Test_Npcs.dialogue_menu_right
       end; end
       end
     end
    #---------------------------------------------------------------------------------------------------------------------------------+ 
    #----------------------------------------------Up---------------------------------------------------------------------------------+
     def Player_Physics.wasd_up(@@player_character_rendered_model, window) #f(x) = ax² + bx + c
      jump_time = @@jump_clock.elapsed_time
        if @@player_jumped == false && @@can_player_move_at_all == true
          @@jump_clock.restart
          IDLE_TIMER.restart
         if jump_time <= SF.seconds(3)
            @@player_character_rendered_model.position += SF.vector2(0, -150)
            @@player_jumped = true
          end
    #      if SF::Keyboard.key_pressed?(SF::Keyboard::A)
    #       @@player_character_rendered_model.position -= SF.vector2(5, 0)
    #      end
    #      if SF::Keyboard.key_pressed?(SF::Keyboard::D)
    #       @@player_character_rendered_model.position += SF.vector2(5, 0)
    #      end
    #    window.draw(@@player_character_rendered_model)
    #     end; end
       if SF::Keyboard.key_pressed?(SF::Keyboard::A)
         IDLE_TIMER.restart
         Player_Physics.wasd_left(@@player_character_rendered_model)
       end
       if SF::Keyboard.key_pressed?(SF::Keyboard::D)
         IDLE_TIMER.restart
         Player_Physics.wasd_right(@@player_character_rendered_model)
      end; end; end
     def Player_Physics.wasd_down(@@player_character_rendered_model, window)
      if @@player_bounding_box.intersects? Ground.global_bounds
        @@player_jumped = false
      else if @@can_player_move_at_all == true && @@player_jumped == false
        @@player_character_rendered_model.position += SF.vector2(0, 10)
        @@player_jumped = true
      end; end
     end
    #---------------------------------------------------------------------------------------------------------------------------------+ 
    #-------------------------------------------Mobility------------------------------------------------------------------------------+
     def Player_Physics.mobilize_player
      @@can_player_move_at_all = true
      end
     def Player_Physics.immobilize_player
        @@can_player_move_at_all = false
      end
     def Player_Physics.get_quest_movement(quest)
      @@current_quest = quest
      end
     def Player_Physics.nullify_quest
      @@current_quest = "none"
     end
    #---------------------------------------------------------------------------------------------------------------------------------+ 
 end
 end


#////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#|                                                         @note  NPCs                                                                      |
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module NPCS 
  include Player_Data
  include Gui
  extend self
  # -----------------------------------------------------------------------------------------------------------------------------------------
  #|                                                          Test Npcs                                                                      |
  # -----------------------------------------------------------------------------------------------------------------------------------------
   class Test_Npcs < Window_Class; Player_Physics
    include Player_Data
    include Gui
   #**********************************************************Variables***********************************************************************
    #........................................................NPC Models......................................................................
     @@test_npcs_model_01 = SF::RenderTexture.new(672, 512)
     @@test_npc_rendered_model_01 = SF::Sprite.new(@@test_npcs_model_01.texture)
    #----------------------------------------------------------------------------------------------------------------------------------------
    #......................................................Scene_Variables...................................................................
     @@test_npc_scene : String; @@test_npc_scene = "none"; @@test_scene_option : Int32; @@test_scene_option = 0; @@saved_hair : Int32;
     @@saved_hair = 0; property = @@saved_hair 
    #----------------------------------------------------------------------------------------------------------------------------------------
    #.......................................................Dialogue Box.....................................................................
     @@test_dialogue_box_01 : SF::RectangleShape; @@test_dialogue_box_01 = Dialog_Box.dup
     @@test_dialogue_box_01.position = SF.vector2(950, 580); @@npc_frame : Int32; @@npc_frame = 0; @@test_dialogue_box_text_01 : SF::Text
     @@test_dialogue_box_text_01 = Dialog_Box_Text.dup; @@test_dialogue_box_text_01.string = "Oh, hello! Do\n you need a haircut?"
     @@test_dialogue_box_text_01.position = SF.vector2(960, 600)
    #----------------------------------------------------------------------------------------------------------------------------------------
    #........................................................Choice Box......................................................................
     @@choice_01 = Choice_Box_Option.dup; @@choice_01 : SF::RectangleShape;
     @@choice_01.position = SF.vector2(622, 570); @@choice_02 = Choice_Box_Option.dup; @@choice_02 : SF::RectangleShape;
     @@choice_02.position = SF.vector2(780, 570); @@choice_box_text : SF::Text
     @@choice_box_text = Dialog_Box_Text.dup; @@choice_box_text.string = "Would you like a haircut for 1000\nShards?"
     @@choice_box_text.position = SF.vector2(622, 490); @@choice_box_choice_text_01 = Dialog_Box_Text.dup; @@choice_box_choice_text_01 : SF::Text
     @@choice_box_choice_text_01.position = SF.vector2(622, 570); @@choice_box_choice_text_01.string = "  Yes           No"; 
     @@choice_box_choice_text_01.character_size = 30
   #__________________________________________________________________________________________________________________________________________ 
   #***********************************************************Methods************************************************************************
    def Test_Npcs.test_npc_initialize
      @@test_npcs_model_01.clear(SF::Color::Transparent)
      @@test_npcs_model_01.draw(SKIN_ARRAY[0])
      @@test_npcs_model_01.draw(SHOES_ARRAY[2])
      @@test_npcs_model_01.draw(FACE_ARRAY[7])
      @@test_npcs_model_01.draw(HAIR_ARRAY[3])
      @@test_npcs_model_01.draw(PANTS_ARRAY[18])
      @@test_npcs_model_01.draw(SHIRT_ARRAY[8])
      @@test_npcs_model_01.draw(GLOVE_ARRAY[2])
      @@test_npcs_model_01.create(672, 512, false)
      @@test_npcs_model_01.display
      @@test_npc_rendered_model_01.texture_rect = SF.int_rect(0, 128, 96, 128)
      @@test_npc_rendered_model_01.position = SF.vector2(1002, 680)
      @@test_npc_rendered_model_01.scale = SF.vector2(1.0, 1.0)
     end
     def Test_Npcs.nullify_npc_scene
      @@test_npc_scene = "none"
     end
     def Test_Npcs.dialogue_menu_select(window)
      All_Audio::SFX.light_bonk
      case @@test_scene_option 
      when 0
        All_Audio::SFX.light_bonk
      when 1
        @@test_npc_scene = "test_quest_1_stage_4"
        @@saved_hair = @@hair_slot
        puts @@saved_hair
        this = "Salon"
        Gui::Window_Class.change_popup(this)
        this = "test"
        Gui::Window_Class.change_salon(this)
      when 2
        @@test_npc_scene = "none"
        quest = "none"
        Player_Data::Player_Physics.get_quest_movement(quest)
        Player_Data::Player_Physics.mobilize_player
      end
    end
     def Test_Npcs.revert_hair(window)
      hair_slot = @@saved_hair
      Clothing_Outfit_Slot.change_hair(hair_slot, window)
     end
     def Test_Npcs.dialogue_menu_left
      All_Audio::SFX.light_bonk
      @@choice_02.fill_color = SF.color(155, 155, 255)
      @@choice_01.fill_color = SF.color(100, 100, 255)
      @@test_scene_option = 1
      end
     def Test_Npcs.dialogue_menu_right
        All_Audio::SFX.light_bonk
        @@choice_01.fill_color = SF.color(155, 155, 255)
        @@choice_02.fill_color = SF.color(100, 100, 255)
        @@test_scene_option = 2
      end
    def Test_Npcs.test_npc_maintain(window)
    #  npc_bounding_01 = Bounding_Box.dup
    #  npc_bounding_01.position = @@test_npc_rendered_model_01.position
    #  window.draw(npc_bounding_01)
     window.draw(@@test_npc_rendered_model_01) 
      case @@test_npc_scene
        when "none"
          window.draw(@@test_npc_rendered_model_01)
        when "test_quest_1_stage_1"
            window.draw(@@test_dialogue_box_01)
           if @@npc_frame  > -1 && @@npc_frame  < 1200
            @@test_dialogue_box_01.texture_rect = SF.int_rect(0, 200, 150, 100);           @@npc_frame += 1
           else if @@npc_frame  >= 1200 && @@npc_frame  < 1800
            @@test_dialogue_box_01.texture_rect = SF.int_rect(0, 100, 150, 100);           @@npc_frame += 1
           else if @@npc_frame  >= 1800 #&& @@npc_frame  < 210000
            @@test_dialogue_box_01.texture_rect = SF.int_rect(0, 0, 150, 100);
            @@test_npc_scene = "test_quest_1_stage_2"
           end; end; end
         when "test_quest_1_stage_2"
           @@npc_frame = 0
           @@test_dialogue_box_text_01.string = "  Oh, hello! Do \n   you need a \n    haircut?"
           window.draw(@@test_dialogue_box_01)
           window.draw(@@test_dialogue_box_text_01)  
           Choice_Box.position = SF.vector2(602, 480)
           @@test_npc_scene = "test_quest_1_stage_3"
         when "test_quest_1_stage_3"
         if @@npc_frame  > -1 && @@npc_frame  < 1200 @@npc_frame += 1
          window.draw(@@test_dialogue_box_01)
          window.draw(@@test_dialogue_box_text_01) 
        else if @@npc_frame  >= 1200
          window.draw(@@test_dialogue_box_01)
          window.draw(@@test_dialogue_box_text_01) 
          window.draw(Choice_Box); window.draw(@@choice_01)
          window.draw(@@choice_02); window.draw(@@choice_box_text)
          window.draw(@@choice_box_choice_text_01) 
        end; end; end; end
           end
          end
    def NPCS::Test_Npcs.click(window, @@player_character_rendered_model)
     # npc_bounding_01 = Bounding_Box.dup
     # npc_bounding_01.position = @@test_npc_rendered_model_01.position
     # window.draw(npc_bounding_01)
      bounding_box1 = @@player_character_rendered_model.global_bounds
      bounding_box2 = @@test_npc_rendered_model_01.global_bounds
       if bounding_box1.intersects? bounding_box2
         if @@test_npc_scene == "none" 
          Player_Data::Player_Physics.immobilize_player
          quest = "test"
          Player_Data::Player_Physics.get_quest_movement(quest)
          All_Audio::SFX.light_bonk
          @@test_npc_scene = "test_quest_1_stage_1"
         end
        if @@test_npc_scene == "test_quest_1_stage_3" 
          Test_Npcs.dialogue_menu_select(window)
       end

    end #test npc class end
  end #module end



   
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


#=================================================================================================================================================
#                                                           Clothing                                                                          #
#=================================================================================================================================================
 
#  module Skin
#   #properties
#    property is_owned : Bool
#    property char_sprite : SF::Sprite
#    property display_sprite : SF::Sprite
#    property id : String
#    property name : String
#   class Human
#      Light = new.Human(false, PLAYER_CHAR, PLAYER_CHAR_DISPLAY, "SH001", "Light") 
#      Tan = new.Human(false, PLAYER_CHAR_2, PLAYER_CHAR_DISPLAY_2, "SH002", "Tan")
#      Dark = new.Human(false, PLAYER_CHAR_3, PLAYER_CHAR_DISPLAY_3, "SH003", "Dark")
#      Jaundiced = new.Human(false, PLAYER_CHAR_7, PLAYER_CHAR_DISPLAY_7, "SH004", "Jaundiced")
#    end
#   class Spooky
  #   Ghostly = new.Spooky(false, PLAYER_CHAR_4, PLAYER_CHAR_DISPLAY_4, "SS001", "Ghostly")
  #   Blue = new.Spooky(false, PLAYER_CHAR_5, PLAYER_CHAR_DISPLAY_5, "SS002", "Blue")
  #   Purple = new.Spooky(false, PLAYER_CHAR_6, PLAYER_CHAR_DISPLAY_6, "SS003", "Purple")
  #  end
  #  end
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

module Clothing
include Gui

#PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
#P                                                                Pants                                                                       P
#PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
 class Pants < Window_Class 
   include Gui; include Player_Data
 # __________________________________________________________________________________________________________________________________________
 #|                                                             initialize                                                                  |
 #|_________________________________________________________________________________________________________________________________________|
   def initialize(is_owned : Bool, char_sprite : SF::Sprite, display_sprite : SF::Sprite, name : String, color : String, pants_length : String, number : Int32) 
     @is_owned = is_owned
     @char_sprite = char_sprite
     @display_sprite = display_sprite
     @name = name
     @color = color
     @pants_length = pants_length
     @number = number 
    end
   def is_owned
     @is_owned
    end
   def char_sprite
     @char_sprite
    end
   def display_sprite
     @display_sprite
    end
   def name
     @name
    end
   def color
     @color
    end
   def pants_length
     @pants_length
    end
   def number
     @number
    end
 
 # __________________________________________________________________________________________________________________________________________
 #|                                                     pants methods and variables                                                         |
 #|_________________________________________________________________________________________________________________________________________|
  #..............................................................variables...................................................................
   @@owned_pants_array = [] of Pants 
   @@pants_array : Array(Pants)
   property = @@owned_pants_array
   @@outfit_pants_slot : Pants
   @@outfit_pants_slot = @@white_shorts
   @@pants_array = [@@white_shorts, @@brown_shorts, @@black_shorts, @@red_shorts, @@light_blue_shorts, @@orange_shorts, @@khaki_shorts,
   @@green_shorts, @@blue_shorts, @@purple_shorts, @@pink_shorts, @@white_booty_shorts, @@brown_booty_shorts, @@red_booty_shorts,
   @@orange_booty_shorts, @@yellow_booty_shorts, @@black_booty_shorts, @@green_booty_shorts, @@blue_booty_shorts, @@purple_booty_shorts,
   @@pink_booty_shorts, @@white_jeans, @@black_jeans, @@brown_jeans, @@red_jeans, @@orange_jeans, @@yellow_jeans, @@green_jeans,
   @@blue_jeans, @@purple_jeans, @@pink_jeans]
  #******************************************************************************************************************************************
  #...............................................................methods....................................................................
   def Pants.obtain(this)#---------------------------------------obtain
     this.is_owned = true
    end
  
   def Pants.gather_owned(window)#----------------------------gather obtained
    a = 0; b = @@pants_array.size 
     while a < b 
      if @@pants_array[a].is_owned == true
        @@owned_pants_array.push(@@pants_array[a])
       end
    a += 1
      end; end 
  
   def Pants.draw(window, @@page)#-----------------------------------------draw
      @@owned_pants_array.uniq!
      array = @@owned_pants_array; array_size = @@owned_pants_array.size
      Pants.sort_by_color
      @@owned_pants_array = array
      s = @@owned_pants_array.size - 1
    #__________________________page one________________________________________
      if @@page == 1
     #-------------------------row one-----------------------------------------
      if s >= 0 && @@owned_pants_array[0].is_owned == true
        @@owned_pants_array[0].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[0].display_sprite.position = SF.vector2(650, 300)
        window.draw(@@owned_pants_array[0].display_sprite)
       end
      if s >= 1 && @@owned_pants_array[1].is_owned == true
        @@owned_pants_array[1].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[1].display_sprite.position = SF.vector2(770, 300)
        window.draw(@@owned_pants_array[1].display_sprite)
       end
      if s >=  2 && @@owned_pants_array[2].is_owned == true
        @@owned_pants_array[2].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[2].display_sprite.position = SF.vector2(880, 300)
        window.draw(@@owned_pants_array[2].display_sprite)
       end
      if s >=  3 && @@owned_pants_array[3].is_owned == true
        @@owned_pants_array[3].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[3].display_sprite.position = SF.vector2(990, 300)
        window.draw(@@owned_pants_array[3].display_sprite)
       end
      if s >=  4 && @@owned_pants_array[4].is_owned == true
        @@owned_pants_array[4].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[4].display_sprite.position = SF.vector2(1110, 300)
        window.draw(@@owned_pants_array[4].display_sprite)
       end
     #-------------------------row two-----------------------------------------
      if s >=  5 && @@owned_pants_array[5].is_owned == true
        @@owned_pants_array[5].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[5].display_sprite.position = SF.vector2(650, 400)
        window.draw(@@owned_pants_array[5].display_sprite)
       end
      if s >=  6 && @@owned_pants_array[6].is_owned == true
       @@owned_pants_array[6].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[6].display_sprite.position = SF.vector2(770, 400)
       window.draw(@@owned_pants_array[6].display_sprite)
       end
      if s >=  7 && @@owned_pants_array[7].is_owned == true
       @@owned_pants_array[7].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[7].display_sprite.position = SF.vector2(880, 400)
       window.draw(@@owned_pants_array[7].display_sprite)
       end
      if s >=  8 && @@owned_pants_array[8].is_owned == true
       @@owned_pants_array[8].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[8].display_sprite.position = SF.vector2(990, 400)
       window.draw(@@owned_pants_array[8].display_sprite)
       end
      if s >=  9 && @@owned_pants_array[9].is_owned == true
       @@owned_pants_array[9].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[9].display_sprite.position = SF.vector2(1110, 400)
       window.draw(@@owned_pants_array[9].display_sprite)
       end
     #------------------------row three----------------------------------------   
      if s >=  10 && @@owned_pants_array[10].is_owned == true
       @@owned_pants_array[10].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[10].display_sprite.position = SF.vector2(650, 500)
       window.draw(@@owned_pants_array[10].display_sprite)
       end
      if s >=  11 && @@owned_pants_array[11].is_owned == true
        @@owned_pants_array[11].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[11].display_sprite.position = SF.vector2(770, 500)
        window.draw(@@owned_pants_array[11].display_sprite)
       end
      if s >=  12 && @@owned_pants_array[12].is_owned == true
        @@owned_pants_array[12].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[12].display_sprite.position = SF.vector2(880, 500)
        window.draw(@@owned_pants_array[12].display_sprite)
       end
      if s >=  13 && @@owned_pants_array[13].is_owned == true
        @@owned_pants_array[13].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[13].display_sprite.position = SF.vector2(990, 500)
        window.draw(@@owned_pants_array[13].display_sprite)
       end
      if s >=  14 && @@owned_pants_array[14].is_owned == true
        @@owned_pants_array[14].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[14].display_sprite.position = SF.vector2(1110, 500)
        window.draw(@@owned_pants_array[14].display_sprite)
       end; end
    #__________________________page two________________________________________
     if @@page == 2
     #-------------------------row one----------------------------------------
      if s >= 15 && @@owned_pants_array[15].is_owned == true
        @@owned_pants_array[15].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[15].display_sprite.position = SF.vector2(650, 300)
        window.draw(@@owned_pants_array[15].display_sprite)
       end
      if s >= 16 && @@owned_pants_array[16].is_owned == true
        @@owned_pants_array[16].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[16].display_sprite.position = SF.vector2(770, 300)
        window.draw(@@owned_pants_array[16].display_sprite)
       end
      if s >=  17 && @@owned_pants_array[17].is_owned == true
        @@owned_pants_array[17].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[17].display_sprite.position = SF.vector2(880, 300)
        window.draw(@@owned_pants_array[17].display_sprite)
       end
      if s >=  18 && @@owned_pants_array[18].is_owned == true
        @@owned_pants_array[18].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[18].display_sprite.position = SF.vector2(990, 300)
        window.draw(@@owned_pants_array[18].display_sprite)
       end
      if s >=  19 && @@owned_pants_array[19].is_owned == true
        @@owned_pants_array[19].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_pants_array[19].display_sprite.position = SF.vector2(1110, 300)
        window.draw(@@owned_pants_array[19].display_sprite)
       end
     #-------------------------row two-----------------------------------------
      if s >=  20 && @@owned_pants_array[20].is_owned == true
       @@owned_pants_array[20].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[20].display_sprite.position = SF.vector2(650, 400)
       window.draw(@@owned_pants_array[20].display_sprite)
       end
      if s >=  21 && @@owned_pants_array[21].is_owned == true
       @@owned_pants_array[21].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[21].display_sprite.position = SF.vector2(770, 400)
       window.draw(@@owned_pants_array[21].display_sprite)
       end
      if s >=  22 && @@owned_pants_array[22].is_owned == true
       @@owned_pants_array[22].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[22].display_sprite.position = SF.vector2(880, 400)
       window.draw(@@owned_pants_array[22].display_sprite)
       end
      if s >=  23 && @@owned_pants_array[23].is_owned == true
       @@owned_pants_array[23].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[23].display_sprite.position = SF.vector2(990, 400)
       window.draw(@@owned_pants_array[23].display_sprite)
       end
      if s >=  24 && @@owned_pants_array[24].is_owned == true
       @@owned_pants_array[24].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[24].display_sprite.position = SF.vector2(1110, 400)
       window.draw(@@owned_pants_array[24].display_sprite)
       end
     #-----------------------row three-----------------------------------------   
      if s >=  25 && @@owned_pants_array[25].is_owned == true
       @@owned_pants_array[25].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[25].display_sprite.position = SF.vector2(650, 500)
       window.draw(@@owned_pants_array[25].display_sprite)
       end
      if s >=  26 && @@owned_pants_array[26].is_owned == true
       @@owned_pants_array[26].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[26].display_sprite.position = SF.vector2(770, 500)
       window.draw(@@owned_pants_array[26].display_sprite)
       end
      if s >=  27 && @@owned_pants_array[27].is_owned == true
       @@owned_pants_array[27].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[27].display_sprite.position = SF.vector2(880, 500)
       window.draw(@@owned_pants_array[27].display_sprite)
       end
      if s >=  28 && @@owned_pants_array[28].is_owned == true 
       @@owned_pants_array[28].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[28].display_sprite.position = SF.vector2(990, 500)
       window.draw(@@owned_pants_array[28].display_sprite)
       end
      if s >=  29 && @@owned_pants_array[29].is_owned == true
       @@owned_pants_array[29].display_sprite.scale = SF.vector2(2.5, 2.5)
       @@owned_pants_array[29].display_sprite.position = SF.vector2(1110, 500)
       window.draw(@@owned_pants_array[29].display_sprite)
      end; end; end
   def Pants.determine_array_length(window, this)#--------------array length
    @@owned_pants_array.uniq!
    if this <= @@owned_pants_array.size - 1
     case this
      when 0
       selected_pants = @@owned_pants_array[0].number
       Clothing::Pants.select(window, selected_pants)
      when 1
       selected_pants = @@owned_pants_array[1].number
       Clothing::Pants.select(window, selected_pants)
      when 2
       selected_pants = @@owned_pants_array[2].number
       Clothing::Pants.select(window, selected_pants)
      when 3
       selected_pants = @@owned_pants_array[3].number
       Clothing::Pants.select(window, selected_pants)
      when 4
       selected_pants = @@owned_pants_array[4].number
       Clothing::Pants.select(window, selected_pants)
      when 5
       selected_pants = @@owned_pants_array[5].number
       Clothing::Pants.select(window, selected_pants)
      when 6
       selected_pants = @@owned_pants_array[6].number
       Clothing::Pants.select(window, selected_pants)
      when 7
       selected_pants = @@owned_pants_array[7].number
       Clothing::Pants.select(window, selected_pants)
      when 8
       selected_pants = @@owned_pants_array[8].number
       Clothing::Pants.select(window, selected_pants)
      when 9
       selected_pants = @@owned_pants_array[9].number
       Clothing::Pants.select(window, selected_pants)
      when 10
       selected_pants = @@owned_pants_array[10].number
       Clothing::Pants.select(window, selected_pants)
      when 11
       selected_pants = @@owned_pants_array[11].number
       Clothing::Pants.select(window, selected_pants)
      when 12
       selected_pants = @@owned_pants_array[12].number
       Clothing::Pants.select(window, selected_pants)
      when 13
       selected_pants = @@owned_pants_array[13].number
       Clothing::Pants.select(window, selected_pants)
      when 14
       selected_pants = @@owned_pants_array[14].number
       Clothing::Pants.select(window, selected_pants)
      when 15
       selected_pants = @@owned_pants_array[15].number
       Clothing::Pants.select(window, selected_pants)
      when 16
       selected_pants = @@owned_pants_array[16].number
       Clothing::Pants.select(window, selected_pants)
      when 17
       selected_pants = @@owned_pants_array[17].number
       Clothing::Pants.select(window, selected_pants)
      when 18
       selected_pants = @@owned_pants_array[18].number
       Clothing::Pants.select(window, selected_pants)
      when 19
       selected_pants = @@owned_pants_array[19].number
       Clothing::Pants.select(window, selected_pants)
      when 20
       selected_pants = @@owned_pants_array[20].number
       Clothing::Pants.select(window, selected_pants)
      when 21
       selected_pants = @@owned_pants_array[21].number
       Clothing::Pants.select(window, selected_pants)
      when 22
       selected_pants = @@owned_pants_array[22].number
       Clothing::Pants.select(window, selected_pants)
      when 23
       selected_pants = @@owned_pants_array[23].number
       Clothing::Pants.select(window, selected_pants)
      when 24
       selected_pants = @@owned_pants_array[24].number
       Clothing::Pants.select(window, selected_pants)
      when 25
        selected_pants = @@owned_pants_array[25].number
        Clothing::Pants.select(window, selected_pants)
      when 26
        selected_pants = @@owned_pants_array[26].number
        Clothing::Pants.select(window, selected_pants)
      when 27
        selected_pants = @@owned_pants_array[27].number
        Clothing::Pants.select(window, selected_pants)
      when 28
        selected_pants = @@owned_pants_array[28].number
        Clothing::Pants.select(window, selected_pants)
      when 29
        selected_pants = @@owned_pants_array[29].number
        Clothing::Pants.select(window, selected_pants)
      end; end; end
   
   def Pants.select(window, selected_pants)#----------------------select
    pants_slot = selected_pants
    Clothing_Outfit_Slot.change_pants(pants_slot, window)
      end
   
   def Pants.sort_by_color#-----------------------------------sort by color
    a = 0; sorted_array = @@owned_pants_array.dup
    @@owned_pants_array.clear
    while a < sorted_array.size
     if sorted_array[a].color === "white"
       @@owned_pants_array.push(sorted_array[a])
      end
      a += 1
     end
     a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "black"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "red"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "orange"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "yellow"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "green"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "blue"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "purple"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "pink"
       @@owned_pants_array.push(sorted_array[a])
      end
       a += 1
      end
      a = 0
    while a < sorted_array.size
     if sorted_array[a].color === "brown"
     @@owned_pants_array.push(sorted_array[a])
    end
     a += 1
    end
    end
  #white, black, red, orange, yellow, green, blue, purple, pink, brown

 # __________________________________________________________________________________________________________________________________________
 #|                                                               shorts                                                                    |
 #|_________________________________________________________________________________________________________________________________________|
 
    @@white_shorts = Pants.new(true, SHORTS_01, DISPLAY_SHORTS_01,"White_Shorts", "white", "short", 0)
    @@brown_shorts = Pants.new(true, SHORTS_02, DISPLAY_SHORTS_02, "Brown_Shorts", "brown", "short", 1)
    @@black_shorts = Pants.new(true, SHORTS_03, DISPLAY_SHORTS_03, "Black_Shorts", "black", "short", 2)
    @@red_shorts = Pants.new(true, SHORTS_04, DISPLAY_SHORTS_04, "Red Shorts", "red", "short", 3)
    @@light_blue_shorts = Pants.new(true, SHORTS_05, DISPLAY_SHORTS_05, "Light-Blue Shorts", "blue", "short", 4)
    @@orange_shorts = Pants.new(true, SHORTS_06, DISPLAY_SHORTS_06, "Orange Shorts", "orange", "short", 5)
    @@khaki_shorts = Pants.new(true, SHORTS_07, DISPLAY_SHORTS_07, "Khaki_Shorts", "brown", "short", 6)
    @@green_shorts = Pants.new(true, SHORTS_08, DISPLAY_SHORTS_08, "Green_Shorts", "green", "short", 7)
    @@blue_shorts = Pants.new(true, SHORTS_09, DISPLAY_SHORTS_09, "Red_Shorts", "blue", "short", 8)
    @@purple_shorts = Pants.new(true, SHORTS_10, DISPLAY_SHORTS_10, "Purple_Shorts", "purple", "short", 9)
    @@pink_shorts = Pants.new(true, SHORTS_11, DISPLAY_SHORTS_11, "Pink_Shorts", "pink", "short", 10)
 
 # __________________________________________________________________________________________________________________________________________
 #|                                                             booty shorts                                                                |
 #|_________________________________________________________________________________________________________________________________________|
 
    @@white_booty_shorts = Pants.new(true, BOOTY_SHORTS_01, BOOTY_DISPLAY_SHORTS_01,"White Booty Shorts", "white", "very short", 11)
    @@brown_booty_shorts = Pants.new(true, BOOTY_SHORTS_02, BOOTY_DISPLAY_SHORTS_02,"Brown Booty Shorts", "brown", "very short", 12)
    @@red_booty_shorts = Pants.new(true, BOOTY_SHORTS_03, BOOTY_DISPLAY_SHORTS_03,"Red Booty Shorts", "red", "very short", 13)
    @@orange_booty_shorts = Pants.new(true, BOOTY_SHORTS_04, BOOTY_DISPLAY_SHORTS_04,"Orange Booty Shorts", "orange", "very short", 14)
    @@yellow_booty_shorts = Pants.new(true, BOOTY_SHORTS_05, BOOTY_DISPLAY_SHORTS_05,"Yellow Booty Shorts", "yellow", "very short", 15)
    @@black_booty_shorts = Pants.new(true, BOOTY_SHORTS_06, BOOTY_DISPLAY_SHORTS_06,"Black Booty Shorts", "black", "very short", 16)
    @@green_booty_shorts = Pants.new(true, BOOTY_SHORTS_07, BOOTY_DISPLAY_SHORTS_07,"Green Booty Shorts", "green", "very short", 17)
    @@blue_booty_shorts = Pants.new(true, BOOTY_SHORTS_08, BOOTY_DISPLAY_SHORTS_08,"Blue Booty Shorts", "blue", "very short", 18)
    @@purple_booty_shorts = Pants.new(true, BOOTY_SHORTS_09, BOOTY_DISPLAY_SHORTS_09,"Purple Booty Shorts", "purple", "very short", 19)
    @@pink_booty_shorts = Pants.new(true, BOOTY_SHORTS_10, BOOTY_DISPLAY_SHORTS_10,"Pink Booty Shorts", "pink", "very short", 20)
 
 # __________________________________________________________________________________________________________________________________________
 #|                                                                Jeans                                                                    |
 #|_________________________________________________________________________________________________________________________________________|

   @@white_jeans = Pants.new(true, JEANS_01, DISPLAY_JEANS_01,"White Jeans", "white", "long", 21)
   @@black_jeans = Pants.new(true, JEANS_02, DISPLAY_JEANS_02,"Black Jeans", "black", "long", 22)
   @@brown_jeans = Pants.new(true, JEANS_03, DISPLAY_JEANS_03,"Brown Jeans", "brown", "long", 23)
   @@red_jeans = Pants.new(true, JEANS_04, DISPLAY_JEANS_04,"Red Jeans", "red", "long", 24)
   @@orange_jeans = Pants.new(true, JEANS_05, DISPLAY_JEANS_05,"Orange Jeans", "Orange", "long", 25)
   @@yellow_jeans = Pants.new(true, JEANS_06, DISPLAY_JEANS_06,"Yellow Jeans", "yellow", "long", 26)
   @@green_jeans = Pants.new(true, JEANS_07, DISPLAY_JEANS_07,"Green Jeans", "green", "long", 27)
   @@blue_jeans = Pants.new(true, JEANS_08, DISPLAY_JEANS_08,"Blue Jeans", "blue", "long", 28)
   @@purple_jeans = Pants.new(true, JEANS_09, DISPLAY_JEANS_09,"Purple Jeans", "purple", "long", 29)
   @@pink_jeans = Pants.new(true, JEANS_10, DISPLAY_JEANS_10,"Pink Jeans", "pink", "long", 30)

   end


#SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
#S                                                                Shoes                                                                       S
#SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
 class Shoes  #@note Shoes go here
  include Gui; include Player_Data
  # __________________________________________________________________________________________________________________________________________
  #|                                                             initialize                                                                  |
  #|_________________________________________________________________________________________________________________________________________|
     def initialize(is_owned : Bool, char_sprite : SF::Sprite, display_sprite : SF::Sprite, name : String, color : String, number : Int32) 
       @is_owned = is_owned
       @char_sprite = char_sprite
       @display_sprite = display_sprite
       @name = name
       @color = color
       @number = number
      end
     def is_owned
       @is_owned
      end
     def charsprite
       @char_sprite
      end
     def display_sprite
       @display_sprite
      end 
     def name
       @name
      end
     def color
       @color
      end
     def number
        @number
      end
  #------------------------------------------------------------------------------------------------------------------------------------------


  # __________________________________________________________________________________________________________________________________________
  #|                                                     shoe methods and variables                                                          |
  #|_________________________________________________________________________________________________________________________________________|
   #..............................................................variables...................................................................
     @@owned_shoes_array = [] of Shoes
     @@shoes_array : Array(Shoes)
     property = @@owned_shoes_array
     @@outfit_shoe_slot : Shoes
     @@outfit_shoe_slot = @@white_rain_boots
     @@shoes_array = [@@white_rain_boots, @@red_rain_boots, @@blue_rain_boots, @@black_rain_boots, @@orange_rain_boots, @@yellow_rain_boots,
     @@green_rain_boots, @@purple_rain_boots, @@pink_rain_boots]
    #.........................................................................................................................................
   #...............................................................methods....................................................................
       def Shoes.obtain(this)
         this.is_owned = true
        end 
       def Shoes.gather_owned(window)
         a = 0; b = @@shoes_array.size
          while a != b
          if @@shoes_array[a].is_owned == true
            @@owned_shoes_array.push(@@shoes_array[a])
          end
          a += 1
          end
        end
       def Shoes.draw(window)
         @@owned_shoes_array.uniq!
         array = @@owned_shoes_array; array_size = @@owned_shoes_array.size
         Shoes.sort_by_color
        #_________________________page  one_______________________________________________________________________________________________________
        #-------------------------Row One--------------------------------------------------------------------------------------------------------
           s = @@owned_shoes_array.size - 1
          if s >= 0 && @@owned_shoes_array[0].is_owned == true
            @@owned_shoes_array[0].display_sprite.position = SF.vector2(595, 135)
            window.draw(@@owned_shoes_array[0].display_sprite)
           end
          if s >= 1 && @@owned_shoes_array[1].is_owned == true
            @@owned_shoes_array[1].display_sprite.position = SF.vector2(715, 135)
            window.draw(@@owned_shoes_array[1].display_sprite)
           end
          if s >=  2 && @@owned_shoes_array[2].is_owned == true
            @@owned_shoes_array[2].display_sprite.position = SF.vector2(830, 135)
            window.draw(@@owned_shoes_array[2].display_sprite)
           end
          if s >=  3 && @@owned_shoes_array[3].is_owned == true
            @@owned_shoes_array[3].display_sprite.position = SF.vector2(945, 135)
            window.draw(@@owned_shoes_array[3].display_sprite)
           end
          if s >=  4 && @@owned_shoes_array[4].is_owned == true
            @@owned_shoes_array[4].display_sprite.position = SF.vector2(1060, 135)
            window.draw(@@owned_shoes_array[4].display_sprite)
           end
        #-------------------------Row Two--------------------------------------------------------------------------------------------------------
          if s >= 5 && @@owned_shoes_array[5].is_owned == true
            @@owned_shoes_array[5].display_sprite.position = SF.vector2(595, 235)
            window.draw(@@owned_shoes_array[5].display_sprite)
           end
          if s >= 6 && @@owned_shoes_array[6].is_owned == true
            @@owned_shoes_array[6].display_sprite.position = SF.vector2(715, 235)
            window.draw(@@owned_shoes_array[6].display_sprite)
           end
          if s >= 7 && @@owned_shoes_array[7].is_owned == true
            @@owned_shoes_array[7].display_sprite.position = SF.vector2(830, 235)
            window.draw(@@owned_shoes_array[7].display_sprite)
           end
          if s >= 8 && @@owned_shoes_array[8].is_owned == true
            @@owned_shoes_array[8].display_sprite.position = SF.vector2(945, 235)
            window.draw(@@owned_shoes_array[8].display_sprite)
           end
          if s >= 9 && @@owned_shoes_array[9].is_owned == true
            @@owned_shoes_array[9].display_sprite.position = SF.vector2(1060, 235)
            window.draw(@@owned_shoes_array[9].display_sprite)
          end
        #-------------------------Row Three------------------------------------------------------------------------------------------------------
        if s >= 10 && @@owned_shoes_array[10].is_owned == true
          @@owned_shoes_array[10].display_sprite.position = SF.vector2(595, 335)
          window.draw(@@owned_shoes_array[10].display_sprite)
         end
        if s >= 11 && @@owned_shoes_array[11].is_owned == true
           @@owned_shoes_array[11].display_sprite.position = SF.vector2(715, 335)
           window.draw(@@owned_shoes_array[11].display_sprite)
          end
        if s >= 12 && @@owned_shoes_array[12].is_owned == true
           @@owned_shoes_array[12].display_sprite.position = SF.vector2(830, 335)
           window.draw(@@owned_shoes_array[12].display_sprite)
          end
        if s >= 13 && @@owned_shoes_array[13].is_owned == true
           @@owned_shoes_array[13].display_sprite.position = SF.vector2(945, 335)
           window.draw(@@owned_shoes_array[13].display_sprite)
          end
        if s >= 14 && @@owned_shoes_array[14].is_owned == true
          @@owned_shoes_array[14].display_sprite.position = SF.vector2(1060, 335)
          window.draw(@@owned_shoes_array[14].display_sprite)
         end
        end
    def Shoes.determine_array_length(window, this)
     @@owned_shoes_array.uniq!
     if this <= @@owned_shoes_array.size - 1
       case this
       when 0
         selected_shoe = @@owned_shoes_array[0].number
         Clothing::Shoes.select(window, selected_shoe)
       when 1
         selected_shoe = @@owned_shoes_array[1].number
         Clothing::Shoes.select(window, selected_shoe)
       when 2
         selected_shoe = @@owned_shoes_array[2].number
         Clothing::Shoes.select(window, selected_shoe)
       when 3
         selected_shoe = @@owned_shoes_array[3].number
         Clothing::Shoes.select(window, selected_shoe)
       when 4
        selected_shoe = @@owned_shoes_array[4].number
        Clothing::Shoes.select(window, selected_shoe)
       when 5
         selected_shoe = @@owned_shoes_array[5].number
         Clothing::Shoes.select(window, selected_shoe)
       when 6
        selected_shoe = @@owned_shoes_array[6].number
        Clothing::Shoes.select(window, selected_shoe)
       when 7
        selected_shoe = @@owned_shoes_array[7].number
        Clothing::Shoes.select(window, selected_shoe)
       when 8
        selected_shoe = @@owned_shoes_array[8].number
        Clothing::Shoes.select(window, selected_shoe)
       when 9
        selected_shoe = @@owned_shoes_array[9].number
        Clothing::Shoes.select(window, selected_shoe)
       when 10
        selected_shoe = @@owned_shoes_array[10].number
        Clothing::Shoes.select(window, selected_shoe)
       end; end; end
    def Shoes.select(window, selected_shoe)
      shoes_slot = selected_shoe
      Clothing_Outfit_Slot.change_shoes(shoes_slot, window)
     end
    def Shoes.sort_by_color#-----------------------------------sort by color
      a = 0; sorted_array = @@owned_shoes_array.dup
      @@owned_shoes_array.clear
     while a < sorted_array.size
      if sorted_array[a].color === "white"
        @@owned_shoes_array.push(sorted_array[a])
       end
       a += 1
      end
      a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "black"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "red"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "orange"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "yellow"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "green"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "blue"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "purple"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "pink"
        @@owned_shoes_array.push(sorted_array[a])
       end
        a += 1
       end
     end
    #.........................................................................................................................................
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
  # __________________________________________________________________________________________________________________________________________
  #|                                                             Rain Boots                                                                  |
  #|_________________________________________________________________________________________________________________________________________|
      @@white_rain_boots = Shoes.new(true, RAIN_BOOTS_01, DISPLAY_RAIN_BOOTS_01, "White Rain Boots", "white", 0)
      @@red_rain_boots = Shoes.new(true, RAIN_BOOTS_02, DISPLAY_RAIN_BOOTS_02, "Red Rain Boots", "red", 1)
      @@blue_rain_boots = Shoes.new(true, RAIN_BOOTS_03, DISPLAY_RAIN_BOOTS_03, "Blue Rain Boots", "blue", 2)
      @@black_rain_boots = Shoes.new(true, RAIN_BOOTS_04, DISPLAY_RAIN_BOOTS_04, "Black Rain Boots", "black", 3)
      @@orange_rain_boots = Shoes.new(true, RAIN_BOOTS_05, DISPLAY_RAIN_BOOTS_05, "Orange Rain Boots", "orange", 4)
      @@yellow_rain_boots = Shoes.new(true, RAIN_BOOTS_06, DISPLAY_RAIN_BOOTS_06, "Yellow Rain Boots", "yellow", 5)
      @@green_rain_boots = Shoes.new(true, RAIN_BOOTS_07, DISPLAY_RAIN_BOOTS_07, "Green Rain Boots", "green", 6)
      @@purple_rain_boots = Shoes.new(true, RAIN_BOOTS_08, DISPLAY_RAIN_BOOTS_08, "Purple Rain Boots", "purple", 7)
      @@pink_rain_boots = Shoes.new(true, RAIN_BOOTS_09, DISPLAY_RAIN_BOOTS_09, "Pink Rain Boots", "pink", 8)


 #------------------------------------------------------------------------------------------------------------------------------------------ 
   end

class Face
    def initialize(is_owned : Bool, char_sprite : SF::Sprite, display_sprite : SF::Sprite, name : String, eye_color : String, does_blink : Bool, number : Int32)
    @is_owned = is_owned
    @char_sprite = char_sprite
    @display_sprite = display_sprite
    @name = name
    @eye_color = eye_color
    @does_blink = does_blink
    @number = number 
    end
#    #properties
#     property is_owned : Bool
#     property char_sprite : SF::Sprite
#     property display_sprite : SF::Sprite
#     property name : String
#     property eye_color : String
#     property does_blink : Bool
      property number
#    class Button_Face
#     Blue_Button_Eyes = new.Button_Face(false, BUTTON_FACE_01, BUTTON_DISPLAY_FACE_01, "FFBE001", "Blue Button Eyes", "blue", false)
#     Red_Button_Eyes = new.Button_Face(false, BUTTON_FACE_02, BUTTON_DISPLAY_FACE_02, "FFBE002", "Red Button Eyes", "red", false)
#     Purple_Button_Eyes = new.Button_Face(false, BUTTON_FACE_03, BUTTON_DISPLAY_FACE_03, "FFBE003", "Purple Button Eyes", "purple", false)
#     Green_Button_Eyes = new.Button_Face(false, BUTTON_FACE_04, BUTTON_DISPLAY_FACE_04, "FFBE004", "Green Button Eyes", "green", false)
#     Yellow_Button_Eyes = new.Button_Face(false, BUTTON_FACE_05, BUTTON_DISPLAY_FACE_05, "FFBE005", "Yellow Button Eyes", "yellow", false)
#     Brown_Button_Eyes = new.Button_Face(false, BUTTON_FACE_06, BUTTON_DISPLAY_FACE_06, "FFBE006", "Brown Button Eyes", "brown", false)
#     end
#    class Shounen_Face
#     Grey_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_01, SHOUNEN_DISPLAY_FACE_01, "FSF001", "Grey Shounen Face", "grey", true)
#     Blue_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_02, SHOUNEN_DISPLAY_FACE_02, "FSF002", "Blue Shounen Face", "blue", true)
#     Green_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_03, SHOUNEN_DISPLAY_FACE_03, "FSF003", "Green Shounen Face", "green", true)
#     Brown_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_04, SHOUNEN_DISPLAY_FACE_04, "FSF004", "Brown Shounen Face", "brown", true)
#     Purple_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_05, SHOUNEN_DISPLAY_FACE_05, "FSF005", "Purple Shounen Face", "purple", true)
#     Yellow_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_06, SHOUNEN_DISPLAY_FACE_06, "FSF006", "Yellow Shounen Face", "yellow", true)
#     end
#    class Tired_Face
#     Grey_Tired_Face = new.Tired_Face(false, TIRED_FACE_01, TIRED_DISPLAY_FACE_01, "FTF001", "Grey Tired Face", "grey", true)
#     Blue_Tired_Face = new.Tired_Face(false, TIRED_FACE_02, TIRED_DISPLAY_FACE_02, "FTF002", "Blue Tired Face", "blue", true)
#     Brown_Tired_Face = new.Tired_Face(false, TIRED_FACE_03, TIRED_DISPLAY_FACE_03, "FTF003", "Brown Tired Face", "brown", true)
#     Green_Tired_Face = new.Tired_Face(false, TIRED_FACE_04, TIRED_DISPLAY_FACE_04, "FTF004", "Green Tired Face", "green", true)
#     Red_Tired_Face = new.Tired_Face(false, TIRED_FACE_05, TIRED_DISPLAY_FACE_05, "FTF005", "Red Tired Face", "red", true)
#     Yellow_Tired_Face = new.Tired_Face(false, TIRED_FACE_06, TIRED_DISPLAY_FACE_06, "FTF006", "Yellow Tired Face", "yellow", true)
#     end
#    class Smiley_Face
#      Smiley_Face = new.Smiley_Face(false, SMILEY_FACE_01, SMILEY_DISPLAY_FACE_01, "FSFL001", "Smiley Face", "black", false)
#    end
   end
  
#GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
#G                                                               Gloves                                                                     G
#GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG

  class Gloves
   include Gui; include Player_Data
 # __________________________________________________________________________________________________________________________________________
 #|                                                             initialize                                                                  |
 #|_________________________________________________________________________________________________________________________________________|
   def initialize(is_owned : Bool, char_sprite : SF::Sprite, display_sprite : SF::Sprite, name : String, color : String, number : Int32) 
     @is_owned = is_owned
     @char_sprite = char_sprite
     @display_sprite = display_sprite
     @name = name
     @color = color
     @number = number 
    end
   def is_owned
     @is_owned
    end
   def char_sprite
     @char_sprite
    end
   def display_sprite
     @display_sprite
    end
   def name
     @name
    end
   def color
     @color
    end
   def number
     @number
    end
 #-------------------------------------------------------------------------------------------------------------------------------------------

 # __________________________________________________________________________________________________________________________________________
 #|                                                     glove methods and variables                                                         |
 #|_________________________________________________________________________________________________________________________________________|
  #..............................................................variables...................................................................
    @@owned_gloves_array = [] of Gloves
    @@gloves_array : Array(Gloves)
    property = @@owned_gloves_array
    @@outfit_gloves_slot : Gloves
    @@outfit_gloves_slot = @@white_fingerless_gloves
    @@gloves_array = [@@white_fingerless_gloves, @@red_fingerless_gloves, @@blue_fingerless_gloves, @@black_fingerless_gloves, @@orange_fingerless_gloves,
    @@yellow_fingerless_gloves, @@green_fingerless_gloves, @@purple_fingerless_gloves, @@pink_fingerless_gloves, @@brown_fingerless_gloves]
  #******************************************************************************************************************************************
  #...............................................................methods....................................................................
   def Gloves.obtain(this)#---------------------------------------obtain
     this.is_owned = true
    end 

   def Gloves.gather_owned(window)#----------------------------gather obtained
     a = -1; b = @@gloves_array.size
      while a != b
       if @@gloves_array[a].is_owned == true
          @@owned_gloves_array.push(@@gloves_array[a])
       end
     a += 1
        end
    end

   def Gloves.draw(window)#-----------------------------------------draw
      @@owned_gloves_array.uniq!
      array = @@owned_gloves_array; array_size = @@owned_gloves_array.size
      Gloves.sort_by_color
      s = @@owned_gloves_array.size - 1
    #_________________________page  one_______________________________________________________________________________________________________
    #-------------------------Row One--------------------------------------------------------------------------------------------------------
     if s >= 0 && @@owned_gloves_array[0].is_owned == true
        @@owned_gloves_array[0].display_sprite.position = SF.vector2(535, 135)
        window.draw(@@owned_gloves_array[0].display_sprite)
      end
     if s >= 1 && @@owned_gloves_array[1].is_owned == true
        @@owned_gloves_array[1].display_sprite.position = SF.vector2(655, 135)
        window.draw(@@owned_gloves_array[1].display_sprite)
      end
     if s >=  2 && @@owned_gloves_array[2].is_owned == true
        @@owned_gloves_array[2].display_sprite.position = SF.vector2(775, 135)
        window.draw(@@owned_gloves_array[2].display_sprite)
      end
     if s >=  3 && @@owned_gloves_array[3].is_owned == true
       @@owned_gloves_array[3].display_sprite.position = SF.vector2(895, 135)
       window.draw(@@owned_gloves_array[3].display_sprite)
      end
     if s >=  4 && @@owned_gloves_array[4].is_owned == true
       @@owned_gloves_array[4].display_sprite.position = SF.vector2(1015, 135)
       window.draw(@@owned_gloves_array[4].display_sprite)
     end
    #-------------------------Row Two--------------------------------------------------------------------------------------------------------
     if s >= 5 && @@owned_gloves_array[5].is_owned == true
        @@owned_gloves_array[5].display_sprite.position = SF.vector2(535, 235)
        window.draw(@@owned_gloves_array[5].display_sprite)
      end
     if s >= 6 && @@owned_gloves_array[6].is_owned == true
        @@owned_gloves_array[6].display_sprite.position = SF.vector2(655, 235)
        window.draw(@@owned_gloves_array[6].display_sprite)
      end
     if s >=  7 && @@owned_gloves_array[7].is_owned == true
        @@owned_gloves_array[7].display_sprite.position = SF.vector2(775, 235)
        window.draw(@@owned_gloves_array[7].display_sprite)
      end
     if s >=  8 && @@owned_gloves_array[8].is_owned == true
       @@owned_gloves_array[8].display_sprite.position = SF.vector2(895, 235)
       window.draw(@@owned_gloves_array[8].display_sprite)
      end
     if s >=  9 && @@owned_gloves_array[9].is_owned == true
       @@owned_gloves_array[9].display_sprite.position = SF.vector2(1015, 235)
       window.draw(@@owned_gloves_array[9].display_sprite)
     end
     end

   def Gloves.determine_array_length(window, this)#--------------array length
      @@owned_gloves_array.uniq!
    if this <= @@owned_gloves_array.size - 1
     case this
      when 0
       selected_gloves = @@owned_gloves_array[0].number
       Clothing::Gloves.select(window, selected_gloves)
      when 1
       selected_gloves = @@owned_gloves_array[1].number
       Clothing::Gloves.select(window, selected_gloves)
      when 2
       selected_gloves = @@owned_gloves_array[2].number
       Clothing::Gloves.select(window, selected_gloves)
      when 3
        selected_gloves = @@owned_gloves_array[3].number
        Clothing::Gloves.select(window, selected_gloves)
      when 4
        selected_gloves = @@owned_gloves_array[4].number
        Clothing::Gloves.select(window, selected_gloves)
      when 5
        selected_gloves = @@owned_gloves_array[5].number
        Clothing::Gloves.select(window, selected_gloves)
      when 6
        selected_gloves = @@owned_gloves_array[6].number
        Clothing::Gloves.select(window, selected_gloves)
      when 7
        selected_gloves = @@owned_gloves_array[7].number
        Clothing::Gloves.select(window, selected_gloves)
      when 8
        selected_gloves = @@owned_gloves_array[8].number
        Clothing::Gloves.select(window, selected_gloves)
      when 9
        selected_gloves = @@owned_gloves_array[9].number
        Clothing::Gloves.select(window, selected_gloves)
    end; end; end
   def Gloves.select(window, selected_gloves)#----------------------select
    gloves_slot = selected_gloves
    Clothing_Outfit_Slot.change_gloves(gloves_slot, window)
    end
   def Gloves.sort_by_color#-----------------------------------sort by color
      a = 0; sorted_array = @@owned_gloves_array.dup
      @@owned_gloves_array.clear
     while a < sorted_array.size
      if sorted_array[a].color === "white"
        @@owned_gloves_array.push(sorted_array[a])
       end
       a += 1
      end
      a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "black"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "red"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "orange"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "yellow"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "green"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "blue"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "purple"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "pink"
        @@owned_gloves_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "brown"
        @@owned_gloves_array.push(sorted_array[a])
       end
       a += 1
       end
    end
  #******************************************************************************************************************************************

 # __________________________________________________________________________________________________________________________________________
 #|                                                          Fingerless Gloves                                                              |
 #|_________________________________________________________________________________________________________________________________________|

   @@white_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_01, DISPLAY_FINGERLESS_GLOVE_01, "Black Fingerless Gloves", "white", 0)
   @@red_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_02, DISPLAY_FINGERLESS_GLOVE_02, "Red Fingerless Gloves", "red", 1)
   @@blue_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_03, DISPLAY_FINGERLESS_GLOVE_03, "Blue Fingerless Gloves", "blue", 2)
   @@black_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_04, DISPLAY_FINGERLESS_GLOVE_04, "Black Fingerless Gloves", "black", 3)
   @@orange_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_05, DISPLAY_FINGERLESS_GLOVE_05, "Orange Fingerless Gloves", "orange", 4)
   @@yellow_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_06, DISPLAY_FINGERLESS_GLOVE_06, "Yellow Fingerless Gloves", "yellow", 5)
   @@green_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_07, DISPLAY_FINGERLESS_GLOVE_07, "Green Fingerless Gloves", "green", 6)
   @@purple_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_08, DISPLAY_FINGERLESS_GLOVE_08, "Purple Fingerless Gloves", "purple", 7)
   @@pink_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_09, DISPLAY_FINGERLESS_GLOVE_09, "Pink Fingerless Gloves", "pink", 8)
   @@brown_fingerless_gloves = Gloves.new(true, FINGERLESS_GLOVE_10, DISPLAY_FINGERLESS_GLOVE_10, "Brown Fingerless Gloves", "brown", 9)

 #-------------------------------------------------------------------------------------------------------------------------------------------
 end

#SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
#S                                                               Shirts                                                                     S
#SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
 class Shirt < Window_Class 
   include Gui; include Player_Data
  # __________________________________________________________________________________________________________________________________________
  #|                                                           initialize                                                                    |
  #|_________________________________________________________________________________________________________________________________________|
   def initialize(is_owned : Bool, char_sprite : SF::Sprite, display_sprite : SF::Sprite, name : String, color : String, sleeve_length : String, number : Int32) 
     @is_owned = is_owned
     @char_sprite = char_sprite
     @display_sprite = display_sprite
     @name = name
     @color = color
     @sleeve_length = sleeve_length
     @number = number 
    end
   def is_owned
     @is_owned
    end
   def char_sprite
     @char_sprite
    end
   def display_sprite
     @display_sprite
    end
   def name
     @name
    end
   def color
     @color
    end
   def sleeve_length
     @sleeve_length
    end
   def number
     @number
    end
  # __________________________________________________________________________________________________________________________________________
  #|                                                    shirt methods and variables                                                          |
  #|_________________________________________________________________________________________________________________________________________|
   #............................................................variables....................................................................
    @@owned_shirt_array = [] of Shirt
    @@shirt_array : Array(Shirt)
    property = @@owned_shirt_array
    @@outfit_shirt_slot : Shirt
    @@outfit_shirt_slot = @@white_t_shirt
    @@shirt_array = [@@white_t_shirt, @@blue_t_shirt, @@red_t_shirt, @@green_t_shirt, @@purple_t_shirt, @@black_t_shirt, @@white_tank_top,
    @@black_tank_top,  @@red_tank_top, @@orange_tank_top, @@yellow_tank_top, @@green_tank_top, @@blue_tank_top, @@purple_tank_top,
    @@pink_tank_top, @@orange_t_shirt, @@yellow_t_shirt, @@pink_t_shirt, @@white_tube_top, @@black_tube_top, @@red_tube_top, @@orange_tube_top,
    @@yellow_tube_top, @@green_tube_top, @@blue_tube_top, @@purple_tube_top, @@pink_tube_top]
   #******************************************************************************************************************************************
   #.............................................................methods......................................................................
    def Shirt.obtain(this)#---------------------------------------obtain
      this.is_owned = true
     end
 
    def Shirt.gather_owned(window)#----------------------------gather obtained
     a = 0; b = @@shirt_array.size
      while a < b 
       if @@shirt_array[a].is_owned == true
         @@owned_shirt_array.push(@@shirt_array[a])
        end
     a += 1
       end; end 
 
    def Shirt.draw(window, @@page)#-----------------------------------------draw
       @@owned_shirt_array.uniq!
       array = @@owned_shirt_array; array_size = @@owned_shirt_array.size
       Shirt.sort_by_color
       @@owned_shirt_array = array
       s = @@owned_shirt_array.size - 1
     #__________________________page one________________________________________
      if @@page == 1
      #-------------------------row one-----------------------------------------
       if s >= 0 && @@owned_shirt_array[0].is_owned == true
         @@owned_shirt_array[0].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[0].display_sprite.position = SF.vector2(650, 360)
         window.draw(@@owned_shirt_array[0].display_sprite)
        end
       if s >= 1 && @@owned_shirt_array[1].is_owned == true
         @@owned_shirt_array[1].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[1].display_sprite.position = SF.vector2(770, 360)
         window.draw(@@owned_shirt_array[1].display_sprite)
        end
       if s >=  2 && @@owned_shirt_array[2].is_owned == true
         @@owned_shirt_array[2].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[2].display_sprite.position = SF.vector2(880, 360)
         window.draw(@@owned_shirt_array[2].display_sprite)
        end
       if s >=  3 && @@owned_shirt_array[3].is_owned == true
         @@owned_shirt_array[3].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[3].display_sprite.position = SF.vector2(990, 360)
         window.draw(@@owned_shirt_array[3].display_sprite)
       end
       if s >=  4 && @@owned_shirt_array[4].is_owned == true
         @@owned_shirt_array[4].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[4].display_sprite.position = SF.vector2(1110, 360)
         window.draw(@@owned_shirt_array[4].display_sprite)
       end
      #-------------------------row two-----------------------------------------
       if s >=  5 && @@owned_shirt_array[5].is_owned == true
         @@owned_shirt_array[5].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[5].display_sprite.position = SF.vector2(650, 460)
         window.draw(@@owned_shirt_array[5].display_sprite)
       end
       if s >=  6 && @@owned_shirt_array[6].is_owned == true
        @@owned_shirt_array[6].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_shirt_array[6].display_sprite.position = SF.vector2(770, 460)
        window.draw(@@owned_shirt_array[6].display_sprite)
       end
       if s >=  7 && @@owned_shirt_array[7].is_owned == true
        @@owned_shirt_array[7].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_shirt_array[7].display_sprite.position = SF.vector2(880, 460)
        window.draw(@@owned_shirt_array[7].display_sprite)
       end
       if s >=  8 && @@owned_shirt_array[8].is_owned == true
        @@owned_shirt_array[8].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_shirt_array[8].display_sprite.position = SF.vector2(990, 460)
        window.draw(@@owned_shirt_array[8].display_sprite)
       end
       if s >=  9 && @@owned_shirt_array[9].is_owned == true
        @@owned_shirt_array[9].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_shirt_array[9].display_sprite.position = SF.vector2(1110, 460)
        window.draw(@@owned_shirt_array[9].display_sprite)
       end
      #-----------------------row three-----------------------------------------   
       if s >=  10 && @@owned_shirt_array[10].is_owned == true
        @@owned_shirt_array[10].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@owned_shirt_array[10].display_sprite.position = SF.vector2(650, 560)
        window.draw(@@owned_shirt_array[10].display_sprite)
       end
       if s >=  11 && @@owned_shirt_array[11].is_owned == true
         @@owned_shirt_array[11].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[11].display_sprite.position = SF.vector2(770, 560)
         window.draw(@@owned_shirt_array[11].display_sprite)
        end
        if s >=  12 && @@owned_shirt_array[12].is_owned == true
         @@owned_shirt_array[12].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[12].display_sprite.position = SF.vector2(880, 560)
         window.draw(@@owned_shirt_array[12].display_sprite)
        end
        if s >=  13 && @@owned_shirt_array[13].is_owned == true
         @@owned_shirt_array[13].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[13].display_sprite.position = SF.vector2(990, 560)
         window.draw(@@owned_shirt_array[13].display_sprite)
        end
        if s >=  14 && @@owned_shirt_array[14].is_owned == true
         @@owned_shirt_array[14].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[14].display_sprite.position = SF.vector2(1110, 560)
         window.draw(@@owned_shirt_array[14].display_sprite)
        end; end
     #__________________________page two________________________________________
       if @@page == 2
       #-------------------------row one-----------------------------------------
        if s >= 15 && @@owned_shirt_array[15].is_owned == true
          @@owned_shirt_array[15].display_sprite.scale = SF.vector2(2.5, 2.5)
          @@owned_shirt_array[15].display_sprite.position = SF.vector2(650, 360)
          window.draw(@@owned_shirt_array[15].display_sprite)
         end
        if s >= 16 && @@owned_shirt_array[16].is_owned == true
          @@owned_shirt_array[16].display_sprite.scale = SF.vector2(2.5, 2.5)
          @@owned_shirt_array[16].display_sprite.position = SF.vector2(770, 360)
          window.draw(@@owned_shirt_array[16].display_sprite)
         end
        if s >=  17 && @@owned_shirt_array[17].is_owned == true
          @@owned_shirt_array[17].display_sprite.scale = SF.vector2(2.5, 2.5)
          @@owned_shirt_array[17].display_sprite.position = SF.vector2(880, 360)
          window.draw(@@owned_shirt_array[17].display_sprite)
         end
        if s >=  18 && @@owned_shirt_array[18].is_owned == true
          @@owned_shirt_array[18].display_sprite.scale = SF.vector2(2.5, 2.5)
          @@owned_shirt_array[18].display_sprite.position = SF.vector2(990, 360)
          window.draw(@@owned_shirt_array[18].display_sprite)
        end
        if s >=  19 && @@owned_shirt_array[19].is_owned == true
          @@owned_shirt_array[19].display_sprite.scale = SF.vector2(2.5, 2.5)
          @@owned_shirt_array[19].display_sprite.position = SF.vector2(1110, 360)
          window.draw(@@owned_shirt_array[19].display_sprite)
        end
       #-------------------------row two-----------------------------------------
        if s >=  20 && @@owned_shirt_array[20].is_owned == true
         @@owned_shirt_array[20].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[20].display_sprite.position = SF.vector2(650, 460)
         window.draw(@@owned_shirt_array[20].display_sprite)
        end
        if s >=  21 && @@owned_shirt_array[21].is_owned == true
         @@owned_shirt_array[21].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[21].display_sprite.position = SF.vector2(770, 460)
         window.draw(@@owned_shirt_array[21].display_sprite)
        end
        if s >=  22 && @@owned_shirt_array[22].is_owned == true
         @@owned_shirt_array[22].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[22].display_sprite.position = SF.vector2(880, 460)
         window.draw(@@owned_shirt_array[22].display_sprite)
        end
        if s >=  23 && @@owned_shirt_array[23].is_owned == true
         @@owned_shirt_array[23].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[23].display_sprite.position = SF.vector2(990, 460)
         window.draw(@@owned_shirt_array[23].display_sprite)
        end
        if s >=  24 && @@owned_shirt_array[24].is_owned == true
         @@owned_shirt_array[24].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[24].display_sprite.position = SF.vector2(1110, 460)
         window.draw(@@owned_shirt_array[24].display_sprite)
        end
       #-----------------------row three-----------------------------------------   
        if s >=  25 && @@owned_shirt_array[25].is_owned == true
         @@owned_shirt_array[25].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[25].display_sprite.position = SF.vector2(650, 560)
         window.draw(@@owned_shirt_array[25].display_sprite)
        end
        if s >=  26 && @@owned_shirt_array[26].is_owned == true
         @@owned_shirt_array[26].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[26].display_sprite.position = SF.vector2(770, 560)
         window.draw(@@owned_shirt_array[26].display_sprite)
        end
        if s >=  27 && @@owned_shirt_array[27].is_owned == true
         @@owned_shirt_array[27].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[27].display_sprite.position = SF.vector2(880, 560)
         window.draw(@@owned_shirt_array[27].display_sprite)
        end
        if s >=  28 && @@owned_shirt_array[28].is_owned == true
         @@owned_shirt_array[28].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[28].display_sprite.position = SF.vector2(990, 560)
         window.draw(@@owned_shirt_array[28].display_sprite)
        end
        if s >=  29 && @@owned_shirt_array[29].is_owned == true
         @@owned_shirt_array[29].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@owned_shirt_array[29].display_sprite.position = SF.vector2(1110, 560)
         window.draw(@@owned_shirt_array[29].display_sprite)
        end; end; end
    def Shirt.determine_array_length(window, this)#--------------array length
     @@owned_shirt_array.uniq!
     if this <= @@owned_shirt_array.size - 1
      case this
       when 0
        selected_shirt = @@owned_shirt_array[0].number
        Clothing::Shirt.select(window, selected_shirt)
       when 1
        selected_shirt = @@owned_shirt_array[1].number
        Clothing::Shirt.select(window, selected_shirt)
       when 2
        selected_shirt = @@owned_shirt_array[2].number
        Clothing::Shirt.select(window, selected_shirt)
       when 3
        selected_shirt = @@owned_shirt_array[3].number
        Clothing::Shirt.select(window, selected_shirt)
       when 4
        selected_shirt = @@owned_shirt_array[4].number
        Clothing::Shirt.select(window, selected_shirt)
       when 5
        selected_shirt = @@owned_shirt_array[5].number
        Clothing::Shirt.select(window, selected_shirt)
       when 6
        selected_shirt = @@owned_shirt_array[6].number
        Clothing::Shirt.select(window, selected_shirt)
       when 7
        selected_shirt = @@owned_shirt_array[7].number
        Clothing::Shirt.select(window, selected_shirt)
       when 8
        selected_shirt = @@owned_shirt_array[8].number
        Clothing::Shirt.select(window, selected_shirt)
       when 9
        selected_shirt = @@owned_shirt_array[9].number
        Clothing::Shirt.select(window, selected_shirt)
       when 10
        selected_shirt = @@owned_shirt_array[10].number
        Clothing::Shirt.select(window, selected_shirt)
       when 11
        selected_shirt = @@owned_shirt_array[11].number
        Clothing::Shirt.select(window, selected_shirt)
       when 12
        selected_shirt = @@owned_shirt_array[12].number
        Clothing::Shirt.select(window, selected_shirt)
       when 13
        selected_shirt = @@owned_shirt_array[13].number
        Clothing::Shirt.select(window, selected_shirt)
       when 14
        selected_shirt = @@owned_shirt_array[14].number
        Clothing::Shirt.select(window, selected_shirt)
       when 15
        selected_shirt = @@owned_shirt_array[15].number
        Clothing::Shirt.select(window, selected_shirt)
       when 16
        selected_shirt = @@owned_shirt_array[16].number
        Clothing::Shirt.select(window, selected_shirt)
       when 17
        selected_shirt = @@owned_shirt_array[17].number
        Clothing::Shirt.select(window, selected_shirt)
       when 18
        selected_shirt = @@owned_shirt_array[18].number
        Clothing::Shirt.select(window, selected_shirt)
       when 19
        selected_shirt = @@owned_shirt_array[19].number
        Clothing::Shirt.select(window, selected_shirt)
       when 20
        selected_shirt = @@owned_shirt_array[20].number
        Clothing::Shirt.select(window, selected_shirt)
       when 21
        selected_shirt = @@owned_shirt_array[21].number
        Clothing::Shirt.select(window, selected_shirt)
       when 22
        selected_shirt = @@owned_shirt_array[22].number
        Clothing::Shirt.select(window, selected_shirt)
       when 23
        selected_shirt = @@owned_shirt_array[23].number
        Clothing::Shirt.select(window, selected_shirt)
       when 24
        selected_shirt = @@owned_shirt_array[24].number
        Clothing::Shirt.select(window, selected_shirt)
       when 25
         selected_shirt = @@owned_shirt_array[25].number
         Clothing::Shirt.select(window, selected_shirt)
       when 26
         selected_shirt = @@owned_shirt_array[26].number
         Clothing::Shirt.select(window, selected_shirt)
       when 27
         selected_shirt = @@owned_shirt_array[27].number
         Clothing::Shirt.select(window, selected_shirt)
       when 28
         selected_shirt = @@owned_shirt_array[28].number
         Clothing::Shirt.select(window, selected_shirt)
       when 29
         selected_shirt = @@owned_shirt_array[29].number
         Clothing::Shirt.select(window, selected_shirt)
       end; end; end
  
    def Shirt.select(window, selected_shirt)#----------------------select
     shirt_slot = selected_shirt
     Clothing_Outfit_Slot.change_shirt(shirt_slot, window)
       end
  
    def Shirt.sort_by_color#-----------------------------------sort by color
      a = 0; sorted_array = @@owned_shirt_array.dup
      @@owned_shirt_array.clear
     while a < sorted_array.size
      if sorted_array[a].color === "white"
        @@owned_shirt_array.push(sorted_array[a])
       end
       a += 1
      end
      a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "black"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "red"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "orange"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "yellow"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "green"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "blue"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "purple"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
       a = 0
     while a < sorted_array.size
      if sorted_array[a].color === "pink"
        @@owned_shirt_array.push(sorted_array[a])
       end
        a += 1
       end
    end
    #white, black, red, orange, yellow, green, blue, purple, pink
  # __________________________________________________________________________________________________________________________________________
  #|                                                          T-Shirts                                                                       |
  #|_________________________________________________________________________________________________________________________________________|
   @@white_t_shirt = Shirt.new(true, T_SHIRT_01, DISPLAY_T_SHIRT_01, "White T-Shirt", "white", "short", 0)  
   @@blue_t_shirt = Shirt.new(true, T_SHIRT_02, DISPLAY_T_SHIRT_02, "Blue T-Shirt", "blue", "short", 1)
   @@red_t_shirt = Shirt.new(true, T_SHIRT_03, DISPLAY_T_SHIRT_03, "Red T-Shirt", "red", "short", 2)
   @@green_t_shirt = Shirt.new(true, T_SHIRT_04, DISPLAY_T_SHIRT_04, "Green T-Shirt", "green", "short", 3)
   @@purple_t_shirt = Shirt.new(true, T_SHIRT_05, DISPLAY_T_SHIRT_05, "Purple T-Shirt", "purple", "short", 4) 
   @@black_t_shirt = Shirt.new(true, T_SHIRT_06, DISPLAY_T_SHIRT_06, "Black T-Shirt", "black", "short", 5) 
   @@orange_t_shirt = Shirt.new(true, T_SHIRT_07, DISPLAY_T_SHIRT_07, "Orange T-Shirt", "orange", "short", 15) 
   @@yellow_t_shirt = Shirt.new(true, T_SHIRT_08, DISPLAY_T_SHIRT_08, "Yellow T-Shirt", "yellow", "short", 16) 
   @@pink_t_shirt = Shirt.new(true, T_SHIRT_09, DISPLAY_T_SHIRT_09, "Pink T-Shirt", "pink", "short", 17) 
  # __________________________________________________________________________________________________________________________________________
  #|                                                          Tank Tops                                                                      |
  #|_________________________________________________________________________________________________________________________________________|
   @@white_tank_top = Shirt.new(true, TANK_TOP_01, DISPLAY_TANK_TOP_01, "White_Tank_Top", "white", "short", 6)
   @@black_tank_top = Shirt.new(true, TANK_TOP_02, DISPLAY_TANK_TOP_02, "Black_Tank_Top", "black", "short", 7)
   @@red_tank_top = Shirt.new(true, TANK_TOP_03, DISPLAY_TANK_TOP_03, "Red_Tank_Top", "red", "short", 8)
   @@orange_tank_top = Shirt.new(true, TANK_TOP_04, DISPLAY_TANK_TOP_04, "Orange_Tank_Top", "orange", "short", 9)
   @@yellow_tank_top = Shirt.new(true, TANK_TOP_05, DISPLAY_TANK_TOP_05, "Yellow_Tank_Top", "yellow", "short", 10)
   @@green_tank_top = Shirt.new(true, TANK_TOP_06, DISPLAY_TANK_TOP_06, "Green_Tank_Top", "green", "short", 11)
   @@blue_tank_top = Shirt.new(true, TANK_TOP_07, DISPLAY_TANK_TOP_07, "Blue_Tank_Top", "blue", "short", 12)
   @@purple_tank_top = Shirt.new(true, TANK_TOP_08, DISPLAY_TANK_TOP_08, "Purple_Tank_Top", "purple", "short", 13)
   @@pink_tank_top = Shirt.new(true, TANK_TOP_09, DISPLAY_TANK_TOP_09, "Pink_Tank_Top", "pink", "short", 14)
  # __________________________________________________________________________________________________________________________________________
  #|                                                          Tube Tops                                                                      |
  #|_________________________________________________________________________________________________________________________________________|
   @@white_tube_top = Shirt.new(true, TUBE_TOP_01, DISPLAY_TUBE_TOP_01, "White_Tube_Top", "white", "none", 18)
   @@black_tube_top = Shirt.new(true, TUBE_TOP_02, DISPLAY_TUBE_TOP_02, "Black_Tube_Top", "black", "none", 19)
   @@red_tube_top = Shirt.new(true, TUBE_TOP_03, DISPLAY_TUBE_TOP_03, "Red_Tube_Top", "red", "none", 20)
   @@orange_tube_top = Shirt.new(true, TUBE_TOP_04, DISPLAY_TUBE_TOP_04, "Orange_Tube_Top", "orange", "none", 21)
   @@yellow_tube_top = Shirt.new(true, TUBE_TOP_05, DISPLAY_TUBE_TOP_05, "Yellow_Tube_Top", "yellow", "none", 22)
   @@green_tube_top = Shirt.new(true, TUBE_TOP_06, DISPLAY_TUBE_TOP_06, "Green_Tube_Top", "green", "none", 23)
   @@blue_tube_top = Shirt.new(true, TUBE_TOP_07, DISPLAY_TUBE_TOP_07, "Blue_Tube_Top", "blue", "none", 24)
   @@purple_tube_top = Shirt.new(true, TUBE_TOP_08, DISPLAY_TUBE_TOP_08, "Purple_Tube_Top", "purple", "none", 25)
   @@pink_tube_top = Shirt.new(true, TUBE_TOP_09, DISPLAY_TUBE_TOP_09, "Pink_Tube_Top", "pink", "none", 26)
   end
   end
 end
#____________________________________________________________________________________________________________________________________________









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




# class Person
#   def initialize(name : String)
#     @name = name
#     @age = 0
#   end

#   def name
#     @name
#   end

#   def age
#     @age
#   end
# end

# john = Person.new "John"
# john.name

# if SF::Keyboard.key_pressed?(SF::Keyboard::A) #-------------------turbo mode motherfucker! So much glitch, so little time!
#   #Player_Physics.wasd_left(@@player_character_rendered_model)
# end
# if SF::Keyboard.key_pressed?(SF::Keyboard::D)
#  SF::Event::KeyPressed
#   #Player_Physics.wasd_right(@@player_character_rendered_model)
# end