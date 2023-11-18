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
module Etc
 # _________________________________________________________________________________________________________________________________________________________
 #|                                                              Etc Variables                                                                              |
 #|_________________________________________________________________________________________________________________________________________________________|
   Inventory_Ore_Array = [] of Inventory_Ore
   Ore_Array = [] of Inventory_Ore

  class Inventory_Ore
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, id : Int32, sprite : SF::Sprite, amount_owned : Int32, color : String, element : String, effect : String, sell_price : Int32)
      @name = name
      @id = id
      @sprite = sprite
      @amount_owned = amount_owned
 #     self.amount_owned = amount_owned
      @color = color
      @element = element
      @effect = effect
      @sell_price = sell_price
     end
    def name
      @name
     end
    def id
      @id
     end
    def sprite
      @sprite
     end
    def amount_owned
      @amount_owned
     end
    def color
      @color
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
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   def amount_owned=(value : Int32)
    @amount_owned = value
   end
    def Inventory_Ore.add_ore(amount, ore)
      case ore
      when "bloodstone_ore"
        @@bloodstone_owned += amount
      when "moss_agate"
        @@moss_agate_inventory_ore.amount_owned += amount
      end
     end
    def remove_ore(amount)
      @amount_owned -= amount
    end
   def Inventory_Ore.update_ore_inventory #@todo this is the final piece that needs fixed I think
    puts "boop"
    s = Ore_Array.size - 1; x = 0
    while s >= x
      if Ore_Array[x].amount_owned > 0
        Inventory_Ore_Array.push(Ore_Array[x])
        puts Inventory_Ore_Array
      end
      x += 1
    end
   end
   def Inventory_Ore.display_ore(window) 
    if Inventory_Ore_Array.size >= 1
    Inventory_Ore_Array[0].sprite.position = SF.vector2(555, 310);
    window.draw(Inventory_Ore_Array[0].sprite)
    end
   end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @@bloodstone_owned = 0
    @@bloodstone_inventory_ore = Inventory_Ore.new("Bloodstone Ore", 1, Bloodstone_Inventory_Ore, @@bloodstone_owned, "red", "life", "hp+", 70)
    Ore_Array.push(@@bloodstone_inventory_ore)
    @@moss_agate_inventory_ore = Inventory_Ore.new("Moss_Agate", 1, Moss_Agate_Inventory_Ore, 0, "green", "life", "passive_mp_regen", 60)
    Ore_Array.push(@@moss_agate_inventory_ore)
   #________________________________________________________________________________________________________________________________________________________
  end
end


