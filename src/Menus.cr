require "crsfml"
require "../src/crystal_meth.cr"


FONT_TITLE = SF::Font.from_file("fonts/PermanentMarker-Regular.ttf")
FONT_COMMON = SF::Font.from_file("fonts/Changa/Changa-VariableFont_wght.ttf")
FONT_FUTURE = SF::Font.from_file("fonts/Orbitron/Orbitron-VariableFont_wght.ttf")

#Main Menu Gui.Menus.drawmainmenu(window)
module Gui
class Menus
 
        def Menus.drawmainmenu(this)
        
    text_title = SF::Text.new
    text_title.font = FONT_TITLE
    text_title.string = "Crystal Meth!"
    text_title.character_size = 80
    text_title.color = SF::Color::White
    text_title.style = (SF::Text::Bold)
    text_title.position = SF.vector2(650, 50)
    #create menu body
    rectangle_menu = SF::RectangleShape.new(SF.vector2(650, 300))
    rectangle_menu.fill_color = SF.color(150, 50, 50)
    rectangle_menu.outline_thickness = 7
    rectangle_menu.outline_color = SF.color(150, 150, 150)
    rectangle_menu.position = SF.vector2(625, 550)
    #create menu option 1
    rectangle_opt1 = SF::RectangleShape.new(SF.vector2(500, 100))
    rectangle_opt1.fill_color = SF.color(100, 50, 50)
    rectangle_opt1.outline_thickness = 5
    rectangle_opt1.outline_color = SF.color(150, 150, 150)
    rectangle_opt1.position = SF.vector2(700, 590)
    text_opt1 = SF::Text.new
    text_opt1.font = FONT_TITLE
    text_opt1.string = "Play"
    text_opt1.character_size = 50
    text_opt1.color = SF::Color::White
    text_opt1.style = (SF::Text::Bold)
    text_opt1.position = SF.vector2(880, 610)
    #create menu option 2
    rectangle_opt2= SF::RectangleShape.new(SF.vector2(500, 100))
    rectangle_opt2.fill_color = SF.color(100, 50, 50)
    rectangle_opt2.outline_thickness = 5
    rectangle_opt2.outline_color = SF.color(150, 150, 150)
    rectangle_opt2.position = SF.vector2(700, 710)
    text_opt2 = SF::Text.new
    text_opt2.font = FONT_TITLE
    text_opt2.string = "Quit"
    text_opt2.character_size = 50
    text_opt2.color = SF::Color::White
    text_opt2.style = (SF::Text::Bold)
    text_opt2.position = SF.vector2(880, 730)
    this.clear(SF::Color::Black)
this.draw(text_title)
this.draw(rectangle_menu)
this.draw(rectangle_opt1)
this.draw(text_opt1)
this.draw(rectangle_opt2)
this.draw(text_opt2)
        end
        end
        end
class Menuopt1 
            
    Rectangle_opt1 = SF::RectangleShape.new(SF.vector2(500, 100))
    Rectangle_opt1.fill_color = SF.color(100, 50, 50)
    Rectangle_opt1.outline_thickness = 5
    Rectangle_opt1.outline_color = SF.color(150, 150, 150)
    Rectangle_opt1.position = SF.vector2(700, 590)
    text_opt1 = SF::Text.new
    text_opt1.font = FONT_TITLE
    text_opt1.string = "Play"
    text_opt1.character_size = 50
    text_opt1.color = SF::Color::White
    text_opt1.style = (SF::Text::Bold)
    text_opt1.position = SF.vector2(880, 610)
        def Menuopt1.blinkopt1 (rectangle_opt1)
            rectangle_opt1 = SF::RectangleShape
           
            Rectangle_opt1.outline_color = SF.color(100, 100, 100)
            sleep 3.seconds
            Rectangle_opt1.outline_color = SF.color(130, 130, 130)
        end
end   

       
            


   module CONTROLS
    class Menucontrols

    
   def Menucontrols.arrows (this, this2)
    if this2.is_a? SF::Event::KeyPressed
        puts "ice ice baby"
    puts "woooot"
            if this2.code SF::Keyboard::Up
                up = true
                puts up
            
            while up = true
                Menuopt1.blinkopt1(this)
               if this2.code SF::Keyboard::Down
                Menucontrols.arrows this, this2
               end
                end
            end
        if this2.code  SF::Keyboard::Down
            while !SF::Keyboard::Down
                #rectangle_opt2.outline_color = SF.color(140, 140, 140)
                if SF::Keyboard::Up
                    Menucontrols.arrows this, this2
                   end
                    end
end
end
end
end
end

