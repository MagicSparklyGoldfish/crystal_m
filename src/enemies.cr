require "../src/crystal_meth.cr"
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
 @@test_enemy_model : SF::RenderTexture 
 @@test_enemy_model = SF::RenderTexture.new(672, 512)
 @@test_enemy_rendered_model = SF::Sprite.new
 @@attack_strength : Float64; @@attack_strength = 1
 Enemy_Clock_01 = SF::Clock.new

 def Regular_Enemies.set_attack_strength(attack_strength)
    Humanoids.set_attack_strength(attack_strength)
   end 
 def Regular_Enemies.display(window, map, area)
   case area
    when "test"
    when "doll factory"
        Humanoids.display_doll_factory(window, map)
  end
 end
  def Regular_Enemies.attack(attack)
    Regular_Enemies::Humanoids.attack(attack)
  end
  class Humanoids < Ingredients
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(hp : Float64, max_hp : Float64, atk_power : Float64, name : String, lvl : Int32, drop_array : Array(Ingredients), amount_killed : Int32, sprite : SF::Sprite, sfx : SF::Sound,
     id : Int32, kind : String, color : String, amount_owned : Int32, effects : Array(String), is_dead : Bool, clock : SF::Clock, exp : Float64)
      @hp = hp
      @max_hp = max_hp
      @atk_power = atk_power
      @name = name
      @lvl = lvl
      @drop_array = drop_array
      @amount_killed = amount_killed
      @sprite = sprite
      @sfx = sfx 
      @id = id
      @kind = kind
      @color = color
      @amount_owned = amount_owned
      @effects = effects
      @is_dead = is_dead
      @clock = clock
      @exp = exp
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
    def amount_owned #direction
      @amount_owned
     end
    def is_dead
        @is_dead
    end
    def clock
        @clock
    end
    def exp
        @exp
    end
    def is_dead=(this)
        @is_dead = this
    end
   #________________________________________________________________________________________________________________________________________________________
   #********************************************************************************************************************************************************
   #*                                                              Variables                                                                               *
   #********************************************************************************************************************************************************
    @@attack_strength : Float64; @@attack_strength = 1.0
    @@exp : Float64; @@exp = 0.0
    Enemy_Blocking_Wall_Array = [Enemy_Blocking_Wall_01]
    All_Humanoid_Enemy_Array = [] of Humanoids 
    Current_Map_Humanoid_Array = [] of Humanoids
    Enemy_Walk_Cycle_Clock = SF::Clock.new; Enemy_Death_Animation_Clock = SF::Clock.new; Enemy_Death_Clock = SF::Clock.new
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    #---------------------------------------------------------------Combat----------------------------------------------------------------------------------
     def hp_subtract(damage)
        @hp -= damage
       end
     def revive
        @hp = @max_hp
       end
     def Humanoids.set_attack_strength(attack_strength)
       @@attack_strength = attack_strength
      end
     def Humanoids.attack(attack)
         b = Player_Attack_Bounding_Box.global_bounds
         if b.intersects? @@broken_doll.sprite.global_bounds
         this = @@broken_doll.sprite.global_bounds
         enemy = @@broken_doll
         time = Enemy_Clock_01.elapsed_time
         attack2 = Player_Attack_Bounding_Box.global_bounds
        if attack2.intersects? this
        if enemy.hp > 0
        if time >= SF.seconds(0.35) && attack == true
          Crafted_Items::Weapon.play_hit_sound
          damage = @@attack_strength
          enemy.hp_subtract(damage)
          Enemy_Clock_01.restart
        end; end; end; end; end
    #-------------------------------------------------------------Initialize--------------------------------------------------------------------------------
     def Humanoids.initialize_humanoids(window, map, area)
        All_Humanoid_Enemy_Array.map { |i| i.sprite.position = SF.vector2(100, 20005)}
        Current_Map_Humanoid_Array.clear
      case area
       when "test"
       when "doll factory"
        @@broken_doll.sprite.position = SF.vector2(0, 305) 
        Current_Map_Humanoid_Array.push(@@broken_doll)
        puts @@broken_doll.sprite.position
       end
     end
    #--------------------------------------------------------------Display----------------------------------------------------------------------------------
     def Humanoids.display_doll_factory(window, map)
        case map
        when "factory_map_01"
            Enemy_Blocking_Wall_Array.map { |i| window.draw(i)}
            Enemy_Blocking_Wall_01.position = SF.vector2(100, 205)
            Current_Map_Humanoid_Array.map { |i| 
                if i.hp > 0
                humanoid = i
                Humanoids.wander(humanoid)
                else if i.is_dead == false
                humanoid = i
                Humanoids.death_animation(humanoid)
                else
                humanoid = i
                Humanoids.respawn(humanoid)
                end; end
            Enemy_Health_Bar.position = i.sprite.position + SF.vector2(-50, 100)
            if i.hp > 0
            x = i.hp / 4
            else
            x = 0
            humanoid = i
            end
            Enemy_Health_Bar.size = SF.vector2(x, 5)
            window.draw(i.sprite); window.draw(Enemy_Health_Bar)
           }end
      end
    #---------------------------------------------------------------Logic-----------------------------------------------------------------------------------
     def Humanoids.wander(humanoid)
        if humanoid.amount_owned > 2000 || humanoid.amount_owned < -2000
            humanoid.amount_owned = 0
        end
      Enemy_Blocking_Wall_Array.map { |i| if i.global_bounds.intersects? humanoid.sprite.global_bounds
      if humanoid.sprite.position.x < i.position.x
        humanoid.sprite.position -= SF.vector2(1, 0)
        humanoid.amount_owned = 0
       end
      else 
       movement = rand(1..10) 
       movement += humanoid.amount_owned
       if movement < 5
        Humanoids.walk_animation(humanoid)
        humanoid.sprite.position += SF.vector2(0.025, 0)
        humanoid.sprite.scale = SF.vector2(1.0, 1.0)
        humanoid.amount_owned -= 1
       else if movement > 6
        Humanoids.walk_animation(humanoid)
        humanoid.sprite.position -= SF.vector2(0.025, 0)
        humanoid.sprite.scale = SF.vector2(-1.0, 1.0)
        humanoid.amount_owned += 1
       else
        humanoid.sprite.texture_rect = SF.int_rect(0, 0, 75, 100)
       end; end
     end}
      end
      def Humanoids.respawn(humanoid)
        Current_Map_Humanoid_Array.map { |i| if i.is_dead == true && i.clock.elapsed_time >= SF.seconds(5) 
        i.revive; i.is_dead = false
      end}
      end
      def Humanoids.walk_animation(humanoid)
        if humanoid.sprite.texture_rect == SF.int_rect(0, 0, 75, 100) && Enemy_Walk_Cycle_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(0, 100, 75, 100)
            Enemy_Walk_Cycle_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(0, 100, 75, 100) && Enemy_Walk_Cycle_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(75, 100, 75, 100)
            Enemy_Walk_Cycle_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(75, 100, 75, 100) && Enemy_Walk_Cycle_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(150, 100, 75, 100)
            Enemy_Walk_Cycle_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(150, 100, 75, 100) && Enemy_Walk_Cycle_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(225, 100, 75, 100)
            Enemy_Walk_Cycle_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(225, 100, 75, 100) && Enemy_Walk_Cycle_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(0, 100, 75, 100)
            Enemy_Walk_Cycle_Clock.restart
        end
      end
      def Humanoids.death_animation(humanoid)
        if humanoid.sprite.texture_rect != SF.int_rect(0, 300, 75, 100) && humanoid.sprite.texture_rect != SF.int_rect(75, 300, 75, 100) && 
        humanoid.sprite.texture_rect != SF.int_rect(150, 300, 75, 100) && humanoid.sprite.texture_rect != SF.int_rect(225, 300, 75, 100)
        humanoid.sprite.texture_rect = SF.int_rect(0, 300, 75, 100)
        Enemy_Death_Animation_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(0, 300, 75, 100) && Enemy_Death_Animation_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(75, 300, 75, 100)
            Enemy_Death_Animation_Clock.restart        
        end
        if humanoid.sprite.texture_rect == SF.int_rect(75, 300, 75, 100) && Enemy_Death_Animation_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(150, 300, 75, 100)
            Enemy_Death_Animation_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(150, 300, 75, 100) && Enemy_Death_Animation_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(225, 300, 75, 100)
            Enemy_Death_Animation_Clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(225, 300, 75, 100) && Enemy_Death_Animation_Clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(300, 300, 75, 100)
            humanoid.is_dead = true
            @@exp += humanoid.exp
            humanoid.clock.restart
        end
      end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @@broken_doll = Humanoids.new(50.1, 50.1, 10.1, "Broken Doll", 1, [@@pineapples], 0, Broken_Doll, WEAPSOUND_06, 1, "humanoid", "N/A", 0, ["N/A"],
    false, Enemy_Death_Clock.dup, 10)
    All_Humanoid_Enemy_Array.push(@@broken_doll)
   #________________________________________________________________________________________________________________________________________________________
 end
end