require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Menus.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "x11"
require "crystal/system/time"
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

FONT_TITLE = SF::Font.from_file("fonts/PermanentMarker-Regular.ttf")
FONT_COMMON = SF::Font.from_file("fonts/Changa/Changa-VariableFont_wght.ttf")
FONT_FUTURE = SF::Font.from_file("fonts/Orbitron/Orbitron-VariableFont_wght.ttf")
FONT_PIXEL = SF::Font.from_file("fonts/VT323-Regular.ttf")

GL.enable(GL::TEXTURE_2D)
include X11


module Game_Manager

  window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen)
  window.vertical_sync_enabled = true 
  char_select_pointer_position = 1

 
  Game_Manager.init(window, char_select_pointer_position)
  
  class Render_Loop_Manager


    event = window.poll_event
  
    def Game_Manager.init(window, char_select_pointer_position)
      CONTROLS::Menucontrols.cursorFunc
      menu = "main"
      cursorposition = "up"
      puts "init ran"
      Game_Manager::Render_Loop_Manager.render_loop(window, menu, cursorposition, char_select_pointer_position)
    end

    def Game_Manager.refresh(window, menu, cursorposition, char_select_pointer_position) #this is to refresh the window
      this = window
        if menu == "main"
      CONTROLS::Menucontrols.cursorFunc
      Gui::Menus.drawmainmenu(window, cursorposition, menu, char_select_pointer_position)
      Input_Manager.keyboard_input_main_menu(window, menu, cursorposition, char_select_pointer_position)
        end
        if menu == "charselect"
          char_select_pointer_position = 1
          puts menu
          Gui::Menus.character_select(window, cursorposition, menu, char_select_pointer_position)
          Input_Manager.keyboard_input_char_select(window, menu, cursorposition, char_select_pointer_position)
     
      else
        begin
          raise "something is very wrong"
        rescue exception
          Gui::Menus.drawmainmenu(this, cursorposition, menu, char_select_pointer_position)
      Input_Manager.keyboard_input_main_menu(window, menu, cursorposition, char_select_pointer_position)
      end
      end
      end
    end
    def Render_Loop_Manager.render_loop(window, menu, cursorposition, char_select_pointer_position) #the main render loop
      while window.open?
        event = window.poll_event
        Game_Manager.refresh(window, menu, cursorposition, char_select_pointer_position)
       if event.is_a? SF::Event::Closed
        (window).close
       end
       end
       end
  end

  class Input_Manager #manages input from the keyboard
    
    def Input_Manager.keyboard_input_main_menu(window, menu, cursorposition, char_select_pointer_position)
      event = window.poll_event
      if event.is_a? SF::Event::KeyPressed
        case (event.code)

        when SF::Keyboard::Escape 
         SF::Event::Closed
         window.close
#--------------------------------------------------------
           
        when SF::Keyboard::Enter 

           All_Audio::SFX.select1
           this = window
          case (cursorposition)

          when "up"
           menu = "charselect"
           
           Gui::Menus.character_select(this, cursorposition, menu, char_select_pointer_position)

          when "down"
           SF::Event::Closed
          end
#--------------------------------------------------------         
        
        when SF::Keyboard::Up 
          All_Audio::SFX.cursor1
          this = window
          CONTROLS::Menucontrols.arrowup(this, cursorposition, menu, char_select_pointer_position)
          cursorposition = "up"
#--------------------------------------------------------        

        when SF::Keyboard::Down
        All_Audio::SFX.cursor1
        this = window
        CONTROLS::Menucontrols.arrowdown(this, cursorposition, menu, char_select_pointer_position)
        cursorposition = "down"
    end
  end 
end
   def Input_Manager.keyboard_input_char_select(window, menu, cursorposition, char_select_pointer_position)
   event = window.poll_event
    if event.is_a? SF::Event::KeyPressed
     case (event.code)

       when SF::Keyboard::Escape 
        menu = "main"
#--------------------------------------------------------
       
    when SF::Keyboard::Enter 

       All_Audio::SFX.select1
       this = window
      case (cursorposition)

      when "up"
       menu = "charselect"
       
       Gui::Menus.character_select(this, cursorposition, menu, char_select_pointer_position)

      when "down"
       SF::Event::Closed
      end
