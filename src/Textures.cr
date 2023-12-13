#|||||||||||||||||||||||||||||||||||||||||||||||||||||||Textures|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  Ground = SF::RectangleShape.new(SF.vector2(10000, 500)); Ground.fill_color = SF.color(0, 255, 100)
  Ground.position = SF.vector2(-5000, 800)

  Test_Platform_01 = SF::RectangleShape.new(SF.vector2(5000, 5)); Test_Platform_01.fill_color = SF.color(0, 255, 100)
  Test_Platform_01.position = SF.vector2(0, 400)

  Test_Platform_02 = SF::RectangleShape.new(SF.vector2(5000, 5)); Test_Platform_02.fill_color = SF.color(0, 255, 100)
  Test_Platform_02.position = SF.vector2(0, 200)
#------------------------------------------------------------------------------------------------------------------------------------
#                                                    Menu Textures
#-----------------------------------------------------------------------------------------------------------------------------------
 WOOD_TEXTURE_1 = SF::Texture.from_file("graphics/Wood01.png"); WALLPAPER_1 = SF::Texture.from_file("graphics/Wallpaper_01.png")
 CABINET_01_TEXTURE = SF::Texture.from_file("graphics/Cabinet01.png"); CURSOR_TEXTURE_1 = SF::Texture.from_file("graphics/Cursor.png")
 CHAR_CREATE_CURSOR_TEXTURE_1 = SF::Texture.from_file("graphics/Char_Create_Cursor.png"); MENU_TEXTURE_1 = SF::Texture.from_file("graphics/sys_menu.png")
 INVENTORY_GRID_01 = SF::Texture.from_file("graphics/Inventory.png"); INVENTORY_TAB_01 = SF::Texture.from_file("graphics/Inventory_Tab.png")
#------------------------------------------------------------------------------------------------------------------------------------
#                                                  Character Textures
#------------------------------------------------------------------------------------------------------------------------------------
 CHAR_SKIN = SF::Texture.from_file("graphics/Char_Skin.png")
#____________________________________________________________________________________________________________________________________
#||||||||||||||||||||||||||||||||||||||||||||||||||Shapes and Sprites||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#------------------------------------------------------------------------------------------------------------------------------------
#                                                      Main Menu
#------------------------------------------------------------------------------------------------------------------------------------
 #______________________________________________________Cursor_______________________________________________________________________
  Cursor_opt1.texture_rect = SF.int_rect(0, 0, 62, 65); Cursor_opt1.position = SF.vector2(750, 610)
  Cursor_opt1 = SF::Sprite.new(CURSOR_TEXTURE_1) 
 #______________________________________________________Title________________________________________________________________________
  Text_Title = SF::Text.new; Text_Title.font = FONT_TITLE; Text_Title.string = "Crystal Meth!"; Text_Title.character_size = 80
  Text_Title.color = SF::Color::White; Text_Title.style = (SF::Text::Bold); Text_Title.position = SF.vector2(650, 50)
 #__________________________________________________Main Menu Body___________________________________________________________________
  Rectangle_Menu = SF::RectangleShape.new(SF.vector2(650, 300)); Rectangle_Menu.fill_color = SF.color(150, 50, 50)
  Rectangle_Menu.outline_thickness = 7; Rectangle_Menu.outline_color = SF.color(150, 150, 150)
  Rectangle_Menu.position = SF.vector2(625, 550)
 #________________________________________________Main Menu Option 1_________________________________________________________________
  Rectangle_Opt1 = SF::RectangleShape.new(SF.vector2(500, 100)); Rectangle_Opt1.fill_color = SF.color(100, 50, 50)
  Rectangle_Opt1.outline_thickness = 5; Rectangle_Opt1.outline_color = SF.color(150, 150, 150)
  Rectangle_Opt1.position = SF.vector2(700, 590); Text_Opt1 = SF::Text.new; Text_Opt1.font = FONT_TITLE
  Text_Opt1.string = "Play"; Text_Opt1.character_size = 50; Text_Opt1.color = SF::Color::White
  Text_Opt1.style = (SF::Text::Bold); Text_Opt1.position = SF.vector2(880, 610)
 #________________________________________________Main Menu Option 2_________________________________________________________________
  Rectangle_Opt2 = SF::RectangleShape.new(SF.vector2(500, 100)); Rectangle_Opt2.fill_color = SF.color(100, 50, 50)
  Rectangle_Opt2.outline_thickness = 5; Rectangle_Opt2.outline_color = SF.color(150, 150, 150)
  Rectangle_Opt2.position = SF.vector2(700, 710); Text_Opt2 = SF::Text.new; Text_Opt2.font = FONT_TITLE
  Text_Opt2.string = "Quit"; Text_Opt2.character_size = 50; Text_Opt2.color = SF::Color::White
  Text_Opt2.style = (SF::Text::Bold); Text_Opt2.position = SF.vector2(880, 730)
#------------------------------------------------------------------------------------------------------------------------------------
#                                                   Charselect Menu
#------------------------------------------------------------------------------------------------------------------------------------
 #_____________________________________________________Ground________________________________________________________________________
  Rectangle_Charmenu_Ground = SF::RectangleShape.new(SF.vector2(8000, 700)); Rectangle_Charmenu_Ground.fill_color = SF.color(50, 150, 50)
  Rectangle_Charmenu_Ground.position = SF.vector2(0, 500)  
 #_______________________________________________Char Blocks Outer___________________________________________________________________
  Rectangle_CharOuter_1 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_1.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_1.position = SF.vector2(100, 400)
  
  Rectangle_CharOuter_2 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_2.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_2.position = SF.vector2(600, 400)
  
  Rectangle_CharOuter_3 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_3.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_3.position = SF.vector2(1100, 400)
  
  Rectangle_CharOuter_4 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_4.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_4.position = SF.vector2(1600, 400)
  
  Rectangle_CharOuter_5 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_5.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_5.position = SF.vector2(350, 600)
  
  Rectangle_CharOuter_6 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_6.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_6.position = SF.vector2(850, 600)
  
  Rectangle_CharOuter_7 = SF::RectangleShape.new(SF.vector2(200, 300)); Rectangle_CharOuter_7.fill_color = SF.color(50, 50, 150)
  Rectangle_CharOuter_7.position = SF.vector2(1350, 600)
 #_______________________________________________Char Blocks Inner___________________________________________________________________
  Rectangle_CharInner_0 = SF::RectangleShape.new(SF.vector2(96, 128));
  
  Rectangle_CharInner_1 = SF::RectangleShape.new(SF.vector2(96, 128)); Rectangle_CharInner_1.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_1.position = SF.vector2(150, 500)
  #Char_Skin01.position = SF.vector2(150, 515)
  
  Rectangle_CharInner_2 = SF::RectangleShape.new(SF.vector2(100, 150)); Rectangle_CharInner_2.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_2.position = SF.vector2(650, 500)
  
  Rectangle_CharInner_3 = SF::RectangleShape.new(SF.vector2(100, 150)); Rectangle_CharInner_3.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_3.position = SF.vector2(1150, 500)
  
  Rectangle_CharInner_4 = SF::RectangleShape.new(SF.vector2(100, 150)); Rectangle_CharInner_4.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_4.position = SF.vector2(1650, 500)
  
  Rectangle_CharInner_5 = SF::RectangleShape.new(SF.vector2(100, 150)); Rectangle_CharInner_5.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_5.position = SF.vector2(400, 700)
  
  Rectangle_CharInner_6 = SF::RectangleShape.new(SF.vector2(100, 150)); Rectangle_CharInner_6.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_6.position = SF.vector2(900, 700)
  
  Rectangle_CharInner_7 = SF::RectangleShape.new(SF.vector2(100, 150)); Rectangle_CharInner_7.fill_color = SF.color(150, 250, 50)
  Rectangle_CharInner_7.position = SF.vector2(1400, 700)
 #__________________________________________________Info Blocks______________________________________________________________________
 Info_Block_1 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_1.fill_color = SF.color(150, 250, 150)
 Info_Block_1.position = SF.vector2(90, 680); Info_Block_1.outline_thickness = 3.5; Info_Block_1.outline_color = SF.color(150, 150, 150)
 
 Info_Block_2 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_2.fill_color = SF.color(150, 250, 150)
 Info_Block_2.position = SF.vector2(590, 680); Info_Block_2.outline_thickness = 3.5; Info_Block_2.outline_color = SF.color(150, 150, 150)
 
 Info_Block_3 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_3.fill_color = SF.color(150, 250, 150)
 Info_Block_3.position = SF.vector2(1090, 680); Info_Block_3.outline_thickness = 3.5; Info_Block_3.outline_color = SF.color(150, 150, 150)
 
 Info_Block_4 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_4.fill_color = SF.color(150, 250, 150)
 Info_Block_4.position = SF.vector2(1590, 680); Info_Block_4.outline_thickness = 3.5; Info_Block_4.outline_color = SF.color(150, 150, 150)
 
 Info_Block_5 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_5.fill_color = SF.color(150, 250, 150)
 Info_Block_5.position = SF.vector2(340, 880); Info_Block_5.outline_thickness = 3.5; Info_Block_5.outline_color = SF.color(150, 150, 150)
 
 Info_Block_6 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_6.fill_color = SF.color(150, 250, 150)
 Info_Block_6.position = SF.vector2(840, 880); Info_Block_6.outline_thickness = 3.5; Info_Block_6.outline_color = SF.color(150, 150, 150)
 
 Info_Block_7 = SF::RectangleShape.new(SF.vector2(220, 150)); Info_Block_7.fill_color = SF.color(150, 250, 150)
 Info_Block_7.position = SF.vector2(1340, 880); Info_Block_7.outline_thickness = 3.5; Info_Block_7.outline_color = SF.color(150, 150, 150)
#------------------------------------------------------------------------------------------------------------------------------------
#                                                Character Creation Menu
#-----------------------------------------------------------------------------------------------------------------------------------
 #______________________________________________________Backwall____________________________________________________________________
  Rectangle_Charcreation_Backwall = SF::RectangleShape.new(SF.vector2(8000, 600)); Rectangle_Charcreation_Backwall.position = SF.vector2(0, 0);
  Rectangle_Charcreation_Backwall.set_texture(WALLPAPER_1, reset_rect: false)
 #_______________________________________________________Ground_____________________________________________________________________
  Rectangle_Charcreation_Ground.position = SF.vector2(0, 600); Rectangle_Charcreation_Ground = SF::Sprite.new(WOOD_TEXTURE_1)
 #______________________________________________________Dresser 1___________________________________________________________________
  Rectangle_Dresser_01 = SF::RectangleShape.new(SF.vector2(330, 900)); Rectangle_Dresser_01.fill_color = SF.color(210, 210, 255)
  Rectangle_Dresser_01.position = SF.vector2(210, 10); Rectangle_Dresser_01.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Dresser_01.outline_thickness = 1; Rectangle_Dresser_01.outline_color = SF.color(30, 15, 0)
 #______________________________________________________Dresser 2___________________________________________________________________
  Rectangle_Dresser_02 = SF::RectangleShape.new(SF.vector2(610, 900)); Rectangle_Dresser_02.fill_color = SF.color(210, 210, 255)
  Rectangle_Dresser_02.position = SF.vector2(1130, 10); Rectangle_Dresser_02.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Dresser_02.outline_thickness = 1; Rectangle_Dresser_02.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 1____________________________________________________________________
  Rectangle_Cubby_01 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_01.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_01.position = SF.vector2(250, 50); Rectangle_Cubby_01.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_01.texture_rect = SF.int_rect(0, 250, 250, 150); Rectangle_Cubby_01.outline_thickness = 1 
  Rectangle_Cubby_01.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 2____________________________________________________________________
  Rectangle_Cubby_02 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_02.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_02.position = SF.vector2(250, 330); Rectangle_Cubby_02.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_02.texture_rect = SF.int_rect(0, 250, 600, 600); Rectangle_Cubby_02.outline_thickness = 1 
  Rectangle_Cubby_02.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 3____________________________________________________________________
  Rectangle_Cubby_03 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_03.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_03.position = SF.vector2(250, 610); Rectangle_Cubby_03.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_03.texture_rect = SF.int_rect(800, 0, 600, 600); Rectangle_Cubby_03.outline_thickness = 1 
  Rectangle_Cubby_03.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 4____________________________________________________________________
  Rectangle_Cubby_04 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_04.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_04.position = SF.vector2(1450, 50); Rectangle_Cubby_04.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_04.texture_rect = SF.int_rect(0, 700, 600, 600); Rectangle_Cubby_04.outline_thickness = 1 
  Rectangle_Cubby_04.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 5____________________________________________________________________
  Rectangle_Cubby_05 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_05.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_05.position = SF.vector2(1450, 330); Rectangle_Cubby_05.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_05.texture_rect = SF.int_rect(700, 700, 600, 600); Rectangle_Cubby_05.outline_thickness = 1 
  Rectangle_Cubby_05.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 6____________________________________________________________________
  Rectangle_Cubby_06 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_06.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_06.position = SF.vector2(1450, 610); Rectangle_Cubby_06.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_06.texture_rect = SF.int_rect(700, 800, 600, 600); Rectangle_Cubby_06.outline_thickness = 1 
  Rectangle_Cubby_06.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cubby 7____________________________________________________________________
  Rectangle_Cubby_07 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_07.fill_color = SF.color(150, 150, 200)
  Rectangle_Cubby_07.position = SF.vector2(1170, 610); Rectangle_Cubby_07.set_texture(WOOD_TEXTURE_1, reset_rect: false)
  Rectangle_Cubby_07.texture_rect = SF.int_rect(700, 900, 600, 600); Rectangle_Cubby_07.outline_thickness = 1 
  Rectangle_Cubby_07.outline_color = SF.color(30, 15, 0)
 #_______________________________________________________Cabinet____________________________________________________________________
  Cabinet_01 = SF::RectangleShape.new(SF.vector2(250, 530)); Cabinet_01.fill_color = SF.color(205, 205, 205)
  Cabinet_01.position = SF.vector2(1170, 50); Cabinet_01.set_texture(CABINET_01_TEXTURE, reset_rect: false)
 #___________________________________________________Left Black Bar_________________________________________________________________
  Left_Black_Bar = SF::RectangleShape.new(SF.vector2(150, 1080)); Left_Black_Bar.fill_color = SF.color(0, 0, 0)
  Left_Black_Bar.position = SF.vector2(0, 0);
 #__________________________________________________Right Black Bar_________________________________________________________________
  Right_Black_Bar = SF::RectangleShape.new(SF.vector2(150, 1080)); Right_Black_Bar.fill_color = SF.color(0, 0, 0)
  Right_Black_Bar.position = SF.vector2(1800, 0);
 #__________________________________________________Bottom Black Bar________________________________________________________________
  Bottom_Black_Bar = SF::RectangleShape.new(SF.vector2(2000, 140)); Bottom_Black_Bar.fill_color = SF.color(0, 0, 0)
  Bottom_Black_Bar.position = SF.vector2(0, 960);
 #_________________________________________________Char Create Cursor_______________________________________________________________
  Char_Creat_Cursor = SF::RectangleShape.new(SF.vector2(295, 25)); #Char_Creat_Cursor.fill_color = SF.color(150, 150, 255)
  Char_Creat_Cursor.position = SF.vector2(225, 285); Char_Creat_Cursor.set_texture(CHAR_CREATE_CURSOR_TEXTURE_1, reset_rect: false)
  Char_Creat_Cursor.texture_rect = SF.int_rect(0, 0, 295, 25)
 #________________________________________________Char Create Popup Box_____________________________________________________________
  #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Body\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   Char_Create_Popup_Box = SF::RectangleShape.new(SF.vector2(500, 300)); Char_Create_Popup_Box.fill_color = SF.color(150, 200, 255)
   Char_Create_Popup_Box.position = SF.vector2(575, 200); Char_Create_Popup_Box.outline_thickness = 2
   Char_Create_Popup_Box.outline_color = SF.color(100, 100, 100)
  #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Option_01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   Char_Create_Popup_Option_01 = SF::RectangleShape.new(SF.vector2(200, 100)); Char_Create_Popup_Option_01.outline_thickness = 2
   Char_Create_Popup_Option_01.fill_color = SF.color(150, 175, 255); Char_Create_Popup_Option_01.position = SF.vector2(590, 385)
   Char_Create_Popup_Option_01.outline_color = SF.color(255, 255, 255)
  #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Option_02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   Char_Create_Popup_Option_02 = SF::RectangleShape.new(SF.vector2(200, 100)); Char_Create_Popup_Option_02.outline_thickness = 2
   Char_Create_Popup_Option_02.fill_color = SF.color(150, 175, 255); Char_Create_Popup_Option_02.position = SF.vector2(860, 385)
   Char_Create_Popup_Option_02.outline_color = SF.color(255, 255, 255)
  #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Body Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   Text_Popup_01 = SF::Text.new; Text_Popup_01.font = FONT_COMMON; Text_Popup_01.string = "   Start new game\nwith this character?" 
   Text_Popup_01.character_size = 30; Text_Popup_01.color = SF::Color::White
   Text_Popup_01.position = SF.vector2(700, 250)
  #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Opt 1 Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   Text_Popup_01_Opt_01 = SF::Text.new; Text_Popup_01_Opt_01.font = FONT_COMMON; Text_Popup_01_Opt_01.string = "Yes" 
   Text_Popup_01_Opt_01.character_size = 30; Text_Popup_01_Opt_01.color = SF::Color::White
   Text_Popup_01_Opt_01.position = SF.vector2(690, 410)
  #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Opt 1 Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   Text_Popup_01_Opt_02 = SF::Text.new; Text_Popup_01_Opt_02.font = FONT_COMMON; Text_Popup_01_Opt_02.string = "No" 
   Text_Popup_01_Opt_02.character_size = 30; Text_Popup_01_Opt_02.color = SF::Color::White
   Text_Popup_01_Opt_02.position = SF.vector2(960, 410) 
