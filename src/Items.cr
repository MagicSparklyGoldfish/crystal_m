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
   Inventory_Ore_Array = [] of Inventory_Ore; 
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
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   def amount_owned=(value : Int32)
    @amount_owned = value
   end
   @@drop_iterator : Int32; @@drop_iterator = 0
    def Inventory_Ore.add_ore(amount, ore)
      s = Ore_Array.size; @@drop_iterator = 0
      while @@drop_iterator < s
        if Ore_Array[@@drop_iterator].name == ore
          Ore_Array[@@drop_iterator].amount_owned += amount
         @@drop_iterator = 0
         ore = "none"
        end
        @@drop_iterator += 1
      end
     end
    def remove_ore(amount)
      @amount_owned -= amount
    end
   def Inventory_Ore.update_ore_inventory 
    s = Ore_Array.size - 1; x = 0
    while s >= x
      if Ore_Array[x].amount_owned > 0
        Inventory_Ore_Array.push(Ore_Array[x])
      end
      x += 1
    end
   end
   def Inventory_Ore.display_ore(window, page) 
     Inventory_Ore_Array.uniq!
    #----------------------------------------------------slot 1-------------------------------------------
     if Inventory_Ore_Array.size >= 1
       case page
        when 1   
         Inventory_Ore_Array[0].sprite.position = SF.vector2(555, 310);
         ore_array_text_01 = Ore_amount_owned_text.dup
         ore_array_text_01.position = Inventory_Ore_Array[0].sprite.position + SF.vector2(100, -5)
         ore_array_text_01.string = "x" + Inventory_Ore_Array[0].amount_owned.to_s
         window.draw(Inventory_Ore_Array[0].sprite); window.draw(ore_array_text_01)
        when 2   
         if Inventory_Ore_Array.size >= 19
         Inventory_Ore_Array[18].sprite.position = SF.vector2(555, 310);
         ore_array_text_19 = Ore_amount_owned_text.dup
         ore_array_text_19.position = Inventory_Ore_Array[18].sprite.position + SF.vector2(100, -5)
         ore_array_text_19.string = "x" + Inventory_Ore_Array[18].amount_owned.to_s
         window.draw(Inventory_Ore_Array[18].sprite); window.draw(ore_array_text_19)
       end; end; end
    #----------------------------------------------------slot 2-------------------------------------------
     if Inventory_Ore_Array.size >= 2
       case page
        when 1   
         Inventory_Ore_Array[1].sprite.position = SF.vector2(710, 310);
         ore_array_text_02 = Ore_amount_owned_text.dup
         ore_array_text_02.position = Inventory_Ore_Array[1].sprite.position + SF.vector2(100, -5)
         ore_array_text_02.string = "x" + Inventory_Ore_Array[1].amount_owned.to_s
         window.draw(Inventory_Ore_Array[1].sprite); window.draw(ore_array_text_02)
        when 2   
         if Inventory_Ore_Array.size >= 20
         Inventory_Ore_Array[19].sprite.position = SF.vector2(710, 310);
         ore_array_text_20 = Ore_amount_owned_text.dup
         ore_array_text_20.position = Inventory_Ore_Array[19].sprite.position + SF.vector2(100, -5)
         ore_array_text_20.string = "x" + Inventory_Ore_Array[19].amount_owned.to_s
         window.draw(Inventory_Ore_Array[19].sprite); window.draw(ore_array_text_20)
       end; end; end
    #----------------------------------------------------slot 3-------------------------------------------
     if Inventory_Ore_Array.size >= 3
       case page
        when 1   
         Inventory_Ore_Array[2].sprite.position = SF.vector2(855, 310);
         ore_array_text_03 = Ore_amount_owned_text.dup
         ore_array_text_03.position = Inventory_Ore_Array[2].sprite.position + SF.vector2(100, -5)
         ore_array_text_03.string = "x" + Inventory_Ore_Array[2].amount_owned.to_s
         window.draw(Inventory_Ore_Array[2].sprite); window.draw(ore_array_text_03)
        when 2   
         if Inventory_Ore_Array.size >= 21
         Inventory_Ore_Array[20].sprite.position = SF.vector2(855, 310);
         ore_array_text_21 = Ore_amount_owned_text.dup
         ore_array_text_21.position = Inventory_Ore_Array[20].sprite.position + SF.vector2(100, -5)
         ore_array_text_21.string = "x" + Inventory_Ore_Array[20].amount_owned.to_s
         window.draw(Inventory_Ore_Array[20].sprite); window.draw(ore_array_text_21)
       end; end; end
    #----------------------------------------------------slot 4-------------------------------------------
     if Inventory_Ore_Array.size >= 4
       case page
        when 1   
         Inventory_Ore_Array[3].sprite.position = SF.vector2(1005, 310);
         ore_array_text_04 = Ore_amount_owned_text.dup
         ore_array_text_04.position = Inventory_Ore_Array[3].sprite.position + SF.vector2(100, -5)
         ore_array_text_04.string = "x" + Inventory_Ore_Array[3].amount_owned.to_s
         window.draw(Inventory_Ore_Array[3].sprite); window.draw(ore_array_text_04)
        when 2   
         if Inventory_Ore_Array.size >= 22
         Inventory_Ore_Array[21].sprite.position = SF.vector2(1005, 310);
         ore_array_text_22 = Ore_amount_owned_text.dup
         ore_array_text_22.position = Inventory_Ore_Array[21].sprite.position + SF.vector2(100, -5)
         ore_array_text_22.string = "x" + Inventory_Ore_Array[21].amount_owned.to_s
         window.draw(Inventory_Ore_Array[21].sprite); window.draw(ore_array_text_22)
       end; end; end
    #----------------------------------------------------slot 5-------------------------------------------
     if Inventory_Ore_Array.size >= 5
       case page
        when 1   
         Inventory_Ore_Array[4].sprite.position = SF.vector2(1155, 310);
         ore_array_text_05 = Ore_amount_owned_text.dup
         ore_array_text_05.position = Inventory_Ore_Array[4].sprite.position + SF.vector2(100, -5)
         ore_array_text_05.string = "x" + Inventory_Ore_Array[4].amount_owned.to_s
         window.draw(Inventory_Ore_Array[4].sprite); window.draw(ore_array_text_05)
        when 2   
         if Inventory_Ore_Array.size >= 23
         Inventory_Ore_Array[22].sprite.position = SF.vector2(1155, 310);
         ore_array_text_23 = Ore_amount_owned_text.dup
         ore_array_text_23.position = Inventory_Ore_Array[22].sprite.position + SF.vector2(100, -5)
         ore_array_text_23.string = "x" + Inventory_Ore_Array[22].amount_owned.to_s
         window.draw(Inventory_Ore_Array[22].sprite); window.draw(ore_array_text_23)
       end; end; end
    #----------------------------------------------------slot 6-------------------------------------------
     if Inventory_Ore_Array.size >= 6
       case page
        when 1   
         Inventory_Ore_Array[5].sprite.position = SF.vector2(1305, 310);
         ore_array_text_06 = Ore_amount_owned_text.dup
         ore_array_text_06.position = Inventory_Ore_Array[5].sprite.position + SF.vector2(100, -5)
         ore_array_text_06.string = "x" + Inventory_Ore_Array[5].amount_owned.to_s
         window.draw(Inventory_Ore_Array[5].sprite); window.draw(ore_array_text_06)
        when 2   
         if Inventory_Ore_Array.size >= 24
         Inventory_Ore_Array[23].sprite.position = SF.vector2(1305, 310);
         ore_array_text_24 = Ore_amount_owned_text.dup
         ore_array_text_24.position = Inventory_Ore_Array[23].sprite.position + SF.vector2(100, -5)
         ore_array_text_24.string = "x" + Inventory_Ore_Array[23].amount_owned.to_s
         window.draw(Inventory_Ore_Array[23].sprite); window.draw(ore_array_text_24)
       end; end; end
    #----------------------------------------------------slot 7-------------------------------------------
     if Inventory_Ore_Array.size >= 7
       case page
        when 1   
         Inventory_Ore_Array[6].sprite.position = SF.vector2(555, 460);
         ore_array_text_07 = Ore_amount_owned_text.dup
         ore_array_text_07.position = Inventory_Ore_Array[6].sprite.position + SF.vector2(100, -5)
         ore_array_text_07.string = "x" + Inventory_Ore_Array[6].amount_owned.to_s
         window.draw(Inventory_Ore_Array[6].sprite); window.draw(ore_array_text_07)
        when 2   
         if Inventory_Ore_Array.size >= 25
         Inventory_Ore_Array[24].sprite.position = SF.vector2(555, 460);
         ore_array_text_25 = Ore_amount_owned_text.dup
         ore_array_text_25.position = Inventory_Ore_Array[24].sprite.position + SF.vector2(100, -5)
         ore_array_text_25.string = "x" + Inventory_Ore_Array[24].amount_owned.to_s
         window.draw(Inventory_Ore_Array[24].sprite); window.draw(ore_array_text_25)
       end; end; end
    #----------------------------------------------------slot 8-------------------------------------------
     if Inventory_Ore_Array.size >= 8
       case page
        when 1   
         Inventory_Ore_Array[7].sprite.position = SF.vector2(710, 460);
         ore_array_text_08 = Ore_amount_owned_text.dup
         ore_array_text_08.position = Inventory_Ore_Array[7].sprite.position + SF.vector2(100, -5)
         ore_array_text_08.string = "x" + Inventory_Ore_Array[7].amount_owned.to_s
         window.draw(Inventory_Ore_Array[7].sprite); window.draw(ore_array_text_08)
        when 2   
         if Inventory_Ore_Array.size >= 26
         Inventory_Ore_Array[25].sprite.position = SF.vector2(710, 460);
         ore_array_text_26 = Ore_amount_owned_text.dup
         ore_array_text_26.position = Inventory_Ore_Array[25].sprite.position + SF.vector2(100, -5)
         ore_array_text_26.string = "x" + Inventory_Ore_Array[25].amount_owned.to_s
         window.draw(Inventory_Ore_Array[25].sprite); window.draw(ore_array_text_26)
       end; end; end
    #----------------------------------------------------slot 9-------------------------------------------
     if Inventory_Ore_Array.size >= 9
       case page
        when 1   
         Inventory_Ore_Array[8].sprite.position = SF.vector2(855, 460);
         ore_array_text_09 = Ore_amount_owned_text.dup
         ore_array_text_09.position = Inventory_Ore_Array[8].sprite.position + SF.vector2(100, -5)
         ore_array_text_09.string = "x" + Inventory_Ore_Array[8].amount_owned.to_s
         window.draw(Inventory_Ore_Array[8].sprite); window.draw(ore_array_text_09)
        when 2   
         if Inventory_Ore_Array.size >= 27
         Inventory_Ore_Array[26].sprite.position = SF.vector2(855, 460);
         ore_array_text_27 = Ore_amount_owned_text.dup
         ore_array_text_27.position = Inventory_Ore_Array[26].sprite.position + SF.vector2(100, -5)
         ore_array_text_27.string = "x" + Inventory_Ore_Array[26].amount_owned.to_s
         window.draw(Inventory_Ore_Array[26].sprite); window.draw(ore_array_text_27)
       end; end; end
    #----------------------------------------------------slot 10------------------------------------------
     if Inventory_Ore_Array.size >= 10
       case page
        when 1   
         Inventory_Ore_Array[9].sprite.position = SF.vector2(1005, 460);
         ore_array_text_10 = Ore_amount_owned_text.dup
         ore_array_text_10.position = Inventory_Ore_Array[9].sprite.position + SF.vector2(100, -5)
         ore_array_text_10.string = "x" + Inventory_Ore_Array[9].amount_owned.to_s
         window.draw(Inventory_Ore_Array[9].sprite); window.draw(ore_array_text_10)
        when 2
         if Inventory_Ore_Array.size >= 28
         Inventory_Ore_Array[27].sprite.position = SF.vector2(1005, 460);
         ore_array_text_28 = Ore_amount_owned_text.dup
         ore_array_text_28.position = Inventory_Ore_Array[27].sprite.position + SF.vector2(100, -5)
         ore_array_text_28.string = "x" + Inventory_Ore_Array[27].amount_owned.to_s
         window.draw(Inventory_Ore_Array[27].sprite); window.draw(ore_array_text_28)
      end; end; end
    #----------------------------------------------------slot 11------------------------------------------
     if Inventory_Ore_Array.size >= 11
       case page
        when 1   
         Inventory_Ore_Array[10].sprite.position = SF.vector2(1155, 460);
         ore_array_text_11 = Ore_amount_owned_text.dup
         ore_array_text_11.position = Inventory_Ore_Array[10].sprite.position + SF.vector2(100, -5)
         ore_array_text_11.string = "x" + Inventory_Ore_Array[10].amount_owned.to_s
         window.draw(Inventory_Ore_Array[10].sprite); window.draw(ore_array_text_11)
        when 2
         if Inventory_Ore_Array.size >= 29
         Inventory_Ore_Array[28].sprite.position = SF.vector2(1155, 460);
         ore_array_text_29 = Ore_amount_owned_text.dup
         ore_array_text_29.position = Inventory_Ore_Array[28].sprite.position + SF.vector2(100, -5)
         ore_array_text_29.string = "x" + Inventory_Ore_Array[28].amount_owned.to_s
         window.draw(Inventory_Ore_Array[28].sprite); window.draw(ore_array_text_29)
       end; end; end
    #----------------------------------------------------slot 12------------------------------------------
     if Inventory_Ore_Array.size >= 12
      case page
       when 1   
        Inventory_Ore_Array[11].sprite.position = SF.vector2(1305, 460);
        ore_array_text_12 = Ore_amount_owned_text.dup
        ore_array_text_12.position = Inventory_Ore_Array[11].sprite.position + SF.vector2(100, -5)
        ore_array_text_12.string = "x" + Inventory_Ore_Array[11].amount_owned.to_s
        window.draw(Inventory_Ore_Array[11].sprite); window.draw(ore_array_text_12)
       when 2
        if Inventory_Ore_Array.size >= 30
        Inventory_Ore_Array[29].sprite.position = SF.vector2(1305, 460);
        ore_array_text_30 = Ore_amount_owned_text.dup
        ore_array_text_30.position = Inventory_Ore_Array[29].sprite.position + SF.vector2(100, -5)
        ore_array_text_30.string = "x" + Inventory_Ore_Array[29].amount_owned.to_s
        window.draw(Inventory_Ore_Array[29].sprite); window.draw(ore_array_text_30)
      end; end; end
    #----------------------------------------------------slot 13------------------------------------------
     if Inventory_Ore_Array.size >= 13
      case page
       when 1   
        Inventory_Ore_Array[12].sprite.position = SF.vector2(555, 610);
        ore_array_text_13 = Ore_amount_owned_text.dup
        ore_array_text_13.position = Inventory_Ore_Array[12].sprite.position + SF.vector2(100, -5)
        ore_array_text_13.string = "x" + Inventory_Ore_Array[12].amount_owned.to_s
        window.draw(Inventory_Ore_Array[12].sprite); window.draw(ore_array_text_13)
       when 2
        if Inventory_Ore_Array.size >= 31
        Inventory_Ore_Array[30].sprite.position = SF.vector2(555, 610);
        ore_array_text_31 = Ore_amount_owned_text.dup
        ore_array_text_31.position = Inventory_Ore_Array[30].sprite.position + SF.vector2(100, -5)
        ore_array_text_31.string = "x" + Inventory_Ore_Array[30].amount_owned.to_s
        window.draw(Inventory_Ore_Array[30].sprite); window.draw(ore_array_text_31)
      end; end; end
    #----------------------------------------------------slot 14------------------------------------------
     if Inventory_Ore_Array.size >= 14
       case page
       when 1   
       Inventory_Ore_Array[13].sprite.position = SF.vector2(710, 610);
       ore_array_text_14 = Ore_amount_owned_text.dup
       ore_array_text_14.position = Inventory_Ore_Array[13].sprite.position + SF.vector2(100, -5)
       ore_array_text_14.string = "x" + Inventory_Ore_Array[13].amount_owned.to_s
       window.draw(Inventory_Ore_Array[13].sprite); window.draw(ore_array_text_14)
        end; end
    #----------------------------------------------------slot 15------------------------------------------
     if Inventory_Ore_Array.size >= 15
       case page
       when 1   
       Inventory_Ore_Array[14].sprite.position = SF.vector2(855, 610);
       ore_array_text_15 = Ore_amount_owned_text.dup
       ore_array_text_15.position = Inventory_Ore_Array[14].sprite.position + SF.vector2(100, -5)
       ore_array_text_15.string = "x" + Inventory_Ore_Array[14].amount_owned.to_s
       window.draw(Inventory_Ore_Array[14].sprite); window.draw(ore_array_text_15)
        end; end
    #----------------------------------------------------slot 16------------------------------------------
      if Inventory_Ore_Array.size >= 16
        case page
        when 1   
        Inventory_Ore_Array[15].sprite.position = SF.vector2(1005, 610);
        ore_array_text_16 = Ore_amount_owned_text.dup
        ore_array_text_16.position = Inventory_Ore_Array[15].sprite.position + SF.vector2(100, -5)
        ore_array_text_16.string = "x" + Inventory_Ore_Array[15].amount_owned.to_s
        window.draw(Inventory_Ore_Array[15].sprite); window.draw(ore_array_text_16)
          end; end
    #----------------------------------------------------slot 17------------------------------------------
      if Inventory_Ore_Array.size >= 17
        case page
        when 1   
        Inventory_Ore_Array[16].sprite.position = SF.vector2(1155, 610);
        ore_array_text_17 = Ore_amount_owned_text.dup
        ore_array_text_17.position = Inventory_Ore_Array[16].sprite.position + SF.vector2(100, -5)
        ore_array_text_17.string = "x" + Inventory_Ore_Array[16].amount_owned.to_s
        window.draw(Inventory_Ore_Array[16].sprite); window.draw(ore_array_text_17)
          end; end
    #----------------------------------------------------slot 18------------------------------------------
      if Inventory_Ore_Array.size >= 18
        case page
        when 1   
        Inventory_Ore_Array[17].sprite.position = SF.vector2(1305, 610);
        ore_array_text_18 = Ore_amount_owned_text.dup
        ore_array_text_18.position = Inventory_Ore_Array[17].sprite.position + SF.vector2(100, -5)
        ore_array_text_18.string = "x" + Inventory_Ore_Array[17].amount_owned.to_s
        window.draw(Inventory_Ore_Array[17].sprite); window.draw(ore_array_text_18)
          end; end
   end                
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #--------------------------------------------------------------Bloodstone------------------------------------------------------------------------------
     @@bloodstone_inventory_ore = Inventory_Ore.new("Bloodstone", 1, Bloodstone_Inventory_Ore, 1, "red", "earth", "hp+", 70)
     Ore_Array.push(@@bloodstone_inventory_ore)
    #--------------------------------------------------------------Moss Agate------------------------------------------------------------------------------
     @@moss_agate_inventory_ore = Inventory_Ore.new("Moss Agate", 2, Moss_Agate_Inventory_Ore, 1, "green", "earth", "passive_mp_regen", 60)
     Ore_Array.push(@@moss_agate_inventory_ore)
    #----------------------------------------------------------------Amber---------------------------------------------------------------------------------
     @@amber_inventory_ore = Inventory_Ore.new("Amber", 3, Amber_Inventory_Ore, 1, "yellow", "fire", "passive_hp_regen", 55)
     Ore_Array.push(@@amber_inventory_ore)
    #---------------------------------------------------------------Wavellite------------------------------------------------------------------------------ 
     @@wavellite_inventory_ore = Inventory_Ore.new("Wavellite", 4, Wavellite_Inventory_Ore, 1, "green", "earth", "mp+", 75)
     Ore_Array.push(@@wavellite_inventory_ore)
    #-----------------------------------------------------------------Topaz-------------------------------------------------------------------------------- 
     @@topaz_inventory_ore = Inventory_Ore.new("Topaz", 5, Topaz_Inventory_Ore, 1, "yellow", "fire", "INT+", 175)
     Ore_Array.push(@@topaz_inventory_ore)
    #---------------------------------------------------------------Amethyst------------------------------------------------------------------------------- 
     @@amethyst_inventory_ore = Inventory_Ore.new("Amethyst", 6, Amethyst_Inventory_Ore, 1, "purple", "air", "INT+", 105)
     Ore_Array.push(@@amethyst_inventory_ore) 
    #-------------------------------------------------------------Smokey Quartz---------------------------------------------------------------------------- 
     @@smokey_quartz_inventory_ore = Inventory_Ore.new("Smokey Quartz", 7, Smokey_Quartz_Inventory_Ore, 1, "clear", "earth", "STR+", 95)
     Ore_Array.push(@@smokey_quartz_inventory_ore) 
    #---------------------------------------------------------------Sapphire------------------------------------------------------------------------------- 
     @@sapphire = Inventory_Ore.new("Sapphire", 8, Sapphire_Inventory_Ore, 1, "blue", "water", "EXP++", 950)
     Ore_Array.push(@@sapphire) 
    #--------------------------------------------------------------Black Opal------------------------------------------------------------------------------ 
     @@black_opal = Inventory_Ore.new("Black Opal", 9, Black_Opal_Inventory_Ore, 1, "black", "water", "LUK+", 80)
     Ore_Array.push(@@black_opal) 
    #---------------------------------------------------------------Ajiote--------------------------------------------------------------------------------- 
     @@ajiote = Inventory_Ore.new("Ajoite", 10, Ajoite_Inventory_Ore, 1, "clear", "water", "DEX+", 60)
     Ore_Array.push(@@ajiote) 
    #--------------------------------------------------------------Rhodolite------------------------------------------------------------------------------- 
     @@rhodolite = Inventory_Ore.new("Rhodolite", 11, Rhodolite_Inventory_Ore, 1, "pink", "water", "STR+", 60)
     Ore_Array.push(@@rhodolite)
    #-------------------------------------------------------------Chalcanthite----------------------------------------------------------------------------- 
     @@chalcanthite = Inventory_Ore.new("Chalcanthite", 12, Chalcanthite_Inventory_Ore, 1, "blue", "water", "poison", 30)
     Ore_Array.push(@@chalcanthite)
    #---------------------------------------------------------------Flourite------------------------------------------------------------------------------- 
     @@flourite = Inventory_Ore.new("Flourite", 13, Flourite_Inventory_Ore, 1, "clear", "water", "INT+", 40)
     Ore_Array.push(@@flourite)
    #---------------------------------------------------------------Amorite-------------------------------------------------------------------------------- 
     @@amorite = Inventory_Ore.new("Amorite", 14, Amorite_Inventory_Ore, 1, "white", "water", "INT+", 40)
     Ore_Array.push(@@amorite)
    #-------------------------------------------------------------Lapis Lazuli----------------------------------------------------------------------------- 
     @@lapis_lazuli = Inventory_Ore.new("Lapis Lazuli", 15, Lapis_Lazuli_Inventory_Ore, 1, "blue", "water", "STR+", 70)
     Ore_Array.push(@@lapis_lazuli)
    #--------------------------------------------------------------Moonstone------------------------------------------------------------------------------- 
     @@moonstone = Inventory_Ore.new("Moonstone", 16, Moonstone_Inventory_Ore, 1, "white", "water", "DEX+", 70)
     Ore_Array.push(@@moonstone)
    #-------------------------------------------------------------Blue Calcite----------------------------------------------------------------------------- 
     @@blue_calcite = Inventory_Ore.new("Blue Calcite", 17, Blue_Calcite_Inventory_Ore, 1, "blue", "water", "DEX+", 70)
     Ore_Array.push(@@blue_calcite)
    #--------------------------------------------------------------Hiddenite------------------------------------------------------------------------------- 
     @@hiddenite = Inventory_Ore.new("Hiddenite", 18, Hiddenite_Inventory_Ore, 1, "green", "water", "passive_hp_regen", 70)
     Ore_Array.push(@@hiddenite)
   #________________________________________________________________________________________________________________________________________________________
  end
