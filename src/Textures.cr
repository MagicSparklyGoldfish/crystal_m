#|||||||||||||||||||||||||||||||||||||||||||||||||||||||Textures|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  Ground = SF::RectangleShape.new(SF.vector2(10000, 500)); Ground.fill_color = SF.color(0, 255, 100)
  Ground.position = SF.vector2(0, 800)
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
 HAIR_ARRAY = [SHOUNEN_HAIR_01, SHOUNEN_HAIR_02, SHOUNEN_HAIR_03, SHOUNEN_HAIR_04, SHOUNEN_HAIR_05, SHOUNEN_HAIR_06,
 PONYTAIL_01, PONYTAIL_02, PONYTAIL_03, PONYTAIL_04, PONYTAIL_05, PONYTAIL_06]

 HAIR_DISPLAY_ARRAY = [SHOUNEN_DISPLAY_HAIR_01, SHOUNEN_DISPLAY_HAIR_02, SHOUNEN_DISPLAY_HAIR_03, SHOUNEN_DISPLAY_HAIR_04, 
 SHOUNEN_DISPLAY_HAIR_05, SHOUNEN_DISPLAY_HAIR_06, DISPLAY_PONYTAIL_HAIR_01, DISPLAY_PONYTAIL_HAIR_02, DISPLAY_PONYTAIL_HAIR_03,
 DISPLAY_PONYTAIL_HAIR_04, DISPLAY_PONYTAIL_HAIR_05, DISPLAY_PONYTAIL_HAIR_06]

 HAIR_DESC_ARRAY = ["Shounen Hair Black", "Shounen Hair Green", "Shounen Hair Blue", "Shounen Hair Red",
 "Shounen Hair Yellow", "Shounen Hair Purple", "   Ponytail Grey", "Ponytail Blonde", "Ponytail Red", "Ponytail Brown",
 "Ponytail Pink", "Ponytail Blue"]

 Hair_Desc = SF::Text.new; Hair_Desc.font = FONT_FANCY_BOLD
 Hair_Desc.string = HAIR_DESC_ARRAY[0]; Hair_Desc.character_size = 40; Hair_Desc.color = SF::Color::White
 Hair_Desc.position = SF.vector2(235, 240)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #                                                    Shounen Hairs
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #.................................................Shounen Hair Black...............................................................
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
   SHOUNEN_HAIR_02.color = SF.color(50, 255, 50)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_02 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_02.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_02.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_02.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_02.color = SF.color(50, 255, 50)
  #.................................................Shounen Hair Blue................................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_03 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_03.color = SF.color(50, 50, 255) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_03 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_03.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_03.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_03.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_03.color = SF.color(50, 50, 255) 
  #.................................................Shounen Hair Red.................................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_04 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_04.color = SF.color(255, 0, 0) 
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_04 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_04.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_04.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_04.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_04.color = SF.color(255, 0, 0) 
  #.................................................Shounen Hair Yellow..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_05 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_05.color = SF.color(255, 240, 80)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_05 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_05.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_05.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_05.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_05.color = SF.color(255, 240, 80)
  #.................................................Shounen Hair Purple..............................................................
   #\\\\\\\Character Model
   SHOUNEN_HAIR_06 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
   SHOUNEN_HAIR_06.color = SF.color(255, 0, 255)
   #\\\\\\\Display Model
   SHOUNEN_DISPLAY_HAIR_06 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01)
   SHOUNEN_DISPLAY_HAIR_06.texture_rect = SF.int_rect(0, 0, 96, 128)
   SHOUNEN_DISPLAY_HAIR_06.position = SF.vector2(250, 50)
   SHOUNEN_DISPLAY_HAIR_06.scale = SF.vector2(3.0, 3.0)
   SHOUNEN_DISPLAY_HAIR_06.color = SF.color(255, 0, 255)
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
 GLOVE_ARRAY = [FINGERLESS_GLOVE_01, FINGERLESS_GLOVE_02, FINGERLESS_GLOVE_03]

 DISPLAY_GLOVE_ARRAY = [DISPLAY_FINGERLESS_GLOVE_01, DISPLAY_FINGERLESS_GLOVE_02, DISPLAY_FINGERLESS_GLOVE_03]

 GLOVE_DESC_ARRAY = ["Black Fingerless Gloves", "Red Fingerless Gloves", "Blue Fingerless Gloves"]

 Glove_Desc = SF::Text.new; Glove_Desc.font = FONT_FANCY_BOLD
 Glove_Desc.string = GLOVE_DESC_ARRAY[0]; Glove_Desc.character_size = 40; Glove_Desc.color = SF::Color::White
 Glove_Desc.position = SF.vector2(1400, 250)
 #.................................................Fingerless Gloves Black...........................................................
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
  FINGERLESS_GLOVE_02.color = SF.color(255, 50, 50)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_02 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_02.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_02.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_02.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_02.color = SF.color(255, 50, 50)
 #.................................................Fingerless Gloves Blue............................................................
  #\\\\\\\Character Model
  FINGERLESS_GLOVE_03 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01) 
  FINGERLESS_GLOVE_03.color = SF.color(50, 50, 255)
  #\\\\\\\Display Model
  DISPLAY_FINGERLESS_GLOVE_03 = SF::Sprite.new(FINGERLESS_GLOVE_TEXTURE_01)
  DISPLAY_FINGERLESS_GLOVE_03.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_FINGERLESS_GLOVE_03.position = SF.vector2(1350, -250)
  DISPLAY_FINGERLESS_GLOVE_03.scale = SF.vector2(5.0, 5.0)
  DISPLAY_FINGERLESS_GLOVE_03.color = SF.color(50, 50, 255)
