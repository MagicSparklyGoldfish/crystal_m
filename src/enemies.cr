require "../src/Textures.cr"
require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Items.cr"
require "../src/enemies.cr"
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

module Test_Enemies
include Use
 class Test_Humanoids < Ingredients
  def initialize(hp : Float64, max_hp : Float64, atk_power : Float64, name : String, lvl : Int32, drop_array : Array(Ingredients), amount_killed : Int32, sprite : SF::Sprite, sfx : SF::Sound,
   id : Int32, kind : String, color : String, amount_owned : Int32, effects : Array(String))
    @hp = hp
    @max_hp = max_hp
    @atk_power = atk_power
    @name = name
    @lvl = lvl
    @drop_array = drop_array
    @amount_killed = amount_killed
    @sprite = sprite
    @sfx = sfx 
   #------------drop item properties
    @id = id
    @kind = kind
    @color = color
    @amount_owned = amount_owned
    @effects = effects
   end
  def hp
     @hp
   end
  def max_hp
    @max_hp
   end
  def atk_power
     @power
   end
  def name
     @name
   end
  def lvl
     @lvl
   end
  def drop_array
     @drop_array
   end
  def amount_killed
     @amount_killed
   end
  def sprite
     @sprite
   end
  def sfx
     @sfx
   end

 @@test_enemy_model : SF::RenderTexture 
 @@test_enemy_model = SF::RenderTexture.new(672, 512)
 @@test_enemy_rendered_model = SF::Sprite.new
 @@attack_strength : Float64; @@attack_strength = 1
 Enemy_Clock_01 = SF::Clock.new
 def hp_subtract(damage)
    @hp -= damage
   end
 def Test_Humanoids.set_attack_strength(attack_strength)
    @@attack_strength = attack_strength
   end 

 def Test_Humanoids.draw_test_enemy_sprite
    @@test_enemy_model.clear(SF::Color::Transparent)
    @@test_enemy_model.draw(SKIN_ARRAY[1])
    @@test_enemy_model.draw(SHOES_ARRAY[2])
    @@test_enemy_model.draw(FACE_ARRAY[6])
    @@test_enemy_model.draw(HAIR_ARRAY[5])
    @@test_enemy_model.draw(PANTS_ARRAY[4])
    @@test_enemy_model.draw(SHIRT_ARRAY[1])
    @@test_enemy_model.draw(GLOVE_ARRAY[2])
    @@test_enemy_model.create(672, 512, false)
    @@test_enemy_model.display
    @@test_enemy_rendered_model.texture = @@test_enemy_model.texture
    @@test_enemy_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
    @@test_enemy_rendered_model.scale = SF.vector2(1.2, 1.2)
  end
  def Test_Humanoids.draw_test_enemy(window)
    Test_Humanoids.draw_test_enemy_sprite
    @@test_humanoid.sprite.position = SF.vector2(-560, 652)
    window.draw(@@test_humanoid.sprite)
  end
  def Test_Humanoids.attack(attack)
    b = Player_Attack_Bounding_Box.global_bounds
    if b.intersects? @@test_humanoid.sprite.global_bounds
    this = @@test_humanoid.sprite.global_bounds
    enemy = @@test_humanoid
    time = Enemy_Clock_01.elapsed_time
    attack2 = Player_Attack_Bounding_Box.global_bounds
   if attack2.intersects? this
   if enemy.hp > 0
   if time >= SF.seconds(0.35) && attack == true
     Crafted_Items::Weapon.play_hit_sound
     enemy.hp_subtract(@@attack_strength)
    # @@current_plant_attacked = plant
    # @@is_plant_attacked = true
     #Plant_Animation_Clock_01.restart
     Enemy_Clock_01.restart
   end; end; end
  end; end
  def Test_Humanoids.logic
   # Test_Humanoids.attack(attack)
  end

 @@test_humanoid = Test_Humanoids.new(500, 500, 10, "Test Enemy", 1, [@@pineapples], 0, @@test_enemy_rendered_model, WEAPSOUND_06, 1, "humanoid", "na", 0, ["na"])
 end
end

module Regular_Enemies
include Use
  class Humanoids < Ingredients
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(hp : Float64, max_hp : Float64, atk_power : Float64, name : String, lvl : Int32, drop_array : Array(Ingredients), amount_killed : Int32, sprite : SF::Sprite, sfx : SF::Sound,
     id : Int32, kind : String, color : String, amount_owned : Int32, effects : Array(String))
      @hp = hp
      @max_hp = max_hp
      @atk_power = atk_power
      @name = name
      @lvl = lvl
      @drop_array = drop_array
      @amount_killed = amount_killed
      @sprite = sprite
      @sfx = sfx 
     #------------drop item properties
      @id = id
      @kind = kind
      @color = color
      @amount_owned = amount_owned
      @effects = effects
     end
    def hp
       @hp
     end
    def max_hp
      @max_hp
     end
    def atk_power
       @power
     end
    def name
       @name
     end
    def lvl
       @lvl
     end
    def drop_array
       @drop_array
     end
    def amount_killed
       @amount_killed
     end
    def sprite
       @sprite
     end
    def sfx
      @sfx
     end
   #________________________________________________________________________________________________________________________________________________________
   #********************************************************************************************************************************************************
   #*                                                              Variables                                                                               *
   #********************************************************************************************************************************************************
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    #---------------------------------------------------------------Combat----------------------------------------------------------------------------------
     def Humanoids.attack(attack)
         b = Player_Attack_Bounding_Box.global_bounds
         if b.intersects? @@test_humanoid.sprite.global_bounds
         this = @@test_humanoid.sprite.global_bounds
         enemy = @@test_humanoid
         time = Enemy_Clock_01.elapsed_time
         attack2 = Player_Attack_Bounding_Box.global_bounds
        if attack2.intersects? this
        if enemy.hp > 0
        if time >= SF.seconds(0.35) && attack == true
          Crafted_Items::Weapon.play_hit_sound
          enemy.hp_subtract(@@attack_strength)
          Enemy_Clock_01.restart
        end; end; end; end; end
    #--------------------------------------------------------------Display----------------------------------------------------------------------------------
     def Humanoids.display(window, map)
        case map
        when "factory_map_01"
            window.draw(@@broken_doll)
        end
      end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @@broken_doll = Humanoids.new(500.1, 500.1, 10.1, "Broken Doll", 1, [@@pineapples], 0, Broken_Doll, WEAPSOUND_06, 1, "humanoid", "N/A", 0, ["N/A"])
   #________________________________________________________________________________________________________________________________________________________
 end
end