require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "crsfml/system"
require "yaml"
require "crystal/system/time"
require "chipmunk"
#require "timer"

FONT_TITLE = SF::Font.from_file("fonts/PermanentMarker-Regular.ttf")
FONT_COMMON = SF::Font.from_file("fonts/Changa/Changa-VariableFont_wght.ttf")
FONT_FUTURE = SF::Font.from_file("fonts/Orbitron/Orbitron-VariableFont_wght.ttf")
CURSOR_TEXTURE_1 = SF::Texture.from_file("graphics/Cursor.png")
Cursor_opt1.texture_rect = SF.int_rect(0, 0, 62, 65)
Cursor_opt1.position = SF.vector2(750, 610)
Cursor_opt1 = SF::Sprite.new(CURSOR_TEXTURE_1) 

#--------------------------------------------------table of contents----------------------------------------------------------------------------------
#                                                  _Gui Module
#                                                  |
#                                                  ===Main
#                                                  |
#                                                  ===Char Select



#Main Menu Gui.Menus.drawmainmenu(window)
module Gui
class Menus

#init main menu #todo add textures

    #text
    @@text_title = SF::Text.new; @@text_title.font = FONT_TITLE; @@text_title.string = "Crystal Meth!"; @@text_title.character_size = 80
    @@text_title.color = SF::Color::White; @@text_title.style = (SF::Text::Bold); @@text_title.position = SF.vector2(650, 50)
    #create menu body
    @@rectangle_menu = SF::RectangleShape.new(SF.vector2(650, 300))
    @@rectangle_menu.fill_color = SF.color(150, 50, 50)
    @@rectangle_menu.outline_thickness = 7
    @@rectangle_menu.outline_color = SF.color(150, 150, 150)
    @@rectangle_menu.position = SF.vector2(625, 550)
    #create menu option 1
    @@rectangle_opt1 = SF::RectangleShape.new(SF.vector2(500, 100))
    @@rectangle_opt1.fill_color = SF.color(100, 50, 50)
    @@rectangle_opt1.outline_thickness = 5
    @@rectangle_opt1.outline_color = SF.color(150, 150, 150)
    @@rectangle_opt1.position = SF.vector2(700, 590)
    @@text_opt1 = SF::Text.new
    @@text_opt1.font = FONT_TITLE
    @@text_opt1.string = "Play"
    @@text_opt1.character_size = 50
    @@text_opt1.color = SF::Color::White
    @@text_opt1.style = (SF::Text::Bold)
    @@text_opt1.position = SF.vector2(880, 610)
    #create menu option 2
    @@rectangle_opt2= SF::RectangleShape.new(SF.vector2(500, 100))
    @@rectangle_opt2.fill_color = SF.color(100, 50, 50)
    @@rectangle_opt2.outline_thickness = 5
    @@rectangle_opt2.outline_color = SF.color(150, 150, 150)
    @@rectangle_opt2.position = SF.vector2(700, 710)
    @@text_opt2 = SF::Text.new
    @@text_opt2.font = FONT_TITLE
    @@text_opt2.string = "Quit"
    @@text_opt2.character_size = 50
    @@text_opt2.color = SF::Color::White
    @@text_opt2.style = (SF::Text::Bold)
    @@text_opt2.position = SF.vector2(880, 730)
   
#draw main menu
 def Menus.drawmainmenu(this, cursorposition, menu, char_select_pointer_position)
this.clear(SF::Color::Black); this.draw(@@text_title); this.draw(@@rectangle_menu); this.draw(@@rectangle_opt1); this.draw(@@text_opt1)
this.draw(@@rectangle_opt2); this.draw(@@text_opt2); this.draw(Cursor_opt1); this.display
  end

#init char menu #todo add textures

#ground
@@rectangle_charmenu_ground = SF::RectangleShape.new(SF.vector2(8000, 700)); @@rectangle_charmenu_ground.fill_color = SF.color(50, 150, 50)
@@rectangle_charmenu_ground.position = SF.vector2(0, 500)  

#charblocksouter
@@rectangle_char_outer_1 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_1.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_1.position = SF.vector2(100, 400)

@@rectangle_char_outer_2 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_2.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_2.position = SF.vector2(600, 400)

@@rectangle_char_outer_3 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_3.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_3.position = SF.vector2(1100, 400)

@@rectangle_char_outer_4 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_4.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_4.position = SF.vector2(1600, 400)

@@rectangle_char_outer_5 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_5.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_5.position = SF.vector2(350, 600)

@@rectangle_char_outer_6 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_6.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_6.position = SF.vector2(850, 600)

@@rectangle_char_outer_7 = SF::RectangleShape.new(SF.vector2(200, 300)); @@rectangle_char_outer_7.fill_color = SF.color(50, 50, 150)
@@rectangle_char_outer_7.position = SF.vector2(1350, 600)

#char blocks inner
@@rectangle_char_inner_1 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_1.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_1.position = SF.vector2(150, 500)

@@rectangle_char_inner_2 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_2.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_2.position = SF.vector2(650, 500)

@@rectangle_char_inner_3 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_3.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_3.position = SF.vector2(1150, 500)

@@rectangle_char_inner_4 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_4.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_4.position = SF.vector2(1650, 500)

@@rectangle_char_inner_5 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_5.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_5.position = SF.vector2(400, 700)