#-----------------------------------------------------------------------------------------------------------------------------------
#                                                         HUD
#-----------------------------------------------------------------------------------------------------------------------------------  
 #______________________________________________________Arrows______________________________________________________________________
  UP_ARROW_TEXTURE_01 = SF::Texture.from_file("graphics/Up_Arrow.png")
  Up_Arrow_01 = SF::Sprite.new(UP_ARROW_TEXTURE_01) 
  DOWN_ARROW_TEXTURE_01 = SF::Texture.from_file("graphics/Down_Arrow.png")
  Down_Arrow_01 = SF::Sprite.new(DOWN_ARROW_TEXTURE_01)
 #______________________________________________________Bottom______________________________________________________________________
  Bottom_HUD = SF::RectangleShape.new(SF.vector2(2500, 140)); Bottom_HUD.fill_color = SF.color(50, 150, 255)
  Bottom_HUD.position = SF.vector2(0, 950);
 #____________________________________________________System Menu___________________________________________________________________
  System_Menu = SF::RectangleShape.new(SF.vector2(150, 50)); #System_Menu.fill_color = SF.color(50, 50, 255)
  System_Menu.position = SF.vector2(1700, 960); System_Menu.set_texture(MENU_TEXTURE_1, reset_rect: false)
  System_Menu.texture_rect = SF.int_rect(0, 0, 150, 50)

  Text_System_Menu = SF::Text.new; Text_System_Menu.font = FONT_COMMON; Text_System_Menu.string = "Menu"; 
  Text_System_Menu.character_size = 30; Text_System_Menu.color = SF::Color::White; Text_System_Menu.position = SF.vector2(1735, 965) 
 #________________________________________________Extended System Menu______________________________________________________________
  System_Menu_Extended = SF::RectangleShape.new(SF.vector2(150, 150)); #System_Menu_Extended.fill_color = SF.color(50, 50, 255)
  System_Menu_Extended.position = SF.vector2(1700, 810); System_Menu_Extended.set_texture(MENU_TEXTURE_1, reset_rect: false)

  Text_System_Menu_Opt_01 = SF::Text.new; Text_System_Menu_Opt_01.font = FONT_COMMON; Text_System_Menu_Opt_01.string = "Quit"; 
  Text_System_Menu_Opt_01.character_size = 30; Text_System_Menu_Opt_01.color = SF::Color::White; 
  Text_System_Menu_Opt_01.position = SF.vector2(1745, 915) 

  Text_System_Menu_Opt_02 = SF::Text.new; Text_System_Menu_Opt_02.font = FONT_COMMON; Text_System_Menu_Opt_02.string = "Stats"; 
  Text_System_Menu_Opt_02.character_size = 30; Text_System_Menu_Opt_02.color = SF::Color::White; 
  Text_System_Menu_Opt_02.position = SF.vector2(1740, 865) 

  Text_System_Menu_Opt_03 = SF::Text.new; Text_System_Menu_Opt_03.font = FONT_COMMON; Text_System_Menu_Opt_03.string = "System"; 
  Text_System_Menu_Opt_03.character_size = 30; Text_System_Menu_Opt_03.color = SF::Color::White; 
  Text_System_Menu_Opt_03.position = SF.vector2(1725, 815) 
 #_________________________________________________________EXP______________________________________________________________________
  LVL_Box = SF::RectangleShape.new(SF.vector2(115, 115)); LVL_Box.fill_color = SF.color(30, 130, 235)
  LVL_Box.position = SF.vector2(10, 959.5);

  LVL_Bar = SF::RectangleShape.new(SF.vector2(1000, 20)); LVL_Bar.fill_color = SF.color(255, 255, 255)
  LVL_Bar.position = SF.vector2(155, 1049.5);

  LVL_Bar_Color = SF::RectangleShape.new(SF.vector2(996, 16)); LVL_Bar_Color.fill_color = SF.color(255, 255, 0)
  LVL_Bar_Color.position = SF.vector2(157, 1051.5);

  EXP_Label = SF::Text.new; EXP_Label.font = FONT_FANCY_BOLD; EXP_Label.string = "EXP"; EXP_Label.character_size = 20; 
  EXP_Label.color = SF::Color::White; EXP_Label.position = SF.vector2(125, 1048) 

  LVL_Label = SF::Text.new; LVL_Label.font = FONT_FANCY_BOLD; LVL_Label.character_size = 50; 
  LVL_Label.color = SF::Color::White; LVL_Label.position = SF.vector2(60, 988) 
 #_________________________________________________________MP_______________________________________________________________________
  MP_Bar = SF::RectangleShape.new(SF.vector2(1000, 20)); MP_Bar.fill_color = SF.color(255, 255, 255)
  MP_Bar.position = SF.vector2(155, 1019.5);

  MP_Bar_Color = SF::RectangleShape.new(SF.vector2(996, 16)); MP_Bar_Color.fill_color = SF.color(0, 0, 255)
  MP_Bar_Color.position = SF.vector2(157, 1021.5);

  MP_Label = SF::Text.new; MP_Label.font = FONT_FANCY_BOLD; MP_Label.string = "MP"; MP_Label.character_size = 20; 
  MP_Label.color = SF::Color::White; MP_Label.position = SF.vector2(127, 1016) 
 #_________________________________________________________HP_______________________________________________________________________
  HP_Bar = SF::RectangleShape.new(SF.vector2(1000, 20)); HP_Bar.fill_color = SF.color(255, 255, 255)
  HP_Bar.position = SF.vector2(155, 989.5);

  HP_Bar_Color = SF::RectangleShape.new(SF.vector2(996, 16)); HP_Bar_Color.fill_color = SF.color(255, 0, 0)
  HP_Bar_Color.position = SF.vector2(157, 991.5);

  HP_Label = SF::Text.new; HP_Label.font = FONT_FANCY_BOLD; HP_Label.string = "HP"; HP_Label.character_size = 20; 
  HP_Label.color = SF::Color::White; HP_Label.position = SF.vector2(127, 986) 
 #_____________________________________________________Quit Window__________________________________________________________________
  Quit_Window = SF::RectangleShape.new(SF.vector2(500, 300)); Quit_Window.fill_color = SF.color(50, 50, 255)
  Quit_Window.position = SF.vector2(700, 300);
  
  Quit_Menu_Text = SF::Text.new; Quit_Menu_Text.font = FONT_COMMON; Quit_Menu_Text.string = "Do you want to quit?"; 
  Quit_Menu_Text.character_size = 50; Quit_Menu_Text.color = SF::Color::White; Quit_Menu_Text.position = SF.vector2(720, 320)

  Quit_Window_Opt_01 = SF::RectangleShape.new(SF.vector2(170, 100)); Quit_Window_Opt_01.fill_color = SF.color(0, 0, 205)
  Quit_Window_Opt_01.position = SF.vector2(710, 490);

  Quit_Menu_Opt_01_Text = SF::Text.new; Quit_Menu_Opt_01_Text.font = FONT_COMMON; Quit_Menu_Opt_01_Text.string = "Yes"; 
  Quit_Menu_Opt_01_Text.character_size = 50; Quit_Menu_Opt_01_Text.color = SF::Color::White; Quit_Menu_Opt_01_Text.position = SF.vector2(750, 510);

  Quit_Window_Opt_02 = SF::RectangleShape.new(SF.vector2(170, 100)); Quit_Window_Opt_02.fill_color = SF.color(0, 0, 205)
  Quit_Window_Opt_02.position = SF.vector2(1020, 490);

  Quit_Menu_Opt_02_Text = SF::Text.new; Quit_Menu_Opt_02_Text.font = FONT_COMMON; Quit_Menu_Opt_02_Text.string = "No"; 
  Quit_Menu_Opt_02_Text.character_size = 50; Quit_Menu_Opt_02_Text.color = SF::Color::White; Quit_Menu_Opt_02_Text.position = SF.vector2(1070, 510);
 #_____________________________________________________Stats Window__________________________________________________________________
  #.......................................................Body.......................................................................
   Stats_Window = SF::RectangleShape.new(SF.vector2(600, 600)); Stats_Window.fill_color = SF.color(50, 50, 255)
   Stats_Window.position = SF.vector2(700, 200);
 
   Stats_Window_Char_Box = SF::RectangleShape.new(SF.vector2(100, 190)); Stats_Window_Char_Box.fill_color = SF.color(100, 100, 255)
   Stats_Window_Char_Box.position = SF.vector2(710, 210); 
 
   Stats_Window_Exit_Box = SF::RectangleShape.new(SF.vector2(50, 50)); Stats_Window_Exit_Box.fill_color = SF.color(255, 0, 0)
   Stats_Window_Exit_Box.position = SF.vector2(1240, 210);
 
   Stats_Window_LVL_Text = SF::Text.new; Stats_Window_LVL_Text.font = FONT_COMMON; Stats_Window_LVL_Text.character_size = 30; 
   Stats_Window_LVL_Text.color = SF::Color::White; Stats_Window_LVL_Text.position = SF.vector2(840, 250);
 
   Stats_Window_LVL_Text_02 = SF::Text.new; Stats_Window_LVL_Text_02.font = FONT_COMMON; Stats_Window_LVL_Text_02.character_size = 30; 
   Stats_Window_LVL_Text_02.color = SF::Color::White; Stats_Window_LVL_Text_02.position = SF.vector2(840, 220);
 
   Stats_Window_Str_Text = SF::Text.new; Stats_Window_Str_Text.font = FONT_COMMON; Stats_Window_Str_Text.character_size = 25; 
   Stats_Window_Str_Text.color = SF::Color::White; Stats_Window_Str_Text.position = SF.vector2(840, 280);
 
   Stats_Window_Dex_Text = SF::Text.new; Stats_Window_Dex_Text.font = FONT_COMMON; Stats_Window_Dex_Text.character_size = 25; 
   Stats_Window_Dex_Text.color = SF::Color::White; Stats_Window_Dex_Text.position = SF.vector2(950, 280);
 
   Stats_Window_Luk_Text = SF::Text.new; Stats_Window_Luk_Text.font = FONT_COMMON; Stats_Window_Luk_Text.character_size = 25; 
   Stats_Window_Luk_Text.color = SF::Color::White; Stats_Window_Luk_Text.position = SF.vector2(1060, 280);
 
   Stats_Window_Int_Text = SF::Text.new; Stats_Window_Int_Text.font = FONT_COMMON; Stats_Window_Int_Text.character_size = 25; 
   Stats_Window_Int_Text.color = SF::Color::White; Stats_Window_Int_Text.position = SF.vector2(1170, 280);
 
   Stats_Window_HP_Text = SF::Text.new; Stats_Window_HP_Text.font = FONT_COMMON; Stats_Window_HP_Text.character_size = 30; 
   Stats_Window_HP_Text.color = SF::Color::White; Stats_Window_HP_Text.position = SF.vector2(840, 340);
 
   Stats_Window_MP_Text = SF::Text.new; Stats_Window_MP_Text.font = FONT_COMMON; Stats_Window_MP_Text.character_size = 30; 
   Stats_Window_MP_Text.color = SF::Color::White; Stats_Window_MP_Text.position = SF.vector2(1080, 340);
 
   Stats_Window_Name_Text = SF::Text.new; Stats_Window_Name_Text.font = FONT_COMMON; Stats_Window_Name_Text.character_size = 30; 
   Stats_Window_Name_Text.color = SF::Color::White; Stats_Window_Name_Text.position = SF.vector2(710, 400);

  #....................................................Inventory...................................................................
   Inventory_Box = SF::RectangleShape.new(SF.vector2(580, 310)); Inventory_Box.fill_color = SF.color(20, 20, 250)
   Inventory_Box.position = SF.vector2(710, 480); Inventory_Box.set_texture(INVENTORY_GRID_01, reset_rect: false) 
 
   Inventory_Tab_01 = SF::RectangleShape.new(SF.vector2(140, 35)); Inventory_Tab_01.set_texture(INVENTORY_TAB_01, reset_rect: false)
   Inventory_Tab_01.position = SF.vector2(713, 450); Inventory_Tab_01.texture_rect = SF.int_rect(0, 0, 140, 35)
 
   Inventory_Tab_Text_01 = SF::Text.new; Inventory_Tab_Text_01.font = FONT_COMMON; Inventory_Tab_Text_01.string = "Shirts"
   Inventory_Tab_Text_01.color = SF::Color::White; Inventory_Tab_Text_01.position = SF.vector2(755, 450); 
   Inventory_Tab_Text_01.character_size = 20

   Inventory_Tab_02 = SF::RectangleShape.new(SF.vector2(140, 35)); Inventory_Tab_02.set_texture(INVENTORY_TAB_01, reset_rect: false)
   Inventory_Tab_02.position = SF.vector2(857, 450); Inventory_Tab_02.texture_rect = SF.int_rect(0, 0, 140, 35)

   Inventory_Tab_Text_02 = SF::Text.new; Inventory_Tab_Text_02.font = FONT_COMMON; Inventory_Tab_Text_02.string = "Gloves"
   Inventory_Tab_Text_02.color = SF::Color::White; Inventory_Tab_Text_02.position = SF.vector2(900, 450); 
   Inventory_Tab_Text_02.character_size = 20

   Inventory_Tab_03 = SF::RectangleShape.new(SF.vector2(140, 35)); Inventory_Tab_03.set_texture(INVENTORY_TAB_01, reset_rect: false)
   Inventory_Tab_03.position = SF.vector2(1001, 450); Inventory_Tab_03.texture_rect = SF.int_rect(0, 0, 140, 35)

   Inventory_Tab_Text_03 = SF::Text.new; Inventory_Tab_Text_03.font = FONT_COMMON; Inventory_Tab_Text_03.string = "Pants"
   Inventory_Tab_Text_03.color = SF::Color::White; Inventory_Tab_Text_03.position = SF.vector2(1045, 450); 
   Inventory_Tab_Text_03.character_size = 20

   Inventory_Tab_04 = SF::RectangleShape.new(SF.vector2(140, 35)); Inventory_Tab_04.set_texture(INVENTORY_TAB_01, reset_rect: false)
   Inventory_Tab_04.position = SF.vector2(1146, 450); Inventory_Tab_04.texture_rect = SF.int_rect(0, 0, 140, 35)

   Inventory_Tab_Text_04 = SF::Text.new; Inventory_Tab_Text_04.font = FONT_COMMON; Inventory_Tab_Text_04.string = "Shoes"
   Inventory_Tab_Text_04.color = SF::Color::White; Inventory_Tab_Text_04.position = SF.vector2(1186, 450); 
   Inventory_Tab_Text_04.character_size = 20

   Inventory_arrow_up = SF::RectangleShape.new(SF.vector2(20, 40)); Inventory_arrow_up.position = SF.vector2(670, 550);
   Inventory_arrow_up.fill_color = SF.color(255, 100, 100)

   Inventory_arrow_down = SF::RectangleShape.new(SF.vector2(20, 40)); Inventory_arrow_down.position = SF.vector2(670, 650);
   Inventory_arrow_down.fill_color = SF.color(255, 100, 100)
 #__________________________________________________Inventory Window________________________________________________________________  
  INVENTORY_TEXTURE_01 = SF::Texture.from_file("graphics/Inventory_01.png"); INVENTORY_TAB_TEXTURE_01 = SF::Texture.from_file("graphics/Inventory_Tab_01.png"); 
  Inventory_Window.set_texture(INVENTORY_TEXTURE_01, reset_rect: false); Inventory_Window = SF::RectangleShape.new(SF.vector2(1000, 600)); 
  Inventory_Window.position = SF.vector2(500, 200); Weapon_Tab = SF::RectangleShape.new(SF.vector2(200, 70)); 
  Weapon_Tab.position = SF.vector2(800, 160); Weapon_Tab.set_texture(INVENTORY_TAB_TEXTURE_01, reset_rect: false); 
  Weapon_Tab.texture_rect = SF.int_rect(0, 0, 200, 70); Use_Tab = SF::RectangleShape.new(SF.vector2(200, 70)); 
  Use_Tab.position = SF.vector2(1010, 160); Use_Tab.set_texture(INVENTORY_TAB_TEXTURE_01, reset_rect: false); 
  Use_Tab.texture_rect = SF.int_rect(0, 0, 200, 70); Etc_Tab = SF::RectangleShape.new(SF.vector2(200, 70)); 
  Etc_Tab.position = SF.vector2(1220, 160); Etc_Tab.set_texture(INVENTORY_TAB_TEXTURE_01, reset_rect: false);   
  Etc_Tab.texture_rect = SF.int_rect(0, 0, 200, 70); Weapon_Tab_Text = SF::Text.new; Weapon_Tab_Text.font = FONT_FANCY_BOLD
  Weapon_Tab_Text.character_size = 40; Weapon_Tab_Text.color = SF::Color::White; Weapon_Tab_Text.position = SF.vector2(820, 165);
  Weapon_Tab_Text.string = "Equipment"; Use_Tab_Text = Weapon_Tab_Text.dup; Use_Tab_Text.position = SF.vector2(1080, 165);
  Use_Tab_Text.string = "Use"; Etc_Tab_Text = Weapon_Tab_Text.dup; Etc_Tab_Text.position = SF.vector2(1290, 165);
  Etc_Tab_Text.string = "Etc"; 
  Inventory_arrow_up2 = SF::RectangleShape.new(SF.vector2(50, 90)); Inventory_arrow_up2.position = SF.vector2(400, 400);
  Inventory_arrow_up2.fill_color = SF.color(255, 100, 100)
  Inventory_arrow_down2 = SF::RectangleShape.new(SF.vector2(50, 90)); Inventory_arrow_down2.position = SF.vector2(400, 550);
  Inventory_arrow_down2.fill_color = SF.color(255, 100, 100)

  Ore_Button = SF::RectangleShape.new(SF.vector2(90, 50)); Ore_Button.position = SF.vector2(555, 245);
  Ore_Button.fill_color = SF.color(100, 255, 100)
  Ore_Button_Text = SF::Text.new; Ore_Button_Text.font = FONT_BOLD_OUTLINE; Ore_Button_Text.character_size = 30;
  Ore_Button_Text.color = SF::Color::White; Ore_Button_Text.position = SF.vector2(575, 250); Ore_Button_Text.string = "Ores";

  Ingot_Button = SF::RectangleShape.new(SF.vector2(90, 50)); Ingot_Button.position = SF.vector2(655, 245);
  Ingot_Button.fill_color = SF.color(100, 255, 100)
  Ingot_Button_Text = SF::Text.new; Ingot_Button_Text.font = FONT_BOLD_OUTLINE; Ingot_Button_Text.character_size = 30;
  Ingot_Button_Text.color = SF::Color::White; Ingot_Button_Text.position = SF.vector2(670, 250); Ingot_Button_Text.string = "Ingots";

  Gem_Button = SF::RectangleShape.new(SF.vector2(90, 50)); Gem_Button.position = SF.vector2(755, 245);
  Gem_Button.fill_color = SF.color(100, 255, 100)
  Gem_Button_Text = SF::Text.new; Gem_Button_Text.font = FONT_BOLD_OUTLINE; Gem_Button_Text.character_size = 30;
  Gem_Button_Text.color = SF::Color::White; Gem_Button_Text.position = SF.vector2(775, 250); Gem_Button_Text.string = "Gems";

  Ingredient_Button = SF::RectangleShape.new(SF.vector2(130, 50)); Ingredient_Button.position = SF.vector2(555, 245);
  Ingredient_Button.fill_color = SF.color(100, 255, 100)
  Ingredient_Button_Text = SF::Text.new; Ingredient_Button_Text.font = FONT_BOLD_OUTLINE; Ingredient_Button_Text.character_size = 30;
  Ingredient_Button_Text.color = SF::Color::White; Ingredient_Button_Text.position = SF.vector2(565, 250); Ingredient_Button_Text.string = "Ingredients";

  Test_Rectangle_01 = SF::RectangleShape.new(SF.vector2(140, 140));
  Test_Rectangle_01.fill_color = SF.color(155, 155, 255); Test_Rectangle_01.position = SF.vector2(555, 310);
  #--------------------------------------------------Weapon Info Box---------------------------------------------------------------
   Weapon_Info_Box = SF::RectangleShape.new(SF.vector2(300, 175)); Weapon_Info_Box.fill_color = SF.color(200, 200, 200)
   Weapon_Info_Box.position = SF.vector2(200, 150) 
   Weapon_Info_Text = SF::Text.new; Weapon_Info_Text.font = FONT_COMMON; Weapon_Info_Text.character_size = 20
   Weapon_Info_Text.color = SF::Color::Black; Weapon_Info_Text.position = Weapon_Info_Box.position 
   Weapon_Info_Text.string = ""
  #----------------------------------------------------Gem Info Box----------------------------------------------------------------
   Gem_Info_Box = SF::RectangleShape.new(SF.vector2(250, 150)); Gem_Info_Box.fill_color = SF.color(200, 200, 200)
   Gem_Info_Box.position = SF.vector2(200, 150) 
   Gem_Info_Text = SF::Text.new; Gem_Info_Text.font = FONT_COMMON; Gem_Info_Text.character_size = 20
   Gem_Info_Text.color = SF::Color::Black; Gem_Info_Text.position = Gem_Info_Box.position 
   Gem_Info_Text.string = ""
  #--------------------------------------------------Weapon Overlays---------------------------------------------------------------
   #.....................................................Stick.....................................................................
    EARTH_STICK_OVERLAY_TEXTURE = SF::Texture.from_file("graphics/metals/Earth_Stick_Overlay.png")
    Earth_Stick_Overlay = SF::Sprite.new(EARTH_STICK_OVERLAY_TEXTURE) 
  #--------------------------------------------------Weapon Textures---------------------------------------------------------------
   WEAPON_DISPLAY_TEXTURE_01 = SF::Texture.from_file("graphics/Weapons_display.png"); STICK_TEXTURE = SF::Texture.from_file("graphics/Stick01.png");
   Stick01 = SF::Sprite.new(STICK_TEXTURE)
   WEAPON_ARRAY = [Stick01, Zinc_Stick]
   #.....................................................Stick.....................................................................
    Weapon_Rectangle_01 = SF::RectangleShape.new(SF.vector2(140, 140));
    Weapon_Rectangle_01.set_texture(WEAPON_DISPLAY_TEXTURE_01, reset_rect: false);  Weapon_Rectangle_01.position = SF.vector2(555, 310);
    Weapon_Rectangle_01.texture_rect = SF.int_rect(0, 0, 140, 140);
    Nil_Rectangle_01 = SF::RectangleShape.new(SF.vector2(140, 140));
    Nil_Rectangle_01.set_texture(WEAPON_DISPLAY_TEXTURE_01, reset_rect: false);  Nil_Rectangle_01.position = SF.vector2(555, 310);
    Nil_Rectangle_01.texture_rect = SF.int_rect(0, 0, 140, 140); Nil_Rectangle_01.fill_color = SF.color(0, 0, 0, 0)
   #...................................................Zinc Stick...................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     ZINC_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Zinc_Stick.png"); Zinc_Stick = SF::Sprite.new(ZINC_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     ZINC_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Zinc_Stick_Display.png")
     Zinc_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Zinc_Stick_Display.set_texture(ZINC_STICK_DISPLAY_TEXTURE, reset_rect: false);
   #...................................................Tin Stick....................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     TIN_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Tin_Stick.png"); Tin_Stick = SF::Sprite.new(TIN_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     Tin_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Tin_Stick_Display.png")
     Tin_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Tin_Stick_Display.set_texture(Tin_STICK_DISPLAY_TEXTURE, reset_rect: false);
   #..................................................Copper Stick..................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     COPPER_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Copper_Stick.png"); Copper_Stick = SF::Sprite.new(COPPER_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     Copper_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Copper_Stick_Display.png")
     Copper_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Copper_Stick_Display.set_texture(Copper_STICK_DISPLAY_TEXTURE, reset_rect: false);
   #..................................................Brass Stick..................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     BRASS_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Brass_Stick.png"); Brass_Stick = SF::Sprite.new(BRASS_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     BRASS_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Brass_Stick_Display.png")
     Brass_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Brass_Stick_Display.set_texture(BRASS_STICK_DISPLAY_TEXTURE, reset_rect: false);
   #..................................................Bronze Stick..................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     BRONZE_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Bronze_Stick.png"); Bronze_Stick = SF::Sprite.new(BRONZE_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     BRONZE_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Bronze_Stick_Display.png")
     Bronze_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Bronze_Stick_Display.set_texture(BRONZE_STICK_DISPLAY_TEXTURE, reset_rect: false);
   #...................................................Iron Stick...................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     IRON_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Iron_Stick.png"); Iron_Stick = SF::Sprite.new(IRON_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     IRON_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Iron_Stick_Display.png")
     Iron_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Iron_Stick_Display.set_texture(IRON_STICK_DISPLAY_TEXTURE, reset_rect: false);
   #..................................................Steel Stick...................................................................
    #---------------------------------------------------Sprite----------------------------------------------------------------------
     STEEL_STICK_TEXTURE = SF::Texture.from_file("graphics/weapons/Steel_Stick.png"); Steel_Stick = SF::Sprite.new(STEEL_STICK_TEXTURE)
    #---------------------------------------------------Display---------------------------------------------------------------------
     STEEL_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Steel_Stick_Display.png")
     Steel_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
     Steel_Stick_Display.set_texture(STEEL_STICK_DISPLAY_TEXTURE, reset_rect: false);
  #--------------------------------------------------ETC item Textures--------------------------------------------------------------
   #......................................................Rocks.....................................................................
     Ore_amount_owned_text = SF::Text.new; Ore_amount_owned_text.font = FONT_COMMON; Ore_amount_owned_text.character_size = 20
    #''''''''''''''''''''''''''''''''''''''''''''''''''Bloodstone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLOODSTONE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone_Ore.png")
     Bloodstone_Inventory_Ore = SF::Sprite.new(BLOODSTONE_INVENTORY_ORE_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''''Moss Agate''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
     MOSS_AGATE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate_Ore.png")
     Moss_Agate_Inventory_Ore = SF::Sprite.new(MOSS_AGATE_INVENTORY_ORE_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Amber''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
     AMBER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber_Ore.png")
     Amber_Inventory_Ore = SF::Sprite.new(AMBER_INVENTORY_ORE_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Wavellite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
     WAVELLITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite_ore.png")
     Wavellite_Inventory_Ore = SF::Sprite.new(WAVELLITE_INVENTORY_ORE_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Topaz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     TOPAZ_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz_ore.png")
     Topaz_Inventory_Ore = SF::Sprite.new(TOPAZ_INVENTORY_ORE_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Amethyst'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     AMETHYST_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_ore.png")
     Amethyst_Inventory_Ore = SF::Sprite.new(AMETHYST_INVENTORY_ORE_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''''Smokey Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
     SMOKEY_QUARTZ_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz_Ore.png")
     Smokey_Quartz_Inventory_Ore = SF::Sprite.new(SMOKEY_QUARTZ_INVENTORY_ORE_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Sapphire'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
     SAPPHIRE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire_Ore.png")
     Sapphire_Inventory_Ore = SF::Sprite.new(SAPPHIRE_INVENTORY_ORE_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Black Opal'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLACK_OPAL_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal_Inventory.png")
     Black_Opal_Inventory_Ore = SF::Sprite.new(BLACK_OPAL_INVENTORY_ORE_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Ajoite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     AJOITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite_Inventory.png")
     Ajoite_Inventory_Ore = SF::Sprite.new(AJOITE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Rhodolite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     RHODOLITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite_Inventory.png")
     Rhodolite_Inventory_Ore = SF::Sprite.new(RHODOLITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Chalcanthite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     CHALCANTHITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite_Inventory.png")
     Chalcanthite_Inventory_Ore = SF::Sprite.new(CHALCANTHITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Flourite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     FLOURITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite_Inventory.png")
     Flourite_Inventory_Ore = SF::Sprite.new(FLOURITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Amorite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     AMORITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite_Inventory.png")
     Amorite_Inventory_Ore = SF::Sprite.new(AMORITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Lapis Lazuli''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     LAPIS_LAZULI_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli_Inventory.png")
     Lapis_Lazuli_Inventory_Ore = SF::Sprite.new(LAPIS_LAZULI_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Moonstone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     MOONSTONE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone_Inventory.png")
     Moonstone_Inventory_Ore = SF::Sprite.new(MOONSTONE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Blue Calcite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLUE_CALCITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite_Inventory.png")
     Blue_Calcite_Inventory_Ore = SF::Sprite.new(BLUE_CALCITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Hiddenite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     HIDDENITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite_Inventory.png")
     Hiddenite_Inventory_Ore = SF::Sprite.new(HIDDENITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Offretite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     OFFRETITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite_Inventory.png")
     Offretite_Inventory_Ore = SF::Sprite.new(OFFRETITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Holley Blue Agate'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     HOLLEY_BLUE_AGATE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Holley_Blue_Agate_Inventory.png")
     Holley_Blue_Agate_Inventory_Ore = SF::Sprite.new(HOLLEY_BLUE_AGATE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Ametrine''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     AMETRINE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine_Inventory.png")
     Ametrine_Inventory_Ore = SF::Sprite.new(AMETRINE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Hemimorphite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     HEMIMORPHITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite_Inventory.png")
     Hemimorphite_Inventory_Ore = SF::Sprite.new(HEMIMORPHITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Tiffany Stone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     TIFFANY_STONE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone_Inventory.png")
     Tiffany_Stone_Inventory_Ore = SF::Sprite.new(TIFFANY_STONE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''''Azurite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     AZURITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite_Inventory.png")
     Azurite_Inventory_Ore = SF::Sprite.new(AZURITE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''''Howlite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     HOWLITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite_Inventory.png")
     Howlite_Inventory_Ore = SF::Sprite.new(HOWLITE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''''Angelite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     ANGELITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite_Inventory.png")
     Angelite_Inventory_Ore = SF::Sprite.new(ANGELITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Blue Lace Agate''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLUE_LACE_AGATE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate_Inventory.png")
     Blue_Lace_Agate_Inventory_Ore = SF::Sprite.new(BLUE_LACE_AGATE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''''Iolite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     IOLITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite_Inventory.png")
     Iolite_Inventory_Ore = SF::Sprite.new(IOLITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Sodalite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     SODALITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite_Inventory.png")
     Sodalite_Inventory_Ore = SF::Sprite.new(SODALITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Kyanite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     KYANITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite_Inventory.png")
     Kyanite_Inventory_Ore = SF::Sprite.new(KYANITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Sunstone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     SUNSTONE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone_Inventory.png")
     Sunstone_Inventory_Ore = SF::Sprite.new(SUNSTONE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Bony Amber'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BONY_AMBER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber_Inventory.png")
     Bony_Amber_Inventory_Ore = SF::Sprite.new(BONY_AMBER_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Blue Amber'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLUE_AMBER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber_Inventory.png")
     Blue_Amber_Inventory_Ore = SF::Sprite.new(BLUE_AMBER_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Blue Spinel'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLUE_SPINEL_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel_Inventory.png")
     Blue_Spinel_Inventory_Ore = SF::Sprite.new(BLUE_SPINEL_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Red Spinel'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     RED_SPINEL_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel_Inventory.png")
     Red_Spinel_Inventory_Ore = SF::Sprite.new(RED_SPINEL_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Fire Opal''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     FIRE_OPAL_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal_Inventory.png")
     Fire_Opal_Inventory_Ore = SF::Sprite.new(FIRE_OPAL_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Garnet''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     GARNET_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet_Inventory.png")
     Garnet_Inventory_Ore = SF::Sprite.new(GARNET_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''''Ruby'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     RUBY_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby_Inventory.png")
     Ruby_Inventory_Ore = SF::Sprite.new(RUBY_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Cherry Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     CHERRY_QUARTZ_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz_Inventory.png")
     Cherry_Quartz_Inventory_Ore = SF::Sprite.new(CHERRY_QUARTZ_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Lemon Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     LEMON_QUARTZ_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz_Inventory.png")
     Lemon_Quartz_Inventory_Ore = SF::Sprite.new(LEMON_QUARTZ_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Turquoise''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     TURQUOISE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise_Inventory.png")
     Turquoise_Inventory_Ore = SF::Sprite.new(TURQUOISE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Tiger's Eye'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     TIGERS_EYE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye_Inventory.png")
     Tigers_Eye_Inventory_Ore = SF::Sprite.new(TIGERS_EYE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Orange Calcite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     ORANGE_CALCITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite_Inventory.png")
     Orange_Calcite_Inventory_Ore = SF::Sprite.new(ORANGE_CALCITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Grape Agate'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     GRAPE_AGATE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate_Inventory.png")
     Grape_Agate_Inventory_Ore = SF::Sprite.new(GRAPE_AGATE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''''Jade'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     JADE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade_Inventory.png")
     Jade_Inventory_Ore = SF::Sprite.new(JADE_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Diamond''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     DIAMOND_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond_Inventory.png")
     Diamond_Inventory_Ore = SF::Sprite.new(DIAMOND_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Emerald''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     EMERALD_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald_Inventory.png")
     Emerald_Inventory_Ore = SF::Sprite.new(EMERALD_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Painite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     PAINITE_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite_Inventory.png")
     Painite_Inventory_Ore = SF::Sprite.new(PAINITE_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''Bumblebee Jasper''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BUMBLEBEE_JASPER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper_Inventory.png")
     Bumblebee_Jasper_Inventory_Ore = SF::Sprite.new(BUMBLEBEE_JASPER_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Blood Jasper''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLOOD_JASPER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper_Inventory.png")
     Blood_Jasper_Inventory_Ore = SF::Sprite.new(BLOOD_JASPER_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Mook Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     MOOK_JASPER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper_Inventory.png")
     Mook_Jasper_Inventory_Ore = SF::Sprite.new(MOOK_JASPER_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Red Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     RED_JASPER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper_Inventory.png")
     Red_Jasper_Inventory_Ore = SF::Sprite.new(RED_JASPER_INVENTORY_ORE_TEXTURE) 
   #.....................................................Metals.....................................................................
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Carbon'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     CARBON_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/metals/Carbon_Inventory.png")
     Carbon_Inventory_Ore = SF::Sprite.new(CARBON_INVENTORY_ORE_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Copper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     COPPER_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/metals/Copper_Inventory.png")
     Copper_Inventory_Ore = SF::Sprite.new(COPPER_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Tin'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     TIN_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/metals/Tin_Inventory.png")
     Tin_Inventory_Ore = SF::Sprite.new(TIN_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Zinc''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     ZINC_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/metals/Zinc_Inventory.png")
     Zinc_Inventory_Ore = SF::Sprite.new(ZINC_INVENTORY_ORE_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Iron''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     IRON_INVENTORY_ORE_TEXTURE = SF::Texture.from_file("graphics/metals/Iron_Inventory.png")
     Iron_Inventory_Ore = SF::Sprite.new(IRON_INVENTORY_ORE_TEXTURE) 
   #......................................................Gems......................................................................
    #''''''''''''''''''''''''''''''''''''''''''''''''''Bloodstone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
       BLOODSTONE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone_Inventory_Squarecut.png")
       Bloodstone_Inventory_Square = SF::Sprite.new(BLOODSTONE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
       BLOODSTONE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone_Inventory_Pearcut.png")
       Bloodstone_Inventory_Pear = SF::Sprite.new(BLOODSTONE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant--------------------------------------------------------------------
       BLOODSTONE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone_Inventory_Brilliantcut.png")
       Bloodstone_Inventory_Brilliant = SF::Sprite.new(BLOODSTONE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut---------------------------------------------------------------------
       BLOODSTONE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone_Inventory_Dropcut.png")
       Bloodstone_Inventory_Dropcut = SF::Sprite.new(BLOODSTONE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut---------------------------------------------------------------------
       BLOODSTONE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone_Inventory_Tablecut.png")
       Bloodstone_Inventory_Tablecut = SF::Sprite.new(BLOODSTONE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Moss Agate'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      MOSS_AGATE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate_Inventory_Squarecut.png")
      Moss_Agate_Inventory_Square = SF::Sprite.new(MOSS_AGATE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      MOSS_AGATE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate_Inventory_Pearcut.png")
      Moss_Agate_Inventory_Pear = SF::Sprite.new(MOSS_AGATE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      MOSS_AGATE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate_Inventory_Brilliantcut.png")
      Moss_Agate_Inventory_Brilliant = SF::Sprite.new(MOSS_AGATE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      MOSS_AGATE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate_Inventory_Dropcut.png")
      Moss_Agate_Inventory_Dropcut = SF::Sprite.new(MOSS_AGATE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      MOSS_AGATE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate_Inventory_Tablecut.png")
      Moss_Agate_Inventory_Tablecut = SF::Sprite.new(MOSS_AGATE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Amber''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      AMBER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber_Inventory_Squarecut.png")
      Amber_Inventory_Square = SF::Sprite.new(AMBER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      AMBER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber_Inventory_Pearcut.png")
      Amber_Inventory_Pear = SF::Sprite.new(AMBER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant--------------------------------------------------------------------
      AMBER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber_Inventory_Brilliant.png")
      Amber_Inventory_Brilliant = SF::Sprite.new(AMBER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut---------------------------------------------------------------------
      AMBER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber_Inventory_Drop.png")
      Amber_Inventory_Dropcut = SF::Sprite.new(AMBER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut---------------------------------------------------------------------
      AMBER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber_Inventory_Table.png")
      Amber_Inventory_Tablecut = SF::Sprite.new(AMBER_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Wavellite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      WAVELLITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite_Inventory_Square.png")
      Wavellite_Inventory_Square = SF::Sprite.new(WAVELLITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      WAVELLITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite_Inventory_Pear.png")
      Wavellite_Inventory_Pear = SF::Sprite.new(WAVELLITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      WAVELLITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite_Inventory_Brilliant.png")
      Wavellite_Inventory_Brilliant = SF::Sprite.new(WAVELLITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      WAVELLITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite_Inventory_Drop.png")
      Wavellite_Inventory_Dropcut = SF::Sprite.new(WAVELLITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      WAVELLITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite_Inventory_Table.png")
      Wavellite_Inventory_Tablecut = SF::Sprite.new(WAVELLITE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Topaz''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      TOPAZ_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz_Inventory_Square.png")
      Topaz_Inventory_Square = SF::Sprite.new(TOPAZ_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      TOPAZ_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz_Inventory_Pear.png")
      Topaz_Inventory_Pear = SF::Sprite.new(TOPAZ_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant--------------------------------------------------------------------
      TOPAZ_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz_Inventory_Brilliant.png")
      Topaz_Inventory_Brilliant = SF::Sprite.new(TOPAZ_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut---------------------------------------------------------------------
      TOPAZ_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz_Inventory_Drop.png")
      Topaz_Inventory_Dropcut = SF::Sprite.new(TOPAZ_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut---------------------------------------------------------------------
      TOPAZ_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz_Inventory_Table.png")
      Topaz_Inventory_Tablecut = SF::Sprite.new(TOPAZ_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Amethyst'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      AMETHYST_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_Inventory_Square.png")
      Amethyst_Inventory_Square = SF::Sprite.new(AMETHYST_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      AMETHYST_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_Inventory_Pear.png")
      Amethyst_Inventory_Pear = SF::Sprite.new(AMETHYST_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant--------------------------------------------------------------------
      AMETHYST_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_Inventory_Brilliant.png")
      Amethyst_Inventory_Brilliant = SF::Sprite.new(AMETHYST_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut---------------------------------------------------------------------
      AMETHYST_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_Inventory_Drop.png")
      Amethyst_Inventory_Dropcut = SF::Sprite.new(AMETHYST_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut---------------------------------------------------------------------
      AMETHYST_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_Inventory_Table.png")
      Amethyst_Inventory_Tablecut = SF::Sprite.new(AMETHYST_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Smokey Quartz''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      SMOKEY_QUARTZ_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz_Inventory_Square.png")
      Smokey_Quartz_Inventory_Square = SF::Sprite.new(SMOKEY_QUARTZ_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      SMOKEY_QUARTZ_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz_Inventory_Pear.png")
      Smokey_Quartz_Inventory_Pear = SF::Sprite.new(SMOKEY_QUARTZ_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant--------------------------------------------------------------------
      SMOKEY_QUARTZ_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz_Inventory_Brilliant.png")
      Smokey_Quartz_Inventory_Brilliant = SF::Sprite.new(SMOKEY_QUARTZ_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut---------------------------------------------------------------------
      SMOKEY_QUARTZ_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz_Inventory_Drop.png")
      Smokey_Quartz_Inventory_Dropcut = SF::Sprite.new(SMOKEY_QUARTZ_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut---------------------------------------------------------------------
      SMOKEY_QUARTZ_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz_Inventory_Table.png")
      Smokey_Quartz_Inventory_Tablecut = SF::Sprite.new(SMOKEY_QUARTZ_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Sapphire''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      SAPPHIRE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire_Inventory_Square.png")
      Sapphire_Inventory_Square = SF::Sprite.new(SAPPHIRE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      SAPPHIRE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire_Inventory_Pear.png")
      Sapphire_Inventory_Pear = SF::Sprite.new(SAPPHIRE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      SAPPHIRE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire_Inventory_Brilliant.png")
      Sapphire_Inventory_Brilliant = SF::Sprite.new(SAPPHIRE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      SAPPHIRE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire_Inventory_Drop.png")
      Sapphire_Inventory_Dropcut = SF::Sprite.new(SAPPHIRE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      SAPPHIRE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire_Inventory_Table.png")
      Sapphire_Inventory_Tablecut = SF::Sprite.new(SAPPHIRE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Black Opal'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BLACK_OPAL_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal_Inventory_Square.png")
      Black_Opal_Inventory_Square = SF::Sprite.new(BLACK_OPAL_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BLACK_OPAL_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal_Inventory_Pear.png")
      Black_Opal_Inventory_Pear = SF::Sprite.new(BLACK_OPAL_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BLACK_OPAL_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal_Inventory_Brilliant.png")
      Black_Opal_Inventory_Brilliant = SF::Sprite.new(BLACK_OPAL_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BLACK_OPAL_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal_Inventory_Drop.png")
      Black_Opal_Inventory_Dropcut = SF::Sprite.new(BLACK_OPAL_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BLACK_OPAL_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal_Inventory_Table.png")
      Black_Opal_Inventory_Tablecut = SF::Sprite.new(BLACK_OPAL_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Ajoite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      AJOITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite_Inventory_Square.png")
      Ajoite_Inventory_Square = SF::Sprite.new(AJOITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      AJOITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite_Inventory_Pear.png")
      Ajoite_Inventory_Pear = SF::Sprite.new(AJOITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      AJOITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite_Inventory_Brilliant.png")
      Ajoite_Inventory_Brilliant = SF::Sprite.new(AJOITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      AJOITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite_Inventory_Drop.png")
      Ajoite_Inventory_Dropcut = SF::Sprite.new(AJOITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      AJOITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite_Inventory_Table.png")
      Ajoite_Inventory_Tablecut = SF::Sprite.new(AJOITE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Rhodolite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      RHODOLITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite_Inventory_Square.png")
      Rhodolite_Inventory_Square = SF::Sprite.new(RHODOLITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      RHODOLITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite_Inventory_Pear.png")
      Rhodolite_Inventory_Pear = SF::Sprite.new(RHODOLITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      RHODOLITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite_Inventory_Brilliant.png")
      Rhodolite_Inventory_Brilliant = SF::Sprite.new(RHODOLITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      RHODOLITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite_Inventory_Drop.png")
      Rhodolite_Inventory_Dropcut = SF::Sprite.new(RHODOLITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      RHODOLITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite_Inventory_Table.png")
      Rhodolite_Inventory_Tablecut = SF::Sprite.new(RHODOLITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Chalcanthite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      CHALCANTHITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite_Inventory_Square.png")
      Chalcanthite_Inventory_Square = SF::Sprite.new(CHALCANTHITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      CHALCANTHITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite_Inventory_Pear.png")
      Chalcanthite_Inventory_Pear = SF::Sprite.new(CHALCANTHITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant--------------------------------------------------------------------
      CHALCANTHITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite_Inventory_Brilliant.png")
      Chalcanthite_Inventory_Brilliant = SF::Sprite.new(CHALCANTHITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut---------------------------------------------------------------------
      CHALCANTHITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite_Inventory_Drop.png")
      Chalcanthite_Inventory_Dropcut = SF::Sprite.new(CHALCANTHITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut---------------------------------------------------------------------
      CHALCANTHITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite_Inventory_Table.png")
      Chalcanthite_Inventory_Tablecut = SF::Sprite.new(CHALCANTHITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Flourite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      FLOURITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite_Inventory_Square.png")
      Flourite_Inventory_Square = SF::Sprite.new(FLOURITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      FLOURITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite_Inventory_Pear.png")
      Flourite_Inventory_Pear = SF::Sprite.new(FLOURITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      FLOURITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite_Inventory_Brilliant.png")
      Flourite_Inventory_Brilliant = SF::Sprite.new(FLOURITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      FLOURITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite_Inventory_Drop.png")
      Flourite_Inventory_Dropcut = SF::Sprite.new(FLOURITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      FLOURITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite_Inventory_Table.png")
      Flourite_Inventory_Tablecut = SF::Sprite.new(FLOURITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Amorite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      AMORITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite_Inventory_Square.png")
      Amorite_Inventory_Square = SF::Sprite.new(AMORITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      AMORITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite_Inventory_Pear.png")
      Amorite_Inventory_Pear = SF::Sprite.new(AMORITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      AMORITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite_Inventory_Brilliant.png")
      Amorite_Inventory_Brilliant = SF::Sprite.new(AMORITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      AMORITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite_Inventory_Drop.png")
      Amorite_Inventory_Dropcut = SF::Sprite.new(AMORITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      AMORITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite_Inventory_Table.png")
      Amorite_Inventory_Tablecut = SF::Sprite.new(AMORITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Lapis Lazuli''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      LAPIS_LAZULI_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli_Inventory_Square.png")
      Lapis_Lazuli_Inventory_Square = SF::Sprite.new(LAPIS_LAZULI_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      LAPIS_LAZULI_IINVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli_Inventory_Pear.png")
      Lapis_Lazuli_Inventory_Pear = SF::Sprite.new(LAPIS_LAZULI_IINVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      LAPIS_LAZULI_IINVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli_Inventory_Brilliant.png")
      Lapis_Lazuli_Inventory_Brilliant = SF::Sprite.new(LAPIS_LAZULI_IINVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      LAPIS_LAZULI_IINVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli_Inventory_Drop.png")
      Lapis_Lazuli_Inventory_Dropcut = SF::Sprite.new(LAPIS_LAZULI_IINVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      LAPIS_LAZULI_IINVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli_Inventory_Table.png")
      Lapis_Lazuli_Inventory_Tablecut = SF::Sprite.new(LAPIS_LAZULI_IINVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Moonstone''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square--------------------------------------------------------------------
      MOONSTONE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone_Inventory_Square.png")
      Moonstone_Inventory_Square = SF::Sprite.new(MOONSTONE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      MOONSTONE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone_Inventory_Pear.png")
      Moonstone_Inventory_Pear = SF::Sprite.new(MOONSTONE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      MOONSTONE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone_Inventory_Brilliant.png")
      Moonstone_Inventory_Brilliant = SF::Sprite.new(MOONSTONE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      MOONSTONE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone_Inventory_Drop.png")
      Moonstone_Inventory_Dropcut = SF::Sprite.new(MOONSTONE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      MOONSTONE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone_Inventory_Table.png")
      Moonstone_Inventory_Tablecut = SF::Sprite.new(MOONSTONE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Blue Calcite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BLUE_CALCITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite_Inventory_Square.png")
      Blue_Calcite_Inventory_Square = SF::Sprite.new(BLUE_CALCITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BLUE_CALCITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite_Inventory_Pear.png")
      Blue_Calcite_Inventory_Pear = SF::Sprite.new(BLUE_CALCITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BLUE_CALCITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite_Inventory_Brilliant.png")
      Blue_Calcite_Inventory_Brilliant = SF::Sprite.new(BLUE_CALCITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BLUE_CALCITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite_Inventory_Drop.png")
      Blue_Calcite_Inventory_Dropcut = SF::Sprite.new(BLUE_CALCITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BLUE_CALCITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite_Inventory_Table.png")
      Blue_Calcite_Inventory_Tablecut = SF::Sprite.new(BLUE_CALCITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Hiddenite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      HIDDENITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite_Inventory_Square.png")
      Hiddenite_Inventory_Square = SF::Sprite.new(HIDDENITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      HIDDENITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite_Inventory_Pear.png")
      Hiddenite_Inventory_Pear = SF::Sprite.new(HIDDENITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      HIDDENITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite_Inventory_Brilliant.png")
      Hiddenite_Inventory_Brilliant = SF::Sprite.new(HIDDENITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      HIDDENITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite_Inventory_Drop.png")
      Hiddenite_Inventory_Dropcut = SF::Sprite.new(HIDDENITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      HIDDENITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite_Inventory_Table.png")
      Hiddenite_Inventory_Tablecut = SF::Sprite.new(HIDDENITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Offretite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      OFFRETITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite_Inventory_Square.png")
      Offretite_Inventory_Square = SF::Sprite.new(OFFRETITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      OFFRETITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite_Inventory_Pear.png")
      Offretite_Inventory_Pear = SF::Sprite.new(OFFRETITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      OFFRETITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite_Inventory_Brilliant.png")
      Offretite_Inventory_Brilliant = SF::Sprite.new(OFFRETITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      OFFRETITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite_Inventory_Drop.png")
      Offretite_Inventory_Dropcut = SF::Sprite.new(OFFRETITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      OFFRETITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite_Inventory_Table.png")
      Offretite_Inventory_Tablecut = SF::Sprite.new(OFFRETITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''Holly_Blue_Agate''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      HOLLY_BLUE_AGATE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Holly_Blue_Agate_Inventory_Square.png")
      Holly_Blue_Agate_Inventory_Square = SF::Sprite.new(HOLLY_BLUE_AGATE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      HOLLY_BLUE_AGATE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Holly_Blue_Agate_Inventory_Pear.png")
      Holly_Blue_Agate_Inventory_Pear = SF::Sprite.new(HOLLY_BLUE_AGATE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      HOLLY_BLUE_AGATE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Holly_Blue_Agate_Inventory_Brilliant.png")
      Holly_Blue_Agate_Inventory_Brilliant = SF::Sprite.new(HOLLY_BLUE_AGATE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      HOLLY_BLUE_AGATE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Holly_Blue_Agate_Inventory_Drop.png")
      Holly_Blue_Agate_Inventory_Dropcut = SF::Sprite.new(HOLLY_BLUE_AGATE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      HOLLY_BLUE_AGATE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Holly_Blue_Agate_Inventory_Table.png")
      Holly_Blue_Agate_Inventory_Tablecut = SF::Sprite.new(HOLLY_BLUE_AGATE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Ametrine''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      AMETRINE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine_Inventory_Square.png")
      Ametrine_Inventory_Square = SF::Sprite.new(AMETRINE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      AMETRINE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine_Inventory_Pear.png")
      Ametrine_Inventory_Pear = SF::Sprite.new(AMETRINE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      AMETRINE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine_Inventory_Brilliant.png")
      Ametrine_Inventory_Brilliant = SF::Sprite.new(AMETRINE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      AMETRINE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine_Inventory_Drop.png")
      Ametrine_Inventory_Dropcut = SF::Sprite.new(AMETRINE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      AMETRINE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine_Inventory_Table.png")
      Ametrine_Inventory_Tablecut = SF::Sprite.new(AMETRINE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Hemimorphite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      HEMIMORPHITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite_Inventory_Square.png")
      Hemimorphite_Inventory_Square = SF::Sprite.new(HEMIMORPHITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      HEMIMORPHITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite_Inventory_Pear.png")
      Hemimorphite_Inventory_Pear = SF::Sprite.new(HEMIMORPHITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      HEMIMORPHITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite_Inventory_Brilliant.png")
      Hemimorphite_Inventory_Brilliant = SF::Sprite.new(HEMIMORPHITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      HEMIMORPHITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite_Inventory_Drop.png")
      Hemimorphite_Inventory_Dropcut = SF::Sprite.new(HEMIMORPHITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      HEMIMORPHITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite_Inventory_Table.png")
      Hemimorphite_Inventory_Tablecut = SF::Sprite.new(HEMIMORPHITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Tiffany_Stone''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      TIFFANY_STONE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone_Inventory_Square.png")
      Tiffany_Stone_Inventory_Square = SF::Sprite.new(TIFFANY_STONE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      TIFFANY_STONE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone_Inventory_Pear.png")
      Tiffany_Stone_Inventory_Pear = SF::Sprite.new(TIFFANY_STONE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      TIFFANY_STONE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone_Inventory_Brilliant.png")
      Tiffany_Stone_Inventory_Brilliant = SF::Sprite.new(TIFFANY_STONE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      TIFFANY_STONE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone_Inventory_Drop.png")
      Tiffany_Stone_Inventory_Dropcut = SF::Sprite.new(TIFFANY_STONE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      TIFFANY_STONE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone_Inventory_Table.png")
      Tiffany_Stone_Inventory_Tablecut = SF::Sprite.new(TIFFANY_STONE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Azurite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      AZURITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite_Inventory_Square.png")
      Azurite_Inventory_Square = SF::Sprite.new(AZURITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      AZURITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite_Inventory_Pear.png")
      Azurite_Inventory_Pear = SF::Sprite.new(AZURITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      AZURITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite_Inventory_Brilliant.png")
      Azurite_Inventory_Brilliant = SF::Sprite.new(AZURITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      AZURITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite_Inventory_Drop.png")
      Azurite_Inventory_Dropcut = SF::Sprite.new(AZURITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      AZURITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite_Inventory_Table.png")
      Azurite_Inventory_Tablecut = SF::Sprite.new(AZURITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Howlite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      HOWLITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite_Inventory_Square.png")
      Howlite_Inventory_Square = SF::Sprite.new(HOWLITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      HOWLITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite_Inventory_Pear.png")
      Howlite_Inventory_Pear = SF::Sprite.new(HOWLITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      HOWLITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite_Inventory_Brilliant.png")
      Howlite_Inventory_Brilliant = SF::Sprite.new(HOWLITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      HOWLITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite_Inventory_Drop.png")
      Howlite_Inventory_Dropcut = SF::Sprite.new(HOWLITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      HOWLITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite_Inventory_Table.png")
      Howlite_Inventory_Tablecut = SF::Sprite.new(HOWLITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Angelite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      ANGELITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite_Inventory_Square.png")
      Angelite_Inventory_Square = SF::Sprite.new(ANGELITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      ANGELITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite_Inventory_Pear.png")
      Angelite_Inventory_Pear = SF::Sprite.new(ANGELITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      ANGELITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite_Inventory_Brilliant.png")
      Angelite_Inventory_Brilliant = SF::Sprite.new(ANGELITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      ANGELITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite_Inventory_Drop.png")
      Angelite_Inventory_Dropcut = SF::Sprite.new(ANGELITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      ANGELITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite_Inventory_Table.png")
      Angelite_Inventory_Tablecut = SF::Sprite.new(ANGELITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''Blue Lace Agate'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BLUE_LACE_AGATE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate_Inventory_Square.png")
      Blue_Lace_Agate_Inventory_Square = SF::Sprite.new(BLUE_LACE_AGATE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BLUE_LACE_AGATE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate_Inventory_Pear.png")
      Blue_Lace_Agate_Inventory_Pear = SF::Sprite.new(BLUE_LACE_AGATE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BLUE_LACE_AGATE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate_Inventory_Brilliant.png")
      Blue_Lace_Agate_Inventory_Brilliant = SF::Sprite.new(BLUE_LACE_AGATE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BLUE_LACE_AGATE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate_Inventory_Drop.png")
      Blue_Lace_Agate_Inventory_Dropcut = SF::Sprite.new(BLUE_LACE_AGATE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BLUE_LACE_AGATE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate_Inventory_Table.png")
      Blue_Lace_Agate_Inventory_Tablecut = SF::Sprite.new(BLUE_LACE_AGATE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Iolite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      IOLITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite_Inventory_Square.png")
      Iolite_Inventory_Square = SF::Sprite.new(IOLITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      IOLITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite_Inventory_Pear.png")
      Iolite_Inventory_Pear = SF::Sprite.new(IOLITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      IOLITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite_Inventory_Brilliant.png")
      Iolite_Inventory_Brilliant = SF::Sprite.new(IOLITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      IOLITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite_Inventory_Drop.png")
      Iolite_Inventory_Dropcut = SF::Sprite.new(IOLITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      IOLITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite_Inventory_Table.png")
      Iolite_Inventory_Tablecut = SF::Sprite.new(IOLITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Sodalite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      SODALITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite_Inventory_Square.png")
      Sodalite_Inventory_Square = SF::Sprite.new(SODALITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      SODALITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite_Inventory_Pear.png")
      Sodalite_Inventory_Pear = SF::Sprite.new(SODALITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      SODALITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite_Inventory_Brilliant.png")
      Sodalite_Inventory_Brilliant = SF::Sprite.new(SODALITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      SODALITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite_Inventory_Drop.png")
      Sodalite_Inventory_Dropcut = SF::Sprite.new(SODALITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      SODALITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite_Inventory_Table.png")
      Sodalite_Inventory_Tablecut = SF::Sprite.new(SODALITE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Kyanite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      KYANITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite_Inventory_Square.png")
      Kyanite_Inventory_Square = SF::Sprite.new(KYANITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      KYANITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite_Inventory_Pear.png")
      Kyanite_Inventory_Pear = SF::Sprite.new(KYANITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      KYANITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite_Inventory_Brilliant.png")
      Kyanite_Inventory_Brilliant = SF::Sprite.new(KYANITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      KYANITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite_Inventory_Drop.png")
      Kyanite_Inventory_Dropcut = SF::Sprite.new(KYANITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      KYANITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite_Inventory_Table.png")
      Kyanite_Inventory_Tablecut = SF::Sprite.new(KYANITE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Sunstone''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      SUNSTONE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone_Inventory_Square.png")
      Sunstone_Inventory_Square = SF::Sprite.new(SUNSTONE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      SUNSTONE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone_Inventory_Pear.png")
      Sunstone_Inventory_Pear = SF::Sprite.new(SUNSTONE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      SUNSTONE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone_Inventory_Brilliant.png")
      Sunstone_Inventory_Brilliant = SF::Sprite.new(SUNSTONE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      SUNSTONE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone_Inventory_Drop.png")
      Sunstone_Inventory_Dropcut = SF::Sprite.new(SUNSTONE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      SUNSTONE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone_Inventory_Table.png")
      Sunstone_Inventory_Tablecut = SF::Sprite.new(SUNSTONE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Bony Amber'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BONY_AMBER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber_Inventory_Square.png")
      Bony_Amber_Inventory_Square = SF::Sprite.new(BONY_AMBER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BONY_AMBER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber_Inventory_Pear.png")
      Bony_Amber_Inventory_Pear = SF::Sprite.new(BONY_AMBER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BONY_AMBER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber_Inventory_Brilliant.png")
      Bony_Amber_Inventory_Brilliant = SF::Sprite.new(BONY_AMBER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BONY_AMBER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber_Inventory_Drop.png")
      Bony_Amber_Inventory_Dropcut = SF::Sprite.new(BONY_AMBER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BONY_AMBER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber_Inventory_Table.png")
      Bony_Amber_Inventory_Tablecut = SF::Sprite.new(BONY_AMBER_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Blue Amber'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BLUE_AMBER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber_Inventory_Square.png")
      Blue_Amber_Inventory_Square = SF::Sprite.new(BLUE_AMBER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BLUE_AMBER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber_Inventory_Pear.png")
      Blue_Amber_Inventory_Pear = SF::Sprite.new(BLUE_AMBER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BLUE_AMBER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber_Inventory_Brilliant.png")
      Blue_Amber_Inventory_Brilliant = SF::Sprite.new(BLUE_AMBER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BLUE_AMBER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber_Inventory_Drop.png")
      Blue_Amber_Inventory_Dropcut = SF::Sprite.new(BLUE_AMBER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BLUE_AMBER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber_Inventory_Table.png")
      Blue_Amber_Inventory_Tablecut = SF::Sprite.new(BLUE_AMBER_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Blue Spinel'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BLUE_SPINEL_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel_Inventory_Square.png")
      Blue_Spinel_Inventory_Square = SF::Sprite.new(BLUE_SPINEL_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BLUE_SPINEL_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel_Inventory_Pear.png")
      Blue_Spinel_Inventory_Pear = SF::Sprite.new(BLUE_SPINEL_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BLUE_SPINEL_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel_Inventory_Brilliant.png")
      Blue_Spinel_Inventory_Brilliant = SF::Sprite.new(BLUE_SPINEL_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BLUE_SPINEL_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel_Inventory_Drop.png")
      Blue_Spinel_Inventory_Dropcut = SF::Sprite.new(BLUE_SPINEL_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BLUE_SPINEL_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel_Inventory_Table.png")
      Blue_Spinel_Inventory_Tablecut = SF::Sprite.new(BLUE_SPINEL_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Red Spinel'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      RED_SPINEL_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel_Inventory_Square.png")
      Red_Spinel_Inventory_Square = SF::Sprite.new(RED_SPINEL_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      RED_SPINEL_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel_Inventory_Pear.png")
      Red_Spinel_Inventory_Pear = SF::Sprite.new(RED_SPINEL_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      RED_SPINEL_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel_Inventory_Brilliant.png")
      Red_Spinel_Inventory_Brilliant = SF::Sprite.new(RED_SPINEL_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      RED_SPINEL_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel_Inventory_Drop.png")
      Red_Spinel_Inventory_Dropcut = SF::Sprite.new(RED_SPINEL_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      RED_SPINEL_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel_Inventory_Table.png")
      Red_Spinel_Inventory_Tablecut = SF::Sprite.new(RED_SPINEL_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Fire Opal''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      FIRE_OPAL_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal_Inventory_Square.png")
      Fire_Opal_Inventory_Square = SF::Sprite.new(FIRE_OPAL_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      FIRE_OPAL_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal_Inventory_Pear.png")
      Fire_Opal_Inventory_Pear = SF::Sprite.new(FIRE_OPAL_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      FIRE_OPAL_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal_Inventory_Brilliant.png")
      Fire_Opal_Inventory_Brilliant = SF::Sprite.new(FIRE_OPAL_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      FIRE_OPAL_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal_Inventory_Drop.png")
      Fire_Opal_Inventory_Dropcut = SF::Sprite.new(FIRE_OPAL_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      FIRE_OPAL_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal_Inventory_Table.png")
      Fire_Opal_Inventory_Tablecut = SF::Sprite.new(FIRE_OPAL_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Garnet'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      GARNET_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet_Inventory_Square.png")
      Garnet_Inventory_Square = SF::Sprite.new(GARNET_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      GARNET_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet_Inventory_Pear.png")
      Garnet_Inventory_Pear = SF::Sprite.new(GARNET_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      GARNET_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet_Inventory_Brilliant.png")
      Garnet_Inventory_Brilliant = SF::Sprite.new(GARNET_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      GARNET_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet_Inventory_Drop.png")
      Garnet_Inventory_Dropcut = SF::Sprite.new(GARNET_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      GARNET_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet_Inventory_Table.png")
      Garnet_Inventory_Tablecut = SF::Sprite.new(GARNET_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Ruby''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      RUBY_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby_Inventory_Square.png")
      Ruby_Inventory_Square = SF::Sprite.new(RUBY_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      RUBY_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby_Inventory_Pear.png")
      Ruby_Inventory_Pear = SF::Sprite.new(RUBY_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      RUBY_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby_Inventory_Brilliant.png")
      Ruby_Inventory_Brilliant = SF::Sprite.new(RUBY_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      RUBY_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby_Inventory_Drop.png")
      Ruby_Inventory_Dropcut = SF::Sprite.new(RUBY_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      RUBY_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby_Inventory_Table.png")
      Ruby_Inventory_Tablecut = SF::Sprite.new(RUBY_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Cherry Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      CHERRY_QUARTZ_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz_Inventory_Square.png")
      Cherry_Quartz_Inventory_Square = SF::Sprite.new(CHERRY_QUARTZ_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      CHERRY_QUARTZ_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz_Inventory_Pear.png")
      Cherry_Quartz_Inventory_Pear = SF::Sprite.new(CHERRY_QUARTZ_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      CHERRY_QUARTZ_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz_Inventory_Brilliant.png")
      Cherry_Quartz_Inventory_Brilliant = SF::Sprite.new(CHERRY_QUARTZ_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      CHERRY_QUARTZ_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz_Inventory_Drop.png")
      Cherry_Quartz_Inventory_Dropcut = SF::Sprite.new(CHERRY_QUARTZ_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      CHERRY_QUARTZ_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz_Inventory_Table.png")
      Cherry_Quartz_Inventory_Tablecut = SF::Sprite.new(CHERRY_QUARTZ_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''Lemon Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      LEMON_QUARTZ_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz_Inventory_Square.png")
      Lemon_Quartz_Inventory_Square = SF::Sprite.new(LEMON_QUARTZ_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      LEMON_QUARTZ_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz_Inventory_Pear.png")
      Lemon_Quartz_Inventory_Pear = SF::Sprite.new(LEMON_QUARTZ_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      LEMON_QUARTZ_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz_Inventory_Brilliant.png")
      Lemon_Quartz_Inventory_Brilliant = SF::Sprite.new(LEMON_QUARTZ_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      LEMON_QUARTZ_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz_Inventory_Drop.png")
      Lemon_Quartz_Inventory_Dropcut = SF::Sprite.new(LEMON_QUARTZ_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      LEMON_QUARTZ_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz_Inventory_Table.png")
      Lemon_Quartz_Inventory_Tablecut = SF::Sprite.new(LEMON_QUARTZ_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''Turquoise'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      TURQUOISE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise_Inventory_Square.png")
      Turquoise_Inventory_Square = SF::Sprite.new(TURQUOISE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      TURQUOISE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise_Inventory_Pear.png")
      Turquoise_Inventory_Pear = SF::Sprite.new(TURQUOISE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      TURQUOISE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise_Inventory_Brilliant.png")
      Turquoise_Inventory_Brilliant = SF::Sprite.new(TURQUOISE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      TURQUOISE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise_Inventory_Drop.png")
      Turquoise_Inventory_Dropcut = SF::Sprite.new(TURQUOISE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      TURQUOISE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise_Inventory_Table.png")
      Turquoise_Inventory_Tablecut = SF::Sprite.new(TURQUOISE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Tiger's Eye''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      TIGERS_EYE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye_Inventory_Square.png")
      Tigers_eye_Inventory_Square = SF::Sprite.new(TIGERS_EYE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      TIGERS_EYE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye_Inventory_Pear.png")
      Tigers_eye_Inventory_Pear = SF::Sprite.new(TIGERS_EYE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      TIGERS_EYE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye_Inventory_Brilliant.png")
      Tigers_eye_Inventory_Brilliant = SF::Sprite.new(TIGERS_EYE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      TIGERS_EYE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye_Inventory_Drop.png")
      Tigers_eye_Inventory_Dropcut = SF::Sprite.new(TIGERS_EYE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      TIGERS_EYE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye_Inventory_Table.png")
      Tigers_eye_Inventory_Tablecut = SF::Sprite.new(TIGERS_EYE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''Orange Calcite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      ORANGE_CALCITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite_Inventory_Square.png")
      Orange_Calcite_Inventory_Square = SF::Sprite.new(ORANGE_CALCITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      ORANGE_CALCITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite_Inventory_Pear.png")
      Orange_Calcite_Inventory_Pear = SF::Sprite.new(ORANGE_CALCITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      ORANGE_CALCITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite_Inventory_Brilliant.png")
      Orange_Calcite_Inventory_Brilliant = SF::Sprite.new(ORANGE_CALCITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      ORANGE_CALCITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite_Inventory_Drop.png")
      Orange_Calcite_Inventory_Dropcut = SF::Sprite.new(ORANGE_CALCITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      ORANGE_CALCITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite_Inventory_Table.png")
      Orange_Calcite_Inventory_Tablecut = SF::Sprite.new(ORANGE_CALCITE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Grape Agate''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      GRAPE_AGATE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate_Inventory_Square.png")
      Grape_Agate_Inventory_Square = SF::Sprite.new(GRAPE_AGATE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      GRAPE_AGATE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate_Inventory_Pear.png")
      Grape_Agate_Inventory_Pear = SF::Sprite.new(GRAPE_AGATE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      GRAPE_AGATE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate_Inventory_Brilliant.png")
      Grape_Agate_Inventory_Brilliant = SF::Sprite.new(GRAPE_AGATE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      GRAPE_AGATE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate_Inventory_Drop.png")
      Grape_Agate_Inventory_Dropcut = SF::Sprite.new(GRAPE_AGATE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      GRAPE_AGATE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate_Inventory_Table.png")
      Grape_Agate_Inventory_Tablecut = SF::Sprite.new(GRAPE_AGATE_INVENTORY_TABLECUT_TEXTURE) 
    #'''''''''''''''''''''''''''''''''''''''''''''''''''''Jade''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      JADE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade_Inventory_Square.png")
      Jade_Inventory_Square = SF::Sprite.new(JADE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      JADE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade_Inventory_Pear.png")
      Jade_Inventory_Pear = SF::Sprite.new(JADE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      JADE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade_Inventory_Brilliant.png")
      Jade_Inventory_Brilliant = SF::Sprite.new(JADE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      JADE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade_Inventory_Drop.png")
      Jade_Inventory_Dropcut = SF::Sprite.new(JADE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      JADE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade_Inventory_Table.png")
      Jade_Inventory_Tablecut = SF::Sprite.new(JADE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Diamond''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      DIAMOND_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond_Inventory_Square.png")
      Diamond_Inventory_Square = SF::Sprite.new(DIAMOND_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      DIAMOND_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond_Inventory_Pear.png")
      Diamond_Inventory_Pear = SF::Sprite.new(DIAMOND_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      DIAMOND_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond_Inventory_Brilliant.png")
      Diamond_Inventory_Brilliant = SF::Sprite.new(DIAMOND_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      DIAMOND_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond_Inventory_Drop.png")
      Diamond_Inventory_Dropcut = SF::Sprite.new(DIAMOND_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      DIAMOND_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond_Inventory_Table.png")
      Diamond_Inventory_Tablecut = SF::Sprite.new(DIAMOND_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Emerald''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      EMERALD_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald_Inventory_Square.png")
      Emerald_Inventory_Square = SF::Sprite.new(EMERALD_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      EMERALD_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald_Inventory_Pear.png")
      Emerald_Inventory_Pear = SF::Sprite.new(EMERALD_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      EMERALD_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald_Inventory_Brilliant.png")
      Emerald_Inventory_Brilliant = SF::Sprite.new(EMERALD_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      EMERALD_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald_Inventory_Drop.png")
      Emerald_Inventory_Dropcut = SF::Sprite.new(EMERALD_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      EMERALD_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald_Inventory_Table.png")
      Emerald_Inventory_Tablecut = SF::Sprite.new(EMERALD_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''''Painite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      PAINITE_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite_Inventory_Square.png")
      Painite_Inventory_Square = SF::Sprite.new(PAINITE_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      PAINITE_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite_Inventory_Pear.png")
      Painite_Inventory_Pear = SF::Sprite.new(PAINITE_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      PAINITE_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite_Inventory_Brilliant.png")
      Painite_Inventory_Brilliant = SF::Sprite.new(PAINITE_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      PAINITE_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite_Inventory_Drop.png")
      Painite_Inventory_Dropcut = SF::Sprite.new(PAINITE_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      PAINITE_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite_Inventory_Table.png")
      Painite_Inventory_Tablecut = SF::Sprite.new(PAINITE_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''Bumblebee Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BUMBLEBEE_JASPER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper_Inventory_Square.png")
      Bumblebee_Jasper_Inventory_Square = SF::Sprite.new(BUMBLEBEE_JASPER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BUMBLEBEE_JASPER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper_Inventory_Pear.png")
      Bumblebee_Jasper_Inventory_Pear = SF::Sprite.new(BUMBLEBEE_JASPER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BUMBLEBEE_JASPER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper_Inventory_Brilliant.png")
      Bumblebee_Jasper_Inventory_Brilliant = SF::Sprite.new(BUMBLEBEE_JASPER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BUMBLEBEE_JASPER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper_Inventory_Drop.png")
      Bumblebee_Jasper_Inventory_Dropcut = SF::Sprite.new(BUMBLEBEE_JASPER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BUMBLEBEE_JASPER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper_Inventory_Table.png")
      Bumblebee_Jasper_Inventory_Tablecut = SF::Sprite.new(BUMBLEBEE_JASPER_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Blood Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      BLOOD_JASPER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper_Inventory_Square.png")
      Blood_Jasper_Inventory_Square = SF::Sprite.new(BLOOD_JASPER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      BLOOD_JASPER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper_Inventory_Pear.png")
      Blood_Jasper_Inventory_Pear = SF::Sprite.new(BLOOD_JASPER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      BLOOD_JASPER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper_Inventory_Brilliant.png")
      Blood_Jasper_Inventory_Brilliant = SF::Sprite.new(BLOOD_JASPER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      BLOOD_JASPER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper_Inventory_Drop.png")
      Blood_Jasper_Inventory_Dropcut = SF::Sprite.new(BLOOD_JASPER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      BLOOD_JASPER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper_Inventory_Table.png")
      Blood_Jasper_Inventory_Tablecut = SF::Sprite.new(BLOOD_JASPER_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Mook Jasper''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      MOOK_JASPER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper_Inventory_Square.png")
      Mook_Jasper_Inventory_Square = SF::Sprite.new(MOOK_JASPER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      MOOK_JASPER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper_Inventory_Pear.png")
      Mook_Jasper_Inventory_Pear = SF::Sprite.new(MOOK_JASPER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      MOOK_JASPER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper_Inventory_Brilliant.png")
      Mook_Jasper_Inventory_Brilliant = SF::Sprite.new(MOOK_JASPER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      MOOK_JASPER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper_Inventory_Drop.png")
      Mook_Jasper_Inventory_Dropcut = SF::Sprite.new(MOOK_JASPER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      MOOK_JASPER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper_Inventory_Table.png")
      Mook_Jasper_Inventory_Tablecut = SF::Sprite.new(MOOK_JASPER_INVENTORY_TABLECUT_TEXTURE) 
    #''''''''''''''''''''''''''''''''''''''''''''''''''Red Jasper''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     #---------------------------------------------------Square---------------------------------------------------------------------
      RED_JASPER_INVENTORY_SQUARE_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper_Inventory_Square.png")
      Red_Jasper_Inventory_Square = SF::Sprite.new(RED_JASPER_INVENTORY_SQUARE_TEXTURE) 
     #----------------------------------------------------Pear----------------------------------------------------------------------
      RED_JASPER_INVENTORY_PEAR_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper_Inventory_Pear.png")
      Red_Jasper_Inventory_Pear = SF::Sprite.new(RED_JASPER_INVENTORY_PEAR_TEXTURE) 
     #--------------------------------------------------Brilliant-------------------------------------------------------------------
      RED_JASPER_INVENTORY_BRILLIANT_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper_Inventory_Brilliant.png")
      Red_Jasper_Inventory_Brilliant = SF::Sprite.new(RED_JASPER_INVENTORY_BRILLIANT_TEXTURE) 
     #---------------------------------------------------Dropcut--------------------------------------------------------------------
      RED_JASPER_INVENTORY_DROPCUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper_Inventory_Drop.png")
      Red_Jasper_Inventory_Dropcut = SF::Sprite.new(RED_JASPER_INVENTORY_DROPCUT_TEXTURE) 
     #--------------------------------------------------Tablecut--------------------------------------------------------------------
      RED_JASPER_INVENTORY_TABLECUT_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper_Inventory_Table.png")
      Red_Jasper_Inventory_Tablecut = SF::Sprite.new(RED_JASPER_INVENTORY_TABLECUT_TEXTURE) 
  #------------------------------------------------Use item Textures----------------------------------------------------------------
   #....................................................Bushes......................................................................
    #''''''''''''''''''''''''''''''''''''''''''''''''Blackberries'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLACKBERRY_TEXTURE = SF::Texture.from_file("graphics/plants/Blackberries.png")
     Blackberries = SF::Sprite.new(BLACKBERRY_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''Raspberries'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     RASPBERRY_TEXTURE = SF::Texture.from_file("graphics/plants/Raspberries.png")
     Raspberries = SF::Sprite.new(RASPBERRY_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''Elderberries''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     ELDERBERRY_TEXTURE = SF::Texture.from_file("graphics/plants/Elderberries.png")
     Elderberries = SF::Sprite.new(ELDERBERRY_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''Black Currants'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLACK_CURRANT_TEXTURE = SF::Texture.from_file("graphics/plants/Black_Currants.png")
     Black_Currant = SF::Sprite.new(BLACK_CURRANT_TEXTURE)  
    #'''''''''''''''''''''''''''''''''''''''''''''''''Blueberries'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BLUEBERRY_TEXTURE = SF::Texture.from_file("graphics/plants/Blueberries.png")
     Blueberry = SF::Sprite.new(BLUEBERRY_TEXTURE)  
   #.....................................................Trees......................................................................
    #''''''''''''''''''''''''''''''''''''''''''''''''Snow Pear Tree'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     SNOW_PEAR_TEXTURE = SF::Texture.from_file("graphics/plants/Snow_Pears.png")
     Snow_Pear = SF::Sprite.new(SNOW_PEAR_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''''Quince Tree''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     QUINCE_TEXTURE = SF::Texture.from_file("graphics/plants/Quince.png")
     Quince = SF::Sprite.new(QUINCE_TEXTURE)  
    #''''''''''''''''''''''''''''''''''''''''''''''''Butterfruit Tree'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     BUTTERFRUIT_TEXTURE = SF::Texture.from_file("graphics/plants/Butterfruit.png")
     Butterfruit = SF::Sprite.new(BUTTERFRUIT_TEXTURE)  
#----------------------------------------------------------------------------------------------------------------------------------- 
#                                                    Character Model
#-----------------------------------------------------------------------------------------------------------------------------------
#____________________________________________________Character Skin_________________________________________________________________
 Char_Skin01.texture_rect = SF.int_rect(0, 0, 96, 128); Char_Skin01 = SF::Sprite.new(CHAR_SKIN)
#__________________________________________________Character Creation________________________________________________________________
#------------------------------------------------------------------------------------------------------------------------------------
#                                                         Skin
#-----------------------------------------------------------------------------------------------------------------------------------
 SKIN_ARRAY = [PLAYER_CHAR, PLAYER_CHAR_2, PLAYER_CHAR_3, PLAYER_CHAR_4, PLAYER_CHAR_5, PLAYER_CHAR_6, PLAYER_CHAR_7]
 
 DISPLAY_SKIN_ARRAY = [PLAYER_CHAR_DISPLAY, PLAYER_CHAR_DISPLAY_2, PLAYER_CHAR_DISPLAY_3, PLAYER_CHAR_DISPLAY_4,
 PLAYER_CHAR_DISPLAY_5, PLAYER_CHAR_DISPLAY_6, PLAYER_CHAR_DISPLAY_7]
 
 SKIN_DESC_ARRAY = ["  Light", "   Tan", "  Dark", "Ghostly", "  Blue", "Purple", "Jaundiced"]
 
 Skin_Desc = SF::Text.new; Skin_Desc.font = FONT_FANCY_BOLD
 Skin_Desc.string = SKIN_DESC_ARRAY[0]; Skin_Desc.character_size = 40; Skin_Desc.color = SF::Color::White
 Skin_Desc.position = SF.vector2(305, 530)
 #........................................................Light......................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_TEXTURE_01 = SF::Texture.from_file("graphics/Char_Skin.png")
  PLAYER_CHAR = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY.scale = SF.vector2(2.0, 2.0)
 #.........................................................Tan.......................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_2 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  PLAYER_CHAR_2.color = SF.color(230, 230, 230)
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY_2 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY_2.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY_2.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY_2.color = SF.color(230, 230, 230)
  PLAYER_CHAR_DISPLAY_2.scale = SF.vector2(2.0, 2.0)
 #........................................................Dark.......................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_3 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  PLAYER_CHAR_3.color = SF.color(100, 100, 100)
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY_3 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY_3.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY_3.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY_3.color = SF.color(100, 100, 100)
  PLAYER_CHAR_DISPLAY_3.scale = SF.vector2(2.0, 2.0)
 #.......................................................Ghostly.....................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_4 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  PLAYER_CHAR_4.color = SF.color(255, 255, 255, 128)
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY_4 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY_4.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY_4.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY_4.color = SF.color(255, 255, 255, 128)
  PLAYER_CHAR_DISPLAY_4.scale = SF.vector2(2.0, 2.0)
 #........................................................Blue.......................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_5 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  PLAYER_CHAR_5.color = SF.color(0, 0, 255)
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY_5 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY_5.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY_5.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY_5.color = SF.color(0, 0, 255)
  PLAYER_CHAR_DISPLAY_5.scale = SF.vector2(2.0, 2.0)
 #.......................................................Purple......................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_6 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  PLAYER_CHAR_6.color = SF.color(100, 0, 255)
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY_6 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY_6.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY_6.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY_6.color = SF.color(100, 0, 255)
  PLAYER_CHAR_DISPLAY_6.scale = SF.vector2(2.0, 2.0)
 #.....................................................Jaundiced.....................................................................
  #\\\\\\\Character Model
  PLAYER_CHAR_7 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
  PLAYER_CHAR_7.color = SF.color(220, 255, 0)
  #\\\\\\\Display Model
  PLAYER_CHAR_DISPLAY_7 = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
  PLAYER_CHAR_DISPLAY_7.texture_rect = SF.int_rect(0, 0, 96, 128)
  PLAYER_CHAR_DISPLAY_7.position = SF.vector2(265, 300)
  PLAYER_CHAR_DISPLAY_7.color = SF.color(220, 255, 0)
  PLAYER_CHAR_DISPLAY_7.scale = SF.vector2(2.0, 2.0)


#------------------------------------------------------------------------------------------------------------------------------------
#                                                     Hair Textures
#------------------------------------------------------------------------------------------------------------------------------------
 HAIR_ARRAY = [SHOUNEN_HAIR_01, SHOUNEN_HAIR_02, SHOUNEN_HAIR_03, SHOUNEN_HAIR_04, SHOUNEN_HAIR_05, SHOUNEN_HAIR_06, SHOUNEN_HAIR_07,
 SHOUNEN_HAIR_08, SHOUNEN_HAIR_09, SHOUNEN_HAIR_10, PONYTAIL_01, PONYTAIL_02, PONYTAIL_03, PONYTAIL_04, PONYTAIL_05, PONYTAIL_06]

 HAIR_DISPLAY_ARRAY = [SHOUNEN_DISPLAY_HAIR_01, SHOUNEN_DISPLAY_HAIR_02, SHOUNEN_DISPLAY_HAIR_03, SHOUNEN_DISPLAY_HAIR_04, 
 SHOUNEN_DISPLAY_HAIR_05, SHOUNEN_DISPLAY_HAIR_06, SHOUNEN_DISPLAY_HAIR_07, SHOUNEN_DISPLAY_HAIR_08, SHOUNEN_DISPLAY_HAIR_09, 
 SHOUNEN_DISPLAY_HAIR_10, DISPLAY_PONYTAIL_HAIR_01, DISPLAY_PONYTAIL_HAIR_02, DISPLAY_PONYTAIL_HAIR_03, DISPLAY_PONYTAIL_HAIR_04, 
 DISPLAY_PONYTAIL_HAIR_05, DISPLAY_PONYTAIL_HAIR_06]

 HAIR_DESC_ARRAY = ["Shounen Hair White", "Shounen Hair Green", "Shounen Hair Blue", "Shounen Hair Red",
 "Shounen Hair Yellow", "Shounen Hair Purple", "Shounen Hair Orange", "Shounen Hair Black", "Shounen Hair Brown", "Shounen Hair Black", 
 "   Ponytail Grey", "Ponytail Blonde", "Ponytail Red", "Ponytail Brown", "Ponytail Pink", "Ponytail Blue"]

 Hair_Desc = SF::Text.new; Hair_Desc.font = FONT_FANCY_BOLD
 Hair_Desc.string = HAIR_DESC_ARRAY[0]; Hair_Desc.character_size = 40; Hair_Desc.color = SF::Color::White
 Hair_Desc.position = SF.vector2(235, 240)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                    Shounen Hairs
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #.................................................Shounen Hair White...............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_TEXTURE_01 = SF::Texture.from_file("graphics/Shounen_Hair.png")
   SHOUNEN_HAIR_01 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_01 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_01.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_01.scale = SF.vector2(3.0, 3.0)
  #.................................................Shounen Hair Green...............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_02 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_02.color = SF.color(32, 178, 170)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_02 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_02.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_02.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_02.color = SF.color(32, 178, 170)
  #.................................................Shounen Hair Blue................................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_03 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_03.color = SF.color(70, 130, 180) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_03 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_03.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_03.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_03.color = SF.color(70, 130, 180) 
  #.................................................Shounen Hair Red.................................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_04 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_04.color = SF.color(128, 0, 0) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_04 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_04.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_04.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_04.color = SF.color(128, 0, 0) 
  #.................................................Shounen Hair Yellow..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_05 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_05.color = SF.color(240, 230, 140)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_05 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_05.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_05.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_05.color = SF.color(240, 230, 140)
  #.................................................Shounen Hair Purple..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_06 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_06.color = SF.color(186, 85, 211)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_06 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_06.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_06.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_06.color = SF.color(186, 85, 211)
  #.................................................Shounen Hair Orange..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_07 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_07.color = SF.color(255, 165, 0)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_07 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_07.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_07.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_07.color = SF.color(255, 165, 0)
  #.................................................Shounen Hair Black..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_08 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_08.color = SF.color(10, 10, 10)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_08 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_08.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_08.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_08.color = SF.color(10, 10, 10)
  #.................................................Shounen Hair Brown..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_09 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_09.color = SF.color(139, 69, 19)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_09 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_09.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_09.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_09.color = SF.color(139, 69, 19)
  #.................................................Shounen Hair Pink...............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_10 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_10.color = SF.color(255, 20, 147)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_10 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_10.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_10.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_10.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_10.color = SF.color(255, 20, 147)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                      Ponytails
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #...................................................Grey Ponytail..................................................................
   #\\\\\\\Character Model
   PONYTAIL_TEXTURE_01 = SF::Texture.from_file("graphics/Ponytail.png")
   PONYTAIL_01 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   #\\\\\\\Display Model
   DISPLAY_PONYTAIL_HAIR_01 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   DISPLAY_PONYTAIL_HAIR_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_PONYTAIL_HAIR_01.position = SF.vector2(250, 50)
   DISPLAY_PONYTAIL_HAIR_01.scale = SF.vector2(3.0, 3.0)
  #..................................................Blonde Ponytail.................................................................
   #\\\\\\\Character Model
   PONYTAIL_02 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   PONYTAIL_02.color = SF.color(255, 255, 0)
   #\\\\\\\Display Model
   DISPLAY_PONYTAIL_HAIR_02 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   DISPLAY_PONYTAIL_HAIR_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_PONYTAIL_HAIR_02.position = SF.vector2(250, 50)
   DISPLAY_PONYTAIL_HAIR_02.scale = SF.vector2(3.0, 3.0)
   DISPLAY_PONYTAIL_HAIR_02.color = SF.color(255, 255, 0)
  #...................................................Red Ponytail...................................................................
   #\\\\\\\Character Model
   PONYTAIL_03 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   PONYTAIL_03.color = SF.color(255, 0, 0)
   #\\\\\\\Display Model
   DISPLAY_PONYTAIL_HAIR_03 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   DISPLAY_PONYTAIL_HAIR_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_PONYTAIL_HAIR_03.position = SF.vector2(250, 50)
   DISPLAY_PONYTAIL_HAIR_03.scale = SF.vector2(3.0, 3.0)
   DISPLAY_PONYTAIL_HAIR_03.color = SF.color(255, 0, 0)
  #..................................................Brown Ponytail..................................................................
   #\\\\\\\Character Model
   PONYTAIL_04 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   PONYTAIL_04.color = SF.color(75, 55, 0)
   #\\\\\\\Display Model
   DISPLAY_PONYTAIL_HAIR_04 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   DISPLAY_PONYTAIL_HAIR_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_PONYTAIL_HAIR_04.position = SF.vector2(250, 50)
   DISPLAY_PONYTAIL_HAIR_04.scale = SF.vector2(3.0, 3.0)
   DISPLAY_PONYTAIL_HAIR_04.color = SF.color(75, 55, 0)
  #..................................................Pink Ponytail...................................................................
   #\\\\\\\Character Model
   PONYTAIL_05 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   PONYTAIL_05.color = SF.color(255, 0, 175)
   #\\\\\\\Display Model
   DISPLAY_PONYTAIL_HAIR_05 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   DISPLAY_PONYTAIL_HAIR_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_PONYTAIL_HAIR_05.position = SF.vector2(250, 50)
   DISPLAY_PONYTAIL_HAIR_05.scale = SF.vector2(3.0, 3.0)
   DISPLAY_PONYTAIL_HAIR_05.color = SF.color(255, 0, 175)
  #..................................................Blue Ponytail...................................................................
   #\\\\\\\Character Model
   PONYTAIL_06 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   PONYTAIL_06.color = SF.color(0, 0, 255)
   #\\\\\\\Display Model
   DISPLAY_PONYTAIL_HAIR_06 = SF::Sprite.new(PONYTAIL_TEXTURE_01)
   DISPLAY_PONYTAIL_HAIR_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_PONYTAIL_HAIR_06.position = SF.vector2(250, 50)
   DISPLAY_PONYTAIL_HAIR_06.scale = SF.vector2(3.0, 3.0)
   DISPLAY_PONYTAIL_HAIR_06.color = SF.color(0, 0, 255)


#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Face Textures
#-------------------------------------------------------------------------------------------------------------------------------------

 FACE_ARRAY = [BUTTON_FACE_01, BUTTON_FACE_02, BUTTON_FACE_03, BUTTON_FACE_04, BUTTON_FACE_05, BUTTON_FACE_06,
 SHOUNEN_FACE_01, SHOUNEN_FACE_02, SHOUNEN_FACE_03, SHOUNEN_FACE_04, SHOUNEN_FACE_05, SHOUNEN_FACE_06, TIRED_FACE_01,
 TIRED_FACE_02, TIRED_FACE_03, TIRED_FACE_04, TIRED_FACE_05, TIRED_FACE_06, SMILEY_FACE_01]

 DISPLAY_FACE_ARRAY = [BUTTON_DISPLAY_FACE_01, BUTTON_DISPLAY_FACE_02, BUTTON_DISPLAY_FACE_03, BUTTON_DISPLAY_FACE_04,
 BUTTON_DISPLAY_FACE_05, BUTTON_DISPLAY_FACE_06, SHOUNEN_DISPLAY_FACE_01, SHOUNEN_DISPLAY_FACE_02, SHOUNEN_DISPLAY_FACE_03,
 SHOUNEN_DISPLAY_FACE_04, SHOUNEN_DISPLAY_FACE_05, SHOUNEN_DISPLAY_FACE_06, TIRED_DISPLAY_FACE_01, TIRED_DISPLAY_FACE_02,
 TIRED_DISPLAY_FACE_03, TIRED_DISPLAY_FACE_04, TIRED_DISPLAY_FACE_05, TIRED_DISPLAY_FACE_06, SMILEY_DISPLAY_FACE_01]

 FACE_DESC_ARRAY = ["Blue Button Eyes", "Red Button Eyes", "Purple Button Eyes", "Green Button Eyes",
 "Yellow Button Eyes", "Brown Button Eyes", "Grey Shounen Face", "Blue Shounen Face", "Green Shounen Face",
 "Brown Shounen Face", "Purple Shounen Face", "Yellow Shounen Face", "Tired Face Grey", "Tired Face Blue", "Tired Face Brown",
 "Tired Face Green", "Tired Face Red", "Tired Face Yellow", "Smiley Face"]
 Face_Desc = SF::Text.new; Face_Desc.font = FONT_FANCY_BOLD
 Face_Desc.string = FACE_DESC_ARRAY[0]; Face_Desc.character_size = 40; Face_Desc.color = SF::Color::White
 Face_Desc.position = SF.vector2(235, 800)
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                   Buttons Faces
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #................................................Blue Button Eyes.................................................................
   #\\\\\\\Character Model
   BUTTON_FACE_TEXTURE_01 = SF::Texture.from_file("graphics/Butto_Eyes.png")
   BUTTON_FACE_01 = SF::Sprite.new(BUTTON_FACE_TEXTURE_01) 
   #\\\\\\\Display Model
   BUTTON_DISPLAY_FACE_01 = SF::Sprite.new(BUTTON_FACE_TEXTURE_01)
   BUTTON_DISPLAY_FACE_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   BUTTON_DISPLAY_FACE_01.position = SF.vector2(190, 600)
   BUTTON_DISPLAY_FACE_01.scale = SF.vector2(3.5, 3.5)
  #................................................Red Button Eyes..................................................................
   #\\\\\\\Character Model
   BUTTON_FACE_02 = SF::Sprite.new(BUTTON_FACE_TEXTURE_01) 
   BUTTON_FACE_02.color = SF.color(255, 0, 0)
   #\\\\\\\Display Model
   BUTTON_DISPLAY_FACE_02 = SF::Sprite.new(BUTTON_FACE_TEXTURE_01)
   BUTTON_DISPLAY_FACE_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   BUTTON_DISPLAY_FACE_02.position = SF.vector2(190, 600)
   BUTTON_DISPLAY_FACE_02.scale = SF.vector2(3.5, 3.5)
   BUTTON_DISPLAY_FACE_02.color = SF.color(255, 0, 0)
  #...............................................Purple Button Eyes................................................................
   #\\\\\\\Character Model
   BUTTON_FACE_TEXTURE_02 = SF::Texture.from_file("graphics/Button_Eyes_2.png")
   BUTTON_FACE_03 = SF::Sprite.new(BUTTON_FACE_TEXTURE_02) 
   #\\\\\\\Display Model
   BUTTON_DISPLAY_FACE_03 = SF::Sprite.new(BUTTON_FACE_TEXTURE_02)
   BUTTON_DISPLAY_FACE_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   BUTTON_DISPLAY_FACE_03.position = SF.vector2(190, 600)
   BUTTON_DISPLAY_FACE_03.scale = SF.vector2(3.5, 3.5)
  #...............................................Green Button Eyes.................................................................
   #\\\\\\\Character Model
   BUTTON_FACE_TEXTURE_03 = SF::Texture.from_file("graphics/Button_Eyes_3.png")
   BUTTON_FACE_04 = SF::Sprite.new(BUTTON_FACE_TEXTURE_03) 
   #\\\\\\\Display Model
   BUTTON_DISPLAY_FACE_04 = SF::Sprite.new(BUTTON_FACE_TEXTURE_03)
   BUTTON_DISPLAY_FACE_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   BUTTON_DISPLAY_FACE_04.position = SF.vector2(190, 600)
   BUTTON_DISPLAY_FACE_04.scale = SF.vector2(3.5, 3.5)
  #...............................................Yellow Button Eyes................................................................
   #\\\\\\\Character Model
   BUTTON_FACE_TEXTURE_04 = SF::Texture.from_file("graphics/Button_Eyes_4.png")
   BUTTON_FACE_05 = SF::Sprite.new(BUTTON_FACE_TEXTURE_04) 
   #\\\\\\\Display Model
   BUTTON_DISPLAY_FACE_05 = SF::Sprite.new(BUTTON_FACE_TEXTURE_04)
   BUTTON_DISPLAY_FACE_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   BUTTON_DISPLAY_FACE_05.position = SF.vector2(190, 600)
   BUTTON_DISPLAY_FACE_05.scale = SF.vector2(3.5, 3.5)
  #...............................................Brown Button Eyes.................................................................
   #\\\\\\\Character Model
   BUTTON_FACE_TEXTURE_05 = SF::Texture.from_file("graphics/Button_Eyes_5.png")
   BUTTON_FACE_06 = SF::Sprite.new(BUTTON_FACE_TEXTURE_05) 
   #\\\\\\\Display Model
   BUTTON_DISPLAY_FACE_06 = SF::Sprite.new(BUTTON_FACE_TEXTURE_05)
   BUTTON_DISPLAY_FACE_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   BUTTON_DISPLAY_FACE_06.position = SF.vector2(190, 600)
   BUTTON_DISPLAY_FACE_06.scale = SF.vector2(3.5, 3.5)
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                  Shounen Faces
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #...............................................Grey Shounen Face.................................................................
   #\\\\\\\Character Model
   SHOUNEN_FACE_TEXTURE_01 = SF::Texture.from_file("graphics/Shounen_Face.png")
   SHOUNEN_FACE_01 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_01) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_FACE_01 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_01)
   SHOUNEN_DISPLAY_FACE_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_FACE_01.position = SF.vector2(190, 600)
   SHOUNEN_DISPLAY_FACE_01.scale = SF.vector2(3.5, 3.5)
  #...............................................Blue Shounen Face.................................................................
   #\\\\\\\Character Model
   SHOUNEN_FACE_TEXTURE_02 = SF::Texture.from_file("graphics/Shounen_Face_Blue.png")
   SHOUNEN_FACE_02 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_02) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_FACE_02 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_02)
   SHOUNEN_DISPLAY_FACE_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_FACE_02.position = SF.vector2(190, 600)
   SHOUNEN_DISPLAY_FACE_02.scale = SF.vector2(3.5, 3.5)
  #..............................................Green Shounen Face.................................................................
   #\\\\\\\Character Model
   SHOUNEN_FACE_TEXTURE_03 = SF::Texture.from_file("graphics/Shounen_Face_Green.png")
   SHOUNEN_FACE_03 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_03) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_FACE_03 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_03)
   SHOUNEN_DISPLAY_FACE_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_FACE_03.position = SF.vector2(190, 600)
   SHOUNEN_DISPLAY_FACE_03.scale = SF.vector2(3.5, 3.5)
  #..............................................Brown Shounen Face.................................................................
   #\\\\\\\Character Model
   SHOUNEN_FACE_TEXTURE_04 = SF::Texture.from_file("graphics/Shounen_Face_Brown.png")
   SHOUNEN_FACE_04 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_04) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_FACE_04 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_04)
   SHOUNEN_DISPLAY_FACE_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_FACE_04.position = SF.vector2(190, 600)
   SHOUNEN_DISPLAY_FACE_04.scale = SF.vector2(3.5, 3.5)
  #..............................................Purple Shounen Face................................................................
   #\\\\\\\Character Model
   SHOUNEN_FACE_TEXTURE_05 = SF::Texture.from_file("graphics/Shounen_Face_Purple.png")
   SHOUNEN_FACE_05 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_05) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_FACE_05 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_05)
   SHOUNEN_DISPLAY_FACE_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_FACE_05.position = SF.vector2(190, 600)
   SHOUNEN_DISPLAY_FACE_05.scale = SF.vector2(3.5, 3.5)
  #..............................................Yellow Shounen Face................................................................
   #\\\\\\\Character Model
   SHOUNEN_FACE_TEXTURE_06 = SF::Texture.from_file("graphics/Shounen_Face_Yellow.png")
   SHOUNEN_FACE_06 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_06) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_FACE_06 = SF::Sprite.new(SHOUNEN_FACE_TEXTURE_06)
   SHOUNEN_DISPLAY_FACE_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_FACE_06.position = SF.vector2(190, 600)
   SHOUNEN_DISPLAY_FACE_06.scale = SF.vector2(3.5, 3.5)
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                   Tired Faces
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #................................................Grey Tired Face..................................................................
   #\\\\\\\Character Model
   TIRED_FACE_TEXTURE_01 = SF::Texture.from_file("graphics/Tired_Face.png")
   TIRED_FACE_01 = SF::Sprite.new(TIRED_FACE_TEXTURE_01) 
   #\\\\\\\Display Model
   TIRED_DISPLAY_FACE_01 = SF::Sprite.new(TIRED_FACE_TEXTURE_01)
   TIRED_DISPLAY_FACE_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   TIRED_DISPLAY_FACE_01.position = SF.vector2(190, 600)
   TIRED_DISPLAY_FACE_01.scale = SF.vector2(3.5, 3.5)
  #................................................Blue Tired Face..................................................................
   #\\\\\\\Character Model
   TIRED_FACE_TEXTURE_02 = SF::Texture.from_file("graphics/Tired_Face_Blue.png")
   TIRED_FACE_02 = SF::Sprite.new(TIRED_FACE_TEXTURE_02) 
   #\\\\\\\Display Model
   TIRED_DISPLAY_FACE_02 = SF::Sprite.new(TIRED_FACE_TEXTURE_02)
   TIRED_DISPLAY_FACE_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   TIRED_DISPLAY_FACE_02.position = SF.vector2(190, 600)
   TIRED_DISPLAY_FACE_02.scale = SF.vector2(3.5, 3.5)
  #...............................................Brown Tired Face..................................................................
   #\\\\\\\Character Model
   TIRED_FACE_TEXTURE_03 = SF::Texture.from_file("graphics/Tired_Face_Brown.png")
   TIRED_FACE_03 = SF::Sprite.new(TIRED_FACE_TEXTURE_03) 
   #\\\\\\\Display Model
   TIRED_DISPLAY_FACE_03 = SF::Sprite.new(TIRED_FACE_TEXTURE_03)
   TIRED_DISPLAY_FACE_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   TIRED_DISPLAY_FACE_03.position = SF.vector2(190, 600)
   TIRED_DISPLAY_FACE_03.scale = SF.vector2(3.5, 3.5)
  #...............................................Green Tired Face..................................................................
   #\\\\\\\Character Model
   TIRED_FACE_TEXTURE_04 = SF::Texture.from_file("graphics/Tired_Face_Green.png")
   TIRED_FACE_04 = SF::Sprite.new(TIRED_FACE_TEXTURE_04) 
   #\\\\\\\Display Model
   TIRED_DISPLAY_FACE_04 = SF::Sprite.new(TIRED_FACE_TEXTURE_04)
   TIRED_DISPLAY_FACE_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   TIRED_DISPLAY_FACE_04.position = SF.vector2(190, 600)
   TIRED_DISPLAY_FACE_04.scale = SF.vector2(3.5, 3.5)
  #................................................Red Tired Face...................................................................
   #\\\\\\\Character Model
   TIRED_FACE_TEXTURE_05 = SF::Texture.from_file("graphics/Tired_Face_Red.png")
   TIRED_FACE_05 = SF::Sprite.new(TIRED_FACE_TEXTURE_05) 
   #\\\\\\\Display Model
   TIRED_DISPLAY_FACE_05 = SF::Sprite.new(TIRED_FACE_TEXTURE_05)
   TIRED_DISPLAY_FACE_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   TIRED_DISPLAY_FACE_05.position = SF.vector2(190, 600)
   TIRED_DISPLAY_FACE_05.scale = SF.vector2(3.5, 3.5)
  #..............................................Yellow Tired Face..................................................................
   #\\\\\\\Character Model
   TIRED_FACE_TEXTURE_06 = SF::Texture.from_file("graphics/Tired_Face_Yellow.png")
   TIRED_FACE_06 = SF::Sprite.new(TIRED_FACE_TEXTURE_06) 
   #\\\\\\\Display Model
   TIRED_DISPLAY_FACE_06 = SF::Sprite.new(TIRED_FACE_TEXTURE_06)
   TIRED_DISPLAY_FACE_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   TIRED_DISPLAY_FACE_06.position = SF.vector2(190, 600)
   TIRED_DISPLAY_FACE_06.scale = SF.vector2(3.5, 3.5)

 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                   Smiley Faces
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #..................................................Smiley Face....................................................................
   #\\\\\\\Character Model
   SMILEY_FACE_TEXTURE_01 = SF::Texture.from_file("graphics/Smiley_Face.png")
   SMILEY_FACE_01 = SF::Sprite.new(SMILEY_FACE_TEXTURE_01) 
   #\\\\\\\Display Model
   SMILEY_DISPLAY_FACE_01 = SF::Sprite.new(SMILEY_FACE_TEXTURE_01)
   SMILEY_DISPLAY_FACE_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   SMILEY_DISPLAY_FACE_01.position = SF.vector2(190, 600)
   SMILEY_DISPLAY_FACE_01.scale = SF.vector2(3.5, 3.5)
#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Glove Textures
#-------------------------------------------------------------------------------------------------------------------------------------
 GLOVE_ARRAY = [FINGERLESS_GLOVE_01, FINGERLESS_GLOVE_02, FINGERLESS_GLOVE_03, FINGERLESS_GLOVE_04, FINGERLESS_GLOVE_05, FINGERLESS_GLOVE_06,
 FINGERLESS_GLOVE_07, FINGERLESS_GLOVE_08, FINGERLESS_GLOVE_09, FINGERLESS_GLOVE_10]

 DISPLAY_GLOVE_ARRAY = [DISPLAY_FINGERLESS_GLOVE_01, DISPLAY_FINGERLESS_GLOVE_02, DISPLAY_FINGERLESS_GLOVE_03, DISPLAY_FINGERLESS_GLOVE_04,
 DISPLAY_FINGERLESS_GLOVE_05, DISPLAY_FINGERLESS_GLOVE_06, DISPLAY_FINGERLESS_GLOVE_07, DISPLAY_FINGERLESS_GLOVE_08, DISPLAY_FINGERLESS_GLOVE_09,
 DISPLAY_FINGERLESS_GLOVE_10]

 GLOVE_DESC_ARRAY = ["White Fingerless Gloves", "Red Fingerless Gloves", "Blue Fingerless Gloves", "Black Fingerless Gloves", "Orange Fingerless Gloves",
 "Yellow Fingerless Gloves", "Green Fingerless Gloves", "Purple Fingerless Gloves", "Pink Fingerless Gloves", "Brown Fingerless Gloves"]

 Glove_Desc = SF::Text.new; Glove_Desc.font = FONT_FANCY_BOLD
 Glove_Desc.string = GLOVE_DESC_ARRAY[0]; Glove_Desc.character_size = 40; Glove_Desc.color = SF::Color::White
 Glove_Desc.position = SF.vector2(1400, 250)
 #.................................................Fingerless Gloves White...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_TEXTURE_01 = SF::Texture.from_file("graphics/Fingerless_Gloves_01.png")
  FINGERLESS_GLOVE_01 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_01 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_01.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_01.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_01.scale = SF.vector2(5.0, 5.0)
 #.................................................Fingerless Gloves Red.............................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_02 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_02.color = SF.color(128, 0, 0)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_02 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_02.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_02.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_02.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_02.color = SF.color(128, 0, 0)
 #.................................................Fingerless Gloves Blue............................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_03 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_03.color = SF.color(70, 130, 180)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_03 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_03.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_03.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_03.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_03.color = SF.color(70, 130, 180)
 #.................................................Fingerless Gloves Black...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_04 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_04.color = SF.color(20, 20, 20)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_04 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_04.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_04.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_04.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_04.color = SF.color(20, 20, 20)
 #.................................................Fingerless Gloves Orange...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_05 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_05.color = SF.color(255, 140, 0)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_05 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_05.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_05.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_05.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_05.color = SF.color(255, 140, 0)
 #.................................................Fingerless Gloves Yellow...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_06 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_06.color = SF.color(255, 255, 153)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_06 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_06.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_06.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_06.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_06.color = SF.color(255, 255, 153)
 #.................................................Fingerless Gloves Green...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_07 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_07.color = SF.color(85, 107, 47)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_07 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_07.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_07.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_07.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_07.color = SF.color(85, 107, 47)
 #.................................................Fingerless Gloves Purple...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_08 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_08.color = SF.color(153, 50, 204)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_08 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_08.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_08.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_08.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_08.color = SF.color(153, 50, 204)
 #.................................................Fingerless Gloves Pink...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_09 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_09.color = SF.color(219, 112, 147)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_09 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_09.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_09.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_09.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_09.color = SF.color(219, 112, 147)
 #.................................................Fingerless Gloves Brown...........................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_10 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_10.color = SF.color(139, 69, 19)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_10 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_10.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_10.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_10.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_10.color = SF.color(139, 69, 19)
#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Shirt Textures
#-------------------------------------------------------------------------------------------------------------------------------------

 SHIRT_ARRAY = [T_SHIRT_01, T_SHIRT_02, T_SHIRT_03, T_SHIRT_04, T_SHIRT_05, T_SHIRT_06, TANK_TOP_01, TANK_TOP_02, TANK_TOP_03,
 TANK_TOP_04, TANK_TOP_05, TANK_TOP_06, TANK_TOP_07, TANK_TOP_08, TANK_TOP_09, T_SHIRT_07, T_SHIRT_08, T_SHIRT_09, TUBE_TOP_01,
 TUBE_TOP_02, TUBE_TOP_03, TUBE_TOP_04, TUBE_TOP_05, TUBE_TOP_06, TUBE_TOP_07, TUBE_TOP_08, TUBE_TOP_09]

 DISPLAY_SHIRT_ARRAY = [DISPLAY_T_SHIRT_01, DISPLAY_T_SHIRT_02, DISPLAY_T_SHIRT_03, DISPLAY_T_SHIRT_04,
 DISPLAY_T_SHIRT_05, DISPLAY_T_SHIRT_06, DISPLAY_TANK_TOP_01, DISPLAY_TANK_TOP_02, DISPLAY_TANK_TOP_03, DISPLAY_TANK_TOP_04,
 DISPLAY_TANK_TOP_05, DISPLAY_TANK_TOP_06, DISPLAY_TANK_TOP_07, DISPLAY_TANK_TOP_08, DISPLAY_TANK_TOP_09, DISPLAY_T_SHIRT_07,
 DISPLAY_T_SHIRT_08, DISPLAY_T_SHIRT_09, DISPLAY_TUBE_TOP_01, DISPLAY_TUBE_TOP_02, DISPLAY_TUBE_TOP_03, DISPLAY_TUBE_TOP_04,
 DISPLAY_TUBE_TOP_05, DISPLAY_TUBE_TOP_06, DISPLAY_TUBE_TOP_07, DISPLAY_TUBE_TOP_08, DISPLAY_TUBE_TOP_09]

 SHIRT_DESC_ARRAY = ["White T-Shirt", "Blue T-Shirt", "Red T-Shirt", "Green T-Shirt", "Purple T-Shirt", 
 "Black T-Shirt", "White Tank Top", "Red Tank Top", "Orange Tank Top", "Yellow Tank Top", "Green Tank Top", "Blue Tank Top",
 "Purple Tank Top", "Pink Tank Top", "Orange T-Shirt", "Yellow T-Shirt", "Pink T-Shirt", "White Tube Top", "Black Tube Top",
 "Red Tube Top", "Orange Tube Top", "Yellow Tube Top", "Green Tube Top", "Blue Tube Top", "Purple Tube Top", "Pink Tube Top"]

 Shirt_Desc = SF::Text.new; Shirt_Desc.font = FONT_FANCY_BOLD
 Shirt_Desc.string = SHIRT_DESC_ARRAY[0]; Shirt_Desc.character_size = 40; Shirt_Desc.color = SF::Color::White
 Shirt_Desc.position = SF.vector2(1200, 800)
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''T-Shirts''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #....................................................White T-Shirt..................................................................
   #\\\\\\\Character Model
   T_SHIRT_TEXTURE_01 = SF::Texture.from_file("graphics/T-Shirt_01.png")
   T_SHIRT_01 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_01 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_01.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_01.scale = SF.vector2(3.5, 3.5)
  #....................................................Blue T-Shirt...................................................................
   #\\\\\\\Character Model
   T_SHIRT_02 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_02.color = SF.color(0, 0, 255)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_02 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_02.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_02.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_02.color = SF.color(0, 0, 255)
  #.....................................................Red T-Shirt...................................................................
   #\\\\\\\Character Model
   T_SHIRT_03 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_03.color = SF.color(255, 50, 50)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_03 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_03.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_03.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_03.color = SF.color(255, 50, 50)
  #....................................................Green T-Shirt..................................................................
   #\\\\\\\Character Model
   T_SHIRT_04 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_04.color = SF.color(50, 255, 50)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_04 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_04.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_04.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_04.color = SF.color(50, 255, 50)
  #....................................................Purple T-Shirt.................................................................
   #\\\\\\\Character Model
   T_SHIRT_05 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_05.color = SF.color(100, 0, 200)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_05 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_05.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_05.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_05.color = SF.color(100, 0, 200)
  #....................................................Black T-Shirt..................................................................
   #\\\\\\\Character Model
   T_SHIRT_06 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_06.color = SF.color(10, 10, 10)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_06 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_06.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_06.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_06.color = SF.color(10, 10, 10)
  #....................................................Orange T-Shirt..................................................................
   #\\\\\\\Character Model
   T_SHIRT_07 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_07.color = SF.color(255, 165, 0)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_07 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_07.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_07.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_07.color = SF.color(255, 165, 0)
  #....................................................Yellow T-Shirt..................................................................
   #\\\\\\\Character Model
   T_SHIRT_08 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_08.color = SF.color(255, 255, 153)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_08 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_08.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_08.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_08.color = SF.color(255, 255, 153)
  #.....................................................Pink T-Shirt....................................................................
   #\\\\\\\Character Model
   T_SHIRT_09 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   T_SHIRT_09.color = SF.color(199, 21, 133)
   #\\\\\\\Display Model
   DISPLAY_T_SHIRT_09 = SF::Sprite.new(T_SHIRT_TEXTURE_01)
   DISPLAY_T_SHIRT_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_T_SHIRT_09.position = SF.vector2(1125, 475)
   DISPLAY_T_SHIRT_09.scale = SF.vector2(3.5, 3.5)
   DISPLAY_T_SHIRT_09.color = SF.color(199, 21, 133)
 
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Tank Tops'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  #...................................................White Tank Top...................................................................
   #\\\\\\\Character Model
   TANK_TOP_TEXTURE_01 = SF::Texture.from_file("graphics/Tank_Top_01.png")
   TANK_TOP_01 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_01 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_01.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_01.scale = SF.vector2(3.5, 3.5)
  #...................................................Black Tank Top...................................................................
   #\\\\\\\Character Model
   TANK_TOP_02 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_02.color = SF.color(0, 0, 0)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_02 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_02.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_02.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_02.color = SF.color(0, 0, 0)
  #....................................................Red Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_03 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_03.color = SF.color(255, 0, 0)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_03 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_03.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_03.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_03.color = SF.color(255, 0, 0)
  #..................................................Orange Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_04 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_04.color = SF.color(255, 165, 0)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_04 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_04.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_04.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_04.color = SF.color(255, 165, 0)
  #..................................................Yellow Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_05 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_05.color = SF.color(255, 255, 0)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_05 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_05.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_05.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_05.color = SF.color(255, 255, 0)
  #...................................................Green Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_06 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_06.color = SF.color(0, 100, 0)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_06 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_06.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_06.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_06.color = SF.color(0, 100, 0)
  #...................................................Blue Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_07 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_07.color = SF.color(0, 0, 128)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_07 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_07.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_07.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_07.color = SF.color(0, 0, 128)
  #.................................................Purple Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_08 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_08.color = SF.color(147, 112, 219)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_08 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_08.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_08.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_08.color = SF.color(147, 112, 219)
  #...................................................Pink Tank Top....................................................................
   #\\\\\\\Character Model
   TANK_TOP_09 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   TANK_TOP_09.color = SF.color(255, 105, 180)
   #\\\\\\\Display Model
   DISPLAY_TANK_TOP_09 = SF::Sprite.new(TANK_TOP_TEXTURE_01)
   DISPLAY_TANK_TOP_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TANK_TOP_09.position = SF.vector2(1125, 475)
   DISPLAY_TANK_TOP_09.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TANK_TOP_09.color = SF.color(255, 105, 180)
 #''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Tube Tops'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  #...................................................White Tube Top...................................................................
   #\\\\\\\Character Model
   TUBE_TOP_TEXTURE_01 = SF::Texture.from_file("graphics/Tube_Top_01.png")
   TUBE_TOP_01 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_01 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_01.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_01.scale = SF.vector2(3.5, 3.5)
  #...................................................Black Tube Top...................................................................
   #\\\\\\\Character Model
   TUBE_TOP_02 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_02.color = SF.color(0, 0, 0)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_02 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_02.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_02.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_02.color = SF.color(0, 0, 0)
  #...................................................Red Tube Top...................................................................
   #\\\\\\\Character Model
   TUBE_TOP_03 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_03.color = SF.color(128, 0, 0)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_03 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_03.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_03.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_03.color = SF.color(128, 0, 0)
  #..................................................Orange Tube Top..................................................................
   #\\\\\\\Character Model
   TUBE_TOP_04 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_04.color = SF.color(255, 165, 0)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_04 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_04.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_04.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_04.color = SF.color(255, 165, 0)
  #..................................................Yellow Tube Top..................................................................
   #\\\\\\\Character Model
   TUBE_TOP_05 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_05.color = SF.color(255, 255, 102)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_05 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_05.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_05.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_05.color = SF.color(255, 255, 102)
  #...................................................Green Tube Top..................................................................
   #\\\\\\\Character Model
   TUBE_TOP_06 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_06.color = SF.color(175, 255, 47)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_06 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_06.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_06.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_06.color = SF.color(175, 255, 47)
  #....................................................Blue Tube Top...................................................................
   #\\\\\\\Character Model
   TUBE_TOP_07 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_07.color = SF.color(25, 25, 112)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_07 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_07.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_07.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_07.color = SF.color(25, 25, 112)
  #...................................................Purple Tube Top..................................................................
   #\\\\\\\Character Model
   TUBE_TOP_08 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_08.color = SF.color(138, 43, 226)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_08 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_08.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_08.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_08.color = SF.color(138, 43, 226)
  #.....................................................Pink Tube Top..................................................................
   #\\\\\\\Character Model
   TUBE_TOP_09 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   TUBE_TOP_09.color = SF.color(255, 105, 180)
   #\\\\\\\Display Model
   DISPLAY_TUBE_TOP_09 = SF::Sprite.new(TUBE_TOP_TEXTURE_01)
   DISPLAY_TUBE_TOP_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_TUBE_TOP_09.position = SF.vector2(1125, 475)
   DISPLAY_TUBE_TOP_09.scale = SF.vector2(3.5, 3.5)
   DISPLAY_TUBE_TOP_09.color = SF.color(255, 105, 180)
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Pants Textures
#-------------------------------------------------------------------------------------------------------------------------------------
 PANTS_ARRAY = [SHORTS_01, SHORTS_02, SHORTS_03, SHORTS_04, SHORTS_05, SHORTS_06, SHORTS_07, SHORTS_08, SHORTS_09, SHORTS_10, SHORTS_11,
 BOOTY_SHORTS_01, BOOTY_SHORTS_02, BOOTY_SHORTS_03, BOOTY_SHORTS_04, BOOTY_SHORTS_05, BOOTY_SHORTS_06, BOOTY_SHORTS_07, BOOTY_SHORTS_08,
 BOOTY_SHORTS_09, BOOTY_SHORTS_10, JEANS_01, JEANS_02, JEANS_03, JEANS_04, JEANS_05, JEANS_06, JEANS_07, JEANS_08, JEANS_09, JEANS_10]

 DISPLAY_PANTS_ARRAY = [DISPLAY_SHORTS_01, DISPLAY_SHORTS_02, DISPLAY_SHORTS_03, DISPLAY_SHORTS_04, DISPLAY_SHORTS_05, DISPLAY_SHORTS_06,
 DISPLAY_SHORTS_07, DISPLAY_SHORTS_08, DISPLAY_SHORTS_09, DISPLAY_SHORTS_10, DISPLAY_SHORTS_11, BOOTY_DISPLAY_SHORTS_01, BOOTY_DISPLAY_SHORTS_02,
 BOOTY_DISPLAY_SHORTS_03, BOOTY_DISPLAY_SHORTS_04, BOOTY_DISPLAY_SHORTS_05, BOOTY_DISPLAY_SHORTS_06, BOOTY_DISPLAY_SHORTS_07,
 BOOTY_DISPLAY_SHORTS_08, BOOTY_DISPLAY_SHORTS_09, BOOTY_DISPLAY_SHORTS_10, DISPLAY_JEANS_01, DISPLAY_JEANS_02, DISPLAY_JEANS_03,
 DISPLAY_JEANS_04, DISPLAY_JEANS_05, DISPLAY_JEANS_06, DISPLAY_JEANS_07, DISPLAY_JEANS_08, DISPLAY_JEANS_09, DISPLAY_JEANS_10]

 PANTS_DESC_ARRAY = ["White Shorts", "Brown Shorts", "Black Shorts", "Red Shorts", "Light-Blue Shorts", "Orange Shorts", "Khaki Shorts",
 "Green Shorts", "Blue Shorts", "Purple Shorts", "Pink Shorts", "White Booty Shorts", "Brown Booty Shorts", "Red Booty Shorts",
 "Orange Booty Shorts", "Yellow Booty Shorts", "Black Booty Shorts", "Green Booty Shorts", "Blue Booty Shorts", "Purple Booty Shorts",
 "Pink Booty Shorts", "White Jeans", "Black Jeans", "Brown Jeans", "Red Jeans", "Orange Jeans", "Yellow Jeans", "Green Jeans",
 "Blue Jeans", "Purple Jeans", "Pink Jeans"]

 Pants_Desc = SF::Text.new; Pants_Desc.font = FONT_FANCY_BOLD
 Pants_Desc.string = PANTS_DESC_ARRAY[0]; Pants_Desc.character_size = 40; Pants_Desc.color = SF::Color::White
 Pants_Desc.position = SF.vector2(1500, 530)
 #''''''''''''''''''''''''''''''''''''''''''''''''''''''''Shorts'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  #.....................................................White Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_TEXTURE_01 = SF::Texture.from_file("graphics/Shorts.png")
   SHORTS_01 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   #\\\\\\\Display Model
   DISPLAY_SHORTS_01 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_01.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_01.scale = SF.vector2(3.5, 3.5)
  #.....................................................Brown Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_02 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_02.color = SF.color(139, 69, 19)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_02 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_02.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_02.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_02.color = SF.color(139, 69, 19)
  #.....................................................Black Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_03 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_03.color = SF.color(70, 70, 70)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_03 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_03.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_03.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_03.color = SF.color(70, 70, 70)
  #......................................................Red Shorts...................................................................
   #\\\\\\\Character Model
   SHORTS_04 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_04.color = SF.color(178, 34, 34)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_04 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_04.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_04.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_04.color = SF.color(178, 34, 34)
  #..................................................Light-Blue Shorts................................................................
   #\\\\\\\Character Model
   SHORTS_05 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_05.color = SF.color(176, 224, 230)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_05 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_05.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_05.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_05.color = SF.color(176, 224, 230)
  #.....................................................Orange Shorts.................................................................
   #\\\\\\\Character Model
   SHORTS_06 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_06.color = SF.color(255, 165, 0)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_06 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_06.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_06.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_06.color = SF.color(255, 165, 0)
  #.....................................................Khaki Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_07 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_07.color = SF.color(240, 230, 140)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_07 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_07.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_07.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_07.color = SF.color(240, 230, 140)
  #.....................................................Green Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_08 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_08.color = SF.color(85, 107, 47)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_08 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_08.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_08.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_08.color = SF.color(85, 107, 47)
  #......................................................Blue Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_09 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_09.color = SF.color(70, 130, 180)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_09 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_09.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_09.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_09.color = SF.color(70, 130, 180)
  #.....................................................Purple Shorts..................................................................
   #\\\\\\\Character Model
   SHORTS_10 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_10.color = SF.color(147, 112, 219)
   #\\\\\\\Display Model
   DISPLAY_SHORTS_10 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_10.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_10.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_10.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_10.color = SF.color(147, 112, 219)
  #......................................................Pink Shorts...................................................................
   #\\\\\\\Character Model
   SHORTS_11 = SF::Sprite.new(SHORTS_TEXTURE_01) 
   SHORTS_11.color = SF.color(199, 21, 133)
   #\\\\\\\DBOOTY_DISPLAY_SHORTS_01isplay Model
   DISPLAY_SHORTS_11 = SF::Sprite.new(SHORTS_TEXTURE_01)
   DISPLAY_SHORTS_11.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_SHORTS_11.position = SF.vector2(1415, 120)
   DISPLAY_SHORTS_11.scale = SF.vector2(3.5, 3.5)
   DISPLAY_SHORTS_11.color = SF.color(199, 21, 133)
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''Booty Shorts''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  #.................................................White Booty Shorts................................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_TEXTURE_01 = SF::Texture.from_file("graphics/Booty_Shorts_01.png")
   BOOTY_SHORTS_01 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_01 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_01.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_01.scale = SF.vector2(3.5, 3.5)
  #.................................................Brown Booty Shorts................................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_02 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_02.color = SF.color(210, 105, 30)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_02 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_02.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_02.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_02.color = SF.color(210, 105, 30)
  #..................................................Red Booty Shorts.................................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_03 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_03.color = SF.color(205, 92, 92)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_03 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_03.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_03.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_03.color = SF.color(205, 92, 92)
  #.................................................Orange Booty Shorts...............................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_04 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_04.color = SF.color(255, 215, 0)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_04 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_04.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_04.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_04.color = SF.color(255, 215, 0)
  #.................................................Yellow Booty Shorts...............................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_05 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_05.color = SF.color(255, 255, 153)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_05 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_05.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_05.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_05.color = SF.color(255, 255, 153)
  #..................................................Black Booty Shorts...............................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_06 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_06.color = SF.color(15, 15, 15)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_06 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_06.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_06.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_06.color = SF.color(15, 15, 15)
  #..................................................Green Booty Shorts...............................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_07 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_07.color = SF.color(0, 255, 0)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_07 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_07.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_07.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_07.color = SF.color(0, 255, 0)
  #..................................................Blue Booty Shorts................................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_08 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_08.color = SF.color(0, 191, 255)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_08 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_08.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_08.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_08.color = SF.color(0, 191, 255)
  #.................................................Purple Booty Shorts...............................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_09 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_09.color = SF.color(138, 43, 226)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_09 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_09.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_09.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_09.color = SF.color(138, 43, 226)
  #..................................................Pink Booty Shorts................................................................
   #\\\\\\\Character Model
   BOOTY_SHORTS_10 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01) 
   BOOTY_SHORTS_10.color = SF.color(255, 105, 180)
   #\\\\\\\Display Model
   BOOTY_DISPLAY_SHORTS_10 = SF::Sprite.new(BOOTY_SHORTS_TEXTURE_01)
   BOOTY_DISPLAY_SHORTS_10.texture_rect = SF.int_rect(0, 0, 96, 128)
   BOOTY_DISPLAY_SHORTS_10.position = SF.vector2(1415, 120)
   BOOTY_DISPLAY_SHORTS_10.scale = SF.vector2(3.5, 3.5)
   BOOTY_DISPLAY_SHORTS_10.color = SF.color(255, 105, 180)
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 #''''''''''''''''''''''''''''''''''''''''''''''''''''''''Jeans'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  #....................................................White Jeans....................................................................
   #\\\\\\\Character Model
   JEANS_TEXTURE_01 = SF::Texture.from_file("graphics/Jeans.png")
   JEANS_01 = SF::Sprite.new(JEANS_TEXTURE_01) 
   #\\\\\\\Display Model
   DISPLAY_JEANS_01 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_01.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_01.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_01.scale = SF.vector2(3.5, 3.5)
  #....................................................Black Jeans....................................................................
   #\\\\\\\Character Model
   JEANS_02 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_02.color = SF.color(15, 15, 15)
   #\\\\\\\Display Model
   DISPLAY_JEANS_02 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_02.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_02.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_02.color = SF.color(15, 15, 15)
  #....................................................Brown Jeans....................................................................
   #\\\\\\\Character Model
   JEANS_03 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_03.color = SF.color(139, 69, 19)
   #\\\\\\\Display Model
   DISPLAY_JEANS_03 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_03.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_03.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_03.color = SF.color(139, 69, 19)
  #.....................................................Red Jeans.....................................................................
   #\\\\\\\Character Model
   JEANS_04 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_04.color = SF.color(178, 34, 34)
   #\\\\\\\Display Model
   DISPLAY_JEANS_04 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_04.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_04.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_04.color = SF.color(178, 34, 34)
  #....................................................Orange Jeans...................................................................
   #\\\\\\\Character Model
   JEANS_05 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_05.color = SF.color(255, 140, 0)
   #\\\\\\\Display Model
   DISPLAY_JEANS_05 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_05.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_05.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_05.color = SF.color(255, 140, 0)
  #....................................................Yellow Jeans...................................................................
   #\\\\\\\Character Model
   JEANS_06 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_06.color = SF.color(255, 255, 102)
   #\\\\\\\Display Model
   DISPLAY_JEANS_06 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_06.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_06.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_06.color = SF.color(255, 255, 102)
  #.....................................................Green Jeans...................................................................
   #\\\\\\\Character Model
   JEANS_07 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_07.color = SF.color(46, 139, 87)
   #\\\\\\\Display Model
   DISPLAY_JEANS_07 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_07.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_07.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_07.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_07.color = SF.color(46, 139, 87)
  #.....................................................Blue Jeans....................................................................
   #\\\\\\\Character Model
   JEANS_08 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_08.color = SF.color(70, 130, 180)
   #\\\\\\\Display Model
   DISPLAY_JEANS_08 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_08.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_08.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_08.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_08.color = SF.color(70, 130, 180)
  #....................................................Purple Jeans...................................................................
   #\\\\\\\Character Model
   JEANS_09 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_09.color = SF.color(75, 0, 130)
   #\\\\\\\Display Model
   DISPLAY_JEANS_09 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_09.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_09.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_09.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_09.color = SF.color(75, 0, 130)
  #.....................................................Pink Jeans....................................................................
   #\\\\\\\Character Model
   JEANS_10 = SF::Sprite.new(JEANS_TEXTURE_01) 
   JEANS_10.color = SF.color(219, 112, 147)
   #\\\\\\\Display Model
   DISPLAY_JEANS_10 = SF::Sprite.new(JEANS_TEXTURE_01)
   DISPLAY_JEANS_10.texture_rect = SF.int_rect(0, 0, 96, 128)
   DISPLAY_JEANS_10.position = SF.vector2(1415, 120)
   DISPLAY_JEANS_10.scale = SF.vector2(3.5, 3.5)
   DISPLAY_JEANS_10.color = SF.color(219, 112, 147)
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                     Shoes Textures
#-------------------------------------------------------------------------------------------------------------------------------------
 SHOES_ARRAY = [RAIN_BOOTS_01, RAIN_BOOTS_02, RAIN_BOOTS_03, RAIN_BOOTS_04, RAIN_BOOTS_05, RAIN_BOOTS_06, RAIN_BOOTS_07, RAIN_BOOTS_08,
 RAIN_BOOTS_09]

 DISPLAY_SHOES_ARRAY = [DISPLAY_RAIN_BOOTS_01, DISPLAY_RAIN_BOOTS_02, DISPLAY_RAIN_BOOTS_03, DISPLAY_RAIN_BOOTS_04, DISPLAY_RAIN_BOOTS_05,
 DISPLAY_RAIN_BOOTS_06, DISPLAY_RAIN_BOOTS_07, DISPLAY_RAIN_BOOTS_08, DISPLAY_RAIN_BOOTS_09]

 SHOES_DESC_ARRAY = ["White Rain Boots", "Red Rain Boots", "Blue Rain Boots", "Black Rain Boots", "Orange Rain Boots", "Yellow Rain Boots",
 "Green Rain Boots", "Purple Rain Boots", "Pink Rain Boots"]

 Shoes_Desc = SF::Text.new; Shoes_Desc.font = FONT_FANCY_BOLD
 Shoes_Desc.string = SHOES_DESC_ARRAY[0]; Shoes_Desc.character_size = 40; Shoes_Desc.color = SF::Color::White
 Shoes_Desc.position = SF.vector2(1450, 800)

 NIL_SHOE_TEXTURE = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
 #....................................................White Rain Boots.................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_TEXTURE_01 = SF::Texture.from_file("graphics/Rain_Boots_01.png")
  RAIN_BOOTS_01 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_01 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_01.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_01.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_01.scale = SF.vector2(3.5, 3.5)
 #.....................................................Red Rain Boots..................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_02 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_02.color = SF.color(255, 0, 0)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_02 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_02.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_02.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_02.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_02.color = SF.color(255, 0, 0)
 #....................................................Blue Rain Boots..................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_03 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_03.color = SF.color(0, 191, 255)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_03 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_03.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_03.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_03.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_03.color = SF.color(0, 191, 255)
 #....................................................Black Rain Boots.................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_04 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_04.color = SF.color(10, 10, 10)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_04 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_04.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_04.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_04.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_04.color = SF.color(10, 10, 10)
 #....................................................Orange Rain Boots................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_05 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_05.color = SF.color(255, 165, 0)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_05 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_05.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_05.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_05.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_05.color = SF.color(255, 165, 0)
 #....................................................Yellow Rain Boots................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_06 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_06.color = SF.color(255, 255, 0)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_06 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_06.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_06.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_06.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_06.color = SF.color(255, 255, 0)
 #....................................................Green Rain Boots..................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_07 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_07.color = SF.color(173, 255, 47)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_07 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_07.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_07.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_07.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_07.color = SF.color(173, 255, 47)
 #....................................................Purple Rain Boots..................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_08 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_08.color = SF.color(138, 43, 226)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_08 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_08.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_08.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_08.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_08.color = SF.color(138, 43, 226)
 #.....................................................Pink Rain Boots...................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_09 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_09.color = SF.color(255, 20, 147)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_09 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_09.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_09.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_09.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_09.color = SF.color(255, 20, 147)

#______________________________________________________________________________________________________________________________________
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                    Enemy Textures
#--------------------------------------------------------------------------------------------------------------------------------------
#______________________________________________________________________________________________________________________________________
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                     Name Boxes
#--------------------------------------------------------------------------------------------------------------------------------------
  Name_Box = SF::RectangleShape.new(SF.vector2(110, 20)); Name_Box.fill_color = SF.color(255, 255, 255)
  Name_Box.outline_thickness = 2; Name_Box.outline_color = SF.color(150, 0, 0); Name_Box_Text = SF::Text.new;
  Name_Box_Text.font = FONT_PIXEL; Name_Box_Text.character_size = 20; Name_Box_Text.color = SF::Color::Black
  Health_Bar = SF::RectangleShape.new(SF.vector2(100, 10)); Health_Bar.fill_color = SF.color(255, 0, 0) 
#______________________________________________________________________________________________________________________________________
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                     Bounding Boxes
#--------------------------------------------------------------------------------------------------------------------------------------
  Bounding_Box = SF::RectangleShape.new(SF.vector2(100, 100)); Bounding_Box.fill_color = SF.color(255, 255, 255)
  Bounding_Box.position = SF.vector2(0, 500) 

  Feet_Bounding_Box = SF::RectangleShape.new(SF.vector2(50, 5)); Feet_Bounding_Box.fill_color = SF.color(255, 255, 255, 155)
  Feet_Bounding_Box.position = SF.vector2(0, 500) 
 #....................................................Player_attack....................................................................
  Player_Attack_Bounding_Box = SF::RectangleShape.new; Player_Attack_Bounding_Box.size = SF.vector2(100, 100)
  Player_Attack_Bounding_Box.fill_color = SF.color(255, 255, 255, 100); 
 #.....................................................................................................................................
#______________________________________________________________________________________________________________________________________  
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                      Dialog Boxes
#-------------------------------------------------------------------------------------------------------------------------------------- 
  Dialog_Box = SF::RectangleShape.new(SF.vector2(150, 100)); Dialog_Box.fill_color = SF.color(255, 255, 255)
  DIALOG_BOX_TEXTURE_01 = SF::Texture.from_file("graphics/Dialogue_Boxes.png"); Dialog_Box.set_texture(DIALOG_BOX_TEXTURE_01, reset_rect: false)
  Dialog_Box.texture_rect = SF.int_rect(0, 0, 150, 100); Dialog_Box_Text = SF::Text.new; Dialog_Box_Text.font = FONT_PIXEL; 
  Dialog_Box_Text.character_size = 20; Dialog_Box_Text.color = SF::Color::Black
#______________________________________________________________________________________________________________________________________  
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                      Choice Boxes
#-------------------------------------------------------------------------------------------------------------------------------------- 
 Choice_Box = SF::RectangleShape.new(SF.vector2(300, 150)); Choice_Box.fill_color = SF.color(255, 255, 255)
 Choice_Box_Option = SF::RectangleShape.new(SF.vector2(100, 50)); Choice_Box_Option.fill_color = SF.color(155, 155, 255)
#______________________________________________________________________________________________________________________________________  
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                     Salon Textures
#--------------------------------------------------------------------------------------------------------------------------------------
 SALON_BOX_TEXTURE = SF::Texture.from_file("graphics/salon_box.png")
 Salon_Box = SF::RectangleShape.new(SF.vector2(800, 600)); Salon_Box.set_texture(SALON_BOX_TEXTURE, reset_rect: false); 
 Salon_Box.position = SF.vector2(600, 180); Salon_Confirm_Box = SF::RectangleShape.new(SF.vector2(100, 50)); 
 Salon_Confirm_Box.fill_color = SF.color(155, 155, 255); Salon_Confirm_Box.position = SF.vector2(745, 350)
 Salon_Confirm_Box_Text = SF::Text.new; Salon_Confirm_Box_Text.font = FONT_PIXEL; 
 Salon_Confirm_Box_Text.character_size = 30; Salon_Confirm_Box_Text.color = SF::Color::White; Salon_Confirm_Box_Text.string = "Confirm"
 Salon_Confirm_Box_Text.position = SF.vector2(750, 350)
#______________________________________________________________________________________________________________________________________
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                         Ores
#-------------------------------------------------------------------------------------------------------------------------------------- 
 #//////////////////////////////////////////////////////Minerals\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Bloodstone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   BLOODSTONE_TEXTURE = SF::Texture.from_file("graphics/minerals/Bloodstone.png")
   #Ore_Box = SF::RectangleShape.new(SF.vector2(100, 100)); Ore_Box.position = SF.vector2(1800, 700); Ore_Box.fill_color = SF.color(255, 255, 255)
   Bloodstone_Ore = SF::Sprite.new(BLOODSTONE_TEXTURE); Bloodstone_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Moss Agate''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   MOSS_AGATE_TEXTURE = SF::Texture.from_file("graphics/minerals/Moss_Agate.png")
   Moss_Agate_Ore = SF::Sprite.new(MOSS_AGATE_TEXTURE); Moss_Agate_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Moss_Agate_Ore.position = SF.vector2(500, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Amber'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   AMBER_TEXTURE = SF::Texture.from_file("graphics/minerals/Amber.png")
   Amber_Ore = SF::Sprite.new(AMBER_TEXTURE); Amber_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Amber_Ore.position = SF.vector2(700, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Wavellite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   WAVELLITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Wavellite.png")
   Wavellite_Ore = SF::Sprite.new(WAVELLITE_TEXTURE); Wavellite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Wavellite_Ore.position = SF.vector2(900, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Topaz''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   TOPAZ_TEXTURE = SF::Texture.from_file("graphics/minerals/Topaz.png")
   Topaz_Ore = SF::Sprite.new(TOPAZ_TEXTURE); Topaz_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Topaz_Ore.position = SF.vector2(1100, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Amethyst''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   AMETHYST_TEXTURE = SF::Texture.from_file("graphics/minerals/Amethyst_Ore.png")
   Amethyst_Ore = SF::Sprite.new(AMETHYST_TEXTURE); Amethyst_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Amethyst_Ore.position = SF.vector2(1300, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Smokey Quartz''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   SMOKEY_QUARTZ_TEXTURE = SF::Texture.from_file("graphics/minerals/Smokey_Quartz.png")
   Smokey_Quartz_Ore = SF::Sprite.new(SMOKEY_QUARTZ_TEXTURE); Smokey_Quartz_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Smokey_Quartz_Ore.position = SF.vector2(1500, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Sapphire''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   SAPPHIRE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sapphire.png")
   Sapphire_Ore = SF::Sprite.new(SAPPHIRE_TEXTURE); Sapphire_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Sapphire_Ore.position = SF.vector2(1700, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Black Opal'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BLACK_OPAL_TEXTURE = SF::Texture.from_file("graphics/minerals/Black_Opal.png")
   Black_Opal_Ore = SF::Sprite.new(BLACK_OPAL_TEXTURE); Black_Opal_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Black_Opal_Ore.position = SF.vector2(1900, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Ajoite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   AJOITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ajoite.png")
   Ajoite_Ore = SF::Sprite.new(AJOITE_TEXTURE); Ajoite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Ajoite_Ore.position = SF.vector2(2100, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Rhodolite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   RHODOLITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Rhodolite.png")
   Rhodolite_Ore = SF::Sprite.new(RHODOLITE_TEXTURE); Rhodolite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Rhodolite_Ore.position = SF.vector2(2300, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Chalcanthite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   CHALCANTHITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Chalcanthite.png")
   Chalcanthite_Ore = SF::Sprite.new(CHALCANTHITE_TEXTURE); Chalcanthite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Chalcanthite_Ore.position = SF.vector2(2500, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Flourite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   FLOURITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Flourite.png")
   Flourite_Ore = SF::Sprite.new(FLOURITE_TEXTURE); Flourite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Flourite_Ore.position = SF.vector2(2700, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Amorite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   AMORITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Amorite.png")
   Amorite_Ore = SF::Sprite.new(AMORITE_TEXTURE); Amorite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Amorite_Ore.position = SF.vector2(2900, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Lapis Lazuli''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   LAPIS_LAZULI_TEXTURE = SF::Texture.from_file("graphics/minerals/Lapis_Lazuli.png")
   Lapis_Lazuli_Ore = SF::Sprite.new(LAPIS_LAZULI_TEXTURE); Lapis_Lazuli_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Lapis_Lazuli_Ore.position = SF.vector2(3100, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Moonstone''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   MOONSTONE_TEXTURE = SF::Texture.from_file("graphics/minerals/Moonstone.png")
   Moonstone_Ore = SF::Sprite.new(MOONSTONE_TEXTURE); Moonstone_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Moonstone_Ore.position = SF.vector2(3300, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Blue Calcite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BLUE_CALCITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Calcite.png")
   Blue_Calcite_Ore = SF::Sprite.new(BLUE_CALCITE_TEXTURE); Blue_Calcite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blue_Calcite_Ore.position = SF.vector2(3500, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Hiddenite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   HIDDENITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Hiddenite.png")
   Hiddenite_Ore = SF::Sprite.new(HIDDENITE_TEXTURE); Hiddenite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Hiddenite_Ore.position = SF.vector2(3700, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Offretite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   OFFRETITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Offretite.png")
   Offretite_Ore = SF::Sprite.new(OFFRETITE_TEXTURE); Offretite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Offretite_Ore.position = SF.vector2(3900, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''Holley_Blue_Agate_Ore''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   HOLLEY_BLUE_AGATE_TEXTURE = SF::Texture.from_file("graphics/minerals/Holley_Blue_Agate.png")
   Holley_Blue_Agate_Ore = SF::Sprite.new(HOLLEY_BLUE_AGATE_TEXTURE); Holley_Blue_Agate_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Holley_Blue_Agate_Ore.position = SF.vector2(4100, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Ametrine'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   AMETRINE_TEXTURE = SF::Texture.from_file("graphics/minerals/Ametrine.png")
   Ametrine_Ore = SF::Sprite.new(AMETRINE_TEXTURE); Ametrine_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Ametrine_Ore.position = SF.vector2(4300, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''Hemimorphite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   HEMIMORPHITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Hemimorphite.png")
   Hemimorphite_Ore = SF::Sprite.new(HEMIMORPHITE_TEXTURE); Hemimorphite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Hemimorphite_Ore.position = SF.vector2(-200, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''Tiffany Stone''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   TIFFANY_STONE_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiffany_Stone.png")
   Tiffany_Stone_Ore = SF::Sprite.new(TIFFANY_STONE_TEXTURE); Tiffany_Stone_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Tiffany_Stone_Ore.position = SF.vector2(-400, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Azurite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   AZURITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Azurite.png")
   Azurite_Ore = SF::Sprite.new(AZURITE_TEXTURE); Azurite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Azurite_Ore.position = SF.vector2(-600, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Howlite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   HOWLITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Howlite.png")
   Howlite_Ore = SF::Sprite.new(HOWLITE_TEXTURE); Howlite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Howlite_Ore.position = SF.vector2(-800, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Angelite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   ANGELITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Angelite.png")
   Angelite_Ore = SF::Sprite.new(ANGELITE_TEXTURE); Angelite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Angelite_Ore.position = SF.vector2(-1000, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Blue Lace Agate'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BLUE_LACE_AGATE_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Lace_Agate.png")
   Blue_Lace_Agate_Ore = SF::Sprite.new(BLUE_LACE_AGATE_TEXTURE); Blue_Lace_Agate_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blue_Lace_Agate_Ore.position = SF.vector2(-1200, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Iolite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   IOLITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Iolite.png")
   Iolite_Ore = SF::Sprite.new(IOLITE_TEXTURE); Iolite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Iolite_Ore.position = SF.vector2(-1400, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Sodalite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   SODALITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sodalite.png")
   Sodalite_Ore = SF::Sprite.new(SODALITE_TEXTURE); Sodalite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Sodalite_Ore.position = SF.vector2(-1600, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Kyanite''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   KYANITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Kyanite.png")
   Kyanite_Ore = SF::Sprite.new(KYANITE_TEXTURE); Kyanite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Kyanite_Ore.position = SF.vector2(-1800, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Sunstone'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   SUNSTONE_TEXTURE = SF::Texture.from_file("graphics/minerals/Sunstone.png")
   Sunstone_Ore = SF::Sprite.new(SUNSTONE_TEXTURE); Sunstone_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Sunstone_Ore.position = SF.vector2(-2000, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Bony Amber''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BONY_AMBER_TEXTURE = SF::Texture.from_file("graphics/minerals/Bony_Amber.png")
   Bony_Amber_Ore = SF::Sprite.new(BONY_AMBER_TEXTURE); Bony_Amber_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Bony_Amber_Ore.position = SF.vector2(-2200, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Blue Amber''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BLUE_AMBER_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Amber.png")
   Blue_Amber_Ore = SF::Sprite.new(BLUE_AMBER_TEXTURE); Blue_Amber_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blue_Amber_Ore.position = SF.vector2(-2400, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Blue Spinel'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BLUE_SPINEL_TEXTURE = SF::Texture.from_file("graphics/minerals/Blue_Spinel.png")
   Blue_Spinel_Ore = SF::Sprite.new(BLUE_SPINEL_TEXTURE); Blue_Spinel_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blue_Spinel_Ore.position = SF.vector2(-2600, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Red Spinel''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   RED_SPINEL_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Spinel.png")
   Red_Spinel_Ore = SF::Sprite.new(RED_SPINEL_TEXTURE); Red_Spinel_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Red_Spinel_Ore.position = SF.vector2(-2800, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Fire Opal'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   FIRE_OPAL_TEXTURE = SF::Texture.from_file("graphics/minerals/Fire_Opal.png")
   Fire_Opal_Ore = SF::Sprite.new(FIRE_OPAL_TEXTURE); Fire_Opal_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Fire_Opal_Ore.position = SF.vector2(-3000, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Garnet'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   GARNET_TEXTURE = SF::Texture.from_file("graphics/minerals/Garnet.png")
   Garnet_Ore = SF::Sprite.new(GARNET_TEXTURE); Garnet_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Garnet_Ore.position = SF.vector2(-3200, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Ruby''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   RUBY_TEXTURE = SF::Texture.from_file("graphics/minerals/Ruby.png")
   Ruby_Ore = SF::Sprite.new(RUBY_TEXTURE); Ruby_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Ruby_Ore.position = SF.vector2(-3400, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Cherry Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   CHERRY_QUARTZ_TEXTURE = SF::Texture.from_file("graphics/minerals/Cherry_Quartz.png")
   Cherry_Quartz_Ore = SF::Sprite.new(CHERRY_QUARTZ_TEXTURE); Cherry_Quartz_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Cherry_Quartz_Ore.position = SF.vector2(-3600, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Lemon Quartz'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   LEMON_QUARTZ_TEXTURE = SF::Texture.from_file("graphics/minerals/Lemon_Quartz.png")
   Lemon_Quartz_Ore = SF::Sprite.new(LEMON_QUARTZ_TEXTURE); Lemon_Quartz_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Lemon_Quartz_Ore.position = SF.vector2(-3800, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Turquoise''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   TURQUOISE_TEXTURE = SF::Texture.from_file("graphics/minerals/Turquoise.png")
   Turquoise_Ore = SF::Sprite.new(TURQUOISE_TEXTURE); Turquoise_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Turquoise_Ore.position = SF.vector2(-4000, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Tiger's Eye'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   TIGERS_EYE_TEXTURE = SF::Texture.from_file("graphics/minerals/Tiger's_Eye.png")
   Tigers_Eye_Ore = SF::Sprite.new(TIGERS_EYE_TEXTURE); Tigers_Eye_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Tigers_Eye_Ore.position = SF.vector2(-4200, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Orange Calcite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   ORANGE_CALCITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Orange_Calcite.png")
   Orange_Calcite_Ore = SF::Sprite.new(ORANGE_CALCITE_TEXTURE); Orange_Calcite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Orange_Calcite_Ore.position = SF.vector2(-4400, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Grape Agate'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   GRAPE_AGATE_TEXTURE = SF::Texture.from_file("graphics/minerals/Grape_Agate.png")
   Grape_Agate_Ore = SF::Sprite.new(GRAPE_AGATE_TEXTURE); Grape_Agate_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Grape_Agate_Ore.position = SF.vector2(-4600, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''''Jade''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   JADE_TEXTURE = SF::Texture.from_file("graphics/minerals/Jade.png")
   Jade_Ore = SF::Sprite.new(JADE_TEXTURE); Jade_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Jade_Ore.position = SF.vector2(-4800, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Diamond'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   DIAMOND_TEXTURE = SF::Texture.from_file("graphics/minerals/Diamond.png")
   Diamond_Ore = SF::Sprite.new(DIAMOND_TEXTURE); Diamond_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Diamond_Ore.position = SF.vector2(50, 302)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Emerald'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   EMERALD_TEXTURE = SF::Texture.from_file("graphics/minerals/Emerald.png")
   Emerald_Ore = SF::Sprite.new(EMERALD_TEXTURE); Emerald_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Emerald_Ore.position = SF.vector2(250, 302)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Painite'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   PAINITE_TEXTURE = SF::Texture.from_file("graphics/minerals/Painite.png")
   Painite_Ore = SF::Sprite.new(PAINITE_TEXTURE); Painite_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Painite_Ore.position = SF.vector2(450, 302)
  #'''''''''''''''''''''''''''''''''''''''''''''''''Bumblebee Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BUMBLEBEE_JASPER_TEXTURE = SF::Texture.from_file("graphics/minerals/Bumblebee_Jasper.png")
   Bumblebee_Jasper_Ore = SF::Sprite.new(BUMBLEBEE_JASPER_TEXTURE); Bumblebee_Jasper_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Bumblebee_Jasper_Ore.position = SF.vector2(650, 302)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Blood Jasper''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   BLOOD_JASPER_TEXTURE = SF::Texture.from_file("graphics/minerals/Blood_Jasper.png")
   Blood_Jasper_Ore = SF::Sprite.new(BLOOD_JASPER_TEXTURE); Blood_Jasper_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blood_Jasper_Ore.position = SF.vector2(850, 302)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Mook Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   MOOK_JASPER_TEXTURE = SF::Texture.from_file("graphics/minerals/Mook_Jasper.png")
   Mook_Jasper_Ore = SF::Sprite.new(MOOK_JASPER_TEXTURE); Mook_Jasper_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Mook_Jasper_Ore.position = SF.vector2(1050, 302)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Red Jasper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   RED_JASPER_TEXTURE = SF::Texture.from_file("graphics/minerals/Red_Jasper.png")
   Red_Jasper_Ore = SF::Sprite.new(RED_JASPER_TEXTURE); Red_Jasper_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Red_Jasper_Ore.position = SF.vector2(1250, 302)
 #///////////////////////////////////////////////////////Metals\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Carbon'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   CARBON_TEXTURE = SF::Texture.from_file("graphics/metals/Carbon_Ore.png")
   Carbon_Ore = SF::Sprite.new(CARBON_TEXTURE); Carbon_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Carbon_Ore.position = SF.vector2(0, 102)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Copper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   COPPER_TEXTURE = SF::Texture.from_file("graphics/metals/Copper_Ore.png")
   Copper_Ore = SF::Sprite.new(COPPER_TEXTURE); Copper_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Copper_Ore.position = SF.vector2(200, 102)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Tin'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   TIN_TEXTURE = SF::Texture.from_file("graphics/metals/Tin_Ore.png")
   Tin_Ore = SF::Sprite.new(TIN_TEXTURE); Tin_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Tin_Ore.position = SF.vector2(1600, 102)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Zinc'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   ZINC_TEXTURE = SF::Texture.from_file("graphics/metals/Zinc_Ore.png")
   Zinc_Ore = SF::Sprite.new(ZINC_TEXTURE); Zinc_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Zinc_Ore.position = SF.vector2(1800, 102)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Iron'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   IRON_TEXTURE = SF::Texture.from_file("graphics/metals/Iron_Ore.png")
   Iron_Ore = SF::Sprite.new(IRON_TEXTURE); Iron_Ore.texture_rect = SF.int_rect(0, 0, 100, 100)
   Iron_Ore.position = SF.vector2(2000, 102)
 #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                        Plants
#-------------------------------------------------------------------------------------------------------------------------------------- 
 #///////////////////////////////////////////////////////Bushes\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  #''''''''''''''''''''''''''''''''''''''''''''''''''Blackberry Bush'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   BLACKBERRY_BUSH_TEXTURE = SF::Texture.from_file("graphics/plants/Blackberry_Bush.png")
   Blackberry_Bush = SF::Sprite.new(BLACKBERRY_BUSH_TEXTURE); Blackberry_Bush.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blackberry_Bush.position = SF.vector2(400, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''Raspberry Bush'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   RASPBERRY_BUSH_TEXTURE = SF::Texture.from_file("graphics/plants/Raspberry_Bush.png")
   Raspberry_Bush = SF::Sprite.new(RASPBERRY_BUSH_TEXTURE); Raspberry_Bush.texture_rect = SF.int_rect(0, 0, 100, 100)
   Raspberry_Bush.position = SF.vector2(600, 702)
  #''''''''''''''''''''''''''''''''''''''''''''''''''Elderberry Bush''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   ELDERBERRY_BUSH_TEXTURE = SF::Texture.from_file("graphics/plants/Elderberry_Bush.png")
   Elderberry_Bush = SF::Sprite.new(ELDERBERRY_BUSH_TEXTURE); Elderberry_Bush.texture_rect = SF.int_rect(0, 0, 100, 100)
   Elderberry_Bush.position = SF.vector2(800, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''Black Currant Bush''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   BLACK_CURRANT_BUSH_TEXTURE = SF::Texture.from_file("graphics/plants/Black_Currant_Bush.png")
   Black_Currant_Bush = SF::Sprite.new(BLACK_CURRANT_BUSH_TEXTURE); Black_Currant_Bush.texture_rect = SF.int_rect(0, 0, 100, 100)
   Black_Currant_Bush.position = SF.vector2(1000, 702)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''Blueberry Bush''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   BLUEBERRY_BUSH_TEXTURE = SF::Texture.from_file("graphics/plants/Blueberry_Bush.png")
   Blueberry_Bush = SF::Sprite.new(BLUEBERRY_BUSH_TEXTURE); Blueberry_Bush.texture_rect = SF.int_rect(0, 0, 100, 100)
   Blueberry_Bush.position = SF.vector2(1200, 702)
 #///////////////////////////////////////////////////////Trees\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  #''''''''''''''''''''''''''''''''''''''''''''''''''''Snow Pear Tree''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   SNOW_PEAR_TREE_TEXTURE = SF::Texture.from_file("graphics/plants/Snow_Pear_Tree.png")
   Snow_Pear_Tree = SF::Sprite.new(SNOW_PEAR_TREE_TEXTURE); Snow_Pear_Tree.texture_rect = SF.int_rect(0, 0, 100, 200)
   Snow_Pear_Tree.position = SF.vector2(-200, 602)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Quince Tree'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   QUINCE_TREE_TEXTURE = SF::Texture.from_file("graphics/plants/Quince_Tree.png")
   Quince_Tree = SF::Sprite.new(QUINCE_TREE_TEXTURE); Quince_Tree.texture_rect = SF.int_rect(0, 0, 100, 200)
   Quince_Tree.position = SF.vector2(-400, 602)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Quince Tree'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  BUTTERFRUIT_TREE_TEXTURE = SF::Texture.from_file("graphics/plants/Butterfruit_Tree.png")
  Butterfruit_Tree = SF::Sprite.new(BUTTERFRUIT_TREE_TEXTURE); Butterfruit_Tree.texture_rect = SF.int_rect(0, 0, 100, 200)
  Butterfruit_Tree.position = SF.vector2(-600, 602)
#______________________________________________________________________________________________________________________________________
Testing_Text = SF::Text.new; Testing_Text.font = FONT_PIXEL; 
Testing_Text.character_size = 20; Testing_Text.color = SF::Color::White; Testing_Text.position = SF.vector2(1800, 652)
#-------------------------------------------------------------------------------------------------------------------------------------- 
#                                                         Maps
#-------------------------------------------------------------------------------------------------------------------------------------- 
 Test_Teleporter = SF::RectangleShape.new(SF.vector2(100, 40)); Test_Teleporter.fill_color = SF.color(50, 150, 255)
 Test_Teleporter.position = SF.vector2(120, 762);

 Test_Teleporter2 = SF::RectangleShape.new(SF.vector2(100, 40)); Test_Teleporter2.fill_color = SF.color(50, 150, 255)
 Test_Teleporter2.position = SF.vector2(-120, 762);

 Test_Ladder = SF::RectangleShape.new(SF.vector2(40, 400)); Test_Teleporter.fill_color = SF.color(50, 150, 255)
 Test_Ladder.position = SF.vector2(0, 400);

 SMELTER_RECTANGLE_TEXTURE = SF::Texture.from_file("graphics/Smelter_Sprite.png")
 Test_Smelter = SF::RectangleShape.new(SF.vector2(120, 80)); Test_Smelter.set_texture(SMELTER_RECTANGLE_TEXTURE, reset_rect: false)
 Test_Smelter.position = SF.vector2(400, 125); #Test_Smelter.fill_color = SF.color(50, 150, 155);

 FORGE_RECTANGLE_TEXTURE = SF::Texture.from_file("graphics/Forge_Sprite.png")
 Test_Forge = SF::RectangleShape.new(SF.vector2(120, 80)); Test_Forge.set_texture(FORGE_RECTANGLE_TEXTURE, reset_rect: false)
 Test_Forge.position = SF.vector2(600, 120); #Test_Smelter.fill_color = SF.color(50, 150, 155);

 GEM_CUTTER_RECTANGLE_TEXTURE = SF::Texture.from_file("graphics/Gem_Cutter_Sprite.png")
 Test_Gem_Cutter = SF::RectangleShape.new(SF.vector2(120, 80)); Test_Gem_Cutter.set_texture(GEM_CUTTER_RECTANGLE_TEXTURE, reset_rect: false)
 Test_Gem_Cutter.position = SF.vector2(800, 120);

 UPGRADE_TABLE_RECTANGLE_TEXTURE = SF::Texture.from_file("graphics/Upgrade_Table.png")
 Test_Upgrade_Table = SF::RectangleShape.new(SF.vector2(120, 80)); Test_Upgrade_Table.set_texture(UPGRADE_TABLE_RECTANGLE_TEXTURE, reset_rect: false)
 Test_Upgrade_Table.position = SF.vector2(1000, 120);

#--------------------------------------------------------------------------------------------------------------------------------------
#                                                       Smelter
#-------------------------------------------------------------------------------------------------------------------------------------- 
 
  SMELTER_TEXTURE = SF::Texture.from_file("graphics/smelter.png")
  Test_Smelter_Menu = SF::Sprite.new(SMELTER_TEXTURE); #SF::RectangleShape.new(SF.vector2(800, 500)); 
  #Test_Smelter_Menu.fill_color = SF.color(150, 150, 155)
  Test_Smelter_Menu.position = SF.vector2(0, -200);
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Nil''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   Nil_Ingot_Ore = SF::Sprite.new(COPPER_INGOT_TEXTURE); Nil_Ingot_Ore.color = SF.color(0, 0, 0, 0)
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Carbon'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #......................................................Ore..........................................................................
    CARBON_SMELTER_TEXTURE = SF::Texture.from_file("graphics/metals/Carbon_Smelter.png")
    Carbon_Smelter_Ore = SF::Sprite.new(CARBON_SMELTER_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Copper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #......................................................Ore..........................................................................
    COPPER_SMELTER_TEXTURE = SF::Texture.from_file("graphics/metals/Copper_Smelter.png")
    Copper_Smelter_Ore = SF::Sprite.new(COPPER_SMELTER_TEXTURE)
   #.....................................................Ingot.........................................................................
    COPPER_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Copper_Ingot.png")
    Copper_Ingot_Ore = SF::Sprite.new(COPPER_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_COPPER_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Copper.png")
    Forge_Copper_Ingot = SF::Sprite.new(FORGE_COPPER_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''Tin'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #......................................................Ore..........................................................................
     TIN_SMELTER_TEXTURE = SF::Texture.from_file("graphics/metals/Tin_Smelter.png")
     Tin_Smelter_Ore = SF::Sprite.new(TIN_SMELTER_TEXTURE)
   #.....................................................Ingot.........................................................................
     TIN_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Tin_Ingot.png")
     Tin_Ingot_Ore = SF::Sprite.new(TIN_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_TIN_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Tin.png")
    Forge_Tin_Ingot = SF::Sprite.new(FORGE_TIN_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''Bronze''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
    #...................................................Ingot...........................................................................
     BRONZE_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Bronze_Ingot.png")
     Bronze_Ingot_Ore = SF::Sprite.new(BRONZE_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_BRONZE_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Bronze.png")
    Forge_Bronze_Ingot = SF::Sprite.new(FORGE_BRONZE_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Zinc''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #......................................................Ore..........................................................................
    ZINC_SMELTER_TEXTURE = SF::Texture.from_file("graphics/metals/Zinc_Smelter.png")
    Zinc_Smelter_Ore = SF::Sprite.new(ZINC_SMELTER_TEXTURE)
   #.....................................................Ingot.........................................................................
    ZINC_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Zinc_Ingot.png")
    Zinc_Ingot_Ore = SF::Sprite.new(ZINC_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_ZINC_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Zinc.png")
    Forge_Zinc_Ingot = SF::Sprite.new(FORGE_ZINC_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Brass''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #.....................................................Ingot.........................................................................
     BRASS_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Brass_Ingot.png")
     Brass_Ingot_Ore = SF::Sprite.new(BRASS_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_BRASS_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Brass.png")
    Forge_Brass_Ingot = SF::Sprite.new(FORGE_BRASS_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Iron''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #......................................................Ore..........................................................................
    IRON_SMELTER_TEXTURE = SF::Texture.from_file("graphics/metals/Iron_Smelter.png")
    Iron_Smelter_Ore = SF::Sprite.new(IRON_SMELTER_TEXTURE)
   #.....................................................Ingot.........................................................................
    IRON_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Iron_Ingot.png")
    Iron_Ingot_Ore = SF::Sprite.new(IRON_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_IRON_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Iron.png")
    Forge_Iron_Ingot = SF::Sprite.new(FORGE_IRON_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''Steel''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
   #.....................................................Ingot.........................................................................
    STEEL_INGOT_TEXTURE = SF::Texture.from_file("graphics/metals/Steel_Ingot.png")
    Steel_Ingot_Ore = SF::Sprite.new(STEEL_INGOT_TEXTURE)
   #..................................................Forge Ingot......................................................................
    FORGE_STEEL_TEXTURE = SF::Texture.from_file("graphics/metals/Forge_Steel.png")
    Forge_Steel_Ingot = SF::Sprite.new(FORGE_STEEL_TEXTURE)
  #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

   Smelter_Nil_Sprite = SF::Sprite.new(COPPER_TEXTURE)
   Smelter_Nil_Sprite.color = SF.color(0, 0, 0, 0) 

#--------------------------------------------------------------------------------------------------------------------------------------
#                                                        Forge
#-------------------------------------------------------------------------------------------------------------------------------------- 
 FORGE_TEXTURE = SF::Texture.from_file("graphics/Forge.png")
 Test_Forge_Menu = SF::Sprite.new(FORGE_TEXTURE); #SF::RectangleShape.new(SF.vector2(800, 500)); 
 #Test_Smelter_Menu.fill_color = SF.color(150, 150, 155)
 Test_Forge_Menu.position = SF.vector2(0, -200);

 FORGE_MOLD_OPTION_TEXTURE_01 = SF::Texture.from_file("graphics/Menu_Stick_Mold.png")
 Forge_Mold_Option_01 = SF::Sprite.new(FORGE_MOLD_OPTION_TEXTURE_01)
 Forge_Mold_Option_01.position = SF.vector2(650, -95);

 NIL_STICK_DISPLAY_TEXTURE = SF::Texture.from_file("graphics/weapons/Iron_Stick_Display.png")
 Nil_Stick_Display = SF::RectangleShape.new(SF.vector2(140, 140)); 
 Nil_Stick_Display.set_texture(IRON_STICK_DISPLAY_TEXTURE, reset_rect: false);
 Nil_Stick_Display.fill_color = SF.color(0, 0, 0, 0) 

#--------------------------------------------------------------------------------------------------------------------------------------
#                                                      Gem Cutter
#-------------------------------------------------------------------------------------------------------------------------------------- 
  GEM_CUTTER_MENU_TEXTURE = SF::Texture.from_file("graphics/Gem_Cutter.png")
  Test_Gem_Cutter_Menu = SF::Sprite.new(GEM_CUTTER_MENU_TEXTURE);
  Test_Gem_Cutter_Menu.position = SF.vector2(400, -200);

  Inventory_arrow_up3 = SF::RectangleShape.new(SF.vector2(50, 90)); Inventory_arrow_up3.position = SF.vector2(300, -150);
  Inventory_arrow_up3.fill_color = SF.color(255, 100, 100)
  Inventory_arrow_down3 = SF::RectangleShape.new(SF.vector2(50, 90)); Inventory_arrow_down3.position = SF.vector2(300, -50);
  Inventory_arrow_down3.fill_color = SF.color(255, 100, 100)

  CUTTER_MOLD_OPTION_TEXTURE_01 = SF::Texture.from_file("graphics/Table_Cut_Option.png")
  Cutter_Mold_Option_01 = SF::Sprite.new(CUTTER_MOLD_OPTION_TEXTURE_01)
  Cutter_Mold_Option_01.position = SF.vector2(1050, -95);

  CUTTER_MOLD_OPTION_TEXTURE_02 = SF::Texture.from_file("graphics/Square_Cut_Option.png")
  Cutter_Mold_Option_02 = SF::Sprite.new(CUTTER_MOLD_OPTION_TEXTURE_02)
  Cutter_Mold_Option_02.position = SF.vector2(1050, -95);

  CUTTER_MOLD_OPTION_TEXTURE_03 = SF::Texture.from_file("graphics/Pear_Cut_Option.png")
  Cutter_Mold_Option_03 = SF::Sprite.new(CUTTER_MOLD_OPTION_TEXTURE_03)
  Cutter_Mold_Option_03.position = SF.vector2(1050, -95);

  CUTTER_MOLD_OPTION_TEXTURE_04 = SF::Texture.from_file("graphics/Drop_Cut_Option.png")
  Cutter_Mold_Option_04 = SF::Sprite.new(CUTTER_MOLD_OPTION_TEXTURE_04)
  Cutter_Mold_Option_04.position = SF.vector2(1050, -95);

  CUTTER_MOLD_OPTION_TEXTURE_05 = SF::Texture.from_file("graphics/Brilliant_Cut_Option.png")
  Cutter_Mold_Option_05 = SF::Sprite.new(CUTTER_MOLD_OPTION_TEXTURE_05)
  Cutter_Mold_Option_05.position = SF.vector2(1050, -95);

  CUTTER_CUT_DISPLAY_OPTION_TEXTURE_01 = SF::Texture.from_file("graphics/minerals/Table_Cut_Display.png")
  Cutter_Mold_Cut_Display_Option_01 = SF::Sprite.new(CUTTER_CUT_DISPLAY_OPTION_TEXTURE_01)
  Cutter_Mold_Cut_Display_Option_01.position = SF.vector2(785, 20);

  CUTTER_CUT_DISPLAY_OPTION_TEXTURE_02 = SF::Texture.from_file("graphics/minerals/Square_Cut_Display.png")
  Cutter_Mold_Cut_Display_Option_02 = SF::Sprite.new(CUTTER_CUT_DISPLAY_OPTION_TEXTURE_02)
  Cutter_Mold_Cut_Display_Option_02.position = SF.vector2(785, 20);

  CUTTER_CUT_DISPLAY_OPTION_TEXTURE_03 = SF::Texture.from_file("graphics/minerals/Pear_Cut_Display.png")
  Cutter_Mold_Cut_Display_Option_03 = SF::Sprite.new(CUTTER_CUT_DISPLAY_OPTION_TEXTURE_03)
  Cutter_Mold_Cut_Display_Option_03.position = SF.vector2(785, 20);

  CUTTER_CUT_DISPLAY_OPTION_TEXTURE_04 = SF::Texture.from_file("graphics/minerals/Drop_Cut_Display.png")
  Cutter_Mold_Cut_Display_Option_04 = SF::Sprite.new(CUTTER_CUT_DISPLAY_OPTION_TEXTURE_04)
  Cutter_Mold_Cut_Display_Option_04.position = SF.vector2(785, 20);

  CUTTER_CUT_DISPLAY_OPTION_TEXTURE_05 = SF::Texture.from_file("graphics/minerals/Brilliant_Cut_Display.png")
  Cutter_Mold_Cut_Display_Option_05 = SF::Sprite.new(CUTTER_CUT_DISPLAY_OPTION_TEXTURE_05)
  Cutter_Mold_Cut_Display_Option_05.position = SF.vector2(785, 20);
 #''''''''''''''''''''''''''''''''''''''''''''''''''''''Gem Ores'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  #....................................................Bloodstone......................................................................
   BLOODSTONE_GEM_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Bloodstone.png")
   Bloodstone_Gem_Cutter_Ore = SF::Sprite.new(BLOODSTONE_GEM_CUTTER_TEXTURE)  
  #....................................................Moss Agate......................................................................
   MOSS_AGATE_GEM_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Moss_Agate.png")
   Moss_Agate_Gem_Cutter_Ore = SF::Sprite.new(MOSS_AGATE_GEM_CUTTER_TEXTURE)
  #......................................................Amber.........................................................................
   AMBER_GEM_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Amber.png")
   Amber_Gem_Cutter_Ore = SF::Sprite.new(AMBER_GEM_CUTTER_TEXTURE)
  #....................................................Wavellite.......................................................................
   WAVELLITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Wavellite.png")
   Wavellite_Gem_Cutter_Ore = SF::Sprite.new(WAVELLITE_CUTTER_TEXTURE)
  #......................................................Topaz.........................................................................
   TOPAZ_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Topaz.png")
   Topaz_Gem_Cutter_Ore = SF::Sprite.new(TOPAZ_CUTTER_TEXTURE)
  #.....................................................Amethyst.......................................................................
   AMETHYST_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Amethyst.png")
   Amethyst_Gem_Cutter_Ore = SF::Sprite.new(AMETHYST_CUTTER_TEXTURE)
  #...................................................Smoky Quartz.....................................................................
   SMOKY_QUARTZ_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Smoky_Quartz.png")
   Smoky_Quartz_Gem_Cutter_Ore = SF::Sprite.new(SMOKY_QUARTZ_CUTTER_TEXTURE)
  #.....................................................Sapphire.......................................................................
   SAPPHIRE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Sapphire.png")
   Sapphire_Gem_Cutter_Ore = SF::Sprite.new(SAPPHIRE_CUTTER_TEXTURE)
  #....................................................Black Opal......................................................................
   BLACK_OPAL_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Black_Opal.png")
   Black_Opal_Gem_Cutter_Ore = SF::Sprite.new(BLACK_OPAL_CUTTER_TEXTURE)
  #......................................................Ajoite........................................................................
   AJOITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Ajoite.png")
   Ajoite_Gem_Cutter_Ore = SF::Sprite.new(AJOITE_CUTTER_TEXTURE)
  #.....................................................Rhodolite......................................................................
   RHODOLITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Rhodolite.png")
   Rhodolite_Gem_Cutter_Ore = SF::Sprite.new(RHODOLITE_CUTTER_TEXTURE)
  #....................................................Chalcanthite....................................................................
   CHALCANTHITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Chalcanthite.png")
   Chalcanthite_Gem_Cutter_Ore = SF::Sprite.new(CHALCANTHITE_CUTTER_TEXTURE)
  #......................................................Flourite......................................................................
   FLOURITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Flourite.png")
   Flourite_Gem_Cutter_Ore = SF::Sprite.new(FLOURITE_CUTTER_TEXTURE)
  #......................................................Amorite.......................................................................
   AMORITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Amorite.png")
   Amorite_Gem_Cutter_Ore = SF::Sprite.new(AMORITE_CUTTER_TEXTURE)
  #....................................................Lapis Lazuli....................................................................
   LAPIS_LAZULI_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Lapis_Lazuli.png")
   Lapis_Lazuli_Gem_Cutter_Ore = SF::Sprite.new(LAPIS_LAZULI_CUTTER_TEXTURE)
  #.....................................................Moonstone......................................................................
   MOONSTONE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Moonstone.png")
   Moonstone_Gem_Cutter_Ore = SF::Sprite.new(MOONSTONE_CUTTER_TEXTURE)
  #....................................................Blue Calcite....................................................................
   BLUE_CALCITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Blue_Calcite.png")
   Blue_Calcite_Gem_Cutter_Ore = SF::Sprite.new(BLUE_CALCITE_CUTTER_TEXTURE)
  #.....................................................Hiddenite......................................................................
   HIDDENITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Hiddenite.png")
   Hiddenite_Gem_Cutter_Ore = SF::Sprite.new(HIDDENITE_CUTTER_TEXTURE)
  #.....................................................Offretite......................................................................
   OFFRETITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Offretite.png")
   Offretite_Gem_Cutter_Ore = SF::Sprite.new(OFFRETITE_CUTTER_TEXTURE)
  #..................................................Holly Blue Agate..................................................................
   HOLLY_BLUE_AGATE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Holly_Blue_Agate.png")
   Holly_Blue_Agate_Gem_Cutter_Ore = SF::Sprite.new(HOLLY_BLUE_AGATE_CUTTER_TEXTURE)
  #......................................................Ametrine......................................................................
   AMETRINE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Ametrine.png")
   Ametrine_Gem_Cutter_Ore = SF::Sprite.new(AMETRINE_CUTTER_TEXTURE)
  #....................................................Hemimorphite....................................................................
   HEMIMORPHITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Hemimorphite.png")
   Hemimorphite_Gem_Cutter_Ore = SF::Sprite.new(HEMIMORPHITE_CUTTER_TEXTURE)
  #....................................................Tiffany Stone...................................................................
   TIFFANY_STONE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Tiffany_Stone.png")
   Tiffany_Stone_Gem_Cutter_Ore = SF::Sprite.new(TIFFANY_STONE_CUTTER_TEXTURE)
  #.......................................................Azurite......................................................................
   AZURITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Azurite.png")
   Azurite_Gem_Cutter_Ore = SF::Sprite.new(AZURITE_CUTTER_TEXTURE)
  #.......................................................Howlite......................................................................
   HOWLITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Howlite.png")
   Howlite_Gem_Cutter_Ore = SF::Sprite.new(HOWLITE_CUTTER_TEXTURE)
  #.......................................................Angelite.....................................................................
   ANGELITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Angelite.png")
   Angelite_Gem_Cutter_Ore = SF::Sprite.new(ANGELITE_CUTTER_TEXTURE)
  #....................................................Blue Lace Agate.................................................................
   BLUE_LACE_AGATE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Blue_Lace_Agate.png")
   Blue_Lace_Agate_Gem_Cutter_Ore = SF::Sprite.new(BLUE_LACE_AGATE_CUTTER_TEXTURE)
  #........................................................Iolite......................................................................
   IOLITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Iolite.png")
   Iolite_Gem_Cutter_Ore = SF::Sprite.new(IOLITE_CUTTER_TEXTURE)
  #.......................................................Sodalite.....................................................................
   SODALITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Sodalite.png")
   Sodalite_Gem_Cutter_Ore = SF::Sprite.new(SODALITE_CUTTER_TEXTURE)
  #.......................................................Kyanite......................................................................
   KYANITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Kyanite.png")
   Kyanite_Gem_Cutter_Ore = SF::Sprite.new(KYANITE_CUTTER_TEXTURE)
  #.......................................................Sunstone.....................................................................
   SUNSTONE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Sunstone.png")
   Sunstone_Gem_Cutter_Ore = SF::Sprite.new(SUNSTONE_CUTTER_TEXTURE)
  #......................................................Bony Amber....................................................................
   BONY_AMBER_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Bony_Amber.png")
   Bony_Amber_Gem_Cutter_Ore = SF::Sprite.new(BONY_AMBER_CUTTER_TEXTURE)
  #......................................................Blue Amber....................................................................
   BLUE_AMBER_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Blue_Amber.png")
   Blue_Amber_Gem_Cutter_Ore = SF::Sprite.new(BLUE_AMBER_CUTTER_TEXTURE)
  #......................................................Blue Spinel...................................................................
   BLUE_SPINEL_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Blue_Spinel.png")
   Blue_Spinel_Gem_Cutter_Ore = SF::Sprite.new(BLUE_SPINEL_CUTTER_TEXTURE)
  #......................................................Red Spinel....................................................................
   RED_SPINEL_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Red_Spinel.png")
   Red_Spinel_Gem_Cutter_Ore = SF::Sprite.new(RED_SPINEL_CUTTER_TEXTURE)
  #......................................................Fire Opal.....................................................................
   FIRE_OPAL_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Fire_Opal.png")
   Fire_Opal_Gem_Cutter_Ore = SF::Sprite.new(FIRE_OPAL_CUTTER_TEXTURE)
  #.......................................................Garnet.......................................................................
   GARNET_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Garnet.png")
   Garnet_Gem_Cutter_Ore = SF::Sprite.new(GARNET_CUTTER_TEXTURE)
  #........................................................Ruby........................................................................
   RUBY_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Ruby.png")
   Ruby_Gem_Cutter_Ore = SF::Sprite.new(RUBY_CUTTER_TEXTURE)
  #....................................................Cherry Quartz...................................................................
   CHERRY_QUARTZ_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Cherry_Quartz.png")
   Cherry_Quartz_Gem_Cutter_Ore = SF::Sprite.new(CHERRY_QUARTZ_CUTTER_TEXTURE)
  #....................................................Lemon Quartz....................................................................
   LEMON_QUARTZ_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Lemon_Quartz.png")
   Lemon_Quartz_Gem_Cutter_Ore = SF::Sprite.new(LEMON_QUARTZ_CUTTER_TEXTURE)
  #.....................................................Turquoise......................................................................
   TURQUOISE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Turquoise.png")
   Turquoise_Gem_Cutter_Ore = SF::Sprite.new(TURQUOISE_CUTTER_TEXTURE)
  #....................................................Tiger's Eye.....................................................................
   TIGERS_EYE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Tiger's_Eye.png")
   Tigers_Eye_Gem_Cutter_Ore = SF::Sprite.new(TIGERS_EYE_CUTTER_TEXTURE)
  #...................................................Orange Calcite...................................................................
   ORANGE_CALCITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Orange_Calcite.png")
   Orange_Calcite_Gem_Cutter_Ore = SF::Sprite.new(ORANGE_CALCITE_CUTTER_TEXTURE)
  #....................................................Grape Agate.....................................................................
   GRAPE_AGATE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Grape_Agate.png")
   Grape_Agate_Gem_Cutter_Ore = SF::Sprite.new(GRAPE_AGATE_CUTTER_TEXTURE)
  #.......................................................Jade.........................................................................
   JADE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Jade.png")
   Jade_Gem_Cutter_Ore = SF::Sprite.new(JADE_CUTTER_TEXTURE)
  #......................................................Diamond.......................................................................
   DIAMOND_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Diamond.png")
   Diamond_Gem_Cutter_Ore = SF::Sprite.new(DIAMOND_CUTTER_TEXTURE)
  #......................................................Emerald.......................................................................
   EMERALD_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Emerald.png")
   Emerald_Gem_Cutter_Ore = SF::Sprite.new(EMERALD_CUTTER_TEXTURE)
  #......................................................Painite.......................................................................
   PAINITE_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Painite.png")
   Painite_Gem_Cutter_Ore = SF::Sprite.new(PAINITE_CUTTER_TEXTURE)
  #..................................................Bumblebee Jasper..................................................................
   BUMBLEBEE_JASPER_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Bumblebee_Jasper.png")
   Bumblebee_Jasper_Gem_Cutter_Ore = SF::Sprite.new(BUMBLEBEE_JASPER_CUTTER_TEXTURE)
  #....................................................Blood Jasper....................................................................
   BLOOD_JASPER_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Blood_Jasper.png")
   Blood_Jasper_Gem_Cutter_Ore = SF::Sprite.new(BLOOD_JASPER_CUTTER_TEXTURE)
  #.....................................................Mook Jasper....................................................................
   MOOK_JASPER_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Mook_Jasper.png")
   Mook_Jasper_Gem_Cutter_Ore = SF::Sprite.new(MOOK_JASPER_CUTTER_TEXTURE)
  #.....................................................Red Jasper.....................................................................
   RED_JASPER_CUTTER_TEXTURE = SF::Texture.from_file("graphics/minerals/Gem_Cutter_Red_Jasper.png")
   Red_Jasper_Gem_Cutter_Ore = SF::Sprite.new(RED_JASPER_CUTTER_TEXTURE)
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                     Upgrade Table
#-------------------------------------------------------------------------------------------------------------------------------------- 
 UPGRADE_TABLE_MENU_TEXTURE = SF::Texture.from_file("graphics/Upgrade_Table_Menu.png")
 Test_Upgrade_Table_Menu = SF::Sprite.new(UPGRADE_TABLE_MENU_TEXTURE);
 Test_Upgrade_Table_Menu.position = SF.vector2(400, -200);