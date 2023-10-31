require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "crsfml/system"
require "yaml"
require "crystal/system/time"
require "chipmunk"



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





