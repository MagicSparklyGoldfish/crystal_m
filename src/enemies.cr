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
 Enemy_Clock_02 = SF::Clock.new

 def Regular_Enemies.set_attack_strength(attack_strength)
    Humanoids.set_attack_strength(attack_strength)
   end 
 def Regular_Enemies.display(window, map, area, player)
   case area
    when "test"
    when "doll factory"
        Humanoids.display_doll_factory(window, map, player)
  end
 end
  def Regular_Enemies.attack(attack)
    Regular_Enemies::Humanoids.attack(attack)
  end
 #HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
 #H                                                                 Humanoids                                                                              H
 #HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
  class Humanoids < Ingredients
    def_clone
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(hp : Float64, max_hp : Float64, atk_power : Float64, name : String, lvl : Int32, drop_array : Array(Ingredients), amount_killed : Int32, sprite : SF::Sprite, sfx : SF::Sound,
     id : Int32, kind : String, color : String, amount_owned : Int32, effects : Array(String), is_dead : Bool, clock : SF::Clock, atk_clock : SF::Clock, exp : Float64, health_bar : SF::RectangleShape,
     )
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
      @atk_clock = atk_clock
      @exp = exp
      @health_bar = health_bar
     end
    def hp
       @hp
     end
    def max_hp
      @max_hp
     end
    def atk_power
       @atk_power
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
    def atk_clock
        @atk_clock
     end
    def exp
        @exp
     end
    def health_bar
        @health_bar
     end
    def is_dead=(this)
        @is_dead = this
     end
    def sprite=(this)
        @sprite = this 
     end
    def clock=(this)
        @clock = this 
     end
     def atk_clock=(this)
        @atk_clock = this 
     end
    def health_bar=(this)
       @health_bar = this 
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
    Enemy_Attack_Clock = SF::Clock.new
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
        Current_Map_Humanoid_Array.map { |i|
         b = Player_Attack_Bounding_Box.global_bounds
         if b.intersects? i.sprite.global_bounds
         this = i.sprite.global_bounds
         enemy = i
         time = Enemy_Clock_01.elapsed_time
         attack2 = Player_Attack_Bounding_Box.global_bounds
        if attack2.intersects? this
        if enemy.hp > 0
        if time >= SF.seconds(0.35) && attack == true
          Crafted_Items::Weapon.play_hit_sound
          Enemy_Clock_02.restart
          damage = @@attack_strength
          Damage_Text.string = damage.to_s
          Damage_Text.position = enemy.sprite.position
          enemy.hp_subtract(damage)
          Enemy_Clock_01.restart
          if time <= SF.seconds(0.35)
            Damage_Text.position = SF.vector2(100, 20005)
          end
        end; end; end; end; }end

     def Humanoids.get_hit(player, i)
            if i.atk_clock.elapsed_time > SF.milliseconds(550) && i.is_dead == false && i.hp > 0
            i.sfx.play
            humanoid = i
            Humanoids.attack_animation(humanoid)
            damage = i.atk_power
            Player_Info::Player.take_damage(damage)
            i.atk_clock.restart
            Humanoids.attack_animation(humanoid)
            end
      end
    #-------------------------------------------------------------Initialize--------------------------------------------------------------------------------
     def Humanoids.initialize_humanoids(window, map, area)
        All_Humanoid_Enemy_Array.map { |i| i.sprite.position = SF.vector2(100, 20005)}
        Current_Map_Humanoid_Array.clear
      case area
       when "test"
       when "doll factory"
        @@broken_doll.sprite.position = SF.vector2(0, 305) 
        doll_2 = @@broken_doll.dup
        doll_2.sprite = @@broken_doll.sprite.dup
        doll_2.clock = @@broken_doll.clock.dup
        doll_2.health_bar = Enemy_Health_Bar.dup
        doll_2.sprite.position = SF.vector2(0, 705) 
        doll_3 = @@broken_doll.dup
        doll_3.sprite = @@broken_doll.sprite.dup
        doll_3.clock = @@broken_doll.clock.dup
        doll_3.health_bar = Enemy_Health_Bar.dup
        doll_3.sprite.position = SF.vector2(-500, 705) 
        Current_Map_Humanoid_Array.push(@@broken_doll, doll_2, doll_3)
       end
     end
    #--------------------------------------------------------------Display----------------------------------------------------------------------------------
     def Humanoids.display_doll_factory(window, map, player)
        case map
        when "factory_map_01"
            Enemy_Blocking_Wall_Array.map { |i| window.draw(i)}
            Enemy_Blocking_Wall_01.position = SF.vector2(100, 205)
            Current_Map_Humanoid_Array.map { |i| 
                if i.hp > 0 && player.intersects? i.sprite.global_bounds  
                Humanoids.get_hit(player, i)
                else if i.hp > 0
                humanoid = i
                Humanoids.wander(humanoid)
                else if i.is_dead == false
                humanoid = i
                Humanoids.death_animation(humanoid)
                else
                humanoid = i
                Humanoids.respawn(humanoid)
                end; end; end
                Name_Text.string = i.name
                Name_Text.position = i.sprite.position + SF.vector2(-50, 100)
                i.health_bar.position = i.sprite.position + SF.vector2(0, 125)
            if i.hp > 0
            x = i.hp / 4
            else
            x = 0
            humanoid = i
            end
            i.health_bar.size = SF.vector2(x, 5)
            i.health_bar.origin = SF.vector2(x / 2, 0)
            window.draw(i.sprite); window.draw(i.health_bar)
            window.draw(Damage_Text); window.draw(Name_Text)
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
    #-------------------------------------------------------------Animation---------------------------------------------------------------------------------
      def Humanoids.walk_animation(humanoid)
        if humanoid.sprite.texture_rect == SF.int_rect(0, 0, 75, 100) && humanoid.clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(0, 100, 75, 100)
            humanoid.clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(0, 100, 75, 100) && humanoid.clock.elapsed_time >= SF.milliseconds(150)
            Damage_Text.string = ""
            humanoid.sprite.texture_rect = SF.int_rect(75, 100, 75, 100)
            humanoid.clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(75, 100, 75, 100) && humanoid.clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(150, 100, 75, 100)
            humanoid.clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(150, 100, 75, 100) && humanoid.clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(225, 100, 75, 100)
            humanoid.clock.restart
        end
        if humanoid.sprite.texture_rect == SF.int_rect(225, 100, 75, 100) && humanoid.clock.elapsed_time >= SF.milliseconds(150)
            humanoid.sprite.texture_rect = SF.int_rect(0, 100, 75, 100)
            humanoid.clock.restart
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
            exp = humanoid.exp
            Name_Text.string = ""
            Damage_Text.string = ""
            Damage_Text.position = SF.vector2(100, 20005)
            Name_Text.position = SF.vector2(100, 20005)
            Player_Info::Player.gain_exp(exp)
            humanoid.clock.restart
        end
      end
      def Humanoids.attack_animation(humanoid)
        if humanoid.sprite.texture_rect != SF.int_rect(0, 200, 75, 100) && humanoid.sprite.texture_rect != SF.int_rect(75, 200, 75, 100) && 
          humanoid.sprite.texture_rect != SF.int_rect(150, 200, 75, 100) && humanoid.sprite.texture_rect != SF.int_rect(225, 200, 75, 100)
          humanoid.sprite.texture_rect = SF.int_rect(0, 200, 75, 100)
          humanoid.clock.restart
          Humanoids.attack_animation(humanoid)
         end
        if humanoid.sprite.texture_rect == SF.int_rect(0, 200, 75, 100) && humanoid.clock.elapsed_time >= SF.microseconds(1)
           humanoid.sprite.texture_rect = SF.int_rect(75, 200, 75, 100)
           humanoid.clock.restart 
           Humanoids.attack_animation(humanoid)
        end
        if humanoid.sprite.texture_rect == SF.int_rect(75, 200, 75, 100) && humanoid.clock.elapsed_time >= SF.microseconds(1)
         humanoid.sprite.texture_rect = SF.int_rect(150, 200, 75, 100)
         humanoid.clock.restart 
         Humanoids.attack_animation(humanoid)
        end
        if humanoid.sprite.texture_rect == SF.int_rect(150, 200, 75, 100) && humanoid.clock.elapsed_time >= SF.microseconds(1)
           humanoid.sprite.texture_rect = SF.int_rect(225, 200, 75, 100)
           humanoid.clock.restart 
        end
        if humanoid.sprite.texture_rect == SF.int_rect(225, 200, 75, 100) && humanoid.clock.elapsed_time >= SF.microseconds(1)
            humanoid.sprite.texture_rect = SF.int_rect(0, 200, 75, 100)
            humanoid.clock.restart 
         end
      end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @@broken_doll = Humanoids.new(50.1, 50.1, 1.1, "Broken Doll", 1, [@@pineapples], 0, Broken_Doll, WEAPSOUND_06, 1, "humanoid", "N/A", 0, ["N/A"],
    false, Enemy_Death_Clock.dup, Enemy_Attack_Clock.dup, 3, Enemy_Health_Bar.dup)
    All_Humanoid_Enemy_Array.push(@@broken_doll)
   #________________________________________________________________________________________________________________________________________________________
 end
end