module Harvestables
  extend self
  class Ore
    Test_Ore_Array = [@@bloodstone_01, @@bloodstone_02, @@bloodstone_03, @@moss_agate_01]
    Test_Ore_Sprite_Array = [@@bloodstone_01.sprite, @@bloodstone_02.sprite, @@bloodstone_03.sprite, @@moss_agate_01.sprite]
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@ore_animation_frame = 0; @@ore_reset = 0; @@ore_break_iterator = 0
   #________________________________________________________________________________________________________________________________________________________
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, id : Int32, color : String, hardness : Int32, hp : Int32, drop_item : String, sprite : SF::Sprite, is_broke : Bool)
      @name = name
      @id = id
      @color = color
      @hardness = hardness
      @hp = hp
      @drop_item = drop_item
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
      def drop_item
        @drop_item
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
       def global_bounds
        @global_bounds
       end
       def Ore.harvest2(attack, this, ore)
        time = Ore_Clock_01.elapsed_time
        attack2 = Player_Attack_Bounding_Box.global_bounds
        #ore = @@bloodstone_01.sprite.global_bounds
       if attack2.intersects? this
       if ore.hp > 0
       if time >= SF.seconds(0.35) && attack == true
         Equipment.play_hit_sound
         ore.hp_subtract(10)
         Ore.animation_harvest(this, ore)
         Ore_Clock_01.restart
        end; end; end


        end
      def hit_ore_test(attack, this)
        time = Ore_Clock_01.elapsed_time
        if time >= SF.seconds(0.35) && attack == true
          Equipment.play_hit_sound
          this.hp_subtract(10)
          Ore_Clock_01.restart
        end

    end

    #_______________________________________________________________________________________________________________________________________________________
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    Ore_Clock_01 = SF::Clock.new; Ore_Clock_Break = SF::Clock.new
    def Ore.harvest(attack)
      x = 0; y = Test_Ore_Array.size - 1
      while x <= y
      Test_Ore_Array[x]
      ore = Test_Ore_Array[x]
      Test_Ore_Array[x].sprite.global_bounds
      this = Test_Ore_Array[x].sprite.global_bounds
      Ore.harvest2(attack, this, ore)
      if x <= y
        x += 1
      end
    end
     end
    #..............................................................Animations...............................................................................
     def Ore.animation_harvest(this, ore)
      Ore_Clock_Break.restart
       if @@ore_animation_frame == 1 && ore.hp >= 200
       a = 100; b = 0; x = 100; y = 100
       ore.sprite_change_square(a, b, x, y)
       end
       if @@ore_animation_frame == 2
         a = 200; b = 0; x = 100; y = 100
         ore.sprite_change_square(a, b, x, y)
       end
       if @@ore_animation_frame == 3
         a = 300; b = 0; x = 100; y = 100
         ore.sprite_change_square(a, b, x, y)
       end
       if @@ore_animation_frame == 4
         a = 400; b = 0; x = 100; y = 100
         ore.sprite_change_square(a, b, x, y)
         @@ore_animation_frame = 0
       end
       @@ore_animation_frame += 1
       if ore.hp < 200 && ore.hp > 0
         case @@ore_animation_frame 
         when 1
          a = 100; b = 100; x = 100; y = 100
          ore.sprite_change_square(a, b, x, y)
         when 2
          a = 200; b = 100; x = 100; y = 100
          ore.sprite_change_square(a, b, x, y)
         when 3
           a = 300; b = 100; x = 100; y = 100
           ore.sprite_change_square(a, b, x, y)
         when 4
           a = 400; b = 100; x = 100; y = 100
           ore.sprite_change_square(a, b, x, y)
        if ore.hp >= 0

         end; end; end; end
      def Ore.break(broken)
        amount = rand(3)
        ore = broken.drop_item

        if broken.hp >= 0 && broken.is_broke == false
        if @@ore_reset == 0
          Ore_Clock_Break.restart
          Etc::Inventory_Ore.add_ore(amount, ore)
          Etc::Inventory_Ore.update_ore_inventory
          @@ore_reset = 1
        end; end
           time = Ore_Clock_Break.elapsed_time
          if time >= SF.seconds(0.25) && time < SF.seconds(0.5)
           a = 0; b = 200; x = 100; y = 100
           broken.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(0.5) && time < SF.seconds(0.75)
           a = 100; b = 200; x = 100; y = 100
           broken.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(0.75) && time < SF.seconds(1)
           a = 200; b = 200; x = 100; y = 100
           broken.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(1) && time < SF.seconds(1.25)
           a = 300; b = 200; x = 100; y = 100
           broken.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(1.25) && time < SF.seconds(1.5)
            a = 400; b = 200; x = 100; y = 100
            broken.sprite_change_square(a, b, x, y)
     else if time >= SF.seconds(1.5) && time < SF.seconds(1.75)
      broken.is_broke_toggle   
     else if time >= SF.seconds(30) 
      Ore_Clock_Break.restart
           this = 500
           broken.hp_set(this)
           a = 0; b = 0; x = 100; y = 100
           broken.sprite_change_square(a, b, x, y)
           this = broken.is_broke  
           broken.is_broke_toggle 
           Ore_Clock_Break.restart
       end; end; end; end; end; end; end; end
    #-------------------------------------------------------------------------------------------------------------------------------------------------     
    def Ore.draw_ores(window)
      s = Test_Ore_Array.size - 1
      if Test_Ore_Array[@@ore_break_iterator].hp <= 0 && Test_Ore_Array[@@ore_break_iterator].is_broke == false
        broken = Test_Ore_Array[@@ore_break_iterator]
        Ore.break(broken)
      end
      if @@ore_break_iterator < s
        @@ore_break_iterator += 1
      else
        @@ore_break_iterator = 0
      end
      Testing_Text.string = @@bloodstone_01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
      test_text_2 = Testing_Text.dup; test_text_2.string = @@bloodstone_02.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
      test_text_3 = Testing_Text.dup; test_text_3.string = @@moss_agate_01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
      window.draw(Testing_Text)
      @@bloodstone_02.sprite.position = SF.vector2(2500, 702)
      test_text_2.position = @@bloodstone_02.sprite.position
      test_text_3.position = @@moss_agate_01.sprite.position
      window.draw(@@bloodstone_01.sprite); window.draw(@@bloodstone_02.sprite); window.draw(test_text_2)
      window.draw(@@moss_agate_01.sprite); window.draw(test_text_3)
    end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #..............................................................Bloodstone...............................................................................
     @@bloodstone_01 = Ore.new("Bloodstone", 1, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore, false) 
     @@bloodstone_02 = Ore.new("Bloodstone", 2, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false)
     @@bloodstone_03 = Ore.new("Bloodstone", 3, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore, false)
     @@bloodstone_04 = Ore.new("Bloodstone", 4, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore, false)
     @@bloodstone_05 = Ore.new("Bloodstone", 5, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore, false)
     @@bloodstone_06 = Ore.new("Bloodstone", 6, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore, false)
    #.......................................................................................................................................................
    #..............................................................Moss Stone...............................................................................
     @@moss_agate_01 = Ore.new("Moss Agate", 7, "green", 7, 450, "moss_agate", Moss_Agate_Ore, false)
    #.......................................................................................................................................................
   #________________________________________________________________________________________________________________________________________________________
  end
end

# if time >= SF.seconds(0.35) && @@attacking == true
#   Equipment.play_hit_sound
#  # this.current_hp - 10
#   Player_Attack_Clock.restart