#--------------------------------------------------------         
    
    when SF::Keyboard::Left 
      if char_select_pointer_position > 0
        All_Audio::SFX.cursor1
        this = window
        char_select_pointer_position = char_select_pointer_position - 1
        this2 = char_select_pointer_position 
        #CONTROLS::Menucontrols.charselectright(this2, char_select_pointer_position, char_select_pointer_position)
        Gui::Menus.slot_highlight(this, this2, char_select_pointer_position, window, cursorposition, menu)
      end
#--------------------------------------------------------        

    when SF::Keyboard::Down
      if char_select_pointer_position < 8
        All_Audio::SFX.cursor1
        this = window
        char_select_pointer_position = char_select_pointer_position + 1
        this2 = char_select_pointer_position 
        #CONTROLS::Menucontrols.charselectright(this)
        Gui::Menus.slot_highlight(this,this2, char_select_pointer_position, window, cursorposition, menu)
end
end
end
end
end
end
# module Main
# class Main_routine
#   @@char_select_pointer_position : Int32 = 0

#   def refresh
#     this = window
#     this2 = event
#     case (@@menu)
#     when "main"
#     Gui::Menus.drawmainmenu(window)
#     break
#     when "charselect"
#       Gui::Menus.character_select(window)
#     break
#     else
#       puts "something is very wrong"
#     end
#   end

#   def self.run
#     # Create a window
#     window = SF::RenderWindow.new(SF::VideoMode.new(1920, 1080), "Crystal Meth!", SF::Style::Fullscreen)
#     window.vertical_sync_enabled = true 
#     CONTROLS::Menucontrols.cursorFunc(window) 
#     @@menu = "main"
#     @@cursorposition = "up"
#     @@char_select_pointer_position = 0

#     # Main loop: run the program as long as the window is open
#     while window.open?
#       # Check all the window's events that were triggered since the last iteration of the loop
#       while event = window.poll_event
#         this = window
#         this2 = event
#         case (@@menu)
#         when "main"
#         Gui::Menus.drawmainmenu(window)
#         break
#         when "charselect"
#         Gui::Menus.character_select(window)
#         break
#         else
#           puts "something is very wrong"
#         end

#         window.display
#         this = window
#         end

#         if event.is_a? SF::Event::KeyPressed
#             #escape
#           case (event.code)

#             #escape
#           when SF::Keyboard::Escape
#             SF::Event::Closed
#             window.close

#             #up
#           when SF::Keyboard::Up
#             case (@@menu)
#             when "main"
#               All_Audio::SFX.cursor1
#               this = window
#               CONTROLS::Menucontrols.arrowup (this)
#               @@cursorposition = "up"
#             end

#              #down
#           when SF::Keyboard::Down
#             case (@@menu)
#             when "main"
#               All_Audio::SFX.cursor1
#             this = window
#             CONTROLS::Menucontrols.arrowdown(this)
#             @@cursorposition = "down"
#             end

#              #left
#           when SF::Keyboard::Left
#             case (@@menu)
#             when "main"

#             when "charselect"
#               if @@char_select_pointer_position > 0
#              All_Audio::SFX.cursor1
#              this = window
#              @@char_select_pointer_position = @@char_select_pointer_position - 1
#              this2 = @@char_select_pointer_position 
#              CONTROLS::Menucontrols.charselectright(this2)
#              Gui::Menus.slot_highlight(this, this2)
#               end
#             end
#           when SF::Keyboard::Right
#             case (@@menu)
#             when "main"

#             when "charselect"
#               if @@char_select_pointer_position < 8
#              All_Audio::SFX.cursor1
#              this = window
#              @@char_select_pointer_position = @@char_select_pointer_position + 1
#              this2 = @@char_select_pointer_position 
#              CONTROLS::Menucontrols.charselectright(this)
#              Gui::Menus.slot_highlight(this, this2)
#               end
#             end

#              #enter
#           when SF::Keyboard::Enter
#             case (@@menu)

#             when "main"
#             All_Audio::SFX.select1
#             this = window

#               case (@@cursorposition)

#               when "up"
#               @@menu = "charselect"
#               Gui::Menus.character_select(this)
#               when "down"
#               SF::Event::Closed
#               window.close 
#             end
#           when "charselect"
#             #todo, add method call for new/load when method is created
            
#           end
#         end # <- todo, find way to use less end, it looks messy and it confuses me :c
#       end
#     end
#   end
#           def determine_menu (menu, pointer)
#             menu = @@menu
#             pointer = @@cursorposition
       
#         if event.is_a? SF::Event::Closed
#           window.close
#         end
#       end
      
     
#     end
#   end

# Main::Main_routine.run
# end