end 


module Harvestables
  extend self
  class Ore
    Test_Ore_Array = [@@bloodstone_01, @@bloodstone_02, @@bloodstone_03, @@moss_agate_01, @@amber01, @@wavellite01,  @@topaz01, @@amethyst01,
    @@smokey_quartz01, @@sapphire01, @@black_opal01, @@ajoite01, @@rhodolite01, @@chalcanthite01, @@flourite01, @@amorite01, @@lapis_lazuli01,
    @@moonstone01, @@blue_calcite01, @@hiddenite01]

    Test_Ore_Sprite_Array = [@@bloodstone_01.sprite, @@bloodstone_02.sprite, @@bloodstone_03.sprite, @@moss_agate_01.sprite, @@amber01.sprite, 
    @@wavellite01.sprite,  @@topaz01.sprite, @@amethyst01.sprite, @@smokey_quartz01.sprite, @@sapphire01.sprite, @@black_opal01.sprite,
    @@ajoite01.sprite, @@rhodolite01.sprite, @@chalcanthite01.sprite, @@flourite01.sprite, @@amorite01.sprite, @@lapis_lazuli01.sprite,
    @@moonstone01.sprite, @@blue_calcite01.sprite, @@hiddenite01.sprite]
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@ore_animation_frame = 0; @@ore_reset = 0; @@ore_break_iterator = 0
   #________________________________________________________________________________________________________________________________________________________
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, id : Int32, color : String, hardness : Int32, hp : Int32, drop_item : String, sprite : SF::Sprite, is_broke : Bool, max_hp : Int32)
      @name = name
      @id = id
      @color = color
      @hardness = hardness
      @hp = hp
      @drop_item = drop_item
      @sprite = sprite
      @is_broke = is_broke
      @max_hp = max_hp 
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
     def max_hp
        @max_hp
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
       if attack2.intersects? this
       if ore.hp > 0
       if time >= SF.seconds(0.35) && attack == true
         Equipment.play_hit_sound
         ore.hp_subtract(10)
         Ore.animation_harvest(this, ore)
         Ore_Clock_01.restart
        end; end; end


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
       if ore.hp < ore.max_hp/2 # && ore.hp > 0
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
        amount = rand(1..3)
        ore = broken.name
        if broken.hp >= 0 && broken.is_broke == false
        if @@ore_reset == 0
          Etc::Inventory_Ore.add_ore(amount, ore)
          Etc::Inventory_Ore.update_ore_inventory
          Ore_Clock_Break.restart
          @@ore_reset = 1
        end; end
           time = Ore_Clock_Break.elapsed_time
          if time >= SF.seconds(0.25) && time < SF.seconds(0.5)
            All_Audio::SFX.dig_02
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
      @@ore_reset = 0
      if time > SF.milliseconds(30)  #@note this only works with microseconds and milliseconds, not seconds. I don't know why, there wasn't a typo
      Ore_Clock_Break.restart
           this = broken.max_hp
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
       test_text_4 = Testing_Text.dup; test_text_4.string = @@amber01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
       test_text_5 = Testing_Text.dup; test_text_5.string = @@wavellite01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
       test_text_6 = Testing_Text.dup; test_text_5.string = @@amethyst01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s

      @@bloodstone_02.sprite.position = SF.vector2(4500, 702)
      test_text_2.position = @@bloodstone_02.sprite.position
      test_text_3.position = @@moss_agate_01.sprite.position
      test_text_4.position = @@amber01.sprite.position
      test_text_5.position = @@wavellite01.sprite.position
      test_text_6.position = @@amethyst01.sprite.position
      window.draw(@@bloodstone_01.sprite); window.draw(@@bloodstone_02.sprite); window.draw(test_text_2); window.draw(@@moss_agate_01.sprite); 
      window.draw(@@amber01.sprite); window.draw(@@wavellite01.sprite); window.draw(@@topaz01.sprite); window.draw(@@amethyst01.sprite)
      window.draw(@@smokey_quartz01.sprite); window.draw(@@sapphire01.sprite); window.draw(@@black_opal01.sprite); window.draw(@@ajoite01.sprite)
      window.draw(@@rhodolite01.sprite); window.draw(@@chalcanthite01.sprite); window.draw(@@flourite01.sprite); window.draw(@@amorite01.sprite)
      window.draw(@@lapis_lazuli01.sprite); window.draw(@@moonstone01.sprite); window.draw(@@blue_calcite01.sprite); window.draw(@@hiddenite01.sprite)
    end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #========================================================================================================================================================
   #================================================================Minerals================================================================================
    #..............................................................Bloodstone...............................................................................
     @@bloodstone_01 = Ore.new("Bloodstone", 1, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false, 500) 
     @@bloodstone_02 = Ore.new("Bloodstone", 2, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false, 500) 
     @@bloodstone_03 = Ore.new("Bloodstone", 3, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false, 500) 
     @@bloodstone_04 = Ore.new("Bloodstone", 4, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false, 500) 
     @@bloodstone_05 = Ore.new("Bloodstone", 5, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false, 500) 
     @@bloodstone_06 = Ore.new("Bloodstone", 6, "red", 7, 500, "bloodstone_ore", Bloodstone_Ore.dup, false, 500) 
    #.......................................................................................................................................................
    #..............................................................Moss Stone...............................................................................
     @@moss_agate_01 = Ore.new("Moss Agate", 7, "green", 7, 450, "moss_agate", Moss_Agate_Ore.dup, false, 450) 
     @@moss_agate_02 = Ore.new("Moss Agate", 8, "green", 7, 450, "moss_agate", Moss_Agate_Ore.dup, false, 450) 
     @@moss_agate_03 = Ore.new("Moss Agate", 9, "green", 7, 450, "moss_agate", Moss_Agate_Ore.dup, false, 450) 
     @@moss_agate_04 = Ore.new("Moss Agate", 10, "green", 7, 450, "moss_agate", Moss_Agate_Ore.dup, false, 450) 
     @@moss_agate_05 = Ore.new("Moss Agate", 11, "green", 7, 450, "moss_agate", Moss_Agate_Ore.dup, false, 450) 
     @@moss_agate_06 = Ore.new("Moss Agate", 12, "green", 7, 450, "moss_agate", Moss_Agate_Ore.dup, false, 450) 
    #.......................................................................................................................................................
    #................................................................Amber..................................................................................
     @@amber01 = Ore.new("Amber", 13, "yellow", 2, 100, "amber", Amber_Ore.dup, false, 100) 
     @@amber02 = Ore.new("Amber", 14, "yellow", 2, 100, "amber", Amber_Ore.dup, false, 100) 
     @@amber03 = Ore.new("Amber", 15, "yellow", 2, 100, "amber", Amber_Ore.dup, false, 100) 
     @@amber04 = Ore.new("Amber", 16, "yellow", 2, 100, "amber", Amber_Ore.dup, false, 100) 
     @@amber05 = Ore.new("Amber", 17, "yellow", 2, 100, "amber", Amber_Ore.dup, false, 100) 
     @@amber06 = Ore.new("Amber", 18, "yellow", 2, 100, "amber", Amber_Ore.dup, false, 100) 
    #.......................................................................................................................................................
    #...............................................................Wavellite...............................................................................
     @@wavellite01 = Ore.new("Wavellite", 19, "green", 4, 200, "wavellite", Wavellite_Ore.dup, false, 200) 
     @@wavellite02 = Ore.new("Wavellite", 20, "green", 4, 200, "wavellite", Wavellite_Ore.dup, false, 200) 
     @@wavellite03 = Ore.new("Wavellite", 21, "green", 4, 200, "wavellite", Wavellite_Ore.dup, false, 200) 
     @@wavellite04 = Ore.new("Wavellite", 22, "green", 4, 200, "wavellite", Wavellite_Ore.dup, false, 200) 
     @@wavellite05 = Ore.new("Wavellite", 23, "green", 4, 200, "wavellite", Wavellite_Ore.dup, false, 200) 
     @@wavellite06 = Ore.new("Wavellite", 24, "green", 4, 200, "wavellite", Wavellite_Ore.dup, false, 200) 
    #.......................................................................................................................................................
    #.................................................................Topaz.................................................................................
     @@topaz01 = Ore.new("Topaz", 25, "yellow", 8, 550, "topaz", Topaz_Ore.dup, false, 550)
     @@topaz02 = Ore.new("Topaz", 26, "yellow", 8, 550, "topaz", Topaz_Ore.dup, false, 550)
     @@topaz03 = Ore.new("Topaz", 27, "yellow", 8, 550, "topaz", Topaz_Ore.dup, false, 550)
     @@topaz04 = Ore.new("Topaz", 28, "yellow", 8, 550, "topaz", Topaz_Ore.dup, false, 550)
     @@topaz05 = Ore.new("Topaz", 29, "yellow", 8, 550, "topaz", Topaz_Ore.dup, false, 550)
     @@topaz06 = Ore.new("Topaz", 20, "yellow", 8, 550, "topaz", Topaz_Ore.dup, false, 550)
    #.......................................................................................................................................................
    #................................................................Amethyst...............................................................................
     @@amethyst01 = Ore.new("Amethyst", 21, "purple", 7, 500, "amethyst", Amethyst_Ore.dup, false, 500)
     @@amethyst02 = Ore.new("Amethyst", 22, "purple", 7, 500, "amethyst", Amethyst_Ore.dup, false, 500)
     @@amethyst03 = Ore.new("Amethyst", 23, "purple", 7, 500, "amethyst", Amethyst_Ore.dup, false, 500)
     @@amethyst04 = Ore.new("Amethyst", 24, "purple", 7, 500, "amethyst", Amethyst_Ore.dup, false, 500)
     @@amethyst05 = Ore.new("Amethyst", 25, "purple", 7, 500, "amethyst", Amethyst_Ore.dup, false, 500)
     @@amethyst06 = Ore.new("Amethyst", 26, "purple", 7, 500, "amethyst", Amethyst_Ore.dup, false, 500)
    #.......................................................................................................................................................
    #..............................................................Smokey Quartz...........................................................................
     @@smokey_quartz01 = Ore.new("Smokey Quartz", 27, "clear", 7, 500, "smokey_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smokey_quartz02 = Ore.new("Smokey Quartz", 28, "clear", 7, 500, "smokey_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smokey_quartz03 = Ore.new("Smokey Quartz", 29, "clear", 7, 500, "smokey_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smokey_quartz04 = Ore.new("Smokey Quartz", 30, "clear", 7, 500, "smokey_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smokey_quartz05 = Ore.new("Smokey Quartz", 31, "clear", 7, 500, "smokey_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smokey_quartz06 = Ore.new("Smokey Quartz", 32, "clear", 7, 500, "smokey_quartz", Smokey_Quartz_Ore.dup, false, 500)
    #.......................................................................................................................................................
    #................................................................Sapphire..............................................................................
     @@sapphire01 = Ore.new("Sapphire", 33, "clear", 9, 600, "sapphire", Sapphire_Ore.dup, false, 600)
     @@sapphire02 = Ore.new("Sapphire", 34, "clear", 9, 600, "sapphire", Sapphire_Ore.dup, false, 600)
     @@sapphire03 = Ore.new("Sapphire", 35, "clear", 9, 600, "sapphire", Sapphire_Ore.dup, false, 600)
     @@sapphire04 = Ore.new("Sapphire", 36, "clear", 9, 600, "sapphire", Sapphire_Ore.dup, false, 600)
     @@sapphire05 = Ore.new("Sapphire", 37, "clear", 9, 600, "sapphire", Sapphire_Ore.dup, false, 600)
     @@sapphire06 = Ore.new("Sapphire", 38, "clear", 9, 600, "sapphire", Sapphire_Ore.dup, false, 600)
    #.......................................................................................................................................................
    #................................................................Black Opal.............................................................................
     @@black_opal01 = Ore.new("Black Opal", 39, "clear", 6, 400, "black_opal", Black_Opal_Ore.dup, false, 400)
     @@black_opal02 = Ore.new("Black Opal", 40, "clear", 6, 400, "black_opal", Black_Opal_Ore.dup, false, 400)
     @@black_opal03 = Ore.new("Black Opal", 41, "clear", 6, 400, "black_opal", Black_Opal_Ore.dup, false, 400)
     @@black_opal04 = Ore.new("Black Opal", 42, "clear", 6, 400, "black_opal", Black_Opal_Ore.dup, false, 400)
     @@black_opal05 = Ore.new("Black Opal", 43, "clear", 6, 400, "black_opal", Black_Opal_Ore.dup, false, 400)
     @@black_opal06 = Ore.new("Black Opal", 44, "clear", 6, 400, "black_opal", Black_Opal_Ore.dup, false, 400)
    #.......................................................................................................................................................
    #.................................................................Ajoite................................................................................
     @@ajoite01 = Ore.new("Ajoite", 45, "clear", 3, 150, "ajoite", Ajoite_Ore.dup, false, 150)
     @@ajoite02 = Ore.new("Ajoite", 46, "clear", 3, 150, "ajoite", Ajoite_Ore.dup, false, 150)
     @@ajoite03 = Ore.new("Ajoite", 47, "clear", 3, 150, "ajoite", Ajoite_Ore.dup, false, 150)
     @@ajoite04 = Ore.new("Ajoite", 48, "clear", 3, 150, "ajoite", Ajoite_Ore.dup, false, 150)
     @@ajoite05 = Ore.new("Ajoite", 49, "clear", 3, 150, "ajoite", Ajoite_Ore.dup, false, 150)
     @@ajoite06 = Ore.new("Ajoite", 50, "clear", 3, 150, "ajoite", Ajoite_Ore.dup, false, 150)
    #.......................................................................................................................................................
    #................................................................Rhodolite..............................................................................
     @@rhodolite01 = Ore.new("Rhodolite", 51, "pink", 7, 500, "rhodolite", Rhodolite_Ore.dup, false, 500)
     @@rhodolite02 = Ore.new("Rhodolite", 52, "pink", 7, 500, "rhodolite", Rhodolite_Ore.dup, false, 500)
     @@rhodolite03 = Ore.new("Rhodolite", 53, "pink", 7, 500, "rhodolite", Rhodolite_Ore.dup, false, 500)
     @@rhodolite04 = Ore.new("Rhodolite", 54, "pink", 7, 500, "rhodolite", Rhodolite_Ore.dup, false, 500)
     @@rhodolite05 = Ore.new("Rhodolite", 55, "pink", 7, 500, "rhodolite", Rhodolite_Ore.dup, false, 500)
     @@rhodolite06 = Ore.new("Rhodolite", 56, "pink", 7, 500, "rhodolite", Rhodolite_Ore.dup, false, 500)
    #.......................................................................................................................................................
    #...............................................................Chalcanthite............................................................................
     @@chalcanthite01 = Ore.new("Chalcanthite", 57, "blue", 2, 100, "chalcanthite", Chalcanthite_Ore.dup, false, 100)
     @@chalcanthite02 = Ore.new("Chalcanthite", 58, "blue", 2, 100, "chalcanthite", Chalcanthite_Ore.dup, false, 100)
     @@chalcanthite03 = Ore.new("Chalcanthite", 59, "blue", 2, 100, "chalcanthite", Chalcanthite_Ore.dup, false, 100)
     @@chalcanthite04 = Ore.new("Chalcanthite", 60, "blue", 2, 100, "chalcanthite", Chalcanthite_Ore.dup, false, 100)
     @@chalcanthite05 = Ore.new("Chalcanthite", 61, "blue", 2, 100, "chalcanthite", Chalcanthite_Ore.dup, false, 100)
     @@chalcanthite06 = Ore.new("Chalcanthite", 62, "blue", 2, 100, "chalcanthite", Chalcanthite_Ore.dup, false, 100)
    #.......................................................................................................................................................
    #.................................................................Flourite..............................................................................
     @@flourite01 = Ore.new("Flourite", 63, "clear", 4, 200, "flourite", Flourite_Ore.dup, false, 200)
     @@flourite02 = Ore.new("Flourite", 64, "clear", 4, 200, "flourite", Flourite_Ore.dup, false, 200)
     @@flourite03 = Ore.new("Flourite", 65, "clear", 4, 200, "flourite", Flourite_Ore.dup, false, 200)
     @@flourite04 = Ore.new("Flourite", 66, "clear", 4, 200, "flourite", Flourite_Ore.dup, false, 200)
     @@flourite05 = Ore.new("Flourite", 67, "clear", 4, 200, "flourite", Flourite_Ore.dup, false, 200)
     @@flourite06 = Ore.new("Flourite", 68, "clear", 4, 200, "flourite", Flourite_Ore.dup, false, 200)
    #.......................................................................................................................................................
    #.................................................................Amorite...............................................................................
     @@amorite01 = Ore.new("Amorite", 69, "white", 6, 300, "amorite", Amorite_Ore.dup, false, 300)
     @@amorite02 = Ore.new("Amorite", 70, "white", 6, 300, "amorite", Amorite_Ore.dup, false, 300)
     @@amorite03 = Ore.new("Amorite", 71, "white", 6, 300, "amorite", Amorite_Ore.dup, false, 300)
     @@amorite04 = Ore.new("Amorite", 72, "white", 6, 300, "amorite", Amorite_Ore.dup, false, 300)
     @@amorite05 = Ore.new("Amorite", 73, "white", 6, 300, "amorite", Amorite_Ore.dup, false, 300)
     @@amorite06 = Ore.new("Amorite", 74, "white", 6, 300, "amorite", Amorite_Ore.dup, false, 300)
    #.......................................................................................................................................................
    #...............................................................Lapis Lazuli.............................................................................
     @@lapis_lazuli01 = Ore.new("Lapis Lazuli", 75, "blue", 6, 300, "lapis_lazuli", Lapis_Lazuli_Ore.dup, false, 300)
     @@lapis_lazuli02 = Ore.new("Lapis Lazuli", 76, "blue", 6, 300, "lapis_lazuli", Lapis_Lazuli_Ore.dup, false, 300)
     @@lapis_lazuli03 = Ore.new("Lapis Lazuli", 77, "blue", 6, 300, "lapis_lazuli", Lapis_Lazuli_Ore.dup, false, 300)
     @@lapis_lazuli04 = Ore.new("Lapis Lazuli", 78, "blue", 6, 300, "lapis_lazuli", Lapis_Lazuli_Ore.dup, false, 300)
     @@lapis_lazuli05 = Ore.new("Lapis Lazuli", 79, "blue", 6, 300, "lapis_lazuli", Lapis_Lazuli_Ore.dup, false, 300)
     @@lapis_lazuli06 = Ore.new("Lapis Lazuli", 80, "blue", 6, 300, "lapis_lazuli", Lapis_Lazuli_Ore.dup, false, 300)
    #........................................................................................................................................................
    #................................................................Moonstone...............................................................................
     @@moonstone01 = Ore.new("Moonstone", 81, "white", 6, 300, "moonstone", Moonstone_Ore.dup, false, 300)
     @@moonstone02 = Ore.new("Moonstone", 82, "white", 6, 300, "moonstone", Moonstone_Ore.dup, false, 300)
     @@moonstone03 = Ore.new("Moonstone", 83, "white", 6, 300, "moonstone", Moonstone_Ore.dup, false, 300)
     @@moonstone04 = Ore.new("Moonstone", 84, "white", 6, 300, "moonstone", Moonstone_Ore.dup, false, 300)
     @@moonstone05 = Ore.new("Moonstone", 85, "white", 6, 300, "moonstone", Moonstone_Ore.dup, false, 300)
     @@moonstone06 = Ore.new("Moonstone", 86, "white", 6, 300, "moonstone", Moonstone_Ore.dup, false, 300)
    #........................................................................................................................................................
    #..............................................................Blue Calcite..............................................................................
     @@blue_calcite01 = Ore.new("Blue Calcite", 87, "blue", 3, 250, "blue calcite", Blue_Calcite_Ore.dup, false, 250)
     @@blue_calcite02 = Ore.new("Blue Calcite", 88, "blue", 3, 250, "blue calcite", Blue_Calcite_Ore.dup, false, 250)
     @@blue_calcite03 = Ore.new("Blue Calcite", 89, "blue", 3, 250, "blue calcite", Blue_Calcite_Ore.dup, false, 250)
     @@blue_calcite04 = Ore.new("Blue Calcite", 90, "blue", 3, 250, "blue calcite", Blue_Calcite_Ore.dup, false, 250)
     @@blue_calcite05 = Ore.new("Blue Calcite", 91, "blue", 3, 250, "blue calcite", Blue_Calcite_Ore.dup, false, 250)
     @@blue_calcite06 = Ore.new("Blue Calcite", 92, "blue", 3, 250, "blue calcite", Blue_Calcite_Ore.dup, false, 250)
    #........................................................................................................................................................
    #................................................................Hiddenite...............................................................................
     @@hiddenite01 = Ore.new("Hiddenite", 93, "green", 7, 350, "hiddenite", Hiddenite_Ore.dup, false, 350)
    #........................................................................................................................................................
  end
  class Herbs
  def initialize(name : String, id : Int32, color : String, hp : Int32, drop_item : String, sprite : SF::Sprite, is_broke : Bool)
    @name = name
    @id = id
    @color = color
    @hp = hp
    @drop_item = drop_item
    @sprite = sprite
    @is_broke = is_broke
  end
  def name
    @name
  end
  def id
    @id
  end
  def color
    @color
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
  end
end

# if time >= SF.seconds(0.35) && @@attacking == true
#   Equipment.play_hit_sound
#  # this.current_hp - 10
#   Player_Attack_Clock.restart