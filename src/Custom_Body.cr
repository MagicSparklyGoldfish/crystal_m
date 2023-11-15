require "../src/crystal_meth.cr"
require "../src/Textures.cr"
require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Items.cr"
require "../src/Custom_Body.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/Fonts.cr"
require "../src/level_test.cr"
require "../src/Player_Character.cr"
require "x11"
require "crystal/system/time"
require "chipmunk/chipmunk_crsfml"
require "file_utils"

#HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
#H                                                                     Hair                                                                                   H
#HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH

 class Hair
  # =========================================================================================================================================================
  #|                                                                 Initialize                                                                              |
  # =========================================================================================================================================================
    def initialize(length : String, char_sprite : SF::Sprite, display_sprite : SF::Sprite, name : String, color : String, is_updo : Bool, number : Int32)
        @length = length
        @char_sprite = char_sprite
        @display_sprite = display_sprite
        @name = name
        @color = color
        @number = number 
     end
    def length
        @length
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
    def is_updo
        @is_updo
     end
    def number
        @number
     end
  # =========================================================================================================================================================
  #|                                                                  Variables                                                                              |
  # =========================================================================================================================================================
    @@offered_hair = [] of Hair; @@all_hair : Array(Hair); @@all_hair = [@@shounen_hair_white, @@shounen_hair_green, @@shounen_hair_blue, @@shounen_hair_red,
    @@shounen_hair_yellow, @@shounen_hair_purple, @@shounen_hair_orange, @@shounen_hair_black, @@shounen_hair_brown, @@shounen_hair_pink]
  # =========================================================================================================================================================
  #|                                                                   Methods                                                                               |
  # =========================================================================================================================================================
    def Hair.display_offered_hair(this, window) "x = + 150 per entry"
        case this
      when "test"
        @@offered_hair = [@@shounen_hair_white, @@shounen_hair_green, @@shounen_hair_blue, @@shounen_hair_red, @@shounen_hair_yellow, @@shounen_hair_purple, 
        @@shounen_hair_orange, @@shounen_hair_black, @@shounen_hair_brown, @@shounen_hair_pink]
       end
      size = @@offered_hair.size - 1
       if size >= 0
         @@offered_hair[0].display_sprite.scale = SF.vector2(2.5, 2.5)
         @@offered_hair[0].display_sprite.position = SF.vector2(585, 390)
         window.draw @@offered_hair[0].display_sprite
        end
       if size >= 1
        @@offered_hair[1].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[1].display_sprite.position = SF.vector2(735, 390)
        window.draw @@offered_hair[1].display_sprite
       end
      if size >= 2
        @@offered_hair[2].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[2].display_sprite.position = SF.vector2(885, 390)
        window.draw @@offered_hair[2].display_sprite
       end
      if size >= 3
        @@offered_hair[3].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[3].display_sprite.position = SF.vector2(1035, 390)
        window.draw @@offered_hair[3].display_sprite
       end
      if size >= 4
        @@offered_hair[4].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[4].display_sprite.position = SF.vector2(1180, 390)
        window.draw @@offered_hair[4].display_sprite
       end
       if size >= 5
        @@offered_hair[5].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[5].display_sprite.position = SF.vector2(585, 565)
        window.draw @@offered_hair[5].display_sprite
       end
       if size >= 6
        @@offered_hair[6].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[6].display_sprite.position = SF.vector2(735, 565)
        window.draw @@offered_hair[6].display_sprite
       end
       if size >= 7
        @@offered_hair[7].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[7].display_sprite.position = SF.vector2(885, 565)
        window.draw @@offered_hair[7].display_sprite
       end
       if size >= 8
        @@offered_hair[8].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[8].display_sprite.position = SF.vector2(1035, 565)
        window.draw @@offered_hair[8].display_sprite
       end
       if size >= 9
        @@offered_hair[9].display_sprite.scale = SF.vector2(2.5, 2.5)
        @@offered_hair[9].display_sprite.position = SF.vector2(1180, 565)
        window.draw @@offered_hair[9].display_sprite
       end
     end
    def Hair.cut_hair(window, selected_hair)
        hair_slot = selected_hair
     end 
  # =========================================================================================================================================================
  #|                                                                   Objects                                                                               |
  # =========================================================================================================================================================
    @@shounen_hair_white = Hair.new("medium", SHOUNEN_HAIR_01, SHOUNEN_DISPLAY_HAIR_01, "white shounen hair", "white", false, 0)
    @@shounen_hair_green = Hair.new("medium", SHOUNEN_HAIR_02, SHOUNEN_DISPLAY_HAIR_02, "green shounen hair", "green", false, 1)
    @@shounen_hair_blue = Hair.new("medium", SHOUNEN_HAIR_03, SHOUNEN_DISPLAY_HAIR_03, "blue shounen hair", "blue", false, 2)
    @@shounen_hair_red = Hair.new("medium", SHOUNEN_HAIR_04, SHOUNEN_DISPLAY_HAIR_04, "red shounen hair", "red", false, 3)
    @@shounen_hair_yellow = Hair.new("medium", SHOUNEN_HAIR_05, SHOUNEN_DISPLAY_HAIR_05, "blonde shounen hair", "yellow", false, 4)
    @@shounen_hair_purple = Hair.new("medium", SHOUNEN_HAIR_06, SHOUNEN_DISPLAY_HAIR_06, "purple shounen hair", "purple", false, 5)
    @@shounen_hair_orange = Hair.new("medium", SHOUNEN_HAIR_07, SHOUNEN_DISPLAY_HAIR_07, "orange shounen hair", "orange", false, 6)   
    @@shounen_hair_black = Hair.new("medium", SHOUNEN_HAIR_08, SHOUNEN_DISPLAY_HAIR_08, "black shounen hair", "black", false, 7)   
    @@shounen_hair_brown = Hair.new("medium", SHOUNEN_HAIR_09, SHOUNEN_DISPLAY_HAIR_09, "brown shounen hair", "brown", false, 8)  
    @@shounen_hair_pink = Hair.new("medium", SHOUNEN_HAIR_10, SHOUNEN_DISPLAY_HAIR_10, "pink shounen hair", "pink", false, 9)  
 end