@@rectangle_char_inner_6 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_6.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_6.position = SF.vector2(900, 700)

@@rectangle_char_inner_7 = SF::RectangleShape.new(SF.vector2(100, 150)); @@rectangle_char_inner_7.fill_color = SF.color(150, 250, 50)
@@rectangle_char_inner_7.position = SF.vector2(1400, 700)

#info blocks
@@info_block_1 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_1.fill_color = SF.color(150, 250, 150)
@@info_block_1.position = SF.vector2(90, 680); @@info_block_1.outline_thickness = 3.5; @@info_block_1.outline_color = SF.color(150, 150, 150)

@@info_block_2 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_2.fill_color = SF.color(150, 250, 150)
@@info_block_2.position = SF.vector2(590, 680); @@info_block_2.outline_thickness = 3.5; @@info_block_2.outline_color = SF.color(150, 150, 150)

@@info_block_3 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_3.fill_color = SF.color(150, 250, 150)
@@info_block_3.position = SF.vector2(1090, 680); @@info_block_3.outline_thickness = 3.5; @@info_block_3.outline_color = SF.color(150, 150, 150)

@@info_block_4 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_4.fill_color = SF.color(150, 250, 150)
@@info_block_4.position = SF.vector2(1590, 680); @@info_block_4.outline_thickness = 3.5; @@info_block_4.outline_color = SF.color(150, 150, 150)

@@info_block_5 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_5.fill_color = SF.color(150, 250, 150)
@@info_block_5.position = SF.vector2(340, 880); @@info_block_5.outline_thickness = 3.5; @@info_block_5.outline_color = SF.color(150, 150, 150)

@@info_block_6 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_6.fill_color = SF.color(150, 250, 150)
@@info_block_6.position = SF.vector2(840, 880); @@info_block_6.outline_thickness = 3.5; @@info_block_6.outline_color = SF.color(150, 150, 150)

@@info_block_7 = SF::RectangleShape.new(SF.vector2(220, 150)); @@info_block_7.fill_color = SF.color(150, 250, 150)
@@info_block_7.position = SF.vector2(1340, 880); @@info_block_7.outline_thickness = 3.5; @@info_block_7.outline_color = SF.color(150, 150, 150)


def Menus.character_select(this, cursorposition, menu, char_select_pointer_position)
 
  this.clear(SF::Color::Blue)
  this.draw(@@rectangle_charmenu_ground); this.draw(@@rectangle_char_outer_1); this.draw(@@rectangle_char_outer_2); this.draw(@@rectangle_char_outer_3)
  this.draw(@@rectangle_char_outer_4); this.draw(@@rectangle_char_outer_5); this.draw(@@rectangle_char_outer_6); this.draw(@@rectangle_char_outer_7)
  this.draw(@@rectangle_char_inner_1); this.draw(@@rectangle_char_inner_2); this.draw(@@rectangle_char_inner_3); this.draw(@@rectangle_char_inner_4)
  this.draw(@@rectangle_char_inner_5); this.draw(@@rectangle_char_inner_6); this.draw(@@rectangle_char_inner_7)
  this.draw(@@info_block_1); this.draw(@@info_block_2); this.draw(@@info_block_3); this.draw(@@info_block_4); this.draw(@@info_block_5)
  this.draw(@@info_block_6); this.draw(@@info_block_7)
  this.display
        end
        end

def Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
  this3.move(SF.vector2(0, -10))
  Menus.character_select(window, cursorposition, menu, char_select_pointer_position); this.draw(this3); this.display
  sleep 0.2.seconds
  this3.move(SF.vector2(0, 10))
end

def Menus.slot_highlight(this,this2, char_select_pointer_position, window, cursorposition, menu)
    case this2
    when 1
      this3 = @@rectangle_char_inner_1
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
    when 2
      this3 = @@rectangle_char_inner_2
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
    when 3
      this3 = @@rectangle_char_inner_3
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
    when 4
      this3 = @@rectangle_char_inner_4
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
    when 5
      this3 = @@rectangle_char_inner_5
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
    when 6
      this3 = @@rectangle_char_inner_6
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
    when 7
      this3 = @@rectangle_char_inner_7
      Menus.slot_highlight_2(this,this3, char_select_pointer_position, window, cursorposition, menu)
          end
        end
def Menus.select_character(this,this2)
    case this2
    when 1
      
        end
      end
    end
         


#######################################################################################################################################################

module CONTROLS
    class Menucontrols
     
        #controls for main menu 
   def Menucontrols.arrowup (this, cursorposition, menu, char_select_pointer_position)
    Cursor_opt1.position = SF.vector2(750, 610)
    this.draw(Cursor_opt1)
    this.display
   end

   def Menucontrols.arrowdown (this, cursorposition, menu, char_select_pointer_position)
    Cursor_opt1.position = SF.vector2(750,730)
    this.draw(Cursor_opt1)
    this.display
end


def Menucontrols.cursorFunc #todo fix this stupid method
  spawn do
    blinking = true
    loop do
      if blinking
        Cursor_opt1.texture_rect = SF.int_rect(62, 0, 62, 65)
    
      else
        Cursor_opt1.texture_rect = SF.int_rect(0, 0, 62, 65)
        
      end
      blinking = !blinking


      sleep 2.seconds 
      end
    end
  end
  Fiber.yield
end

end