#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Shirt Textures
#-------------------------------------------------------------------------------------------------------------------------------------

 SHIRT_ARRAY = [T_SHIRT_01, T_SHIRT_02, T_SHIRT_03, T_SHIRT_04, T_SHIRT_05, T_SHIRT_06]

 DISPLAY_SHIRT_ARRAY = [DISPLAY_T_SHIRT_01, DISPLAY_T_SHIRT_02, DISPLAY_T_SHIRT_03, DISPLAY_T_SHIRT_04,
 DISPLAY_T_SHIRT_05, DISPLAY_T_SHIRT_06]

 SHIRT_DESC_ARRAY = ["White T-Shirt", "Blue T-Shirt", "Red T-Shirt", "Green T-Shirt", "Purple T-Shirt", 
 "Black T-Shirt"]

 Shirt_Desc = SF::Text.new; Shirt_Desc.font = FONT_FANCY_BOLD
 Shirt_Desc.string = SHIRT_DESC_ARRAY[0]; Shirt_Desc.character_size = 40; Shirt_Desc.color = SF::Color::White
 Shirt_Desc.position = SF.vector2(1200, 800)
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
#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Pants Textures
#-------------------------------------------------------------------------------------------------------------------------------------
 PANTS_ARRAY = [SHORTS_01, SHORTS_02, SHORTS_03]

 DISPLAY_PANTS_ARRAY = [DISPLAY_SHORTS_01, DISPLAY_SHORTS_02, DISPLAY_SHORTS_03]

 PANTS_DESC_ARRAY = ["Blue Shorts", "Brown Shorts", "Black Shorts"]

 Pants_Desc = SF::Text.new; Pants_Desc.font = FONT_FANCY_BOLD
 Pants_Desc.string = PANTS_DESC_ARRAY[0]; Pants_Desc.character_size = 40; Pants_Desc.color = SF::Color::White
 Pants_Desc.position = SF.vector2(1500, 530)
 #.....................................................Blue Shorts...................................................................
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
  SHORTS_02.color = SF.color(255, 130, 80)
  #\\\\\\\Display Model
  DISPLAY_SHORTS_02 = SF::Sprite.new(SHORTS_TEXTURE_01)
  DISPLAY_SHORTS_02.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_SHORTS_02.position = SF.vector2(1415, 120)
  DISPLAY_SHORTS_02.scale = SF.vector2(3.5, 3.5)
  DISPLAY_SHORTS_02.color = SF.color(255, 130, 80)
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
#-------------------------------------------------------------------------------------------------------------------------------------
#                                                     Shoes Textures
#-------------------------------------------------------------------------------------------------------------------------------------
 SHOES_ARRAY = [RAIN_BOOTS_01, RAIN_BOOTS_02, RAIN_BOOTS_03]

 DISPLAY_SHOES_ARRAY = [DISPLAY_RAIN_BOOTS_01, DISPLAY_RAIN_BOOTS_02, DISPLAY_RAIN_BOOTS_03]

 SHOES_DESC_ARRAY = ["Black Rain Boots", "Red Rain Boots", "Blue Rain Boots"]

 Shoes_Desc = SF::Text.new; Shoes_Desc.font = FONT_FANCY_BOLD
 Shoes_Desc.string = SHOES_DESC_ARRAY[0]; Shoes_Desc.character_size = 40; Shoes_Desc.color = SF::Color::White
 Shoes_Desc.position = SF.vector2(1450, 800)

 NIL_SHOE_TEXTURE = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
 #....................................................Black Rain Boots.................................................................
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
  RAIN_BOOTS_02.color = SF.color(255, 100, 100)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_02 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_02.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_02.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_02.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_02.color = SF.color(255, 100, 100)
 #....................................................Blue Rain Boots..................................................................
  #\\\\\\\Character Model
  RAIN_BOOTS_03 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01) 
  RAIN_BOOTS_03.color = SF.color(100, 100, 255)
  #\\\\\\\Display Model
  DISPLAY_RAIN_BOOTS_03 = SF::Sprite.new(RAIN_BOOTS_TEXTURE_01)
  DISPLAY_RAIN_BOOTS_03.texture_rect = SF.int_rect(0, 0, 96, 128)
  DISPLAY_RAIN_BOOTS_03.position = SF.vector2(1400, 350)
  DISPLAY_RAIN_BOOTS_03.scale = SF.vector2(3.5, 3.5)
  DISPLAY_RAIN_BOOTS_03.color = SF.color(100, 100, 255)


#--------------------------------------------------------------------------------------------------------------------------------------
#                                                    Enemy Textures
#--------------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------------
#                                                     Name Boxes
#--------------------------------------------------------------------------------------------------------------------------------------
  Name_Box = SF::RectangleShape.new(SF.vector2(110, 20)); Name_Box.fill_color = SF.color(255, 255, 255)
  Name_Box.outline_thickness = 2; Name_Box.outline_color = SF.color(150, 0, 0); Name_Box_Text = SF::Text.new;
  Name_Box_Text.font = FONT_PIXEL; Name_Box_Text.character_size = 20; Name_Box_Text.color = SF::Color::Black
  Health_Bar = SF::RectangleShape.new(SF.vector2(100, 10)); Health_Bar.fill_color = SF.color(255, 0, 0) 