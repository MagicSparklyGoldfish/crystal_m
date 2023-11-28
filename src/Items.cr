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
   Inventory_Ore_Array = [] of Inventory_Ore; Inventory_Metal_Ore_Array = [] of Inventory_Ore; 
   Ore_Array = [] of Inventory_Ore; Smelter_Ore_Sprite_Hash = Hash(String, SF::Sprite).new
 #OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
 #OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
 #OO                                                                 Ore Class                                                                             OO
 #OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
 #OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
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
     @@selected_ore_01 : Inventory_Ore; @@selected_ore_01 = @@nil_inventory_ore; @@selected_ore_02 : Inventory_Ore; @@selected_ore_02 = @@nil_inventory_ore
     @@selected_ore_sprite_01 : SF::Sprite; @@selected_ore_sprite_01 = Smelter_Nil_Sprite; @@selected_ore_sprite_02 : SF::Sprite
     @@selected_ore_sprite_02 = Smelter_Nil_Sprite  
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
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++Smelter Methods+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      #-------------------------------------------------------------Sort-------------------------------------------------------------------------------------
       def Inventory_Ore.sort_metal(window)
        s = Inventory_Ore_Array.size - 1; x = 0
        while x <= s
          if Inventory_Ore_Array[x].element == "none"
           Inventory_Metal_Ore_Array.push(Inventory_Ore_Array[x])
          end
          x += 1
         end
        end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #------------------------------------------------------------Select------------------------------------------------------------------------------------
       def Inventory_Ore.select_ore_one(window, cubby_number)
        if @@selected_ore_01 == @@nil_inventory_ore
         @@selected_ore_01 = Inventory_Metal_Ore_Array[cubby_number]
         @@selected_ore_sprite_01 = @@selected_ore_01.sprite.dup
         @@selected_ore_sprite_01.scale(SF.vector2(2, 2))
         @@selected_ore_sprite_01.position = SF.vector2(120, 0)
 
        else if @@selected_ore_01 != Inventory_Metal_Ore_Array[cubby_number]
         @@selected_ore_02 = Inventory_Metal_Ore_Array[cubby_number]
         @@selected_ore_sprite_02 = @@selected_ore_02.sprite.dup
         @@selected_ore_sprite_02.scale(SF.vector2(2, 2))
         @@selected_ore_sprite_02.position = SF.vector2(270, 0)
         end; end
        end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #----------------------------------------------------------Initialize----------------------------------------------------------------------------------
       def Inventory_Ore.initialize_smelter
        @@selected_ore_01 = @@nil_inventory_ore
        @@selected_ore_02 = @@nil_inventory_ore
        @@selected_ore_sprite_01 = Smelter_Nil_Sprite 
        @@selected_ore_sprite_02 = Smelter_Nil_Sprite 
       end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #-----------------------------------------------------------Display------------------------------------------------------------------------------------
       def Inventory_Ore.display_metal_smelter(window)  
        window.draw(@@selected_ore_sprite_01); window.draw(@@selected_ore_sprite_02)   
        if Inventory_Metal_Ore_Array.size >= 1
          metal_array_text_01 = Ore_amount_owned_text.dup
          metal_array_text_01.string = "x" + Inventory_Metal_Ore_Array[0].amount_owned.to_s
          Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[0].name].position = SF.vector2(25, -170)
          metal_array_text_01.position =  Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[0].name].position + SF.vector2(5, 25)
          window.draw(Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[0].name])
          window.draw(metal_array_text_01)
        end
        if Inventory_Metal_Ore_Array.size >= 2
          metal_array_text_02 = Ore_amount_owned_text.dup
          metal_array_text_02.string = "x" + Inventory_Metal_Ore_Array[1].amount_owned.to_s
          Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[1].name].position = SF.vector2(75, -170)
          metal_array_text_02.position =  Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[1].name].position + SF.vector2(5, 25)
          window.draw(Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[1].name])
          window.draw(metal_array_text_02)
        end
        if Inventory_Metal_Ore_Array.size >= 3
          metal_array_text_03 = Ore_amount_owned_text.dup
          metal_array_text_03.string = "x" + Inventory_Metal_Ore_Array[2].amount_owned.to_s
          Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[2].name].position = SF.vector2(125, -170)
          metal_array_text_03.position =  Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[2].name].position + SF.vector2(5, 25)
          window.draw(Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[2].name])
          window.draw(metal_array_text_03)
        end
       end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #-------------------------------------------------------------Smelt------------------------------------------------------------------------------------
       def Inventory_Ore.smelt
        case @@selected_ore_01.name
         when "Copper"
          Inventory_Ore.smelt_copper
         when "Tin"
          Inventory_Ore.smelt_tin
       end; end
       def Inventory_Ore.smelt_copper
        case @@selected_ore_02.name
         when "Nil"
          if @@copper.amount_owned >= 10
            amount = 10
            @@copper.remove_ore(amount)
         ingot = "copper"
          Inventory_Ingot.smelt_ingot(ingot)
          else
            All_Audio::SFX.light_bonk
          end
        when "Tin"
          if @@copper.amount_owned >= 4 && @@tin.amount_owned >= 2
            amount = 4
            @@copper.remove_ore(amount)
            amount = 2
            @@tin.remove_ore(amount)
         ingot = "bronze"
          Inventory_Ingot.smelt_ingot(ingot)
          else
            All_Audio::SFX.light_bonk
          end
        end
       end
       def Inventory_Ore.smelt_tin
        case @@selected_ore_02.name
        when "Nil"
          if @@tin.amount_owned >= 8
            amount = 8
            @@tin.remove_ore(amount)
         ingot = "tin"
          Inventory_Ingot.smelt_ingot(ingot)
          else
            All_Audio::SFX.light_bonk
          end
        when "Copper"
          if @@copper.amount_owned >= 4 && @@tin.amount_owned >= 2
            amount = 4
            @@copper.remove_ore(amount)
            amount = 2
            @@tin.remove_ore(amount)
         ingot = "bronze"
          Inventory_Ingot.smelt_ingot(ingot)
          else
            All_Audio::SFX.light_bonk
          end
        end
       end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     #++++++++++++++++++++++++++++++++++++++++++++++++++++++Inventory Ore Display++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
            end 
           when 3
             if Inventory_Ore_Array.size >= 37
              Inventory_Ore_Array[36].sprite.position = SF.vector2(555, 310);
              ore_array_text_37 = Ore_amount_owned_text.dup
              ore_array_text_37.position = Inventory_Ore_Array[36].sprite.position + SF.vector2(100, -5)
              ore_array_text_37.string = "x" + Inventory_Ore_Array[36].amount_owned.to_s
              window.draw(Inventory_Ore_Array[36].sprite); window.draw(ore_array_text_37)
             end
           when 4
             if Inventory_Ore_Array.size >= 55
              Inventory_Ore_Array[54].sprite.position = SF.vector2(555, 310);
              ore_array_text_55 = Ore_amount_owned_text.dup
              ore_array_text_55.position = Inventory_Ore_Array[54].sprite.position + SF.vector2(100, -5)
              ore_array_text_55.string = "x" + Inventory_Ore_Array[54].amount_owned.to_s
              window.draw(Inventory_Ore_Array[54].sprite); window.draw(ore_array_text_55)
             end
         end; end
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
            end 
           when 3
            if Inventory_Ore_Array.size >= 38
             Inventory_Ore_Array[37].sprite.position = SF.vector2(710, 310);
             ore_array_text_38 = Ore_amount_owned_text.dup
             ore_array_text_38.position = Inventory_Ore_Array[37].sprite.position + SF.vector2(100, -5)
             ore_array_text_38.string = "x" + Inventory_Ore_Array[37].amount_owned.to_s
             window.draw(Inventory_Ore_Array[37].sprite); window.draw(ore_array_text_38)
            end
           when 4
             if Inventory_Ore_Array.size >= 56
              Inventory_Ore_Array[55].sprite.position = SF.vector2(710, 310);
              ore_array_text_56 = Ore_amount_owned_text.dup
              ore_array_text_56.position = Inventory_Ore_Array[55].sprite.position + SF.vector2(100, -5)
              ore_array_text_56.string = "x" + Inventory_Ore_Array[55].amount_owned.to_s
              window.draw(Inventory_Ore_Array[55].sprite); window.draw(ore_array_text_56)
             end
         end; end
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
            end
           when 3
             if Inventory_Ore_Array.size >= 39
              Inventory_Ore_Array[38].sprite.position = SF.vector2(855, 310);
              ore_array_text_39 = Ore_amount_owned_text.dup
              ore_array_text_39.position = Inventory_Ore_Array[38].sprite.position + SF.vector2(100, -5)
              ore_array_text_39.string = "x" + Inventory_Ore_Array[38].amount_owned.to_s
              window.draw(Inventory_Ore_Array[38].sprite); window.draw(ore_array_text_39)
             end
           when 4
             if Inventory_Ore_Array.size >= 57
              Inventory_Ore_Array[56].sprite.position = SF.vector2(855, 310);
              ore_array_text_57 = Ore_amount_owned_text.dup
              ore_array_text_57.position = Inventory_Ore_Array[56].sprite.position + SF.vector2(100, -5)
              ore_array_text_57.string = "x" + Inventory_Ore_Array[56].amount_owned.to_s
              window.draw(Inventory_Ore_Array[56].sprite); window.draw(ore_array_text_57)
             end
          end; end
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
            end
           when 3
             if Inventory_Ore_Array.size >= 40
              Inventory_Ore_Array[39].sprite.position = SF.vector2(1005, 310);
              ore_array_text_40 = Ore_amount_owned_text.dup
              ore_array_text_40.position = Inventory_Ore_Array[39].sprite.position + SF.vector2(100, -5)
              ore_array_text_40.string = "x" + Inventory_Ore_Array[39].amount_owned.to_s
              window.draw(Inventory_Ore_Array[39].sprite); window.draw(ore_array_text_40)
             end
           when 4
             if Inventory_Ore_Array.size >= 58
              Inventory_Ore_Array[57].sprite.position = SF.vector2(1005, 310);
              ore_array_text_58 = Ore_amount_owned_text.dup
              ore_array_text_58.position = Inventory_Ore_Array[57].sprite.position + SF.vector2(100, -5)
              ore_array_text_58.string = "x" + Inventory_Ore_Array[57].amount_owned.to_s
              window.draw(Inventory_Ore_Array[57].sprite); window.draw(ore_array_text_58)
             end
         end; end
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
            end
           when 3
             if Inventory_Ore_Array.size >= 41
              Inventory_Ore_Array[40].sprite.position = SF.vector2(1155, 310);
              ore_array_text_41 = Ore_amount_owned_text.dup
              ore_array_text_41.position = Inventory_Ore_Array[40].sprite.position + SF.vector2(100, -5)
              ore_array_text_41.string = "x" + Inventory_Ore_Array[40].amount_owned.to_s
              window.draw(Inventory_Ore_Array[40].sprite); window.draw(ore_array_text_41)
             end
           when 4
             if Inventory_Ore_Array.size >= 59
              Inventory_Ore_Array[58].sprite.position = SF.vector2(1155, 310);
              ore_array_text_59 = Ore_amount_owned_text.dup
              ore_array_text_59.position = Inventory_Ore_Array[58].sprite.position + SF.vector2(100, -5)
              ore_array_text_59.string = "x" + Inventory_Ore_Array[58].amount_owned.to_s
              window.draw(Inventory_Ore_Array[58].sprite); window.draw(ore_array_text_59)
             end
          end; end
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
            end
           when 3
             if Inventory_Ore_Array.size >= 42
              Inventory_Ore_Array[41].sprite.position = SF.vector2(1305, 310);
              ore_array_text_42 = Ore_amount_owned_text.dup
              ore_array_text_42.position = Inventory_Ore_Array[41].sprite.position + SF.vector2(100, -5)
              ore_array_text_42.string = "x" + Inventory_Ore_Array[41].amount_owned.to_s
              window.draw(Inventory_Ore_Array[41].sprite); window.draw(ore_array_text_42)
             end
           when 4
             if Inventory_Ore_Array.size >= 60
              Inventory_Ore_Array[59].sprite.position = SF.vector2(1305, 310);
              ore_array_text_60 = Ore_amount_owned_text.dup
              ore_array_text_60.position = Inventory_Ore_Array[59].sprite.position + SF.vector2(100, -5)
              ore_array_text_60.string = "x" + Inventory_Ore_Array[59].amount_owned.to_s
              window.draw(Inventory_Ore_Array[59].sprite); window.draw(ore_array_text_60)
             end
          end; end
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
            end
           when 3
            if Inventory_Ore_Array.size >= 43
             Inventory_Ore_Array[42].sprite.position = SF.vector2(555, 460);
             ore_array_text_43 = Ore_amount_owned_text.dup
             ore_array_text_43.position = Inventory_Ore_Array[42].sprite.position + SF.vector2(100, -5)
             ore_array_text_43.string = "x" + Inventory_Ore_Array[42].amount_owned.to_s
             window.draw(Inventory_Ore_Array[42].sprite); window.draw(ore_array_text_43)
            end
           when 4
             if Inventory_Ore_Array.size >= 61
              Inventory_Ore_Array[60].sprite.position = SF.vector2(555, 460);
              ore_array_text_61 = Ore_amount_owned_text.dup
              ore_array_text_61.position = Inventory_Ore_Array[60].sprite.position + SF.vector2(100, -5)
              ore_array_text_61.string = "x" + Inventory_Ore_Array[60].amount_owned.to_s
              window.draw(Inventory_Ore_Array[60].sprite); window.draw(ore_array_text_61)
             end
          end; end
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
            end
           when 3
             if Inventory_Ore_Array.size >= 44
              Inventory_Ore_Array[43].sprite.position = SF.vector2(710, 460);
              ore_array_text_44 = Ore_amount_owned_text.dup
              ore_array_text_44.position = Inventory_Ore_Array[43].sprite.position + SF.vector2(100, -5)
              ore_array_text_44.string = "x" + Inventory_Ore_Array[43].amount_owned.to_s
              window.draw(Inventory_Ore_Array[43].sprite); window.draw(ore_array_text_44)
             end
           when 4
             if Inventory_Ore_Array.size >= 62
              Inventory_Ore_Array[61].sprite.position = SF.vector2(710, 460);
              ore_array_text_62 = Ore_amount_owned_text.dup
              ore_array_text_62.position = Inventory_Ore_Array[61].sprite.position + SF.vector2(100, -5)
              ore_array_text_62.string = "x" + Inventory_Ore_Array[61].amount_owned.to_s
              window.draw(Inventory_Ore_Array[61].sprite); window.draw(ore_array_text_62)
             end
          end; end
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
            end
           when 3
            if Inventory_Ore_Array.size >= 45
             Inventory_Ore_Array[44].sprite.position = SF.vector2(855, 460);
             ore_array_text_45 = Ore_amount_owned_text.dup
             ore_array_text_45.position = Inventory_Ore_Array[44].sprite.position + SF.vector2(100, -5)
             ore_array_text_45.string = "x" + Inventory_Ore_Array[44].amount_owned.to_s
             window.draw(Inventory_Ore_Array[44].sprite); window.draw(ore_array_text_45)
            end
           when 4
             if Inventory_Ore_Array.size >= 63
              Inventory_Ore_Array[62].sprite.position = SF.vector2(855, 460);
              ore_array_text_63 = Ore_amount_owned_text.dup
              ore_array_text_63.position = Inventory_Ore_Array[62].sprite.position + SF.vector2(100, -5)
              ore_array_text_63.string = "x" + Inventory_Ore_Array[62].amount_owned.to_s
              window.draw(Inventory_Ore_Array[62].sprite); window.draw(ore_array_text_63)
             end
          end; end
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
            end
           when 3
            if Inventory_Ore_Array.size >= 46
             Inventory_Ore_Array[45].sprite.position = SF.vector2(1005, 460);
             ore_array_text_46 = Ore_amount_owned_text.dup
             ore_array_text_46.position = Inventory_Ore_Array[45].sprite.position + SF.vector2(100, -5)
             ore_array_text_46.string = "x" + Inventory_Ore_Array[45].amount_owned.to_s
             window.draw(Inventory_Ore_Array[45].sprite); window.draw(ore_array_text_46)
            end
           when 4
             if Inventory_Ore_Array.size >= 64
              Inventory_Ore_Array[63].sprite.position = SF.vector2(1005, 460);
              ore_array_text_64 = Ore_amount_owned_text.dup
              ore_array_text_64.position = Inventory_Ore_Array[63].sprite.position + SF.vector2(100, -5)
              ore_array_text_64.string = "x" + Inventory_Ore_Array[63].amount_owned.to_s
              window.draw(Inventory_Ore_Array[63].sprite); window.draw(ore_array_text_64)
             end
         end; end
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
            end
           when 3
            if Inventory_Ore_Array.size >= 47
             Inventory_Ore_Array[46].sprite.position = SF.vector2(1155, 460);
             ore_array_text_47 = Ore_amount_owned_text.dup
             ore_array_text_47.position = Inventory_Ore_Array[46].sprite.position + SF.vector2(100, -5)
             ore_array_text_47.string = "x" + Inventory_Ore_Array[46].amount_owned.to_s
             window.draw(Inventory_Ore_Array[46].sprite); window.draw(ore_array_text_47)
            end
           when 4
             if Inventory_Ore_Array.size >= 65
              Inventory_Ore_Array[64].sprite.position = SF.vector2(1155, 460);
              ore_array_text_65 = Ore_amount_owned_text.dup
              ore_array_text_65.position = Inventory_Ore_Array[64].sprite.position + SF.vector2(100, -5)
              ore_array_text_65.string = "x" + Inventory_Ore_Array[64].amount_owned.to_s
              window.draw(Inventory_Ore_Array[64].sprite); window.draw(ore_array_text_65)
             end
          end; end
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
           end
          when 3
           if Inventory_Ore_Array.size >= 48
            Inventory_Ore_Array[47].sprite.position = SF.vector2(1305, 460);
            ore_array_text_48 = Ore_amount_owned_text.dup
            ore_array_text_48.position = Inventory_Ore_Array[47].sprite.position + SF.vector2(100, -5)
            ore_array_text_48.string = "x" + Inventory_Ore_Array[47].amount_owned.to_s
            window.draw(Inventory_Ore_Array[47].sprite); window.draw(ore_array_text_48)
           end
          when 4
           if Inventory_Ore_Array.size >= 66
            Inventory_Ore_Array[65].sprite.position = SF.vector2(1305, 460);
            ore_array_text_66 = Ore_amount_owned_text.dup
            ore_array_text_66.position = Inventory_Ore_Array[65].sprite.position + SF.vector2(100, -5)
            ore_array_text_66.string = "x" + Inventory_Ore_Array[65].amount_owned.to_s
            window.draw(Inventory_Ore_Array[65].sprite); window.draw(ore_array_text_66)
           end
         end; end
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
           end
          when 3
           if Inventory_Ore_Array.size >= 49
            Inventory_Ore_Array[48].sprite.position = SF.vector2(555, 610);
            ore_array_text_49 = Ore_amount_owned_text.dup
            ore_array_text_49.position = Inventory_Ore_Array[48].sprite.position + SF.vector2(100, -5)
            ore_array_text_49.string = "x" + Inventory_Ore_Array[48].amount_owned.to_s
            window.draw(Inventory_Ore_Array[48].sprite); window.draw(ore_array_text_49)
           end
          when 4
           if Inventory_Ore_Array.size >= 67
            Inventory_Ore_Array[66].sprite.position = SF.vector2(555, 610);
            ore_array_text_67 = Ore_amount_owned_text.dup
            ore_array_text_67.position = Inventory_Ore_Array[66].sprite.position + SF.vector2(100, -5)
            ore_array_text_67.string = "x" + Inventory_Ore_Array[66].amount_owned.to_s
            window.draw(Inventory_Ore_Array[66].sprite); window.draw(ore_array_text_67)
           end
        end; end
       #----------------------------------------------------slot 14------------------------------------------
        if Inventory_Ore_Array.size >= 14
         case page
          when 1   
           Inventory_Ore_Array[13].sprite.position = SF.vector2(710, 610);
           ore_array_text_14 = Ore_amount_owned_text.dup
           ore_array_text_14.position = Inventory_Ore_Array[13].sprite.position + SF.vector2(100, -5)
           ore_array_text_14.string = "x" + Inventory_Ore_Array[13].amount_owned.to_s
           window.draw(Inventory_Ore_Array[13].sprite); window.draw(ore_array_text_14)
          when 2
           if Inventory_Ore_Array.size >= 32
           Inventory_Ore_Array[31].sprite.position = SF.vector2(710, 610);
           ore_array_text_32 = Ore_amount_owned_text.dup
           ore_array_text_32.position = Inventory_Ore_Array[31].sprite.position + SF.vector2(100, -5)
           ore_array_text_32.string = "x" + Inventory_Ore_Array[31].amount_owned.to_s
           window.draw(Inventory_Ore_Array[31].sprite); window.draw(ore_array_text_32)
           end
          when 3
           if Inventory_Ore_Array.size >= 50
            Inventory_Ore_Array[49].sprite.position = SF.vector2(710, 610);
            ore_array_text_50 = Ore_amount_owned_text.dup
            ore_array_text_50.position = Inventory_Ore_Array[49].sprite.position + SF.vector2(100, -5)
            ore_array_text_50.string = "x" + Inventory_Ore_Array[49].amount_owned.to_s
            window.draw(Inventory_Ore_Array[49].sprite); window.draw(ore_array_text_50)
           end
          when 4
           if Inventory_Ore_Array.size >= 68
            Inventory_Ore_Array[67].sprite.position = SF.vector2(710, 610);
            ore_array_text_68 = Ore_amount_owned_text.dup
            ore_array_text_68.position = Inventory_Ore_Array[67].sprite.position + SF.vector2(100, -5)
            ore_array_text_68.string = "x" + Inventory_Ore_Array[67].amount_owned.to_s
            window.draw(Inventory_Ore_Array[67].sprite); window.draw(ore_array_text_68)
           end
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
          when 2
           if Inventory_Ore_Array.size >= 33
           Inventory_Ore_Array[32].sprite.position = SF.vector2(855, 610);
           ore_array_text_33 = Ore_amount_owned_text.dup
           ore_array_text_33.position = Inventory_Ore_Array[32].sprite.position + SF.vector2(100, -5)
           ore_array_text_33.string = "x" + Inventory_Ore_Array[32].amount_owned.to_s
           window.draw(Inventory_Ore_Array[32].sprite); window.draw(ore_array_text_33)
           end
          when 3
           if Inventory_Ore_Array.size >= 51
            Inventory_Ore_Array[50].sprite.position = SF.vector2(855, 610);
            ore_array_text_51 = Ore_amount_owned_text.dup
            ore_array_text_51.position = Inventory_Ore_Array[50].sprite.position + SF.vector2(100, -5)
            ore_array_text_51.string = "x" + Inventory_Ore_Array[50].amount_owned.to_s
            window.draw(Inventory_Ore_Array[50].sprite); window.draw(ore_array_text_51)
           end
          when 4
           if Inventory_Ore_Array.size >= 69
            Inventory_Ore_Array[68].sprite.position = SF.vector2(855, 610);
            ore_array_text_69 = Ore_amount_owned_text.dup
            ore_array_text_69.position = Inventory_Ore_Array[68].sprite.position + SF.vector2(100, -5)
            ore_array_text_69.string = "x" + Inventory_Ore_Array[68].amount_owned.to_s
            window.draw(Inventory_Ore_Array[68].sprite); window.draw(ore_array_text_69)
           end
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
           when 2
            if Inventory_Ore_Array.size >= 34
             Inventory_Ore_Array[33].sprite.position = SF.vector2(1005, 610);
             ore_array_text_34 = Ore_amount_owned_text.dup
             ore_array_text_34.position = Inventory_Ore_Array[33].sprite.position + SF.vector2(100, -5)
             ore_array_text_34.string = "x" + Inventory_Ore_Array[33].amount_owned.to_s
             window.draw(Inventory_Ore_Array[33].sprite); window.draw(ore_array_text_34)
            end
           when 3
            if Inventory_Ore_Array.size >= 52
             Inventory_Ore_Array[51].sprite.position = SF.vector2(1005, 610);
             ore_array_text_52 = Ore_amount_owned_text.dup
             ore_array_text_52.position = Inventory_Ore_Array[51].sprite.position + SF.vector2(100, -5)
             ore_array_text_52.string = "x" + Inventory_Ore_Array[51].amount_owned.to_s
             window.draw(Inventory_Ore_Array[51].sprite); window.draw(ore_array_text_52)
            end
           when 4
             if Inventory_Ore_Array.size >= 70
              Inventory_Ore_Array[69].sprite.position = SF.vector2(1005, 610);
              ore_array_text_70 = Ore_amount_owned_text.dup
              ore_array_text_70.position = Inventory_Ore_Array[69].sprite.position + SF.vector2(100, -5)
              ore_array_text_70.string = "x" + Inventory_Ore_Array[69].amount_owned.to_s
              window.draw(Inventory_Ore_Array[69].sprite); window.draw(ore_array_text_70)
             end
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
           when 2
            if Inventory_Ore_Array.size >= 35
             Inventory_Ore_Array[34].sprite.position = SF.vector2(1155, 610);
             ore_array_text_35 = Ore_amount_owned_text.dup
             ore_array_text_35.position = Inventory_Ore_Array[34].sprite.position + SF.vector2(100, -5)
             ore_array_text_35.string = "x" + Inventory_Ore_Array[34].amount_owned.to_s
             window.draw(Inventory_Ore_Array[34].sprite); window.draw(ore_array_text_35)
            end
           when 3
             if Inventory_Ore_Array.size >= 53
              Inventory_Ore_Array[52].sprite.position = SF.vector2(1155, 610);
              ore_array_text_53 = Ore_amount_owned_text.dup
              ore_array_text_53.position = Inventory_Ore_Array[52].sprite.position + SF.vector2(100, -5)
              ore_array_text_53.string = "x" + Inventory_Ore_Array[52].amount_owned.to_s
              window.draw(Inventory_Ore_Array[52].sprite); window.draw(ore_array_text_53)
             end
           when 4
             if Inventory_Ore_Array.size >= 71
              Inventory_Ore_Array[70].sprite.position = SF.vector2(1155, 610);
              ore_array_text_71 = Ore_amount_owned_text.dup
              ore_array_text_71.position = Inventory_Ore_Array[70].sprite.position + SF.vector2(100, -5)
              ore_array_text_71.string = "x" + Inventory_Ore_Array[70].amount_owned.to_s
              window.draw(Inventory_Ore_Array[70].sprite); window.draw(ore_array_text_71)
             end
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
           when 2
            if Inventory_Ore_Array.size >= 36
             Inventory_Ore_Array[35].sprite.position = SF.vector2(1305, 610);
             ore_array_text_36 = Ore_amount_owned_text.dup
             ore_array_text_36.position = Inventory_Ore_Array[35].sprite.position + SF.vector2(100, -5)
             ore_array_text_36.string = "x" + Inventory_Ore_Array[35].amount_owned.to_s
             window.draw(Inventory_Ore_Array[35].sprite); window.draw(ore_array_text_36)
            end
           when 3
             if Inventory_Ore_Array.size >= 54
              Inventory_Ore_Array[53].sprite.position = SF.vector2(1305, 610);
              ore_array_text_54 = Ore_amount_owned_text.dup
              ore_array_text_54.position = Inventory_Ore_Array[53].sprite.position + SF.vector2(100, -5)
              ore_array_text_54.string = "x" + Inventory_Ore_Array[53].amount_owned.to_s
              window.draw(Inventory_Ore_Array[53].sprite); window.draw(ore_array_text_54)
             end
           when 4
             if Inventory_Ore_Array.size >= 72
              Inventory_Ore_Array[71].sprite.position = SF.vector2(1305, 610);
              ore_array_text_72 = Ore_amount_owned_text.dup
              ore_array_text_72.position = Inventory_Ore_Array[71].sprite.position + SF.vector2(100, -5)
              ore_array_text_72.string = "x" + Inventory_Ore_Array[71].amount_owned.to_s
              window.draw(Inventory_Ore_Array[71].sprite); window.draw(ore_array_text_72)
             end
        end; end
      end    
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            
      #________________________________________________________________________________________________________________________________________________________
    #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #/                                                               Entities                                                                               /
    #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      @@nil_inventory_ore = Inventory_Ore.new("Nil", 0, Smelter_Nil_Sprite, 0, "clear", "nil", "nil", 0)
     #///////////////////////////////////////////////////////////////Minerals\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
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
      #--------------------------------------------------------------Offretite------------------------------------------------------------------------------- 
       @@offretite = Inventory_Ore.new("Offretite", 19, Offretite_Inventory_Ore, 1, "clear", "air", "INT+", 70)
       Ore_Array.push(@@offretite)
      #-----------------------------------------------------------Holley Blue Agate-------------------------------------------------------------------------- 
       @@holley_blue_agate = Inventory_Ore.new("Holley Blue Agate", 20, Holley_Blue_Agate_Inventory_Ore, 1, "blue", "air", "STR+", 70)
       Ore_Array.push(@@holley_blue_agate)
      #--------------------------------------------------------------Ametrine-------------------------------------------------------------------------------- 
       @@ametrine = Inventory_Ore.new("Ametrine", 21, Ametrine_Inventory_Ore, 1, "purple", "air", "STR+", 70)
       Ore_Array.push(@@ametrine)
      #------------------------------------------------------------Hemimorphite------------------------------------------------------------------------------ 
       @@hemimorphite = Inventory_Ore.new("Hemimorphite", 22, Hemimorphite_Inventory_Ore, 1, "purple", "air", "INT+", 70)
       Ore_Array.push(@@hemimorphite)
      #-----------------------------------------------------------Tiffany Stone------------------------------------------------------------------------------ 
       @@tiffany_stone = Inventory_Ore.new("Tiffany Stone", 23, Tiffany_Stone_Inventory_Ore, 1, "purple", "air", "LUK+", 70)
       Ore_Array.push(@@tiffany_stone)
      #--------------------------------------------------------------Azurite--------------------------------------------------------------------------------- 
       @@azurite = Inventory_Ore.new("Azurite", 24, Azurite_Inventory_Ore, 1, "blue", "air", "DEX+", 70)
       Ore_Array.push(@@azurite)
      #--------------------------------------------------------------Howlite--------------------------------------------------------------------------------- 
       @@howlite = Inventory_Ore.new("Howlite", 25, Howlite_Inventory_Ore, 1, "white", "air", "DEX+", 70)
       Ore_Array.push(@@howlite)
      #--------------------------------------------------------------Angelite--------------------------------------------------------------------------------- 
       @@angelite = Inventory_Ore.new("Angelite", 26, Angelite_Inventory_Ore, 1, "blue", "air", "LUK+", 70)
       Ore_Array.push(@@angelite)
      #-----------------------------------------------------------Blue Lace Agate------------------------------------------------------------------------------ 
       @@blue_lace_agate = Inventory_Ore.new("Blue Lace Agate", 27, Blue_Lace_Agate_Inventory_Ore, 1, "blue", "air", "INT+", 70)
       Ore_Array.push(@@blue_lace_agate)
      #---------------------------------------------------------------Iolite----------------------------------------------------------------------------------- 
       @@iolite = Inventory_Ore.new("Iolite", 28, Iolite_Inventory_Ore, 1, "blue", "air", "INT+", 70)
       Ore_Array.push(@@iolite)
      #--------------------------------------------------------------Sodalite---------------------------------------------------------------------------------- 
       @@sodalite = Inventory_Ore.new("Sodalite", 29, Sodalite_Inventory_Ore, 1, "blue", "air", "passive_mp_regen", 70)
       Ore_Array.push(@@sodalite)
      #--------------------------------------------------------------Kyanite---------------------------------------------------------------------------------- 
       @@kyanite = Inventory_Ore.new("Kyanite", 30, Kyanite_Inventory_Ore, 1, "blue", "air", "LUK+", 70)
       Ore_Array.push(@@kyanite)
      #--------------------------------------------------------------Sunstone--------------------------------------------------------------------------------- 
       @@sunstone = Inventory_Ore.new("Sunstone", 31, Sunstone_Inventory_Ore, 1, "orange", "fire", "LUK+", 70)
       Ore_Array.push(@@sunstone)
      #-------------------------------------------------------------Bony Amber-------------------------------------------------------------------------------- 
       @@bony_amber = Inventory_Ore.new("Bony Amber", 32, Bony_Amber_Inventory_Ore, 1, "orange", "fire", "passive_hp_regen", 70)
       Ore_Array.push(@@bony_amber)
      #-------------------------------------------------------------Blue Amber-------------------------------------------------------------------------------- 
       @@blue_amber = Inventory_Ore.new("Blue Amber", 33, Blue_Amber_Inventory_Ore, 1, "blue", "fire", "passive_mp_regen", 70)
       Ore_Array.push(@@blue_amber)
      #-------------------------------------------------------------Blue Spinel-------------------------------------------------------------------------------- 
       @@blue_spinel = Inventory_Ore.new("Blue Spinel", 34, Blue_Spinel_Inventory_Ore, 1, "blue", "fire", "DEX+", 70)
       Ore_Array.push(@@blue_spinel)
      #-------------------------------------------------------------Red Spinel-------------------------------------------------------------------------------- 
       @@red_spinel = Inventory_Ore.new("Red Spinel", 35, Red_Spinel_Inventory_Ore, 1, "red", "fire", "STR+", 70)
       Ore_Array.push(@@red_spinel)
      #--------------------------------------------------------------Fire Opal-------------------------------------------------------------------------------- 
       @@fire_opal = Inventory_Ore.new("Fire Opal", 36, Fire_Opal_Inventory_Ore, 1, "orange", "fire", "HP+", 70)
       Ore_Array.push(@@fire_opal)
      #---------------------------------------------------------------Garnet---------------------------------------------------------------------------------- 
       @@garnet = Inventory_Ore.new("Garnet", 37, Garnet_Inventory_Ore, 1, "red", "fire", "HP+", 70)
       Ore_Array.push(@@garnet)
      #----------------------------------------------------------------Ruby----------------------------------------------------------------------------------- 
       @@ruby = Inventory_Ore.new("Ruby", 38, Ruby_Inventory_Ore, 1, "red", "fire", "STR+", 70)
       Ore_Array.push(@@ruby)
      #------------------------------------------------------------Cherry Quartz------------------------------------------------------------------------------- 
       @@cherry_quartz = Inventory_Ore.new("Cherry Quartz", 39, Cherry_Quartz_Inventory_Ore, 1, "red", "fire", "HP+", 70)
       Ore_Array.push(@@cherry_quartz)
      #------------------------------------------------------------Lemon Quartz------------------------------------------------------------------------------- 
       @@lemon_quartz = Inventory_Ore.new("Lemon Quartz", 40, Lemon_Quartz_Inventory_Ore, 1, "yellow", "fire", "drop_rate+", 70)
       Ore_Array.push(@@lemon_quartz)
      #--------------------------------------------------------------Turquoise-------------------------------------------------------------------------------- 
       @@turquoise = Inventory_Ore.new("Turquoise", 41, Turquoise_Inventory_Ore, 1, "green", "fire", "LUK+", 70)
       Ore_Array.push(@@turquoise)
      #-------------------------------------------------------------Tiger's Eye------------------------------------------------------------------------------- 
       @@tigers_eye = Inventory_Ore.new("Tiger's Eye", 42, Tigers_Eye_Inventory_Ore, 1, "orange", "fire", "DEX+", 70)
       Ore_Array.push(@@tigers_eye)
      #-------------------------------------------------------------Orange Calcite------------------------------------------------------------------------------- 
       @@orange_calcite = Inventory_Ore.new("Orange Calcite", 43, Orange_Calcite_Inventory_Ore, 1, "orange", "fire", "HP+", 70)
       Ore_Array.push(@@orange_calcite)
      #--------------------------------------------------------------Grape Agate-------------------------------------------------------------------------------- 
       @@grape_agate = Inventory_Ore.new("Grape Agate", 44, Grape_Agate_Inventory_Ore, 1, "purple", "earth", "INT+", 70)
       Ore_Array.push(@@grape_agate)
      #-----------------------------------------------------------------Jade-------------------------------------------------------------------------------- 
       @@jade = Inventory_Ore.new("Jade", 45, Jade_Inventory_Ore, 1, "green", "earth", "LUK+", 70)
       Ore_Array.push(@@jade)
      #---------------------------------------------------------------Diamond------------------------------------------------------------------------------- 
       @@diamond = Inventory_Ore.new("Diamond", 46, Diamond_Inventory_Ore, 1, "white", "earth", "DROP+++", 70)
       Ore_Array.push(@@diamond)
      #---------------------------------------------------------------Emerald------------------------------------------------------------------------------- 
       @@emerald = Inventory_Ore.new("Emerald", 47, Emerald_Inventory_Ore, 1, "green", "earth", "EXP++", 70)
       Ore_Array.push(@@emerald)
      #---------------------------------------------------------------Painite------------------------------------------------------------------------------- 
       @@painite = Inventory_Ore.new("Painite", 48, Painite_Inventory_Ore, 1, "green", "earth", "EXP+++", 70)
       Ore_Array.push(@@painite)
      #----------------------------------------------------------Bumblebee Jasper--------------------------------------------------------------------------- 
       @@bumblebee_jasper = Inventory_Ore.new("Bumblebee Jasper", 49, Bumblebee_Jasper_Inventory_Ore, 1, "yellow", "earth", "DEX+", 70)
       Ore_Array.push(@@bumblebee_jasper)
      #------------------------------------------------------------Blood Jasper----------------------------------------------------------------------------- 
       @@blood_jasper = Inventory_Ore.new("Blood Jasper", 50, Blood_Jasper_Inventory_Ore, 1, "green", "earth", "STR+", 70)
       Ore_Array.push(@@blood_jasper)
      #------------------------------------------------------------Mook Jasper----------------------------------------------------------------------------- 
       @@mook_jasper = Inventory_Ore.new("Mook Jasper", 51, Mook_Jasper_Inventory_Ore, 1, "brown", "earth", "LUK+", 70)
       Ore_Array.push(@@mook_jasper)
      #------------------------------------------------------------Red Jasper------------------------------------------------------------------------------ 
       @@red_jasper = Inventory_Ore.new("Red Jasper", 52, Red_Jasper_Inventory_Ore, 1, "red", "earth", "INT+", 70)
       Ore_Array.push(@@red_jasper)
     #________________________________________________________________________________________________________________________________________________________
     #////////////////////////////////////////////////////////////////Metals\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      #---------------------------------------------------------------Carbon--------------------------------------------------------------------------------- 
       @@carbon = Inventory_Ore.new("Carbon", 1000, Carbon_Inventory_Ore, 1, "black", "none", "none", 70)
       Ore_Array.push(@@carbon); Smelter_Ore_Sprite_Hash["Carbon"] = Carbon_Smelter_Ore
      #---------------------------------------------------------------Copper--------------------------------------------------------------------------------- 
       @@copper = Inventory_Ore.new("Copper", 1001, Copper_Inventory_Ore, 1, "brown", "none", "none", 70)
       Ore_Array.push(@@copper); Smelter_Ore_Sprite_Hash["Copper"] = Copper_Smelter_Ore
      #----------------------------------------------------------------Tin----------------------------------------------------------------------------------- 
       @@tin = Inventory_Ore.new("Tin", 1002, Tin_Inventory_Ore, 1, "white", "none", "none", 70)
       Ore_Array.push(@@tin); Smelter_Ore_Sprite_Hash["Tin"] = Tin_Smelter_Ore
     #________________________________________________________________________________________________________________________________________________________
   end
 #IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
 #IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
 #II                                                               Ingot Class                                                                            II
 #IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
 #IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
   Ingot_Array = [] of Inventory_Ingot; Owned_Ingot_Array = [] of Inventory_Ingot
  class Inventory_Ingot
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, id : Int32, sprite : SF::Sprite, amount_owned : Int32, sell_price : Int32)
      @name = name
      @id = id
      @sprite = sprite
      @amount_owned = amount_owned
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
    def sell_price
      @sell_price
     end
    def amount_owned=(value : Int32)
      @amount_owned = value
     end
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    #-------------------------------------------------------------Player Skill------------------------------------------------------------------------------
     @@smelting_lvl : Int32; @@smelting_lvl = 1; @@smelting_exp : Int32; @@smelting_exp = 0; @@needed_exp : Int32;
     @@needed_exp = 50 * (2 ** @@smelting_lvl)
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Display+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     def Inventory_Ingot.initialize_inventory
      s = Ingot_Array.size; i = 0
      while i < s
        if Ingot_Array[i].amount_owned > 0
          Owned_Ingot_Array.push(Ingot_Array[i])
        end
        i += 1
        puts Owned_Ingot_Array
      end
     end

     def Inventory_Ingot.display_ingot(window, page)
      Owned_Ingot_Array.uniq!
      #----------------------------------------------------slot 1-------------------------------------------
       if Owned_Ingot_Array.size >= 1
        case page
         when 1   
          Owned_Ingot_Array[0].sprite.position = SF.vector2(555, 310);
          ore_array_text_01 = Ore_amount_owned_text.dup
          ore_array_text_01.position = Owned_Ingot_Array[0].sprite.position + SF.vector2(100, -5)
          ore_array_text_01.string = "x" + Owned_Ingot_Array[0].amount_owned.to_s
          window.draw(Owned_Ingot_Array[0].sprite); window.draw(ore_array_text_01)
         end
        end
      #----------------------------------------------------slot 2-------------------------------------------
       if Owned_Ingot_Array.size >= 2
        case page
         when 1   
          Owned_Ingot_Array[1].sprite.position = SF.vector2(710, 310);
          ore_array_text_02 = Ore_amount_owned_text.dup
          ore_array_text_02.position = Owned_Ingot_Array[1].sprite.position + SF.vector2(100, -5)
          ore_array_text_02.string = "x" + Owned_Ingot_Array[1].amount_owned.to_s
          window.draw(Owned_Ingot_Array[1].sprite); window.draw(ore_array_text_02)
         end
        end
      #----------------------------------------------------slot 3-------------------------------------------
        if Owned_Ingot_Array.size >= 3
         case page
          when 1   
            Owned_Ingot_Array[2].sprite.position = SF.vector2(855, 310);
           ore_array_text_03 = Ore_amount_owned_text.dup
           ore_array_text_03.position = Owned_Ingot_Array[2].sprite.position + SF.vector2(100, -5)
           ore_array_text_03.string = "x" + Owned_Ingot_Array[2].amount_owned.to_s
           window.draw(Owned_Ingot_Array[2].sprite); window.draw(ore_array_text_03)
          end
         end
      #----------------------------------------------------slot 4-------------------------------------------
        if Owned_Ingot_Array.size >= 4
         case page
          when 1   
            Owned_Ingot_Array[3].sprite.position = SF.vector2(1005, 310);
           ore_array_text_04 = Ore_amount_owned_text.dup
           ore_array_text_04.position = Owned_Ingot_Array[3].sprite.position + SF.vector2(100, -5)
           ore_array_text_04.string = "x" + Owned_Ingot_Array[3].amount_owned.to_s
           window.draw(Owned_Ingot_Array[3].sprite); window.draw(ore_array_text_04)
          end
        end
     end
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Player Skill+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++Amount Owned Methods++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     def Inventory_Ingot.smelt_ingot(ingot)
      a = 0; r = 0
      case ingot
       when "copper"
        difficulty = 2; ingot = @@copper_ingot
        Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
      when "tin"
        difficulty = 1; ingot = @@tin_ingot
        Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
      when "bronze"
        difficulty = 2; ingot = @@bronze_ingot
        Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
       end
     end
     def Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
      l = @@smelting_lvl; r = 0; a = 1; i = 0; u = 0
      i = difficulty - l
      if i < 0
        i = 0
      end
      u = 10 + i
      Random.new.rand(1..u)
      if r <= 5
        a += 1
        @@smelting_exp += 10
      end
      if r <= 1
        a += 1
        @@smelting_exp += 5
      end
      ingot.amount_owned += a
      Inventory_Ingot.initialize_inventory
      end
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #---------------------------------------------------------------Copper--------------------------------------------------------------------------------- 
     @@copper_ingot = Inventory_Ingot.new("Copper", 0, Copper_Ingot_Ore, 0, 10)
     Ingot_Array.push(@@copper_ingot)
    #----------------------------------------------------------------Tin--------------------------------------------------------------------------------- 
     @@tin_ingot = Inventory_Ingot.new("Tin", 0, Tin_Ingot_Ore, 0, 10)
     Ingot_Array.push(@@tin_ingot)
    #--------------------------------------------------------------Bronze-------------------------------------------------------------------------------- 
     @@bronze_ingot = Inventory_Ingot.new("Bronze", 0, Bronze_Ingot_Ore, 0, 10)
     Ingot_Array.push(@@bronze_ingot)
   end
