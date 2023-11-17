# require "../src/crystal_meth.cr"
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

module Equipment
   extend self
 # ____________________________________________________________________________________________________________________________________
 #|                                                     Equipment Variables                                                            |
 #|____________________________________________________________________________________________________________________________________|
   @@nil_stick = Stick.new("", -1, false, false, false, 1.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Weapon_Rectangle_01, false)
   @@current_weapon : Int32
   @@current_weapon = -1
   @@current_weapon_object : Stick 
   @@current_weapon_object = @@nil_stick
   property = @@current_weapon
   property = @@current_weapon_object
   WEAPON_OBJECT_ARRAY = [] of Stick
   WEAPON_INVENTORY_ARRAY = [] of Stick
 #======================================================================================================================================
 # ____________________________________________________________________________________________________________________________________
 #|                                                     Equipment Methods                                                              |
 #|____________________________________________________________________________________________________________________________________|
   def Equipment.equip_weapon(this)
    size = WEAPON_INVENTORY_ARRAY.size - 1
     if this > size
       All_Audio::SFX.light_bonk
      else 
     if @@current_weapon_object != Nil
       WEAPON_INVENTORY_ARRAY.push(@@current_weapon_object)
      end
     if size != 0
       @@current_weapon = WEAPON_INVENTORY_ARRAY[this].number
       @@current_weapon_object = WEAPON_INVENTORY_ARRAY[this]
       WEAPON_INVENTORY_ARRAY.delete(@@current_weapon_object)
      end
      end
    end
   def Equipment.play_swing_sound
    @@current_weapon_object.swing_sound.play
   end
   def Equipment.play_hit_sound
    @@current_weapon_object.hit_sound.play
   end
   def Equipment.stop_swing_sound
    @@current_weapon_object.swing_sound.stop
    @@current_weapon_object.hit_sound.play
   end
 #======================================================================================================================================
 class Stick
 def initialize(name : String, number : Int32, can_swing : Bool, can_stab : Bool, can_shoot : Bool, atk_power : Float64, elements : Array(String), special_effects : Array(String), swing_sound : SF::Sound, hit_sound : SF::Sound, rectangle : SF::RectangleShape, is_equipped : Bool)
    @name = name
    @number = number
    @can_swing = can_swing
    @can_stab = can_stab
    @can_shoot = can_shoot
    @atk_power = atk_power
    @elements = elements
    @special_effects = special_effects
    @swing_sound = swing_sound
    @hit_sound = hit_sound
    @rectangle = rectangle
    @is_equipped = is_equipped
  end
 def name
   @name
  end
 def number
   @number
  end
 def can_swing
    @can_swing
  end
 def can_stab
    @can_stab
  end
 def can_stab
    @can_stab
  end
 def can_shoot
    @can_shoot
  end
 def atk_power
    @atk_power
  end
 def elements
    @elements
  end
 def special_effects
    @special_effects
  end
 def swing_sound
    @swing_sound
  end
 def hit_sound
  @hit_sound
  end
 def rectangle
   @rectangle
  end
 def is_equipped
    @is_equipped
  end
 def Stick.test(window, page)
        window.draw(Weapon_Rectangle_01)
    end
    WEAPON_OBJECT_ARRAY.push(@@stick01)
    WEAPON_INVENTORY_ARRAY.push(@@nil_stick)
    WEAPON_INVENTORY_ARRAY.push(@@stick01)
 @@nil_stick = Stick.new("", -1, false, false, false, 1.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Weapon_Rectangle_01, false)
 @@stick01 = Stick.new("Stick", 0, true, false, false, 1.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Weapon_Rectangle_01, false)
 end
end

