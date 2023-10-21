require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
require "crsfml/system"
require "timer"



FONT_TITLE = SF::Font.from_file("fonts/PermanentMarker-Regular.ttf")
FONT_COMMON = SF::Font.from_file("fonts/Changa/Changa-VariableFont_wght.ttf")
FONT_FUTURE = SF::Font.from_file("fonts/Orbitron/Orbitron-VariableFont_wght.ttf")
CURSOR_TEXTURE_1 = SF::Texture.from_file("graphics/Cursor.png")
Cursor_opt1.texture_rect = SF.int_rect(0, 0, 70, 70)
Cursor_opt1.position = SF.vector2(750, 610)
Cursor_opt1 = SF::Sprite.new(CURSOR_TEXTURE_1) 



#Main Menu Gui.Menus.drawmainmenu(window)
module Gui
class Menus
 
        def Menus.drawmainmenu(this)
   
    
    
    
    
     #text
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
this.draw(Cursor_opt1)
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
        
        
   def Menucontrols.arrowup (this)
    Cursor_opt1.position = SF.vector2(750, 610)
    #this.draw(Cursor_opt1)
    
   end

   def Menucontrols.arrowdown (this)
    Cursor_opt1.position = SF.vector2(750,730)
    #this.draw(Cursor_opt1)
     
end
def Menucontrols.cursorFunc (this)
   
    spawn do
        clock = SF::Clock.new
   
    loop do
        sleep 2.seconds
        Cursor_opt1.color = SF.color(255, 255, 255, 255)
        Fiber.yield
        sleep 2.seconds
        Fiber.yield
        Cursor_opt1.color = SF.color(255, 255, 255, 128)
        sleep 2.seconds
        Fiber.yield
        break if 
                 SF::Keyboard.key_pressed?(SF::Keyboard::Escape)
                 
        end
      end
      
    Fiber.yield
end
end
end
/#module CONTROLS
    class Menucontrols
      def self.arrowup (this)
        thread = SF::Thread.new(-> {
          cursorFunc
          Cursor_opt1.position = SF.vector2(750, 610)
        })
        thread.launch
      end
  
      def self.arrowdown (this)
        thread = SF::Thread.new(-> {
          cursorFunc
          Cursor_opt1.position = SF.vector2(750, 730)
        })
        thread.launch
      end
  
      def self.cursorFunc
        clock = SF::Clock.new
  
        loop do
          break if SF::Keyboard.key_pressed?(SF::Keyboard::Down) ||
                   SF::Keyboard.key_pressed?(SF::Keyboard::Escape)
  
          elapsed = clock.elapsed_time.as_seconds
          case elapsed
          when 5
            Cursor_opt1.color = SF.color(255, 255, 255, 128)
          when 10
            Cursor_opt1.color = SF.color(155, 155, 155, 155)
          when 15
            clock.restart
          end
        end
      end
    end
  end
  
        
   module CONTROLS
    class Menucontrols
        
        
   def Menucontrols.arrowup (this)
    thread = SF::Thread.new(->Menucontrols.cursorFunc)
    Cursor_opt1.position = SF.vector2(750, 610)
    this.draw(Cursor_opt1)
    thread.launch
   end

   def Menucontrols.arrowdown (this)
    thread = SF::Thread.new(->Menucontrols.cursorFunc)
    Cursor_opt1.position = SF.vector2(750,730)
    this.draw(Cursor_opt1)
    thread.launch
end
def Menucontrols.cursorFunc
    clock = SF::Clock.new 
    elapsed_1 = clock.elapsed_time
    p elapsed_1.as_seconds
         [loop do 
            break if SF::Keyboard.key_pressed?(SF::Keyboard::Down)
               break if SF::Keyboard.key_pressed?(SF::Keyboard::Escape)
         case (elapsed_1) 
         when 5
            Cursor_opt1.color = SF.color(255, 255, 255, 128)
         when 10 
            Cursor_opt1.color = SF.color(155, 155, 155, 155)
         when 15
            clock.restart
               
         end      
        end]
    end 

 
end
end#/