end 


module Harvestables
  extend self
  class Ore
    Test_Ore_Array = [@@bloodstone_01, @@bloodstone_02, @@bloodstone_03, @@moss_agate_01, @@amber01, @@wavellite01,  @@topaz01, @@amethyst01,
    @@smokey_quartz01, @@sapphire01, @@black_opal01, @@ajoite01, @@rhodolite01, @@chalcanthite01, @@flourite01, @@amorite01, @@lapis_lazuli01,
    @@moonstone01, @@blue_calcite01, @@hiddenite01, @@ofretite01, @@holley_blue_agate01, @@ametrine01, @@hemimorphite01, @@tiffany_stone01,
    @@azurite01, @@howlite01, @@angelite01, @@blue_lace_agate01, @@iolite01, @@sodalite01, @@kyanite01, @@sunstone01, @@bony_amber01, @@blue_amber01,
    @@blue_spinel01, @@red_spinel01, @@fire_opal01, @@garnet01, @@ruby01, @@cherry_quartz01, @@lemon_quartz01, @@turquoise01, @@tigers_eye01,
    @@orange_calcite01, @@grape_agate01, @@jade01, @@diamond01, @@emerald01, @@painite01, @@bumblebee_jasper01, @@blood_jasper01, @@mook_jasper01,
    @@red_jasper01, @@carbon01, @@copper01, @@tin01]

    Test_Ore_Sprite_Array = [@@bloodstone_01.sprite, @@bloodstone_02.sprite, @@bloodstone_03.sprite, @@moss_agate_01.sprite, @@amber01.sprite, 
    @@wavellite01.sprite,  @@topaz01.sprite, @@amethyst01.sprite, @@smokey_quartz01.sprite, @@sapphire01.sprite, @@black_opal01.sprite,
    @@ajoite01.sprite, @@rhodolite01.sprite, @@chalcanthite01.sprite, @@flourite01.sprite, @@amorite01.sprite, @@lapis_lazuli01.sprite,
    @@moonstone01.sprite, @@blue_calcite01.sprite, @@hiddenite01.sprite, @@ofretite01.sprite, @@holley_blue_agate01.sprite, @@ametrine01.sprite,
    @@hemimorphite01.sprite, @@tiffany_stone01.sprite, @@azurite01.sprite, @@howlite01.sprite, @@angelite01.sprite, @@blue_lace_agate01.sprite,
    @@iolite01.sprite, @@sodalite01.sprite, @@kyanite01.sprite, @@sunstone01.sprite, @@bony_amber01.sprite, @@blue_amber01.sprite, @@blue_spinel01.sprite,
    @@red_spinel01.sprite, @@fire_opal01.sprite, @@garnet01.sprite, @@ruby01.sprite, @@cherry_quartz01.sprite, @@lemon_quartz01.sprite,
    @@turquoise01.sprite, @@tigers_eye01.sprite, @@orange_calcite01.sprite, @@grape_agate01.sprite, @@jade01.sprite, @@diamond01.sprite, @@emerald01.sprite,
    @@painite01.sprite, @@bumblebee_jasper01.sprite, @@blood_jasper01.sprite, @@mook_jasper01.sprite, @@red_jasper01.sprite, @@carbon01.sprite, 
    @@copper01.sprite, @@tin01.sprite]
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@ore_animation_frame = 0; @@ore_reset = 0; @@ore_break_iterator = 0; @@is_smelting : Bool; @@is_smelting = false
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
    def Ore.smelt(window, player)
      if player.intersects? Test_Smelter.global_bounds
        Etc::Inventory_Ore.sort_metal(window)
      @@is_smelting = true
       end
     end
    def Ore.stop_smelt
      @@is_smelting = false
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
      @@bloodstone_02.sprite.position = SF.vector2(4500, 702); @@bloodstone_01.sprite.position = SF.vector2(300, 702)
      window.draw(@@bloodstone_01.sprite); window.draw(@@bloodstone_02.sprite); window.draw(@@moss_agate_01.sprite); window.draw(@@amber01.sprite); 
      window.draw(@@wavellite01.sprite); window.draw(@@topaz01.sprite); window.draw(@@amethyst01.sprite); window.draw(@@smokey_quartz01.sprite); 
      window.draw(@@sapphire01.sprite); window.draw(@@black_opal01.sprite); window.draw(@@ajoite01.sprite); window.draw(@@rhodolite01.sprite); 
      window.draw(@@chalcanthite01.sprite); window.draw(@@flourite01.sprite); window.draw(@@amorite01.sprite); window.draw(@@lapis_lazuli01.sprite); 
      window.draw(@@moonstone01.sprite); window.draw(@@blue_calcite01.sprite); window.draw(@@hiddenite01.sprite); window.draw(@@ofretite01.sprite); 
      window.draw(@@holley_blue_agate01.sprite); window.draw(@@ametrine01.sprite); window.draw(@@hemimorphite01.sprite); window.draw(@@tiffany_stone01.sprite);
      window.draw(@@azurite01.sprite); window.draw(@@howlite01.sprite); window.draw(@@angelite01.sprite); window.draw(@@blue_lace_agate01.sprite)
      window.draw(@@iolite01.sprite); window.draw(@@sodalite01.sprite); window.draw(@@kyanite01.sprite); window.draw(@@sunstone01.sprite) 
      window.draw(@@bony_amber01.sprite); window.draw(@@blue_amber01.sprite); window.draw(@@blue_spinel01.sprite); window.draw(@@red_spinel01.sprite)
      window.draw(@@fire_opal01.sprite); window.draw(@@garnet01.sprite); window.draw(@@ruby01.sprite); window.draw(@@cherry_quartz01.sprite)
      window.draw(@@lemon_quartz01.sprite); window.draw(@@turquoise01.sprite); window.draw(@@tigers_eye01.sprite); window.draw(@@orange_calcite01.sprite)
      window.draw(@@grape_agate01.sprite); window.draw(@@jade01.sprite); window.draw(@@diamond01.sprite); window.draw(@@emerald01.sprite)
      window.draw(@@painite01.sprite); window.draw(@@bumblebee_jasper01.sprite); window.draw(@@blood_jasper01.sprite); window.draw(@@mook_jasper01.sprite)
      window.draw(@@red_jasper01.sprite); window.draw(@@carbon01.sprite); window.draw(@@copper01.sprite); window.draw(@@tin01.sprite)
      if @@is_smelting == true
        page = 1
        window.draw(Test_Smelter_Menu); Etc::Inventory_Ore.update_ore_inventory; Etc::Inventory_Ore.display_metal_smelter(window)  
      end
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
     @@hiddenite02 = Ore.new("Hiddenite", 94, "green", 7, 350, "hiddenite", Hiddenite_Ore.dup, false, 350)
     @@hiddenite03 = Ore.new("Hiddenite", 95, "green", 7, 350, "hiddenite", Hiddenite_Ore.dup, false, 350)
     @@hiddenite04 = Ore.new("Hiddenite", 96, "green", 7, 350, "hiddenite", Hiddenite_Ore.dup, false, 350)
     @@hiddenite05 = Ore.new("Hiddenite", 97, "green", 7, 350, "hiddenite", Hiddenite_Ore.dup, false, 350)
     @@hiddenite06 = Ore.new("Hiddenite", 98, "green", 7, 350, "hiddenite", Hiddenite_Ore.dup, false, 350)
    #........................................................................................................................................................
    #................................................................Offretite...............................................................................
     @@ofretite01 = Ore.new("Offretite", 99, "clear", 5, 250, "offretite", Offretite_Ore.dup, false, 250)
     @@ofretite02 = Ore.new("Offretite", 100, "clear", 5, 250, "offretite", Offretite_Ore.dup, false, 250)
     @@ofretite03 = Ore.new("Offretite", 101, "clear", 5, 250, "offretite", Offretite_Ore.dup, false, 250)
     @@ofretite04 = Ore.new("Offretite", 102, "clear", 5, 250, "offretite", Offretite_Ore.dup, false, 250)
     @@ofretite05 = Ore.new("Offretite", 103, "clear", 5, 250, "offretite", Offretite_Ore.dup, false, 250)
     @@ofretite06 = Ore.new("Offretite", 104, "clear", 5, 250, "offretite", Offretite_Ore.dup, false, 250)
    #........................................................................................................................................................
    #..............................................................Holley Blue Agate.........................................................................
     @@holley_blue_agate01 = Ore.new("Holley Blue Agate", 105, "blue", 7, 350, "holley_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holley_blue_agate02 = Ore.new("Holley Blue Agate", 106, "blue", 7, 350, "holley_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holley_blue_agate03 = Ore.new("Holley Blue Agate", 107, "blue", 7, 350, "holley_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holley_blue_agate04 = Ore.new("Holley Blue Agate", 108, "blue", 7, 350, "holley_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holley_blue_agate05 = Ore.new("Holley Blue Agate", 109, "blue", 7, 350, "holley_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holley_blue_agate06 = Ore.new("Holley Blue Agate", 110, "blue", 7, 350, "holley_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
    #........................................................................................................................................................
    #..................................................................Ametrine..............................................................................
     @@ametrine01 = Ore.new("Ametrine", 111, "purple", 7, 350, "ametrine", Ametrine_Ore.dup, false, 350)
     @@ametrine02 = Ore.new("Ametrine", 112, "purple", 7, 350, "ametrine", Ametrine_Ore.dup, false, 350)
     @@ametrine03 = Ore.new("Ametrine", 113, "purple", 7, 350, "ametrine", Ametrine_Ore.dup, false, 350)
     @@ametrine04 = Ore.new("Ametrine", 114, "purple", 7, 350, "ametrine", Ametrine_Ore.dup, false, 350)
     @@ametrine05 = Ore.new("Ametrine", 115, "purple", 7, 350, "ametrine", Ametrine_Ore.dup, false, 350)
     @@ametrine06 = Ore.new("Ametrine", 116, "purple", 7, 350, "ametrine", Ametrine_Ore.dup, false, 350)
    #........................................................................................................................................................
    #................................................................Hemimorphite............................................................................
     @@hemimorphite01 = Ore.new("Hemimorphite", 117, "purple", 5, 250, "hemimorphite", Hemimorphite_Ore.dup, false, 250)
     @@hemimorphite02 = Ore.new("Hemimorphite", 118, "purple", 5, 250, "hemimorphite", Hemimorphite_Ore.dup, false, 250)
     @@hemimorphite03 = Ore.new("Hemimorphite", 119, "purple", 5, 250, "hemimorphite", Hemimorphite_Ore.dup, false, 250)
     @@hemimorphite04 = Ore.new("Hemimorphite", 120, "purple", 5, 250, "hemimorphite", Hemimorphite_Ore.dup, false, 250)
     @@hemimorphite05 = Ore.new("Hemimorphite", 121, "purple", 5, 250, "hemimorphite", Hemimorphite_Ore.dup, false, 250)
     @@hemimorphite06 = Ore.new("Hemimorphite", 122, "purple", 5, 250, "hemimorphite", Hemimorphite_Ore.dup, false, 250)
    #........................................................................................................................................................
    #................................................................Tiffany Stone...........................................................................
     @@tiffany_stone01 = Ore.new("Tiffany Stone", 123, "purple", 5, 250, "tiffany stone", Tiffany_Stone_Ore.dup, false, 250)
     @@tiffany_stone02 = Ore.new("Tiffany Stone", 124, "purple", 5, 250, "tiffany stone", Tiffany_Stone_Ore.dup, false, 250)
     @@tiffany_stone03 = Ore.new("Tiffany Stone", 125, "purple", 5, 250, "tiffany stone", Tiffany_Stone_Ore.dup, false, 250)
     @@tiffany_stone04 = Ore.new("Tiffany Stone", 126, "purple", 5, 250, "tiffany stone", Tiffany_Stone_Ore.dup, false, 250)
     @@tiffany_stone05 = Ore.new("Tiffany Stone", 127, "purple", 5, 250, "tiffany stone", Tiffany_Stone_Ore.dup, false, 250)
     @@tiffany_stone06 = Ore.new("Tiffany Stone", 128, "purple", 5, 250, "tiffany stone", Tiffany_Stone_Ore.dup, false, 250)
    #........................................................................................................................................................
    #..................................................................Azurite...............................................................................
     @@azurite01 = Ore.new("Azurite", 129, "blue", 4, 200, "azurite", Azurite_Ore.dup, false, 200)
     @@azurite02 = Ore.new("Azurite", 130, "blue", 4, 200, "azurite", Azurite_Ore.dup, false, 200)
     @@azurite03 = Ore.new("Azurite", 131, "blue", 4, 200, "azurite", Azurite_Ore.dup, false, 200)
     @@azurite04 = Ore.new("Azurite", 132, "blue", 4, 200, "azurite", Azurite_Ore.dup, false, 200)
     @@azurite05 = Ore.new("Azurite", 133, "blue", 4, 200, "azurite", Azurite_Ore.dup, false, 200)
     @@azurite06 = Ore.new("Azurite", 134, "blue", 4, 200, "azurite", Azurite_Ore.dup, false, 200)
    #........................................................................................................................................................
    #..................................................................Howlite...............................................................................
     @@howlite01 = Ore.new("Howlite", 135, "white", 3, 150, "howlite", Howlite_Ore.dup, false, 150)
     @@howlite02 = Ore.new("Howlite", 136, "white", 3, 150, "howlite", Howlite_Ore.dup, false, 150)
     @@howlite03 = Ore.new("Howlite", 137, "white", 3, 150, "howlite", Howlite_Ore.dup, false, 150)
     @@howlite04 = Ore.new("Howlite", 138, "white", 3, 150, "howlite", Howlite_Ore.dup, false, 150)
     @@howlite05 = Ore.new("Howlite", 139, "white", 3, 150, "howlite", Howlite_Ore.dup, false, 150)
     @@howlite06 = Ore.new("Howlite", 140, "white", 3, 150, "howlite", Howlite_Ore.dup, false, 150)
    #........................................................................................................................................................
    #..................................................................Angelite..............................................................................
     @@angelite01 = Ore.new("Angelite", 141, "blue", 3, 150, "angelite", Angelite_Ore.dup, false, 150)
     @@angelite02 = Ore.new("Angelite", 142, "blue", 3, 150, "angelite", Angelite_Ore.dup, false, 150)
     @@angelite03 = Ore.new("Angelite", 143, "blue", 3, 150, "angelite", Angelite_Ore.dup, false, 150)
     @@angelite04 = Ore.new("Angelite", 144, "blue", 3, 150, "angelite", Angelite_Ore.dup, false, 150)
     @@angelite05 = Ore.new("Angelite", 145, "blue", 3, 150, "angelite", Angelite_Ore.dup, false, 150)
     @@angelite06 = Ore.new("Angelite", 146, "blue", 3, 150, "angelite", Angelite_Ore.dup, false, 150)
    #........................................................................................................................................................
    #...............................................................Blue Lace Agate..........................................................................
     @@blue_lace_agate01 = Ore.new("Blue Lace Agate", 147, "blue", 7, 450, "blue lace agate", Blue_Lace_Agate_Ore.dup, false, 450)
     @@blue_lace_agate02 = Ore.new("Blue Lace Agate", 148, "blue", 7, 450, "blue lace agate", Blue_Lace_Agate_Ore.dup, false, 450)
     @@blue_lace_agate03 = Ore.new("Blue Lace Agate", 149, "blue", 7, 450, "blue lace agate", Blue_Lace_Agate_Ore.dup, false, 450)
     @@blue_lace_agate04 = Ore.new("Blue Lace Agate", 150, "blue", 7, 450, "blue lace agate", Blue_Lace_Agate_Ore.dup, false, 450)
     @@blue_lace_agate05 = Ore.new("Blue Lace Agate", 151, "blue", 7, 450, "blue lace agate", Blue_Lace_Agate_Ore.dup, false, 450)
     @@blue_lace_agate06 = Ore.new("Blue Lace Agate", 152, "blue", 7, 450, "blue lace agate", Blue_Lace_Agate_Ore.dup, false, 450)
    #........................................................................................................................................................
    #...................................................................Iolite...............................................................................
     @@iolite01 = Ore.new("Iolite", 153, "blue", 5, 350, "iolite", Iolite_Ore.dup, false, 350)
     @@iolite02 = Ore.new("Iolite", 154, "blue", 5, 350, "iolite", Iolite_Ore.dup, false, 350)
     @@iolite03 = Ore.new("Iolite", 155, "blue", 5, 350, "iolite", Iolite_Ore.dup, false, 350)
     @@iolite04 = Ore.new("Iolite", 156, "blue", 5, 350, "iolite", Iolite_Ore.dup, false, 350)
     @@iolite05 = Ore.new("Iolite", 157, "blue", 5, 350, "iolite", Iolite_Ore.dup, false, 350)
     @@iolite06 = Ore.new("Iolite", 158, "blue", 5, 350, "iolite", Iolite_Ore.dup, false, 350)
    #........................................................................................................................................................
    #...................................................................Iolite...............................................................................
     @@sodalite01 = Ore.new("Sodalite", 159, "blue", 6, 400, "sodalite", Sodalite_Ore.dup, false, 400)
     @@sodalite02 = Ore.new("Sodalite", 160, "blue", 6, 400, "sodalite", Sodalite_Ore.dup, false, 400)
     @@sodalite03 = Ore.new("Sodalite", 161, "blue", 6, 400, "sodalite", Sodalite_Ore.dup, false, 400)
     @@sodalite04 = Ore.new("Sodalite", 162, "blue", 6, 400, "sodalite", Sodalite_Ore.dup, false, 400)
     @@sodalite05 = Ore.new("Sodalite", 163, "blue", 6, 400, "sodalite", Sodalite_Ore.dup, false, 400)
     @@sodalite06 = Ore.new("Sodalite", 164, "blue", 6, 400, "sodalite", Sodalite_Ore.dup, false, 400)
    #........................................................................................................................................................
    #..................................................................Kyanite...............................................................................
     @@kyanite01 = Ore.new("Kyanite", 165, "blue", 6, 400, "kyanite", Kyanite_Ore.dup, false, 400)
     @@kyanite02 = Ore.new("Kyanite", 166, "blue", 6, 400, "kyanite", Kyanite_Ore.dup, false, 400)
     @@kyanite03 = Ore.new("Kyanite", 167, "blue", 6, 400, "kyanite", Kyanite_Ore.dup, false, 400)
     @@kyanite04 = Ore.new("Kyanite", 168, "blue", 6, 400, "kyanite", Kyanite_Ore.dup, false, 400)
     @@kyanite05 = Ore.new("Kyanite", 169, "blue", 6, 400, "kyanite", Kyanite_Ore.dup, false, 400)
     @@kyanite06 = Ore.new("Kyanite", 170, "blue", 6, 400, "kyanite", Kyanite_Ore.dup, false, 400)
    #........................................................................................................................................................
    #..................................................................Sunstone...............................................................................
     @@sunstone01 = Ore.new("Sunstone", 171, "orange", 7, 450, "sunstone", Sunstone_Ore.dup, false, 450)
     @@sunstone02 = Ore.new("Sunstone", 172, "orange", 7, 450, "sunstone", Sunstone_Ore.dup, false, 450)
     @@sunstone03 = Ore.new("Sunstone", 173, "orange", 7, 450, "sunstone", Sunstone_Ore.dup, false, 450)
     @@sunstone04 = Ore.new("Sunstone", 174, "orange", 7, 450, "sunstone", Sunstone_Ore.dup, false, 450)
     @@sunstone05 = Ore.new("Sunstone", 175, "orange", 7, 450, "sunstone", Sunstone_Ore.dup, false, 450)
     @@sunstone06 = Ore.new("Sunstone", 176, "orange", 7, 450, "sunstone", Sunstone_Ore.dup, false, 450)
    #........................................................................................................................................................
    #..................................................................Bony Amber............................................................................
     @@bony_amber01 = Ore.new("Bony Amber", 177, "orange", 3, 250, "bony amber", Bony_Amber_Ore.dup, false, 250)
     @@bony_amber02 = Ore.new("Bony Amber", 178, "orange", 3, 250, "bony amber", Bony_Amber_Ore.dup, false, 250)
     @@bony_amber03 = Ore.new("Bony Amber", 179, "orange", 3, 250, "bony amber", Bony_Amber_Ore.dup, false, 250)
     @@bony_amber04 = Ore.new("Bony Amber", 180, "orange", 3, 250, "bony amber", Bony_Amber_Ore.dup, false, 250)
     @@bony_amber05 = Ore.new("Bony Amber", 181, "orange", 3, 250, "bony amber", Bony_Amber_Ore.dup, false, 250)
     @@bony_amber06 = Ore.new("Bony Amber", 182, "orange", 3, 250, "bony amber", Bony_Amber_Ore.dup, false, 250)
    #........................................................................................................................................................
    #..................................................................Blue Amber............................................................................
     @@blue_amber01 = Ore.new("Blue Amber", 183, "blue", 2, 200, "blue amber", Blue_Amber_Ore.dup, false, 200)
     @@blue_amber02 = Ore.new("Blue Amber", 184, "blue", 2, 200, "blue amber", Blue_Amber_Ore.dup, false, 200)
     @@blue_amber03 = Ore.new("Blue Amber", 185, "blue", 2, 200, "blue amber", Blue_Amber_Ore.dup, false, 200)
     @@blue_amber04 = Ore.new("Blue Amber", 186, "blue", 2, 200, "blue amber", Blue_Amber_Ore.dup, false, 200)
     @@blue_amber05 = Ore.new("Blue Amber", 187, "blue", 2, 200, "blue amber", Blue_Amber_Ore.dup, false, 200)
     @@blue_amber06 = Ore.new("Blue Amber", 188, "blue", 2, 200, "blue amber", Blue_Amber_Ore.dup, false, 200)
    #........................................................................................................................................................
    #..................................................................Blue Spinel...........................................................................
     @@blue_spinel01 = Ore.new("Blue Spinel", 189, "blue", 8, 500, "blue spinel", Blue_Spinel_Ore.dup, false, 500)
     @@blue_spinel02 = Ore.new("Blue Spinel", 190, "blue", 8, 500, "blue spinel", Blue_Spinel_Ore.dup, false, 500)
     @@blue_spinel03 = Ore.new("Blue Spinel", 191, "blue", 8, 500, "blue spinel", Blue_Spinel_Ore.dup, false, 500)
     @@blue_spinel04 = Ore.new("Blue Spinel", 192, "blue", 8, 500, "blue spinel", Blue_Spinel_Ore.dup, false, 500)
     @@blue_spinel05 = Ore.new("Blue Spinel", 193, "blue", 8, 500, "blue spinel", Blue_Spinel_Ore.dup, false, 500)
     @@blue_spinel06 = Ore.new("Blue Spinel", 194, "blue", 8, 500, "blue spinel", Blue_Spinel_Ore.dup, false, 500)
    #........................................................................................................................................................
    #..................................................................Red Spinel............................................................................
     @@red_spinel01 = Ore.new("Red Spinel", 195, "red", 8, 500, "red spinel", Red_Spinel_Ore.dup, false, 500)
     @@red_spinel02 = Ore.new("Red Spinel", 196, "red", 8, 500, "red spinel", Red_Spinel_Ore.dup, false, 500)
     @@red_spinel03 = Ore.new("Red Spinel", 197, "red", 8, 500, "red spinel", Red_Spinel_Ore.dup, false, 500)
     @@red_spinel04 = Ore.new("Red Spinel", 198, "red", 8, 500, "red spinel", Red_Spinel_Ore.dup, false, 500)
     @@red_spinel05 = Ore.new("Red Spinel", 199, "red", 8, 500, "red spinel", Red_Spinel_Ore.dup, false, 500)
     @@red_spinel06 = Ore.new("Red Spinel", 200, "red", 8, 500, "red spinel", Red_Spinel_Ore.dup, false, 500)
    #........................................................................................................................................................
    #...................................................................Fire Opal............................................................................
     @@fire_opal01 = Ore.new("Fire Opal", 201, "orange", 6, 400, "fire opal", Fire_Opal_Ore.dup, false, 400)
     @@fire_opal02 = Ore.new("Fire Opal", 202, "orange", 6, 400, "fire opal", Fire_Opal_Ore.dup, false, 400)
     @@fire_opal03 = Ore.new("Fire Opal", 203, "orange", 6, 400, "fire opal", Fire_Opal_Ore.dup, false, 400)
     @@fire_opal04 = Ore.new("Fire Opal", 204, "orange", 6, 400, "fire opal", Fire_Opal_Ore.dup, false, 400)
     @@fire_opal05 = Ore.new("Fire Opal", 205, "orange", 6, 400, "fire opal", Fire_Opal_Ore.dup, false, 400)
     @@fire_opal06 = Ore.new("Fire Opal", 206, "orange", 6, 400, "fire opal", Fire_Opal_Ore.dup, false, 400)
    #........................................................................................................................................................
    #....................................................................Garnet..............................................................................
     @@garnet01 = Ore.new("Garnet", 207, "red", 7, 450, "garnet", Garnet_Ore.dup, false, 450)
     @@garnet02 = Ore.new("Garnet", 208, "red", 7, 450, "garnet", Garnet_Ore.dup, false, 450)
     @@garnet03 = Ore.new("Garnet", 209, "red", 7, 450, "garnet", Garnet_Ore.dup, false, 450)
     @@garnet04 = Ore.new("Garnet", 210, "red", 7, 450, "garnet", Garnet_Ore.dup, false, 450)
     @@garnet05 = Ore.new("Garnet", 211, "red", 7, 450, "garnet", Garnet_Ore.dup, false, 450)
     @@garnet06 = Ore.new("Garnet", 212, "red", 7, 450, "garnet", Garnet_Ore.dup, false, 450)
    #........................................................................................................................................................
    #.....................................................................Ruby...............................................................................
     @@ruby01 = Ore.new("Ruby", 213, "red", 9, 550, "ruby", Ruby_Ore.dup, false, 550)
     @@ruby02 = Ore.new("Ruby", 214, "red", 9, 550, "ruby", Ruby_Ore.dup, false, 550)
     @@ruby03 = Ore.new("Ruby", 215, "red", 9, 550, "ruby", Ruby_Ore.dup, false, 550)
     @@ruby04 = Ore.new("Ruby", 216, "red", 9, 550, "ruby", Ruby_Ore.dup, false, 550)
     @@ruby05 = Ore.new("Ruby", 217, "red", 9, 550, "ruby", Ruby_Ore.dup, false, 550)
     @@ruby06 = Ore.new("Ruby", 218, "red", 9, 550, "ruby", Ruby_Ore.dup, false, 550)
    #........................................................................................................................................................
    #................................................................Cherry Quartz...........................................................................
     @@cherry_quartz01 = Ore.new("Cherry Quartz", 219, "red", 7, 450, "cherry quartz", Cherry_Quartz_Ore.dup, false, 450)
     @@cherry_quartz02 = Ore.new("Cherry Quartz", 220, "red", 7, 450, "cherry quartz", Cherry_Quartz_Ore.dup, false, 450)
     @@cherry_quartz03 = Ore.new("Cherry Quartz", 221, "red", 7, 450, "cherry quartz", Cherry_Quartz_Ore.dup, false, 450)
     @@cherry_quartz04 = Ore.new("Cherry Quartz", 222, "red", 7, 450, "cherry quartz", Cherry_Quartz_Ore.dup, false, 450)
     @@cherry_quartz05 = Ore.new("Cherry Quartz", 223, "red", 7, 450, "cherry quartz", Cherry_Quartz_Ore.dup, false, 450)
     @@cherry_quartz06 = Ore.new("Cherry Quartz", 224, "red", 7, 450, "cherry quartz", Cherry_Quartz_Ore.dup, false, 450)
    #........................................................................................................................................................
    #................................................................Lemon Quartz...........................................................................
     @@lemon_quartz01 = Ore.new("Lemon Quartz", 225, "yellow", 7, 450, "lemon quartz", Lemon_Quartz_Ore.dup, false, 450)
     @@lemon_quartz02 = Ore.new("Lemon Quartz", 226, "yellow", 7, 450, "lemon quartz", Lemon_Quartz_Ore.dup, false, 450)
     @@lemon_quartz03 = Ore.new("Lemon Quartz", 227, "yellow", 7, 450, "lemon quartz", Lemon_Quartz_Ore.dup, false, 450)
     @@lemon_quartz04 = Ore.new("Lemon Quartz", 228, "yellow", 7, 450, "lemon quartz", Lemon_Quartz_Ore.dup, false, 450)
     @@lemon_quartz05 = Ore.new("Lemon Quartz", 229, "yellow", 7, 450, "lemon quartz", Lemon_Quartz_Ore.dup, false, 450)
     @@lemon_quartz06 = Ore.new("Lemon Quartz", 230, "yellow", 7, 450, "lemon quartz", Lemon_Quartz_Ore.dup, false, 450)
    #........................................................................................................................................................
    #..................................................................Turquoise.............................................................................
     @@turquoise01 = Ore.new("Turquoise", 231, "green", 5, 350, "turquoise", Turquoise_Ore.dup, false, 350)
     @@turquoise02 = Ore.new("Turquoise", 232, "green", 5, 350, "turquoise", Turquoise_Ore.dup, false, 350)
     @@turquoise03 = Ore.new("Turquoise", 233, "green", 5, 350, "turquoise", Turquoise_Ore.dup, false, 350)
     @@turquoise04 = Ore.new("Turquoise", 234, "green", 5, 350, "turquoise", Turquoise_Ore.dup, false, 350)
     @@turquoise05 = Ore.new("Turquoise", 235, "green", 5, 350, "turquoise", Turquoise_Ore.dup, false, 350)
     @@turquoise06 = Ore.new("Turquoise", 236, "green", 5, 350, "turquoise", Turquoise_Ore.dup, false, 350)
    #........................................................................................................................................................
    #.................................................................Tiger's Eye............................................................................
     @@tigers_eye01 = Ore.new("Tiger's Eye", 237, "orange", 7, 450, "tiger's eye", Tigers_Eye_Ore.dup, false, 450)
     @@tigers_eye02 = Ore.new("Tiger's Eye", 238, "orange", 7, 450, "tiger's eye", Tigers_Eye_Ore.dup, false, 450)
     @@tigers_eye03 = Ore.new("Tiger's Eye", 239, "orange", 7, 450, "tiger's eye", Tigers_Eye_Ore.dup, false, 450)
     @@tigers_eye04 = Ore.new("Tiger's Eye", 240, "orange", 7, 450, "tiger's eye", Tigers_Eye_Ore.dup, false, 450)
     @@tigers_eye05 = Ore.new("Tiger's Eye", 241, "orange", 7, 450, "tiger's eye", Tigers_Eye_Ore.dup, false, 450)
     @@tigers_eye06 = Ore.new("Tiger's Eye", 242, "orange", 7, 450, "tiger's eye", Tigers_Eye_Ore.dup, false, 450)
    #........................................................................................................................................................
    #................................................................Orange Calcite..........................................................................
     @@orange_calcite01 = Ore.new("Orange Calcite", 243, "orange", 3, 250, "orange calclite", Orange_Calcite_Ore.dup, false, 250)
     @@orange_calcite02 = Ore.new("Orange Calcite", 244, "orange", 3, 250, "orange calclite", Orange_Calcite_Ore.dup, false, 250)
     @@orange_calcite03 = Ore.new("Orange Calcite", 245, "orange", 3, 250, "orange calclite", Orange_Calcite_Ore.dup, false, 250)
     @@orange_calcite04 = Ore.new("Orange Calcite", 246, "orange", 3, 250, "orange calclite", Orange_Calcite_Ore.dup, false, 250)
     @@orange_calcite05 = Ore.new("Orange Calcite", 247, "orange", 3, 250, "orange calclite", Orange_Calcite_Ore.dup, false, 250)
     @@orange_calcite06 = Ore.new("Orange Calcite", 248, "orange", 3, 250, "orange calclite", Orange_Calcite_Ore.dup, false, 250)
    #........................................................................................................................................................
    #.................................................................Grape Agate............................................................................
     @@grape_agate01 = Ore.new("Grape Agate", 249, "purple", 6, 400, "grape agate", Grape_Agate_Ore.dup, false, 400)
     @@grape_agate02 = Ore.new("Grape Agate", 250, "purple", 6, 400, "grape agate", Grape_Agate_Ore.dup, false, 400)
     @@grape_agate03 = Ore.new("Grape Agate", 251, "purple", 6, 400, "grape agate", Grape_Agate_Ore.dup, false, 400)
     @@grape_agate04 = Ore.new("Grape Agate", 252, "purple", 6, 400, "grape agate", Grape_Agate_Ore.dup, false, 400)
     @@grape_agate05 = Ore.new("Grape Agate", 253, "purple", 6, 400, "grape agate", Grape_Agate_Ore.dup, false, 400)
     @@grape_agate06 = Ore.new("Grape Agate", 254, "purple", 6, 400, "grape agate", Grape_Agate_Ore.dup, false, 400)
    #........................................................................................................................................................
    #....................................................................Jade................................................................................
      @@jade01 = Ore.new("Jade", 255, "green", 7, 450, "jade", Jade_Ore.dup, false, 450)
      @@jade02 = Ore.new("Jade", 256, "green", 7, 450, "jade", Jade_Ore.dup, false, 450)
      @@jade03 = Ore.new("Jade", 257, "green", 7, 450, "jade", Jade_Ore.dup, false, 450)
      @@jade04 = Ore.new("Jade", 258, "green", 7, 450, "jade", Jade_Ore.dup, false, 450)
      @@jade05 = Ore.new("Jade", 259, "green", 7, 450, "jade", Jade_Ore.dup, false, 450)
      @@jade06 = Ore.new("Jade", 260, "green", 7, 450, "jade", Jade_Ore.dup, false, 450)
    #........................................................................................................................................................
    #..................................................................Diamond...............................................................................
     @@diamond01 = Ore.new("Diamond", 261, "white", 10, 600, "diamond", Diamond_Ore.dup, false, 600)
     @@diamond02 = Ore.new("Diamond", 262, "white", 10, 600, "diamond", Diamond_Ore.dup, false, 600)
     @@diamond03 = Ore.new("Diamond", 263, "white", 10, 600, "diamond", Diamond_Ore.dup, false, 600)
     @@diamond04 = Ore.new("Diamond", 264, "white", 10, 600, "diamond", Diamond_Ore.dup, false, 600)
     @@diamond05 = Ore.new("Diamond", 265, "white", 10, 600, "diamond", Diamond_Ore.dup, false, 600)
     @@diamond06 = Ore.new("Diamond", 266, "white", 10, 600, "diamond", Diamond_Ore.dup, false, 600)
    #........................................................................................................................................................
    #..................................................................Emerald...............................................................................
     @@emerald01 = Ore.new("Emerald", 267, "green", 8, 500, "emerald", Emerald_Ore.dup, false, 500)
     @@emerald02 = Ore.new("Emerald", 268, "green", 8, 500, "emerald", Emerald_Ore.dup, false, 500)
     @@emerald03 = Ore.new("Emerald", 269, "green", 8, 500, "emerald", Emerald_Ore.dup, false, 500)
     @@emerald04 = Ore.new("Emerald", 270, "green", 8, 500, "emerald", Emerald_Ore.dup, false, 500)
     @@emerald05 = Ore.new("Emerald", 271, "green", 8, 500, "emerald", Emerald_Ore.dup, false, 500)
     @@emerald06 = Ore.new("Emerald", 272, "green", 8, 500, "emerald", Emerald_Ore.dup, false, 500)
    #........................................................................................................................................................
    #..................................................................Painite...............................................................................
     @@painite01 = Ore.new("Painite", 273, "red", 8, 500, "painite", Painite_Ore.dup, false, 500)
     @@painite02 = Ore.new("Painite", 274, "red", 8, 500, "painite", Painite_Ore.dup, false, 500)
     @@painite03 = Ore.new("Painite", 275, "red", 8, 500, "painite", Painite_Ore.dup, false, 500)
     @@painite04 = Ore.new("Painite", 276, "red", 8, 500, "painite", Painite_Ore.dup, false, 500)
     @@painite05 = Ore.new("Painite", 277, "red", 8, 500, "painite", Painite_Ore.dup, false, 500)
     @@painite06 = Ore.new("Painite", 278, "red", 8, 500, "painite", Painite_Ore.dup, false, 500)
    #........................................................................................................................................................
    #.............................................................Bumblebee Jasper...........................................................................
     @@bumblebee_jasper01 = Ore.new("Bumblebee Jasper", 279, "yellow", 6, 400, "bumblebee jasper", Bumblebee_Jasper_Ore.dup, false, 400)
     @@bumblebee_jasper02 = Ore.new("Bumblebee Jasper", 280, "yellow", 6, 400, "bumblebee jasper", Bumblebee_Jasper_Ore.dup, false, 400)
     @@bumblebee_jasper03 = Ore.new("Bumblebee Jasper", 281, "yellow", 6, 400, "bumblebee jasper", Bumblebee_Jasper_Ore.dup, false, 400)
     @@bumblebee_jasper04 = Ore.new("Bumblebee Jasper", 282, "yellow", 6, 400, "bumblebee jasper", Bumblebee_Jasper_Ore.dup, false, 400)
     @@bumblebee_jasper05 = Ore.new("Bumblebee Jasper", 283, "yellow", 6, 400, "bumblebee jasper", Bumblebee_Jasper_Ore.dup, false, 400)
     @@bumblebee_jasper06 = Ore.new("Bumblebee Jasper", 284, "yellow", 6, 400, "bumblebee jasper", Bumblebee_Jasper_Ore.dup, false, 400)
    #........................................................................................................................................................
    #...............................................................Blood Jasper.............................................................................
     @@blood_jasper01 = Ore.new("Blood Jasper", 285, "green", 7, 450, "blood jasper", Blood_Jasper_Ore.dup, false, 450)
     @@blood_jasper02 = Ore.new("Blood Jasper", 286, "green", 7, 450, "blood jasper", Blood_Jasper_Ore.dup, false, 450)
     @@blood_jasper03 = Ore.new("Blood Jasper", 287, "green", 7, 450, "blood jasper", Blood_Jasper_Ore.dup, false, 450)
     @@blood_jasper04 = Ore.new("Blood Jasper", 288, "green", 7, 450, "blood jasper", Blood_Jasper_Ore.dup, false, 450)
     @@blood_jasper05 = Ore.new("Blood Jasper", 289, "green", 7, 450, "blood jasper", Blood_Jasper_Ore.dup, false, 450)
     @@blood_jasper06 = Ore.new("Blood Jasper", 290, "green", 7, 450, "blood jasper", Blood_Jasper_Ore.dup, false, 450)
    #........................................................................................................................................................
    #...............................................................Mook Jasper..............................................................................
     @@mook_jasper01 = Ore.new("Mook Jasper", 291, "brown", 6, 400, "mook jasper", Mook_Jasper_Ore.dup, false, 400)
     @@mook_jasper02 = Ore.new("Mook Jasper", 292, "brown", 6, 400, "mook jasper", Mook_Jasper_Ore.dup, false, 400)
     @@mook_jasper03 = Ore.new("Mook Jasper", 293, "brown", 6, 400, "mook jasper", Mook_Jasper_Ore.dup, false, 400)
     @@mook_jasper04 = Ore.new("Mook Jasper", 294, "brown", 6, 400, "mook jasper", Mook_Jasper_Ore.dup, false, 400)
     @@mook_jasper05 = Ore.new("Mook Jasper", 295, "brown", 6, 400, "mook jasper", Mook_Jasper_Ore.dup, false, 400)
     @@mook_jasper06 = Ore.new("Mook Jasper", 296, "brown", 6, 400, "mook jasper", Mook_Jasper_Ore.dup, false, 400)
    #........................................................................................................................................................
    #................................................................Red Jasper..............................................................................
     @@red_jasper01 = Ore.new("Red Jasper", 297, "red", 6, 400, "red jasper", Red_Jasper_Ore.dup, false, 400)
     @@red_jasper02 = Ore.new("Red Jasper", 298, "red", 6, 400, "red jasper", Red_Jasper_Ore.dup, false, 400)
     @@red_jasper03 = Ore.new("Red Jasper", 299, "red", 6, 400, "red jasper", Red_Jasper_Ore.dup, false, 400)
     @@red_jasper04 = Ore.new("Red Jasper", 300, "red", 6, 400, "red jasper", Red_Jasper_Ore.dup, false, 400)
     @@red_jasper05 = Ore.new("Red Jasper", 301, "red", 6, 400, "red jasper", Red_Jasper_Ore.dup, false, 400)
     @@red_jasper06 = Ore.new("Red Jasper", 302, "red", 6, 400, "red jasper", Red_Jasper_Ore.dup, false, 400)
    #........................................................................................................................................................
   #========================================================================================================================================================
   #==================================================================Metals================================================================================
    #.................................................................Carbon.................................................................................
     @@carbon01 = Ore.new("Carbon", 3000, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon02 = Ore.new("Carbon", 3001, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon03 = Ore.new("Carbon", 3002, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon04 = Ore.new("Carbon", 3003, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon05 = Ore.new("Carbon", 3004, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon06 = Ore.new("Carbon", 3005, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon07 = Ore.new("Carbon", 3006, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon08 = Ore.new("Carbon", 3007, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon09 = Ore.new("Carbon", 3008, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon10 = Ore.new("Carbon", 3009, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon11 = Ore.new("Carbon", 3010, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
     @@carbon12 = Ore.new("Carbon", 3011, "black", 0, 200, "carbon", Carbon_Ore.dup, false, 200)
    #........................................................................................................................................................
    #.................................................................Copper.................................................................................
     @@copper01 = Ore.new("Copper", 3012, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper02 = Ore.new("Copper", 3013, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper03 = Ore.new("Copper", 3014, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper04 = Ore.new("Copper", 3015, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper05 = Ore.new("Copper", 3016, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper06 = Ore.new("Copper", 3017, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper07 = Ore.new("Copper", 3018, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper08 = Ore.new("Copper", 3019, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper09 = Ore.new("Copper", 3020, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper10 = Ore.new("Copper", 3022, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper11 = Ore.new("Copper", 3023, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
     @@copper12 = Ore.new("Copper", 3024, "brown", 0, 300, "copper", Copper_Ore.dup, false, 300)
    #........................................................................................................................................................
    #.................................................................Copper.................................................................................
     @@tin01 = Ore.new("Tin", 3012, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
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