module Harvestables
  class Ore
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@ore_animation_frame = 0; @@ore_reset = 0
   #________________________________________________________________________________________________________________________________________________________
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, id : Int32, color : String, hardness : Int32, hp : Int32, element : String, effect : String, sell_price : Int32, sprite : SF::Sprite, is_broke : Bool)
      @name = name
      @id = id
      @color = color
      @hardness = hardness
      @hp = hp
      @element = element
      @effect = effect
      @sell_price = sell_price
      @sprite = sprite
      @is_broke = is_broke
     end
    #..........................................................Basic Initializers...........................................................................
     def name
       @name
      end
     def id
       @id
      end
     def color
       @color
      end
     def hardness
       @hardness
      end
     def hp
       @hp
      end
     def element
       @element
      end
     def effect
       @effect
      end
     def sell_price
       @sell_price
      end
     def sprite
       @sprite
      end
     def is_broke
       @is_broke
      end
    #_______________________________________________________________________________________________________________________________________________________
    #..........................................................HP Class Functions...........................................................................
     def hp_subtract(damage)
       @hp -= damage
      end
      def hp_add(healing)
       @hp += healing
      end
     def hp_set(this)
       @hp = this
      end
    #_______________________________________________________________________________________________________________________________________________________
     #.......................................................Animation Class Functions.......................................................................
        def sprite_change_square(a, b, x, y)
          @sprite.texture_rect = SF.int_rect(a, b, x, y)
         end
        def is_broke_toggle
          if @is_broke == true
            @is_broke = false
         else if @is_broke == false
          @is_broke = true
          end
         end; end
       #,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Test Map,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
       def check_collision_test(attack)
        player_attack = Player_Attack_Bounding_Box.global_bounds

       end
    #_______________________________________________________________________________________________________________________________________________________
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    Ore_Clock_01 = SF::Clock.new; Ore_Clock_Break = SF::Clock.new
    def Ore.harvest(attack)
      @@bloodstone_01.check_collision_test(attack)
      time = Ore_Clock_01.elapsed_time
      attack2 = Player_Attack_Bounding_Box.global_bounds
      ore = @@bloodstone_01.sprite.global_bounds
     if attack2.intersects? ore
     if @@bloodstone_01.hp > 0
     if time >= SF.seconds(0.35) && attack == true
       Equipment.play_hit_sound
       @@bloodstone_01.hp_subtract(10)
     #  puts @@bloodstone_01.hp
       Ore.animation_harvest
       Ore_Clock_01.restart
      end; end; end
     end
    #..............................................................Animations...............................................................................
     def Ore.animation_harvest
      Ore_Clock_Break.restart
       if @@ore_animation_frame == 1 && @@bloodstone_01.hp >= 200
       a = 100; b = 0; x = 100; y = 100
       @@bloodstone_01.sprite_change_square(a, b, x, y)
       end
       if @@ore_animation_frame == 2
         a = 200; b = 0; x = 100; y = 100
         @@bloodstone_01.sprite_change_square(a, b, x, y)
       end
       if @@ore_animation_frame == 3
         a = 300; b = 0; x = 100; y = 100
         @@bloodstone_01.sprite_change_square(a, b, x, y)
       end
       if @@ore_animation_frame == 4
         a = 400; b = 0; x = 100; y = 100
         @@bloodstone_01.sprite_change_square(a, b, x, y)
         @@ore_animation_frame = 0
       end
       @@ore_animation_frame += 1
       if @@bloodstone_01.hp < 200 && @@bloodstone_01.hp > 0
         case @@ore_animation_frame 
         when 1
          a = 100; b = 100; x = 100; y = 100
          @@bloodstone_01.sprite_change_square(a, b, x, y)
         when 2
          a = 200; b = 100; x = 100; y = 100
          @@bloodstone_01.sprite_change_square(a, b, x, y)
         when 3
           a = 300; b = 100; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
         when 4
           a = 400; b = 100; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
        if @@bloodstone_01.hp >= 0

         end; end; end; end
      def Ore.break
        if @@bloodstone_01.hp >= 0 && @@bloodstone_01.is_broke == false
        if @@ore_reset == 0
          Ore_Clock_Break.restart
          @@ore_reset = 1
        end; end
           time = Ore_Clock_Break.elapsed_time
          if time >= SF.seconds(0.25) && time < SF.seconds(0.5)
           a = 0; b = 200; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(0.5) && time < SF.seconds(0.75)
           a = 100; b = 200; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(0.75) && time < SF.seconds(1)
           a = 200; b = 200; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(1) && time < SF.seconds(1.25)
           a = 300; b = 200; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(1.25) && time < SF.seconds(1.5)
            a = 400; b = 200; x = 100; y = 100
            @@bloodstone_01.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(1.5) && time < SF.seconds(1.75)
           @@bloodstone_01.is_broke_toggle   
     else if time >= SF.seconds(30) 
      Ore_Clock_Break.restart
           this = 500
           @@bloodstone_01.hp_set(this)
           a = 0; b = 0; x = 100; y = 100
           @@bloodstone_01.sprite_change_square(a, b, x, y)
           this = @@bloodstone_01.is_broke  
           @@bloodstone_01.is_broke_toggle 
           Ore_Clock_Break.restart
       end; end; end; end; end; end; end; end
    #-------------------------------------------------------------------------------------------------------------------------------------------------     
    def Ore.draw_ores(window)
      if @@bloodstone_01.hp <= 0 #&& @@bloodstone_01.is_broke == false
        Ore.break
      end
      Testing_Text.string = @@bloodstone_01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
      window.draw(Testing_Text)
      window.draw(@@bloodstone_01.sprite)
    end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #..............................................................Bloodstone...............................................................................
     @@bloodstone_01 = Ore.new("Bloodstone", 1, "red", 7, 500, "life", "hp+", 70, Bloodstone_Ore, false) 
     @@bloodstone_02 = Ore.new("Bloodstone", 2, "red", 7, 500, "life", "hp+", 70, Bloodstone_Ore, false)
     @@bloodstone_03 = Ore.new("Bloodstone", 3, "red", 7, 500, "life", "hp+", 70, Bloodstone_Ore, false)
    #.......................................................................................................................................................
   #________________________________________________________________________________________________________________________________________________________
  end
  Ore_Array = [@@bloodstone_01, @@bloodstone_02, @@bloodstone_03]
end

# if time >= SF.seconds(0.35) && @@attacking == true
#   Equipment.play_hit_sound
#  # this.current_hp - 10
#   Player_Attack_Clock.restart