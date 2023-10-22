PLAYER_CHAR_TEXTURE_01 = SF::Texture.from_file("graphics/Cursor.png")
PLAYER_CHAR.texture_rect = SF.int_rect(0, 0, 64, 32)
PLAYER_CHAR.position = SF.vector2(750, 610)
PLAYER_CHAR = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01) 

#TO DO: Replce undefined local variables with class variables, implement this shard

module Player_character
###################################@
    class Model
func Model.Animations
    end
###################################@
    class Stats

        #HP
        INIT_HP = 100
        @@health_to_restore
        @@health_to_remove
        @@char_hp = INIT_HP
        @@char_Max_hp = INIT_HP
#Adds level points
func Stats.LVL_HP
    @@char_Max_hp = @@char_Max_hp + lvlp_HP
    @@char_hp = @@char_Max_hp
    end
#when damage is taken
func STATS.LOSE_HP
    @@char_hp = @@char_hp - @@health_to_remove
    end
#the opposite of when damage is taken
func STATS.GAIN_HP
    @@char_hp = @@char_hp + @@health_to_restore
    
###################################@  
    class Movement
        Left = SF.vector2(-1, 0)
        Up = SF.vector2(0, -10)
        Right = SF.vector2(1, 0)
        Down = SF.vector2(0, 1)
@@player_position = PLAYER_CHAR.position
#WASD movement    
func Movement.WASD (game)
while game = "open"
    if event.is_a? SF::Event::KeyPressed
        case (event.code)
        when SF::Keyboard::A
            @@player_position = @@player_position + Left

        when SF::Keyboard::S
            #placeholder

        when SF::Keyboard::D
            @@player_position = @@player_position + Right

        when SF::Keyboard::W
            #placeholder
        
        when SF::Keyboard::Space
            @@player_position = @@player_position + Up

        when SF::Keyboard::F
            #attack
    end
#Arrow key movement
func Movement.Arrows (game)
while game = "open"
    if event.is_a? SF::Event::KeyPressed
        case (event.code)
        when SF::Keyboard::Left
            @@player_position = @@player_position + Left

        when SF::Keyboard::Down
            #placeholder

        when SF::Keyboard::Right
            @@player_position = @@player_position + Right

        when SF::Keyboard::Up
            #placeholder
        
        when SF::Keyboard::Space
            @@player_position = @@player_position + Up

        when SF::Keyboard::Ctrl
            #attack
    end
end
end
end
end
end



