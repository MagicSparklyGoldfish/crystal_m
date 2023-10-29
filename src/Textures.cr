#-----------------------------------------------------------------------------------------------------
#                                    Menu Textures
#-----------------------------------------------------------------------------------------------------
WOOD_TEXTURE_1 = SF::Texture.from_file("graphics/Wood01.png")

#-----------------------------------------------------------------------------------------------------
#                                     Main Menu
#-----------------------------------------------------------------------------------------------------
#_______________________________________Title_________________________________________________________
Text_Title = SF::Text.new; Text_Title.font = FONT_TITLE; Text_Title.string = "Crystal Meth!"; Text_Title.character_size = 80
Text_Title.color = SF::Color::White; Text_Title.style = (SF::Text::Bold); Text_Title.position = SF.vector2(650, 50)
#_________________________________Main Menu Body_______________________________________________________
Rectangle_Menu = SF::RectangleShape.new(SF.vector2(650, 300)); Rectangle_Menu.fill_color = SF.color(150, 50, 50)
Rectangle_Menu.outline_thickness = 7; Rectangle_Menu.outline_color = SF.color(150, 150, 150)
Rectangle_Menu.position = SF.vector2(625, 550)
#________________________________Main Menu Option 1____________________________________________________
Rectangle_Opt1 = SF::RectangleShape.new(SF.vector2(500, 100)); Rectangle_Opt1.fill_color = SF.color(100, 50, 50)
Rectangle_Opt1.outline_thickness = 5; Rectangle_Opt1.outline_color = SF.color(150, 150, 150)
Rectangle_Opt1.position = SF.vector2(700, 590); Text_Opt1 = SF::Text.new; Text_Opt1.font = FONT_TITLE
Text_Opt1.string = "Play"; Text_Opt1.character_size = 50; Text_Opt1.color = SF::Color::White
Text_Opt1.style = (SF::Text::Bold); Text_Opt1.position = SF.vector2(880, 610)
#________________________________Main Menu Option 2_____________________________________________________
Rectangle_Opt2 = SF::RectangleShape.new(SF.vector2(500, 100)); Rectangle_Opt2.fill_color = SF.color(100, 50, 50)
Rectangle_Opt2.outline_thickness = 5; Rectangle_Opt2.outline_color = SF.color(150, 150, 150)
Rectangle_Opt2.position = SF.vector2(700, 710); Text_Opt2 = SF::Text.new; Text_Opt2.font = FONT_TITLE
Text_Opt2.string = "Quit"; Text_Opt2.character_size = 50; Text_Opt2.color = SF::Color::White
Text_Opt2.style = (SF::Text::Bold); Text_Opt2.position = SF.vector2(880, 730)
#------------------------------------------------------------------------------------------------------
#                                  Charselect Menu
#------------------------------------------------------------------------------------------------------
#______________________________________Ground__________________________________________________________
Rectangle_Charmenu_Ground = SF::RectangleShape.new(SF.vector2(8000, 700)); Rectangle_Charmenu_Ground.fill_color = SF.color(50, 150, 50)
Rectangle_Charmenu_Ground.position = SF.vector2(0, 500)  
#________________________________Char Blocks Outer_____________________________________________________
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
#_________________________________Char Blocks Inner____________________________________________________
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
#___________________________________Info Blocks________________________________________________________
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
#------------------------------------------------------------------------------------------------------
#                                  Character Creation Menu
#------------------------------------------------------------------------------------------------------
#______________________________________Ground__________________________________________________________
#Rectangle_Charcreation_Ground = SF::RectangleShape.new(SF.vector2(8000, 700)); 
#Rectangle_Charcreation_Ground.fill_color = SF.color(50, 25, 0)
Rectangle_Charcreation_Ground.position = SF.vector2(0, 500); Rectangle_Charcreation_Ground = SF::Sprite.new(WOOD_TEXTURE_1)
#______________________________________Cubby 1_________________________________________________________
Rectangle_Cubby_01 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_01.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_01.position = SF.vector2(250, 50);
#______________________________________Cubby 2_________________________________________________________
Rectangle_Cubby_02 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_02.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_02.position = SF.vector2(250, 330);
#______________________________________Cubby 3_________________________________________________________
Rectangle_Cubby_03 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_03.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_03.position = SF.vector2(250, 610);
#______________________________________Cubby 4_________________________________________________________
Rectangle_Cubby_04 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_04.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_04.position = SF.vector2(1450, 50);
#______________________________________Cubby 5_________________________________________________________
Rectangle_Cubby_05 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_05.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_05.position = SF.vector2(1450, 330);
#______________________________________Cubby 6_________________________________________________________
Rectangle_Cubby_06 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_06.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_06.position = SF.vector2(1450, 610);
#______________________________________Cubby 7_________________________________________________________
Rectangle_Cubby_07 = SF::RectangleShape.new(SF.vector2(250, 250)); Rectangle_Cubby_07.fill_color = SF.color(50, 25, 0)
Rectangle_Cubby_07.position = SF.vector2(1170, 610);