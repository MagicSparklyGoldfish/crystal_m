require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "crsfml/system"
require "yaml"
require "crystal/system/time"
require "chipmunk"

#--------------------------------------------------------------------
#                           Base
#--------------------------------------------------------------------
PLAYER_CHAR_TEXTURE_01 = SF::Texture.from_file("graphics/Char_Skin.png")
#PLAYER_CHAR.texture_rect = SF.int_rect(0, 0, 96, 128)
#PLAYER_CHAR.position = SF.vector2(750, 610)
PLAYER_CHAR = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 
#--------------------------------------------------------------------
#                          Hair Textures
#--------------------------------------------------------------------
#.......................Shounen Hair Black...........................
SHOUNEN_HAIR_TEXTURE_01 = SF::Texture.from_file("graphics/Shounen_Hair.png")
SHOUNEN_HAIR_01 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
#.......................Shounen Hair Green............................
SHOUNEN_HAIR_02 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
SHOUNEN_HAIR_02.color = SF.color(50, 255, 50) 
#.......................Shounen Hair Blue.............................
SHOUNEN_HAIR_03 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
SHOUNEN_HAIR_03.color = SF.color(50, 50, 255) 
#.......................Shounen Hair Red.............................
SHOUNEN_HAIR_04 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
SHOUNEN_HAIR_04.color = SF.color(255, 0, 0) 
#.......................Shounen Hair Yellow..........................
SHOUNEN_HAIR_05 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
SHOUNEN_HAIR_05.color = SF.color(255, 240, 80)
#.......................Shounen Hair White..........................
SHOUNEN_HAIR_06 = SF::Sprite.new(SHOUNEN_HAIR_TEXTURE_01) 
SHOUNEN_HAIR_06.color = SF.color(255, 255, 255)
#--------------------------------------------------------------------
#                          Face Textures
#--------------------------------------------------------------------
BUTTON_FACE_TEXTURE_01 = SF::Texture.from_file("graphics/Butto_Eyes.png")
BUTTON_FACE_01 = SF::Sprite.new(BUTTON_FACE_TEXTURE_01) 
#--------------------------------------------------------------------
#                          Shirt Textures
#--------------------------------------------------------------------
T_SHIRT_TEXTURE_01 = SF::Texture.from_file("graphics/T-Shirt_01.png")
T_SHIRT = SF::Sprite.new(T_SHIRT_TEXTURE_01) 
#--------------------------------------------------------------------
#                          Pants Textures
#--------------------------------------------------------------------
SHORTS_TEXTURE_01 = SF::Texture.from_file("graphics/Shorts.png")
SHORTS_01 = SF::Sprite.new(SHORTS_TEXTURE_01) 



#TO DO: Replace undefined local variables with class variables, implement this shard

module Player_character
    extend self
    
###################################@
    class Model



#func Model.Animations
# def Model.appearance(window)
#     @@Char_Model.fill_color = SF.color(150, 50, 50)
#     @@Char_Model.position = SF.vector2(625, 550)
#     this.draw(@@Char_Model)
# end
    end
###################################@
    class Stats

        #HP
        INIT_HP = 100
        @@health_to_restore : Nil
        @@health_to_remove : Nil
        @@char_hp = INIT_HP
        @@char_Max_hp = INIT_HP
#Adds level points
#func Stats.LVL_HP
    #@@char_Max_hp = @@char_Max_hp + lvlp_HP
#    @@char_hp = @@char_Max_hp
    end
#when damage is taken
#func STATS.LOSE_HP
#    @@char_hp = @@char_hp - @@health_to_remove
    
#the opposite of when damage is taken
#func STATS.GAIN_HP
    #@@char_hp = @@char_hp + @@health_to_restore
end
###################################@  
    class Movement
        Left = SF.vector2(-1, 0)
        Up = SF.vector2(0, -10)
        Right = SF.vector2(1, 0)
        Down = SF.vector2(0, 1)
#@@player_position = PLAYER_CHAR.position
#WASD movement    
#func Movement.WASD (game)
#while game = "open"
#    if event.is_a? SF::Event::KeyPressed
 #       case (event.code)
    #     when SF::Keyboard::A
    #         @@player_position = @@player_position + Left

    #     when SF::Keyboard::S
    #         #placeholder

    #     when SF::Keyboard::D
    #         @@player_position = @@player_position + Right

    #     when SF::Keyboard::W
    #         #placeholder
        
    #     when SF::Keyboard::Space
    #         @@player_position = @@player_position + Up

    #     when SF::Keyboard::F
    #         #attack
    # end
#Arrow key movement
# func Movement.Arrows (game)
# while game = "open"
#     if event.is_a? SF::Event::KeyPressed
#         case (event.code)
#         when SF::Keyboard::Left
#             @@player_position = @@player_position + Left

#         when SF::Keyboard::Down
#             #placeholder

#         when SF::Keyboard::Right
#             @@player_position = @@player_position + Right

#         when SF::Keyboard::Up
#             #placeholder
        
#         when SF::Keyboard::Space
#             @@player_position = @@player_position + Up

#         when SF::Keyboard::Ctrl
#             #attack
#     end
# end
#end
end





