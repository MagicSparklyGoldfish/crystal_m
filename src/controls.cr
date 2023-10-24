require "../src/crystal_meth.cr"
require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Menus.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/controls.cr"
require "x11"
require "crystal/system/time"

module Menu_Controls

@@newmenu = "main"

#include Main::Main_routine.crystal_meth

#=================================================
# Main Menu Controls
#=================================================

     def Menu_Controls.main_menu_controls(event, window, cursorposition, char_select_pointer_position)
     if event.is_a? SF::Event::KeyPressed
     case (event.code)
#_________________________________________________
     when SF::Keyboard::Escape #------------escape
      SF::Event::Closed
      window.close
#_________________________________________________
     when SF::Keyboard::Up #--------------------up
     All_Audio::SFX.cursor1
     this = window
     CONTROLS::Menucontrols.arrowup (this)
     cursorposition = "up"
#_________________________________________________ 
     when SF::Keyboard::Down #-----------------down
     All_Audio::SFX.cursor1
     this = window
     CONTROLS::Menucontrols.arrowdown(this)
     cursorposition = "down"
#_________________________________________________
     when SF::Keyboard::Left #----------------left
#_________________________________________________
     when SF::Keyboard::Right #--------------right
#_________________________________________________      
     when SF::Keyboard::Enter #--------------enter
     All_Audio::SFX.select1
     this = window
     case (cursorposition)

     when "up"
     @@menu = "charselect"
     Gui::Menus.character_select(this)
        
     when "down"
     SF::Event::Closed
     window.close 
     end; end; end; end

#=================================================
# Character Select Screen Controls
#=================================================

    def Menu_Controls.char_select_controls(event, window, cursorposition, char_select_pointer_position)
    if event.is_a? SF::Event::KeyPressed
    case (event.code)
#_________________________________________________
    when SF::Keyboard::Escape #-------------escape
        SF::Event::Closed
        window.close
#_________________________________________________ 
    when SF::Keyboard::Up #---------------------Up

    #placeholder, dunno if anything will go here
#_________________________________________________
    when SF::Keyboard::Down #-----------------Down
    #placeholder, dunno if anything will go here 
#_________________________________________________
    when SF::Keyboard::Left #----------------Left
    if char_select_pointer_position > 0
    All_Audio::SFX.cursor1
    this = window
    char_select_pointer_position = char_select_pointer_position - 1
    this2 = char_select_pointer_position 
    CONTROLS::Menucontrols.charselectright(this2)
    Gui::Menus.slot_highlight(this, this2)
    end
#_________________________________________________
    when SF::Keyboard::Right #---------------Right
    if char_select_pointer_position < 8
    All_Audio::SFX.cursor1
    this = window
    char_select_pointer_position = char_select_pointer_position + 1
    this2 = char_select_pointer_position 
    CONTROLS::Menucontrols.charselectright(this)
    Gui::Menus.slot_highlight(this, this2)
    end
#_________________________________________________
    when SF::Keyboard::Enter#---------------_Enter 
    #TODO add load/new method
    end; end; end; end
#_________________________________________________
