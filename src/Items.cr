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
   @@nil_stick = Stick.new("", -1, false, false, false, 1.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Weapon_Rectangle_01, false, Stick01, "none", "none", "none")
   @@current_weapon : Int32
   @@current_weapon = -1
   @@current_weapon_object : Stick 
   @@current_weapon_object = @@nil_stick
   property = @@current_weapon
   property = @@current_weapon_object
   WEAPON_OBJECT_ARRAY = [] of Stick
   WEAPON_INVENTORY_ARRAY = [] of Stick
   MOLD_ARRAY = [] of Mold
 #======================================================================================================================================
 # ____________________________________________________________________________________________________________________________________
 #|                                                     Equipment Methods                                                              |
 #|____________________________________________________________________________________________________________________________________|
   def Equipment.equip_weapon(this)
    size = WEAPON_INVENTORY_ARRAY.size 
     if this > size
       All_Audio::SFX.light_bonk
      else 
     if @@current_weapon_object != Nil || @@nil_stick
       WEAPON_INVENTORY_ARRAY.push(@@current_weapon_object)
       @@current_weapon = WEAPON_INVENTORY_ARRAY[this].number
       @@current_weapon_object = WEAPON_INVENTORY_ARRAY[this]
       WEAPON_INVENTORY_ARRAY.delete(@@current_weapon_object)
       puts "equip" + this.to_s
      end
      end
    end
   def Equipment.show_weapon_info(this)
      size = WEAPON_INVENTORY_ARRAY.size 
       if this > size
         All_Audio::SFX.light_bonk
        else 
       if @@current_weapon_object != Nil || @@nil_stick
         WEAPON_INVENTORY_ARRAY.push(@@current_weapon_object)
         @@current_weapon = WEAPON_INVENTORY_ARRAY[this].number
         @@current_weapon_object = WEAPON_INVENTORY_ARRAY[this]
         WEAPON_INVENTORY_ARRAY.delete(@@current_weapon_object)
        end
        end
      end
    def Equipment.draw_current_weapon(player) #@note draw current weapon
      Equipment.check_gem_element_current_weapon
      player.draw(@@current_weapon_object.sprite)
    end

   def Equipment.attack_strength(base_attack) #@note attack strength 
    attack_strength = base_attack + @@current_weapon_object.atk_power
    Harvestables::Ore.set_attack_strength(attack_strength)
   end
   def Equipment.check_stats(slot)
    if WEAPON_INVENTORY_ARRAY.size > slot
      Weapon_Info_Text.string = " Name: " + WEAPON_INVENTORY_ARRAY[slot].name + "\n Attack: " + WEAPON_INVENTORY_ARRAY[slot].atk_power.to_s 
    else
      Weapon_Info_Text.string = ""
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
   def Equipment.forge_weapon(weapon)
    s = WEAPON_OBJECT_ARRAY.size; i = 0
    puts WEAPON_OBJECT_ARRAY[i]
    while s > i
      if weapon == WEAPON_OBJECT_ARRAY[i].number 
        WEAPON_INVENTORY_ARRAY.push(WEAPON_OBJECT_ARRAY[i].dup)
        puts WEAPON_OBJECT_ARRAY[i]
      end
      i += 1
    end
   end
   def Equipment.check_gem_element_current_weapon
    gem1 = WEAPON_OBJECT_ARRAY[@@current_weapon].socket01
    Etc::Gem.check_element(gem1)
    elements = [gem1]
   end
 #======================================================================================================================================
 class Stick
 def initialize(name : String, number : Int32, can_swing : Bool, can_stab : Bool, can_shoot : Bool, atk_power : Float64, elements : Array(String), 
  special_effects : Array(String), swing_sound : SF::Sound, hit_sound : SF::Sound, rectangle : SF::RectangleShape, is_equipped : Bool, sprite : SF::Sprite,
  socket01 : String,  socket02 : String, socket03 : String)
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
    @sprite = sprite
    @socket01 = socket01
    @socket02 = socket02
    @socket03 = socket03
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
 def sprite
    @sprite
  end
 def socket01
    @socket01
  end
 def socket02
    @socket02
  end
 def socket03
    @socket03
  end
 def Stick.test(window, page)
        window.draw(Weapon_Rectangle_01)
    end
    WEAPON_OBJECT_ARRAY.push(@@stick01, @@zinc_stick, @@tin_stick, @@copper_stick, @@brass_stick, @@bronze_stick, @@iron_stick, @@steel_stick)
    #WEAPON_INVENTORY_ARRAY.push(@@nil_stick)
   # WEAPON_INVENTORY_ARRAY.push(@@zinc_stick, @@tin_stick, @@copper_stick, @@brass_stick, @@bronze_stick, @@iron_stick, @@steel_stick)
 #-------------------------------------------------------------Entities----------------------------------------------------------------------------------------
  @@nil_stick = Stick.new("", -1, false, false, false, 1.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Weapon_Rectangle_01, false, Stick01, "none", "none", "none")
  @@stick01 = Stick.new("Stick", 0, true, false, false, 1.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Weapon_Rectangle_01, false, Stick01, "none", "none", "none")
  @@zinc_stick = Stick.new("Zinc Stick", 4, true, false, false, 1.75, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Zinc_Stick_Display, false, Zinc_Stick, "none", "none", "none")
  @@tin_stick = Stick.new("Tin Stick", 2, true, false, false, 2, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Tin_Stick_Display, false, Tin_Stick, "none", "none", "none")
  @@copper_stick = Stick.new("Copper Stick", 1, true, false, false, 4, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Copper_Stick_Display, false, Copper_Stick, "empty", "none", "none")
  @@brass_stick = Stick.new("Brass Stick", 5, true, false, false, 2.5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Brass_Stick_Display, false, Brass_Stick, "empty", "empty", "none")
  @@bronze_stick = Stick.new("Bronze Stick", 3, true, false, false, 3, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Bronze_Stick_Display, false, Bronze_Stick, "empty", "none", "none")
  @@iron_stick = Stick.new("Iron Stick", 6, true, false, false, 4, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Iron_Stick_Display, false, Iron_Stick, "empty", "empty", "none")
  @@steel_stick = Stick.new("Steel Stick", 7, true, false, false, 5, ["none"], ["none"], WEAPSOUND_01, WEAPSOUND_02, Steel_Stick_Display, false, Steel_Stick, "empty", "empty", "empty")
 #_____________________________________________________________________________________________________________________________________________________________
 end
 class Mold
  def initialize(name : String, sockets : Int32, lvl_req : Int32)
    @name = name
    @sockets = sockets
    @lvl_req = lvl_req
   end
  def name
    @name
   end
  def sockets
    @sockets
   end
  def lvl_req
    @lvl_req
   end
 @@stick_mold = Mold.new("Stick Mold", 2, 0)  
  MOLD_ARRAY.push(@@stick_mold) 
 end

 class Weapon_Crafting < Mold
  @@chosen_ingot : Int32; @@chosen_ingot = 0; @@chosen_mold : Mold; @@chosen_mold = @@stick_mold
  @@craft_weapon : Int32; @@craft_weapon = 0
  def Weapon_Crafting.choose_ingot(ingot)
    @@chosen_ingot = ingot
  end 
  def Weapon_Crafting.forge_weapon
    weapon = @@craft_weapon
    Crafted_Items::Weapon.forge_weapon(weapon)
  end
  def Weapon_Crafting.diplay_forge(window)
      window.draw(Test_Forge_Menu)
      Etc::Inventory_Ingot.display_forge_ingots(window)
      Weapon_Crafting.current_mold(window)
  end
  def Weapon_Crafting.current_mold(window)
    weapon = Nil_Stick_Display.dup
    if  @@chosen_mold == @@stick_mold
      case @@chosen_ingot
       when 1
        weapon = Copper_Stick_Display.dup
        @@craft_weapon = 1      
       when 2
        weapon = Tin_Stick_Display.dup
        @@craft_weapon = 2
       when 3
        weapon = Bronze_Stick_Display.dup
        @@craft_weapon = 3
       when 4
        weapon = Zinc_Stick_Display.dup
        @@craft_weapon = 4
       when 5
        weapon = Brass_Stick_Display.dup
        @@craft_weapon = 5
      when 6
        weapon = Iron_Stick_Display.dup
        @@craft_weapon = 6
      when 7
        weapon = Steel_Stick_Display.dup
        @@craft_weapon = 7
     end; end
     weapon.position = SF.vector2(250, 150)
     window.draw(weapon)
  end
  def Weapon_Crafting.choose_mold(mold)
    if mold == 1
      @@chosen_mold = @@stick_mold
    end
  end
 end
end

module Etc
include Equipment
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
     def initialize(name : String, id : Int32, sprite : SF::Sprite, amount_owned : Int32, color : String, element : String, effect : String, sell_price : Int32, craft_sprite : SF::Sprite)
       @name = name
       @id = id
       @sprite = sprite
       @amount_owned = amount_owned
       @color = color
       @element = element
       @effect = effect
       @sell_price = sell_price
       @craft_sprite = craft_sprite
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
     def craft_sprite
      @craft_sprite
      end
     def name=(name)
        @name= name
       end
    #________________________________________________________________________________________________________________________________________________________
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    #+                                                              Variables                                                                               +
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     @@selected_ore_01 : Inventory_Ore; @@selected_ore_01 = @@nil_inventory_ore; @@selected_ore_02 : Inventory_Ore; @@selected_ore_02 = @@nil_inventory_ore
     @@selected_ore_sprite_01 : SF::Sprite; @@selected_ore_sprite_01 = Smelter_Nil_Sprite; @@selected_ore_sprite_02 : SF::Sprite
     @@selected_ore_sprite_02 = Smelter_Nil_Sprite; @@result_ore : SF::Sprite; @@result_ore = Smelter_Nil_Sprite; @@ingot_text = SF::Text.new
     @@ingot_text.font = FONT_COMMON; @@ingot_text.character_size = 20; @@ingot_text.color = SF::Color::Black; @@ingot_text.position = SF.vector2(350, -160) 
     @@ingot_text.string = "  Smelt ores to make ingots!!!"
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
         Inventory_Ore.check_selected_ore
        end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #----------------------------------------------------------Initialize----------------------------------------------------------------------------------
       def Inventory_Ore.initialize_smelter
        @@selected_ore_01 = @@nil_inventory_ore
        @@selected_ore_02 = @@nil_inventory_ore
        @@selected_ore_sprite_01 = Smelter_Nil_Sprite 
        @@selected_ore_sprite_02 = Smelter_Nil_Sprite
        @@result_ore = Smelter_Nil_Sprite  
        @@ingot_text.string = "  Smelt ores to make ingots!!!" 
       end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #-----------------------------------------------------------Display------------------------------------------------------------------------------------
       def Inventory_Ore.display_metal_smelter(window)  
        #Inventory_Ore.check_selected_ore
        window.draw(@@ingot_text)
        window.draw(@@selected_ore_sprite_01); window.draw(@@selected_ore_sprite_02); window.draw(@@result_ore)   
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
        if Inventory_Metal_Ore_Array.size >= 4
          metal_array_text_04 = Ore_amount_owned_text.dup
          metal_array_text_04.string = "x" + Inventory_Metal_Ore_Array[3].amount_owned.to_s
          Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[3].name].position = SF.vector2(175, -170)
          metal_array_text_04.position =  Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[3].name].position + SF.vector2(5, 25)
          window.draw(Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[3].name])
          window.draw(metal_array_text_04)
         end
        if Inventory_Metal_Ore_Array.size >= 5
          metal_array_text_05 = Ore_amount_owned_text.dup
          metal_array_text_05.string = "x" + Inventory_Metal_Ore_Array[4].amount_owned.to_s
          Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[4].name].position = SF.vector2(225, -170)
          metal_array_text_05.position =  Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[4].name].position + SF.vector2(5, 25)
          window.draw(Smelter_Ore_Sprite_Hash[Inventory_Metal_Ore_Array[4].name])
          window.draw(metal_array_text_05)
        end
       end
       def Inventory_Ore.check_selected_ore
         @@result_ore = Smelter_Nil_Sprite  
         @@ingot_text.string = "  Smelt ores to make ingots!!!"
       #.............Copper...............
        if @@selected_ore_01.name == "Copper" && @@selected_ore_02.name == "Nil"
          @@result_ore = Copper_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(410, -25) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Copper ingot requires 10 copper \nore!!!"
       #..............Tin.................
        else if @@selected_ore_01.name == "Tin" && @@selected_ore_02.name == "Nil"
          @@result_ore = Tin_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Tin ingot requires 8 tin ore!!!"
       #..............Zinc................
        else if @@selected_ore_01.name == "Zinc" && @@selected_ore_02.name == "Nil"
          @@result_ore = Zinc_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Zinc ingot requires 6 zinc ore!!!"
       #..............Iron................
        else if @@selected_ore_01.name == "Iron" && @@selected_ore_02.name == "Nil"
          @@result_ore = Iron_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Iron ingot requires 10 iron ore!!!"
       #.............Bronze...............
        else if @@selected_ore_01.name == "Copper" && @@selected_ore_02.name == "Tin"
          @@result_ore = Bronze_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Bronze ingot requires 4 copper \n and 2 tin ore!!!"
        else if @@selected_ore_01.name == "Tin" && @@selected_ore_02.name == "Copper"
          @@result_ore = Bronze_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Bronze ingot requires 4 copper \n and 2 tin ore!!!"
       #.............Brass...............
        else if @@selected_ore_01.name == "Copper" && @@selected_ore_02.name == "Zinc"
          @@result_ore = Brass_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Brass ingot requires 3 copper \n and 4 zinc ore!!!"
        else if @@selected_ore_01.name == "Zinc" && @@selected_ore_02.name == "Copper"
          @@result_ore = Brass_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Brass ingot requires 3 copper \n and 4 zinc ore!!!"
       #.............Steel...............
        else if @@selected_ore_01.name == "Carbon" && @@selected_ore_02.name == "Iron"
          @@result_ore = Steel_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Steel ingot requires 4 carbon \n and 6 iron ore!!!"
        else if @@selected_ore_01.name == "Iron" && @@selected_ore_02.name == "Carbon"
          @@result_ore = Steel_Ingot_Ore.dup
          @@result_ore.position = SF.vector2(400, -5) 
          @@result_ore.scale(SF.vector2(2, 2))
          @@ingot_text.string = "Steel ingot requires 4 carbon \n and 6 iron ore!!!"
       end; end; end; end; end; end; end; end; end; end
       end
      #------------------------------------------------------------------------------------------------------------------------------------------------------
      #-------------------------------------------------------------Smelt------------------------------------------------------------------------------------
         def Inventory_Ore.smelt
          case @@selected_ore_01.name
          when "Carbon"
            Inventory_Ore.smelt_carbon
           when "Copper"
            Inventory_Ore.smelt_copper
           when "Tin"
            Inventory_Ore.smelt_tin
           when "Zinc"
            Inventory_Ore.smelt_zinc
           when "Iron"
            Inventory_Ore.smelt_iron
         end; end
      #''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Carbon'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        def Inventory_Ore.smelt_carbon
         case @@selected_ore_02.name
          when "Iron"
           if @@carbon.amount_owned >= 4 && @@iron.amount_owned >= 6
             amount = 4
             @@carbon.remove_ore(amount)
             amount = 6
             @@iron.remove_ore(amount)
          ingot = "steel"
           Inventory_Ingot.smelt_ingot(ingot)
           else
             All_Audio::SFX.light_bonk
           end
          end
         end
       #_____________________________________________________________________________________________________________________________________________________
       #''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Copper'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
          when "Zinc"
            if @@copper.amount_owned >= 3 && @@zinc.amount_owned >= 4
              amount = 3
              @@copper.remove_ore(amount)
              amount = 4
              @@zinc.remove_ore(amount)
           ingot = "brass"
            Inventory_Ingot.smelt_ingot(ingot)
            else
              All_Audio::SFX.light_bonk
            end
          end
         end
       #_____________________________________________________________________________________________________________________________________________________
       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Tin'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
       #_____________________________________________________________________________________________________________________________________________________
       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Zinc''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        def Inventory_Ore.smelt_zinc
         case @@selected_ore_02.name
         when "Nil"
           if @@zinc.amount_owned >= 6
             amount = 6
             @@zinc.remove_ore(amount)
          ingot = "zinc"
           Inventory_Ingot.smelt_ingot(ingot)
           else
             All_Audio::SFX.light_bonk
           end
         when "Copper"
           if @@copper.amount_owned >= 3 && @@zinc.amount_owned >= 4
             amount = 3
             @@copper.remove_ore(amount)
             amount = 4
             @@zinc.remove_ore(amount)
          ingot = "brass"
           Inventory_Ingot.smelt_ingot(ingot)
           else
             All_Audio::SFX.light_bonk
           end
         end
        end
       #_____________________________________________________________________________________________________________________________________________________
       #'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Iron''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        def Inventory_Ore.smelt_iron
         case @@selected_ore_02.name
         when "Nil"
           if @@iron.amount_owned >= 10
             amount = 10
             @@iron.remove_ore(amount)
          ingot = "iron"
           Inventory_Ingot.smelt_ingot(ingot)
           else
             All_Audio::SFX.light_bonk
           end
         when "Carbon"
           if @@carbon.amount_owned >= 4 && @@iron.amount_owned >= 6
             amount = 4
             @@carbon.remove_ore(amount)
             amount = 6
             @@iron.remove_ore(amount)
          ingot = "steel"
           Inventory_Ingot.smelt_ingot(ingot)
           else
             All_Audio::SFX.light_bonk
           end
         end
        end
     #_______________________________________________________________________________________________________________________________________________________________
      #--------------------------------------------------------------------------------------------------------------------------------------------------------------
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Inventory Ore Display+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            
      #______________________________________________________________________________________________________________________________________________________________
    #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #/                                                                   Entities                                                                                   /
    #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      @@nil_inventory_ore = Inventory_Ore.new("Nil", 0, Smelter_Nil_Sprite, 0, "clear", "nil", "nil", 0, Smelter_Nil_Sprite)                                                             
     #////////////////////////////////////////////////////////////////////Minerals\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      #------------------------------------------------------------------Bloodstone----------------------------------------------------------------------------------
       @@bloodstone_inventory_ore = Inventory_Ore.new("Bloodstone", 1, Bloodstone_Inventory_Ore, 1, "red", "earth", "hp+", 70, Bloodstone_Gem_Cutter_Ore)
       Ore_Array.push(@@bloodstone_inventory_ore)
      #------------------------------------------------------------------Moss Agate----------------------------------------------------------------------------------
       @@moss_agate_inventory_ore = Inventory_Ore.new("Moss Agate", 2, Moss_Agate_Inventory_Ore, 1, "green", "earth", "passive_mp_regen", 60, Moss_Agate_Gem_Cutter_Ore)
       Ore_Array.push(@@moss_agate_inventory_ore)
      #--------------------------------------------------------------------Amber-------------------------------------------------------------------------------------
       @@amber_inventory_ore = Inventory_Ore.new("Amber", 3, Amber_Inventory_Ore, 1, "yellow", "fire", "passive_hp_regen", 55, Amber_Gem_Cutter_Ore)
       Ore_Array.push(@@amber_inventory_ore)
      #------------------------------------------------------------------Wavellite----------------------------------------------------------------------------------- 
       @@wavellite_inventory_ore = Inventory_Ore.new("Wavellite", 4, Wavellite_Inventory_Ore, 1, "green", "earth", "mp+", 75, Wavellite_Gem_Cutter_Ore)
       Ore_Array.push(@@wavellite_inventory_ore)
      #--------------------------------------------------------------------Topaz------------------------------------------------------------------------------------- 
       @@topaz_inventory_ore = Inventory_Ore.new("Topaz", 5, Topaz_Inventory_Ore, 1, "yellow", "fire", "INT+", 175, Topaz_Gem_Cutter_Ore)
       Ore_Array.push(@@topaz_inventory_ore)
      #------------------------------------------------------------------Amethyst------------------------------------------------------------------------------------ 
       @@amethyst_inventory_ore = Inventory_Ore.new("Amethyst", 6, Amethyst_Inventory_Ore, 1, "purple", "air", "INT+", 105, Amethyst_Gem_Cutter_Ore)
       Ore_Array.push(@@amethyst_inventory_ore) 
      #----------------------------------------------------------------Smoky Quartz--------------------------------------------------------------------------------- 
       @@smoky_quartz_inventory_ore = Inventory_Ore.new("Smoky Quartz", 7, Smokey_Quartz_Inventory_Ore, 1, "clear", "earth", "STR+", 95, Smoky_Quartz_Gem_Cutter_Ore)
       Ore_Array.push(@@smoky_quartz_inventory_ore) 
      #------------------------------------------------------------------Sapphire------------------------------------------------------------------------------------ 
       @@sapphire = Inventory_Ore.new("Sapphire", 8, Sapphire_Inventory_Ore, 1, "blue", "water", "EXP++", 950, Sapphire_Gem_Cutter_Ore)
       Ore_Array.push(@@sapphire) 
      #-----------------------------------------------------------------Black Opal----------------------------------------------------------------------------------- 
       @@black_opal = Inventory_Ore.new("Black Opal", 9, Black_Opal_Inventory_Ore, 1, "black", "water", "LUK+", 80, Black_Opal_Gem_Cutter_Ore)
       Ore_Array.push(@@black_opal) 
      #-------------------------------------------------------------------Ajiote------------------------------------------------------------------------------------- 
       @@ajiote = Inventory_Ore.new("Ajoite", 10, Ajoite_Inventory_Ore, 1, "clear", "water", "DEX+", 60, Ajoite_Gem_Cutter_Ore)
       Ore_Array.push(@@ajiote) 
      #-----------------------------------------------------------------Rhodolite------------------------------------------------------------------------------------ 
       @@rhodolite = Inventory_Ore.new("Rhodolite", 11, Rhodolite_Inventory_Ore, 1, "pink", "water", "STR+", 60, Rhodolite_Gem_Cutter_Ore)
       Ore_Array.push(@@rhodolite)
      #---------------------------------------------------------------Chalcanthite----------------------------------------------------------------------------------- 
       @@chalcanthite = Inventory_Ore.new("Chalcanthite", 12, Chalcanthite_Inventory_Ore, 1, "blue", "water", "poison", 30, Chalcanthite_Gem_Cutter_Ore)
       Ore_Array.push(@@chalcanthite)
      #-----------------------------------------------------------------Flourite------------------------------------------------------------------------------------- 
       @@flourite = Inventory_Ore.new("Flourite", 13, Flourite_Inventory_Ore, 1, "clear", "water", "INT+", 40, Flourite_Gem_Cutter_Ore)
       Ore_Array.push(@@flourite)
      #-----------------------------------------------------------------Amorite-------------------------------------------------------------------------------------- 
       @@amorite = Inventory_Ore.new("Amorite", 14, Amorite_Inventory_Ore, 1, "white", "water", "INT+", 40, Amorite_Gem_Cutter_Ore)
       Ore_Array.push(@@amorite)
      #---------------------------------------------------------------Lapis Lazuli----------------------------------------------------------------------------------- 
       @@lapis_lazuli = Inventory_Ore.new("Lapis Lazuli", 15, Lapis_Lazuli_Inventory_Ore, 1, "blue", "water", "STR+", 70, Lapis_Lazuli_Gem_Cutter_Ore)
       Ore_Array.push(@@lapis_lazuli)
      #----------------------------------------------------------------Moonstone------------------------------------------------------------------------------------- 
       @@moonstone = Inventory_Ore.new("Moonstone", 16, Moonstone_Inventory_Ore, 1, "white", "water", "DEX+", 70, Moonstone_Gem_Cutter_Ore)
       Ore_Array.push(@@moonstone)
      #---------------------------------------------------------------Blue Calcite----------------------------------------------------------------------------------- 
       @@blue_calcite = Inventory_Ore.new("Blue Calcite", 17, Blue_Calcite_Inventory_Ore, 1, "blue", "water", "DEX+", 70, Blue_Calcite_Gem_Cutter_Ore)
       Ore_Array.push(@@blue_calcite)
      #----------------------------------------------------------------Hiddenite------------------------------------------------------------------------------------- 
       @@hiddenite = Inventory_Ore.new("Hiddenite", 18, Hiddenite_Inventory_Ore, 1, "green", "water", "passive_hp_regen", 70, Hiddenite_Gem_Cutter_Ore)
       Ore_Array.push(@@hiddenite)
      #----------------------------------------------------------------Offretite------------------------------------------------------------------------------------- 
       @@offretite = Inventory_Ore.new("Offretite", 19, Offretite_Inventory_Ore, 1, "clear", "air", "INT+", 70, Offretite_Gem_Cutter_Ore)
       Ore_Array.push(@@offretite)
      #------------------------------------------------------------Holly Blue Agate--------------------------------------------------------------------------------- 
       @@holly_blue_agate = Inventory_Ore.new("Holly Blue Agate", 20, Holley_Blue_Agate_Inventory_Ore, 1, "blue", "air", "STR+", 70, Holly_Blue_Agate_Gem_Cutter_Ore)
       Ore_Array.push(@@holly_blue_agate)
      #----------------------------------------------------------------Ametrine-------------------------------------------------------------------------------------- 
       @@ametrine = Inventory_Ore.new("Ametrine", 21, Ametrine_Inventory_Ore, 1, "purple", "air", "STR+", 70, Ametrine_Gem_Cutter_Ore)
       Ore_Array.push(@@ametrine)
      #--------------------------------------------------------------Hemimorphite------------------------------------------------------------------------------------ 
       @@hemimorphite = Inventory_Ore.new("Hemimorphite", 22, Hemimorphite_Inventory_Ore, 1, "purple", "air", "INT+", 70, Hemimorphite_Gem_Cutter_Ore)
       Ore_Array.push(@@hemimorphite)
      #-------------------------------------------------------------Tiffany Stone------------------------------------------------------------------------------------ 
       @@tiffany_stone = Inventory_Ore.new("Tiffany Stone", 23, Tiffany_Stone_Inventory_Ore, 1, "purple", "air", "LUK+", 70, Tiffany_Stone_Gem_Cutter_Ore)
       Ore_Array.push(@@tiffany_stone)
      #----------------------------------------------------------------Azurite--------------------------------------------------------------------------------------- 
       @@azurite = Inventory_Ore.new("Azurite", 24, Azurite_Inventory_Ore, 1, "blue", "air", "DEX+", 70, Azurite_Gem_Cutter_Ore)
       Ore_Array.push(@@azurite)
      #----------------------------------------------------------------Howlite--------------------------------------------------------------------------------------- 
       @@howlite = Inventory_Ore.new("Howlite", 25, Howlite_Inventory_Ore, 1, "white", "air", "DEX+", 70, Howlite_Gem_Cutter_Ore)
       Ore_Array.push(@@howlite)
      #---------------------------------------------------------------Angelite--------------------------------------------------------------------------------------- 
       @@angelite = Inventory_Ore.new("Angelite", 26, Angelite_Inventory_Ore, 1, "blue", "air", "LUK+", 70, Angelite_Gem_Cutter_Ore)
       Ore_Array.push(@@angelite)
      #-------------------------------------------------------------Blue Lace Agate---------------------------------------------------------------------------------- 
       @@blue_lace_agate = Inventory_Ore.new("Blue Lace Agate", 27, Blue_Lace_Agate_Inventory_Ore, 1, "blue", "air", "INT+", 70, Blue_Lace_Agate_Gem_Cutter_Ore)
       Ore_Array.push(@@blue_lace_agate)
      #----------------------------------------------------------------Iolite---------------------------------------------------------------------------------------- 
       @@iolite = Inventory_Ore.new("Iolite", 28, Iolite_Inventory_Ore, 1, "blue", "air", "INT+", 70, Iolite_Gem_Cutter_Ore)
       Ore_Array.push(@@iolite)
      #---------------------------------------------------------------Sodalite--------------------------------------------------------------------------------------- 
       @@sodalite = Inventory_Ore.new("Sodalite", 29, Sodalite_Inventory_Ore, 1, "blue", "air", "passive_mp_regen", 70, Sodalite_Gem_Cutter_Ore)
       Ore_Array.push(@@sodalite)
      #---------------------------------------------------------------Kyanite---------------------------------------------------------------------------------------- 
       @@kyanite = Inventory_Ore.new("Kyanite", 30, Kyanite_Inventory_Ore, 1, "blue", "air", "LUK+", 70, Kyanite_Gem_Cutter_Ore)
       Ore_Array.push(@@kyanite)
      #---------------------------------------------------------------Sunstone--------------------------------------------------------------------------------------- 
       @@sunstone = Inventory_Ore.new("Sunstone", 31, Sunstone_Inventory_Ore, 1, "orange", "fire", "LUK+", 70, Sunstone_Gem_Cutter_Ore)
       Ore_Array.push(@@sunstone)
      #--------------------------------------------------------------Bony Amber-------------------------------------------------------------------------------------- 
       @@bony_amber = Inventory_Ore.new("Bony Amber", 32, Bony_Amber_Inventory_Ore, 1, "orange", "fire", "passive_hp_regen", 70, Bony_Amber_Gem_Cutter_Ore)
       Ore_Array.push(@@bony_amber)
      #--------------------------------------------------------------Blue Amber-------------------------------------------------------------------------------------- 
       @@blue_amber = Inventory_Ore.new("Blue Amber", 33, Blue_Amber_Inventory_Ore, 1, "blue", "fire", "passive_mp_regen", 70, Blue_Amber_Gem_Cutter_Ore)
       Ore_Array.push(@@blue_amber)
      #-------------------------------------------------------------Blue Spinel-------------------------------------------------------------------------------------- 
       @@blue_spinel = Inventory_Ore.new("Blue Spinel", 34, Blue_Spinel_Inventory_Ore, 1, "blue", "fire", "DEX+", 70, Blue_Spinel_Gem_Cutter_Ore)
       Ore_Array.push(@@blue_spinel)
      #--------------------------------------------------------------Red Spinel-------------------------------------------------------------------------------------- 
       @@red_spinel = Inventory_Ore.new("Red Spinel", 35, Red_Spinel_Inventory_Ore, 1, "red", "fire", "STR+", 70, Red_Spinel_Gem_Cutter_Ore)
       Ore_Array.push(@@red_spinel)
      #--------------------------------------------------------------Fire Opal--------------------------------------------------------------------------------------- 
       @@fire_opal = Inventory_Ore.new("Fire Opal", 36, Fire_Opal_Inventory_Ore, 1, "orange", "fire", "HP+", 70, Fire_Opal_Gem_Cutter_Ore)
       Ore_Array.push(@@fire_opal)
      #---------------------------------------------------------------Garnet----------------------------------------------------------------------------------------- 
       @@garnet = Inventory_Ore.new("Garnet", 37, Garnet_Inventory_Ore, 1, "red", "fire", "HP+", 70, Garnet_Gem_Cutter_Ore)
       Ore_Array.push(@@garnet)
      #----------------------------------------------------------------Ruby------------------------------------------------------------------------------------------ 
       @@ruby = Inventory_Ore.new("Ruby", 38, Ruby_Inventory_Ore, 1, "red", "fire", "STR+", 70, Ruby_Gem_Cutter_Ore)
       Ore_Array.push(@@ruby)
      #------------------------------------------------------------Cherry Quartz------------------------------------------------------------------------------------- 
       @@cherry_quartz = Inventory_Ore.new("Cherry Quartz", 39, Cherry_Quartz_Inventory_Ore, 1, "red", "fire", "HP+", 70, Cherry_Quartz_Gem_Cutter_Ore)
       Ore_Array.push(@@cherry_quartz)
      #------------------------------------------------------------Lemon Quartz-------------------------------------------------------------------------------------- 
       @@lemon_quartz = Inventory_Ore.new("Lemon Quartz", 40, Lemon_Quartz_Inventory_Ore, 1, "yellow", "fire", "drop_rate+", 70, Lemon_Quartz_Gem_Cutter_Ore)
       Ore_Array.push(@@lemon_quartz)
      #--------------------------------------------------------------Turquoise--------------------------------------------------------------------------------------- 
       @@turquoise = Inventory_Ore.new("Turquoise", 41, Turquoise_Inventory_Ore, 1, "green", "fire", "LUK+", 70, Turquoise_Gem_Cutter_Ore)
       Ore_Array.push(@@turquoise)
      #--------------------------------------------------------------Tiger's Eye------------------------------------------------------------------------------------- 
       @@tigers_eye = Inventory_Ore.new("Tiger's Eye", 42, Tigers_Eye_Inventory_Ore, 1, "orange", "fire", "DEX+", 70, Tigers_Eye_Gem_Cutter_Ore)
       Ore_Array.push(@@tigers_eye)
      #-------------------------------------------------------------Orange Calcite----------------------------------------------------------------------------------- 
       @@orange_calcite = Inventory_Ore.new("Orange Calcite", 43, Orange_Calcite_Inventory_Ore, 1, "orange", "fire", "HP+", 70, Orange_Calcite_Gem_Cutter_Ore)
       Ore_Array.push(@@orange_calcite)
      #--------------------------------------------------------------Grape Agate------------------------------------------------------------------------------------- 
       @@grape_agate = Inventory_Ore.new("Grape Agate", 44, Grape_Agate_Inventory_Ore, 1, "purple", "earth", "INT+", 70, Grape_Agate_Gem_Cutter_Ore)
       Ore_Array.push(@@grape_agate)
      #-----------------------------------------------------------------Jade----------------------------------------------------------------------------------------- 
       @@jade = Inventory_Ore.new("Jade", 45, Jade_Inventory_Ore, 1, "green", "earth", "LUK+", 70, Jade_Gem_Cutter_Ore)
       Ore_Array.push(@@jade)
      #----------------------------------------------------------------Diamond--------------------------------------------------------------------------------------- 
       @@diamond = Inventory_Ore.new("Diamond", 46, Diamond_Inventory_Ore, 1, "white", "earth", "DROP+++", 70, Diamond_Gem_Cutter_Ore)
       Ore_Array.push(@@diamond)
      #----------------------------------------------------------------Emerald--------------------------------------------------------------------------------------- 
       @@emerald = Inventory_Ore.new("Emerald", 47, Emerald_Inventory_Ore, 1, "green", "earth", "EXP++", 70, Emerald_Gem_Cutter_Ore)
       Ore_Array.push(@@emerald)
      #----------------------------------------------------------------Painite--------------------------------------------------------------------------------------- 
       @@painite = Inventory_Ore.new("Painite", 48, Painite_Inventory_Ore, 1, "red", "earth", "EXP+++", 70, Painite_Gem_Cutter_Ore)
       Ore_Array.push(@@painite)
      #-----------------------------------------------------------Bumblebee Jasper----------------------------------------------------------------------------------- 
       @@bumblebee_jasper = Inventory_Ore.new("Bumblebee Jasper", 49, Bumblebee_Jasper_Inventory_Ore, 1, "yellow", "earth", "DEX+", 70, Bumblebee_Jasper_Gem_Cutter_Ore)
       Ore_Array.push(@@bumblebee_jasper)
      #-------------------------------------------------------------Blood Jasper------------------------------------------------------------------------------------- 
       @@blood_jasper = Inventory_Ore.new("Blood Jasper", 50, Blood_Jasper_Inventory_Ore, 1, "green", "earth", "STR+", 70, Blood_Jasper_Gem_Cutter_Ore)
       Ore_Array.push(@@blood_jasper)
      #-------------------------------------------------------------Mook Jasper-------------------------------------------------------------------------------------- 
       @@mook_jasper = Inventory_Ore.new("Mook Jasper", 51, Mook_Jasper_Inventory_Ore, 1, "brown", "earth", "LUK+", 70, Mook_Jasper_Gem_Cutter_Ore)
       Ore_Array.push(@@mook_jasper)
      #-------------------------------------------------Owned_Gem_Cutter_Ore_Array-------------Red Jasper-------------------------------------------------------------------------------------- 
       @@red_jasper = Inventory_Ore.new("Red Jasper", 52, Red_Jasper_Inventory_Ore, 1, "red", "earth", "INT+", 70, Red_Jasper_Gem_Cutter_Ore)
       Ore_Array.push(@@red_jasper)
     #________________________________________________________________________________________________________________________________________________________
     #////////////////////////////////////////////////////////////////Metals\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      #---------------------------------------------------------------Carbon--------------------------------------------------------------------------------- 
       @@carbon = Inventory_Ore.new("Carbon", 1000, Carbon_Inventory_Ore, 1, "black", "none", "none", 70, Carbon_Smelter_Ore)
       Ore_Array.push(@@carbon); Smelter_Ore_Sprite_Hash["Carbon"] = Carbon_Smelter_Ore
      #---------------------------------------------------------------Copper--------------------------------------------------------------------------------- 
       @@copper = Inventory_Ore.new("Copper", 1001, Copper_Inventory_Ore, 1, "brown", "none", "none", 70, Copper_Smelter_Ore)
       Ore_Array.push(@@copper); Smelter_Ore_Sprite_Hash["Copper"] = Copper_Smelter_Ore
      #----------------------------------------------------------------Tin----------------------------------------------------------------------------------- 
       @@tin = Inventory_Ore.new("Tin", 1002, Tin_Inventory_Ore, 1, "white", "none", "none", 70, Tin_Smelter_Ore)
       Ore_Array.push(@@tin); Smelter_Ore_Sprite_Hash["Tin"] = Tin_Smelter_Ore
      #---------------------------------------------------------------Zinc----------------------------------------------------------------------------------- 
       @@zinc = Inventory_Ore.new("Zinc", 1003, Zinc_Inventory_Ore, 1, "white", "none", "none", 70, Zinc_Smelter_Ore)
       Ore_Array.push(@@zinc); Smelter_Ore_Sprite_Hash["Zinc"] = Zinc_Smelter_Ore
      #---------------------------------------------------------------Iron----------------------------------------------------------------------------------- 
       @@iron = Inventory_Ore.new("Iron", 1004, Iron_Inventory_Ore, 1, "grey", "none", "none", 70, Iron_Smelter_Ore)
       Ore_Array.push(@@iron); Smelter_Ore_Sprite_Hash["Iron"] = Iron_Smelter_Ore
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
    def initialize(name : String, id : Int32, sprite : SF::Sprite, amount_owned : Int32, sell_price : Int32, forge_sprite : SF::Sprite)
      @name = name
      @id = id
      @sprite = sprite
      @amount_owned = amount_owned
      @sell_price = sell_price
      @forge_sprite = forge_sprite
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
    def forge_sprite
      @forge_sprite
     end
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    #-------------------------------------------------------------Player Skill------------------------------------------------------------------------------
     @@smelting_lvl : Int32; @@smelting_lvl = 1; @@smelting_exp : Int32; @@smelting_exp = 0; @@needed_exp : Int32;
     @@needed_exp = 50 * (2 ** @@smelting_lvl); @@selected_ingot : Inventory_Ingot; @@selected_ingot = @@nil_ingot
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Select+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     def Inventory_Ingot.select_forge_ingot(slot)
      if slot < Owned_Ingot_Array.size
      @@selected_ingot = Owned_Ingot_Array[slot]
      ingot = Owned_Ingot_Array[slot].id
      Crafted_Items::Forge.choose_ingot(ingot)
      All_Audio::SFX.metal_hit_01
      else
        All_Audio::SFX.light_bonk
      end
      end
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Display++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     #''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Initialize''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
      #----------------------------------------------------------Remove Ingot-------------------------------------------------------------------------------
       def Inventory_Ingot.subtract_amount_owned(ingot, amount)
         ingot.amount_owned -= amount
        end
      #--------------------------------------------------------Ingot Inventory------------------------------------------------------------------------------
       def Inventory_Ingot.initialize_inventory
        s = Ingot_Array.size; i = 0
        while i < s
          if Ingot_Array[i].amount_owned > 0
            Owned_Ingot_Array.push(Ingot_Array[i])
          end
          i += 1
         end; end
      #--------------------------------------------------------Forge Inventory------------------------------------------------------------------------------
       def Inventory_Ingot.initialize_forge_ingots
        @@selected_ingot = @@nil_ingot
       end
     #______________________________________________________________________________________________________________________________________________________
     #''''''''''''''''''''''''''''''''''''''''''''''''''''''''Display Forge Ingots''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
         def Inventory_Ingot.display_forge_ingots(window)
           selected_ingot = @@selected_ingot.sprite.dup
           selected_ingot.position = SF.vector2(115, 45)
           window.draw(selected_ingot)
            Owned_Ingot_Array.uniq!
         #----------------------------------------------------slot 1-------------------------------------------
           if Owned_Ingot_Array.size >= 1
             Owned_Ingot_Array[0].forge_sprite.position = SF.vector2(50, -150)
             ingot_array_text_01 = Ore_amount_owned_text.dup
             ingot_array_text_01.position = Owned_Ingot_Array[0].sprite.position + SF.vector2(50, -125)
             ingot_array_text_01.string = "x" + Owned_Ingot_Array[0].amount_owned.to_s
             window.draw(Owned_Ingot_Array[0].forge_sprite); window.draw(ingot_array_text_01)
            end
         #----------------------------------------------------slot 2-------------------------------------------
           if Owned_Ingot_Array.size >= 2
             Owned_Ingot_Array[1].forge_sprite.position = SF.vector2(100, -150)
             ingot_array_text_02 = Ore_amount_owned_text.dup
             ingot_array_text_02.position = Owned_Ingot_Array[1].sprite.position + SF.vector2(100, -125)
             ingot_array_text_02.string = "x" + Owned_Ingot_Array[1].amount_owned.to_s
             window.draw(Owned_Ingot_Array[1].forge_sprite); window.draw(ingot_array_text_02)
            end
         #----------------------------------------------------slot 3-------------------------------------------
           if Owned_Ingot_Array.size >= 3
             Owned_Ingot_Array[2].forge_sprite.position = SF.vector2(150, -150)
             ingot_array_text_03 = Ore_amount_owned_text.dup
             ingot_array_text_03.position = Owned_Ingot_Array[2].sprite.position + SF.vector2(150, -125)
             ingot_array_text_03.string = "x" + Owned_Ingot_Array[2].amount_owned.to_s
             window.draw(Owned_Ingot_Array[2].forge_sprite); window.draw(ingot_array_text_03)
            end
         #----------------------------------------------------slot 4-------------------------------------------
           if Owned_Ingot_Array.size >= 4
             Owned_Ingot_Array[3].forge_sprite.position = SF.vector2(200, -150)
             ingot_array_text_04 = Ore_amount_owned_text.dup
             ingot_array_text_04.position = Owned_Ingot_Array[3].sprite.position + SF.vector2(200, -125)
             ingot_array_text_04.string = "x" + Owned_Ingot_Array[3].amount_owned.to_s
             window.draw(Owned_Ingot_Array[3].forge_sprite); window.draw(ingot_array_text_04)
            end
         #----------------------------------------------------slot 5-------------------------------------------
           if Owned_Ingot_Array.size >= 5
             Owned_Ingot_Array[4].forge_sprite.position = SF.vector2(250, -150)
             ingot_array_text_05 = Ore_amount_owned_text.dup
             ingot_array_text_05.position = Owned_Ingot_Array[4].sprite.position + SF.vector2(250, -125)
             ingot_array_text_05.string = "x" + Owned_Ingot_Array[4].amount_owned.to_s
             window.draw(Owned_Ingot_Array[4].forge_sprite); window.draw(ingot_array_text_05)
            end
         #----------------------------------------------------slot 6-------------------------------------------
           if Owned_Ingot_Array.size >= 6
             Owned_Ingot_Array[5].forge_sprite.position = SF.vector2(50, -100)
             ingot_array_text_06 = Ore_amount_owned_text.dup
             ingot_array_text_06.position = Owned_Ingot_Array[5].sprite.position + SF.vector2(50, -75)
             ingot_array_text_06.string = "x" + Owned_Ingot_Array[5].amount_owned.to_s
             window.draw(Owned_Ingot_Array[5].forge_sprite); window.draw(ingot_array_text_06)
            end
         #----------------------------------------------------slot 6-------------------------------------------
          if Owned_Ingot_Array.size >= 7
            Owned_Ingot_Array[6].forge_sprite.position = SF.vector2(100, -100)
            ingot_array_text_07 = Ore_amount_owned_text.dup
            ingot_array_text_07.position = Owned_Ingot_Array[6].sprite.position + SF.vector2(100, -75)
            ingot_array_text_07.string = "x" + Owned_Ingot_Array[6].amount_owned.to_s
            window.draw(Owned_Ingot_Array[6].forge_sprite); window.draw(ingot_array_text_07)
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
         #----------------------------------------------------slot 5-------------------------------------------
          if Owned_Ingot_Array.size >= 5
            case page
             when 1   
               Owned_Ingot_Array[4].sprite.position = SF.vector2(1155, 310);
              ore_array_text_05 = Ore_amount_owned_text.dup
              ore_array_text_05.position = Owned_Ingot_Array[4].sprite.position + SF.vector2(100, -5)
              ore_array_text_05.string = "x" + Owned_Ingot_Array[4].amount_owned.to_s
              window.draw(Owned_Ingot_Array[4].sprite); window.draw(ore_array_text_05)
             end
           end
         #----------------------------------------------------slot 6-------------------------------------------
          if Owned_Ingot_Array.size >= 6
            case page
             when 1   
               Owned_Ingot_Array[5].sprite.position = SF.vector2(1305, 310);
              ore_array_text_06 = Ore_amount_owned_text.dup
              ore_array_text_06.position = Owned_Ingot_Array[5].sprite.position + SF.vector2(100, -5)
              ore_array_text_06.string = "x" + Owned_Ingot_Array[5].amount_owned.to_s
              window.draw(Owned_Ingot_Array[5].sprite); window.draw(ore_array_text_06)
             end
           end
         #----------------------------------------------------slot 7-------------------------------------------
           if Owned_Ingot_Array.size >= 7
             case page
              when 1   
               Owned_Ingot_Array[6].sprite.position = SF.vector2(555, 460);
               ore_array_text_07 = Ore_amount_owned_text.dup
               ore_array_text_07.position = Owned_Ingot_Array[6].sprite.position + SF.vector2(100, -5)
               ore_array_text_07.string = "x" + Owned_Ingot_Array[6].amount_owned.to_s
               window.draw(Owned_Ingot_Array[6].sprite); window.draw(ore_array_text_07)
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
      when "zinc"
        difficulty = 1; ingot = @@zinc_ingot
        Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
      when "brass"
        difficulty = 2; ingot = @@brass_ingot
        Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
      when "iron"
        difficulty = 4; ingot = @@iron_ingot
        Inventory_Ingot.determine_ingots_smelted(difficulty, ingot)
      when "steel"
        difficulty = 6; ingot = @@steel_ingot
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
    #-----------------------------------------------------------------Nil--------------------------------------------------------------------------------- 
     @@nil_ingot = Inventory_Ingot.new("", 0, Nil_Ingot_Ore, 0, 10, Forge_Copper_Ingot)
     Ingot_Array.push(@@copper_ingot)
    #---------------------------------------------------------------Copper--------------------------------------------------------------------------------- 
     @@copper_ingot = Inventory_Ingot.new("Copper", 1, Copper_Ingot_Ore, 1, 10, Forge_Copper_Ingot)
     Ingot_Array.push(@@copper_ingot)
    #----------------------------------------------------------------Tin--------------------------------------------------------------------------------- 
     @@tin_ingot = Inventory_Ingot.new("Tin", 2, Tin_Ingot_Ore, 1, 10, Forge_Tin_Ingot)
     Ingot_Array.push(@@tin_ingot)
    #--------------------------------------------------------------Bronze-------------------------------------------------------------------------------- 
     @@bronze_ingot = Inventory_Ingot.new("Bronze", 3, Bronze_Ingot_Ore, 1, 10, Forge_Bronze_Ingot)
     Ingot_Array.push(@@bronze_ingot)
    #---------------------------------------------------------------Zinc--------------------------------------------------------------------------------- 
     @@zinc_ingot = Inventory_Ingot.new("Zinc", 4, Zinc_Ingot_Ore, 1, 10, Forge_Zinc_Ingot)
     Ingot_Array.push(@@zinc_ingot)
    #---------------------------------------------------------------Brass--------------------------------------------------------------------------------- 
     @@brass_ingot = Inventory_Ingot.new("Brass", 5, Brass_Ingot_Ore, 1, 10, Forge_Brass_Ingot)
     Ingot_Array.push(@@brass_ingot)
    #---------------------------------------------------------------Iron--------------------------------------------------------------------------------- 
     @@iron_ingot = Inventory_Ingot.new("Iron", 6, Iron_Ingot_Ore, 1, 10, Forge_Iron_Ingot)
     Ingot_Array.push(@@iron_ingot)
    #---------------------------------------------------------------Steel-------------------------------------------------------------------------------- 
     @@steel_ingot = Inventory_Ingot.new("Steel", 7, Steel_Ingot_Ore, 1, 10, Forge_Steel_Ingot)
     Ingot_Array.push(@@steel_ingot)
    end
 #CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
 #CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
 #C                                                        @note Cut Class                                                                               C
 #CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
 #CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
     class Cut 
      def initialize(name : String, is_owned : Bool, cutter_sprite : SF::Sprite, display_sprite : SF::Sprite)
        @name = name
        @is_owned = is_owned
        @cutter_sprite = cutter_sprite
        @display_sprite = display_sprite
       end
      def name
        @name
       end
      def is_owned
        @is_owned
       end
      def cutter_sprite
        @cutter_sprite
       end
      def display_sprite
        @display_sprite
       end
     @@table_cut = Cut.new("Table Cut", true, Cutter_Mold_Option_01, Cutter_Mold_Cut_Display_Option_01)
     Cut_Array.push(@@table_cut)
     @@square_cut = Cut.new("Square Cut", true, Cutter_Mold_Option_02, Cutter_Mold_Cut_Display_Option_02)
     Cut_Array.push(@@square_cut)
     @@pear_cut = Cut.new("Pear Cut", true, Cutter_Mold_Option_03, Cutter_Mold_Cut_Display_Option_03)
     Cut_Array.push(@@pear_cut)
     @@drop_cut = Cut.new("Drop Cut", true, Cutter_Mold_Option_04, Cutter_Mold_Cut_Display_Option_04)
     Cut_Array.push(@@drop_cut)
     @@brilliant_cut = Cut.new("Brilliant Cut", true, Cutter_Mold_Option_05, Cutter_Mold_Cut_Display_Option_05)
     Cut_Array.push(@@brilliant_cut)
    end
 #_____________________________________________________________________________________________________________________________________________________________
 #GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
 #GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
 #GG                                                         #@note Gem Class                                                                                GG
 #GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
 #GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
  GEM_ARRAY = [] of Gem; Owned_Gem_Array = [] of Gem; Owned_Gem_Cutter_Ore_Array = [] of Inventory_Ore; Cut_Array = [] of Cut; Known_Cut_Array = [] of Cut
  class Gem < Inventory_Ore

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #+                                                              Variables                                                                               +
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@current_style : String; @@current_style = "none"; @@current_gem : Inventory_Ore; @@current_gem = @@nil_inventory_ore
   @@preview_gem : SF::Sprite; @@preview_gem = Smelter_Nil_Sprite; @@current_cut : SF::Sprite; @@current_cut = Smelter_Nil_Sprite
  #________________________________________________________________________________________________________________________________________________________
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!                                                              Initialize                                                                              !
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   def initialize(name : String, id : Int32, sprite : SF::Sprite, cut : String, amount_owned : Int32, color : String, sell_price : Int32, 
    element : String, effect : String, craft_sprite : SF::Sprite)
    @name = name
    @id = id
    @sprite = sprite
    @cut = cut
    @amount_owned = amount_owned
    @color = color
    @sell_price = sell_price
    @element = element
    @effect = effect
    @craft_sprite = craft_sprite
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
   def cut
     @cut
    end
   def amount_owned
     @amount_owned
    end
   def color
     @color
    end
   def sell_price
     @sell_price
    end
   def element
     @element
    end
   def effect
     @effect
    end
   def craft_sprite
     @craft_sprite
    end
   def sprite=(sprite)
     @sprite= sprite
    end
   def craft_sprite=(craft_sprite)
     @craft_sprite= craft_sprite
    end
   def cut=(cut)
     @cut= cut
    end
   def name=(name)
     @name= name
    end
   def effect=(effect)
     @effect= effect
    end
   def element=(element)
     @element= element
    end
   def_clone
  #________________________________________________________________________________________________________________________________________________________
  #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  #?                                                               Methods                                                                                ?
  #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #------------------------------------------------------------Check Element------------------------------------------------------------------------------
    def Gem.check_element(gem1)
      s = GEM_ARRAY.size; i = 0
      while s > i
        if gem1 == GEM_ARRAY[i].name
          element = GEM_ARRAY[i].element
        end
        i += 1
      end
    end
   #--------------------------------------------------------Initialize Inventory---------------------------------------------------------------------------
    def Gem.initialize_gem_inventory
      s = GEM_ARRAY.size; i = 0
      while s > i
        if GEM_ARRAY[i].amount_owned > 0
          Owned_Gem_Array.push(GEM_ARRAY[i])
        end
        i += 1
      end
    end
   #-------------------------------------------------------------Add Gem-----------------------------------------------------------------------------------
    def add_gem(amount)
     @amount_owned += amount
    end
   #-------------------------------------------------Initialize Gem Cutter Ore Inventory-------------------------------------------------------------------
    def Gem.initialize_gem_cutter_ore_display
      s = Inventory_Ore_Array.size; i = 0
      while s > i
        if Inventory_Ore_Array[i].effect != "none"
          Owned_Gem_Cutter_Ore_Array.push(Inventory_Ore_Array[i])
        end
        i += 1
      end
    end
   #-------------------------------------------------Initialize Gem Cutter Cut Inventory-------------------------------------------------------------------
     def Gem.initialize_gem_cutter_cut_display
      s = Cut_Array.size; i = 0
      while s > i
        if Cut_Array[i].is_owned == true
          Known_Cut_Array.push(Cut_Array[i])
        end
        i += 1
      end
    end
    def Gem.initialize_cutter_cut_display(window)
      if Known_Cut_Array.size > 0
       Known_Cut_Array[0].cutter_sprite.position = SF.vector2(1050, -95)
       window.draw(Known_Cut_Array[0].cutter_sprite)
       end
      if Known_Cut_Array.size > 1
        Known_Cut_Array[1].cutter_sprite.position = SF.vector2(1050, -45)
        window.draw(Known_Cut_Array[1].cutter_sprite)
       end
      if Known_Cut_Array.size > 2
        Known_Cut_Array[2].cutter_sprite.position = SF.vector2(1050, 5)
        window.draw(Known_Cut_Array[2].cutter_sprite)
       end
      if Known_Cut_Array.size > 3
        Known_Cut_Array[3].cutter_sprite.position = SF.vector2(1050, 55)
        window.draw(Known_Cut_Array[3].cutter_sprite)
       end
      if Known_Cut_Array.size > 4
        Known_Cut_Array[4].cutter_sprite.position = SF.vector2(1050, 105)
        window.draw(Known_Cut_Array[4].cutter_sprite)
       end
    end
   #---------------------------------------------------------Display Inventory-----------------------------------------------------------------------------
    def Gem.display_gem(window, page)
      Owned_Gem_Array.uniq!
      #----------------------------------------------------slot 1-------------------------------------------
       if Owned_Gem_Array.size >= 1
        case page
         when 1   
          Owned_Gem_Array[0].sprite.position = SF.vector2(555, 310);
          gem_array_text_01 = Ore_amount_owned_text.dup
          gem_array_text_01.position = Owned_Gem_Array[0].sprite.position + SF.vector2(100, -5)
          gem_array_text_01.string = "x" + Owned_Gem_Array[0].amount_owned.to_s
          window.draw(Owned_Gem_Array[0].sprite); window.draw(gem_array_text_01)
         when 2 
           if Owned_Gem_Array.size >= 19  
            Owned_Gem_Array[18].sprite.position = SF.vector2(555, 310);
            ore_array_text_19 = Ore_amount_owned_text.dup
            ore_array_text_19.position = Owned_Gem_Array[18].sprite.position + SF.vector2(100, -5)
            ore_array_text_19.string = "x" + Owned_Gem_Array[18].amount_owned.to_s
            window.draw(Owned_Gem_Array[18].sprite); window.draw(ore_array_text_19)
          end
         when 3 
          if Owned_Gem_Array.size >= 37  
           Owned_Gem_Array[36].sprite.position = SF.vector2(555, 310);
           ore_array_text_37 = Ore_amount_owned_text.dup
           ore_array_text_37.position = Owned_Gem_Array[36].sprite.position + SF.vector2(100, -5)
           ore_array_text_37.string = "x" + Owned_Gem_Array[36].amount_owned.to_s
           window.draw(Owned_Gem_Array[36].sprite); window.draw(ore_array_text_37)
          end
         when 4 
          if Owned_Gem_Array.size >= 55  
           Owned_Gem_Array[54].sprite.position = SF.vector2(555, 310);
           ore_array_text_55 = Ore_amount_owned_text.dup
           ore_array_text_55.position = Owned_Gem_Array[54].sprite.position + SF.vector2(100, -5)
           ore_array_text_55.string = "x" + Owned_Gem_Array[54].amount_owned.to_s
           window.draw(Owned_Gem_Array[54].sprite); window.draw(ore_array_text_55)
          end
         when 5 
          if Owned_Gem_Array.size >= 73  
           Owned_Gem_Array[72].sprite.position = SF.vector2(555, 310);
           ore_array_text_73 = Ore_amount_owned_text.dup
           ore_array_text_73.position = Owned_Gem_Array[72].sprite.position + SF.vector2(100, -5)
           ore_array_text_73.string = "x" + Owned_Gem_Array[72].amount_owned.to_s
           window.draw(Owned_Gem_Array[72].sprite); window.draw(ore_array_text_73)
          end
        end; end
      #----------------------------------------------------slot 2-------------------------------------------
       if Owned_Gem_Array.size >= 2
        case page
         when 1   
          Owned_Gem_Array[1].sprite.position = SF.vector2(710, 310);
          ore_array_text_02 = Ore_amount_owned_text.dup
          ore_array_text_02.position = Owned_Gem_Array[1].sprite.position + SF.vector2(100, -5)
          ore_array_text_02.string = "x" + Owned_Gem_Array[1].amount_owned.to_s
          window.draw(Owned_Gem_Array[1].sprite); window.draw(ore_array_text_02)
         when 2 
          if Owned_Gem_Array.size >= 20  
           Owned_Gem_Array[19].sprite.position = SF.vector2(710, 310);
           ore_array_text_20 = Ore_amount_owned_text.dup
           ore_array_text_20.position = Owned_Gem_Array[19].sprite.position + SF.vector2(100, -5)
           ore_array_text_20.string = "x" + Owned_Gem_Array[19].amount_owned.to_s
           window.draw(Owned_Gem_Array[19].sprite); window.draw(ore_array_text_20)
          end
         when 3 
          if Owned_Gem_Array.size >= 38  
           Owned_Gem_Array[37].sprite.position = SF.vector2(710, 310);
           ore_array_text_38 = Ore_amount_owned_text.dup
           ore_array_text_38.position = Owned_Gem_Array[37].sprite.position + SF.vector2(100, -5)
           ore_array_text_38.string = "x" + Owned_Gem_Array[37].amount_owned.to_s
           window.draw(Owned_Gem_Array[37].sprite); window.draw(ore_array_text_38)
          end
         when 4 
          if Owned_Gem_Array.size >= 56  
           Owned_Gem_Array[55].sprite.position = SF.vector2(710, 310);
           ore_array_text_56 = Ore_amount_owned_text.dup
           ore_array_text_56.position = Owned_Gem_Array[55].sprite.position + SF.vector2(100, -5)
           ore_array_text_56.string = "x" + Owned_Gem_Array[55].amount_owned.to_s
           window.draw(Owned_Gem_Array[55].sprite); window.draw(ore_array_text_56)
          end
         when 5 
          if Owned_Gem_Array.size >= 74  
           Owned_Gem_Array[73].sprite.position = SF.vector2(710, 310);
           ore_array_text_74 = Ore_amount_owned_text.dup
           ore_array_text_74.position = Owned_Gem_Array[73].sprite.position + SF.vector2(100, -5)
           ore_array_text_74.string = "x" + Owned_Gem_Array[73].amount_owned.to_s
           window.draw(Owned_Gem_Array[73].sprite); window.draw(ore_array_text_74)
          end
        end; end
      #----------------------------------------------------slot 3-------------------------------------------
        if Owned_Gem_Array.size >= 3
         case page
          when 1   
            Owned_Gem_Array[2].sprite.position = SF.vector2(855, 310);
            ore_array_text_03 = Ore_amount_owned_text.dup
            ore_array_text_03.position = Owned_Gem_Array[2].sprite.position + SF.vector2(100, -5)
            ore_array_text_03.string = "x" + Owned_Gem_Array[2].amount_owned.to_s
            window.draw(Owned_Gem_Array[2].sprite); window.draw(ore_array_text_03)
          when 2 
           if Owned_Gem_Array.size >= 21  
            Owned_Gem_Array[20].sprite.position = SF.vector2(855, 310);
            ore_array_text_21 = Ore_amount_owned_text.dup
            ore_array_text_21.position = Owned_Gem_Array[20].sprite.position + SF.vector2(100, -5)
            ore_array_text_21.string = "x" + Owned_Gem_Array[20].amount_owned.to_s
            window.draw(Owned_Gem_Array[20].sprite); window.draw(ore_array_text_21)
           end
          when 3 
           if Owned_Gem_Array.size >= 39  
            Owned_Gem_Array[38].sprite.position = SF.vector2(855, 310);
            ore_array_text_39 = Ore_amount_owned_text.dup
            ore_array_text_39.position = Owned_Gem_Array[38].sprite.position + SF.vector2(100, -5)
            ore_array_text_39.string = "x" + Owned_Gem_Array[38].amount_owned.to_s
            window.draw(Owned_Gem_Array[38].sprite); window.draw(ore_array_text_39)
           end
          when 4 
           if Owned_Gem_Array.size >= 57  
            Owned_Gem_Array[56].sprite.position = SF.vector2(855, 310);
            ore_array_text_57 = Ore_amount_owned_text.dup
            ore_array_text_57.position = Owned_Gem_Array[56].sprite.position + SF.vector2(100, -5)
            ore_array_text_57.string = "x" + Owned_Gem_Array[56].amount_owned.to_s
            window.draw(Owned_Gem_Array[56].sprite); window.draw(ore_array_text_57)
           end
          when 5 
           if Owned_Gem_Array.size >= 75  
            Owned_Gem_Array[74].sprite.position = SF.vector2(855, 310);
            ore_array_text_75 = Ore_amount_owned_text.dup
            ore_array_text_75.position = Owned_Gem_Array[74].sprite.position + SF.vector2(100, -5)
            ore_array_text_75.string = "x" + Owned_Gem_Array[74].amount_owned.to_s
            window.draw(Owned_Gem_Array[74].sprite); window.draw(ore_array_text_75)
           end
          end; end
      #----------------------------------------------------slot 4-------------------------------------------
        if Owned_Gem_Array.size >= 4
         case page
          when 1   
            Owned_Gem_Array[3].sprite.position = SF.vector2(1005, 310);
            ore_array_text_04 = Ore_amount_owned_text.dup
            ore_array_text_04.position = Owned_Gem_Array[3].sprite.position + SF.vector2(100, -5)
            ore_array_text_04.string = "x" + Owned_Gem_Array[3].amount_owned.to_s
            window.draw(Owned_Gem_Array[3].sprite); window.draw(ore_array_text_04)
          when 2 
           if Owned_Gem_Array.size >= 22  
            Owned_Gem_Array[21].sprite.position = SF.vector2(1005, 310);
            ore_array_text_22 = Ore_amount_owned_text.dup
            ore_array_text_22.position = Owned_Gem_Array[21].sprite.position + SF.vector2(100, -5)
            ore_array_text_22.string = "x" + Owned_Gem_Array[21].amount_owned.to_s
            window.draw(Owned_Gem_Array[21].sprite); window.draw(ore_array_text_22)
           end
          when 3 
           if Owned_Gem_Array.size >= 40  
            Owned_Gem_Array[39].sprite.position = SF.vector2(1005, 310);
            ore_array_text_40 = Ore_amount_owned_text.dup
            ore_array_text_40.position = Owned_Gem_Array[39].sprite.position + SF.vector2(100, -5)
            ore_array_text_40.string = "x" + Owned_Gem_Array[39].amount_owned.to_s
            window.draw(Owned_Gem_Array[39].sprite); window.draw(ore_array_text_40)
           end
          when 4 
           if Owned_Gem_Array.size >= 58  
            Owned_Gem_Array[57].sprite.position = SF.vector2(1005, 310);
            ore_array_text_58 = Ore_amount_owned_text.dup
            ore_array_text_58.position = Owned_Gem_Array[57].sprite.position + SF.vector2(100, -5)
            ore_array_text_58.string = "x" + Owned_Gem_Array[57].amount_owned.to_s
            window.draw(Owned_Gem_Array[57].sprite); window.draw(ore_array_text_58)
           end
          when 5 
           if Owned_Gem_Array.size >= 76  
            Owned_Gem_Array[75].sprite.position = SF.vector2(1005, 310);
            ore_array_text_76 = Ore_amount_owned_text.dup
            ore_array_text_76.position = Owned_Gem_Array[75].sprite.position + SF.vector2(100, -5)
            ore_array_text_76.string = "x" + Owned_Gem_Array[75].amount_owned.to_s
            window.draw(Owned_Gem_Array[75].sprite); window.draw(ore_array_text_76)
           end
          end; end
      #----------------------------------------------------slot 5-------------------------------------------
       if Owned_Gem_Array.size >= 5
         case page
          when 1   
           Owned_Gem_Array[4].sprite.position = SF.vector2(1155, 310);
           ore_array_text_05 = Ore_amount_owned_text.dup
           ore_array_text_05.position = Owned_Gem_Array[4].sprite.position + SF.vector2(100, -5)
           ore_array_text_05.string = "x" + Owned_Gem_Array[4].amount_owned.to_s
           window.draw(Owned_Gem_Array[4].sprite); window.draw(ore_array_text_05)
          when 2 
           if Owned_Gem_Array.size >= 23  
            Owned_Gem_Array[22].sprite.position = SF.vector2(1155, 310);
            ore_array_text_23 = Ore_amount_owned_text.dup
            ore_array_text_23.position = Owned_Gem_Array[22].sprite.position + SF.vector2(100, -5)
            ore_array_text_23.string = "x" + Owned_Gem_Array[22].amount_owned.to_s
            window.draw(Owned_Gem_Array[22].sprite); window.draw(ore_array_text_23)
           end
          when 3 
           if Owned_Gem_Array.size >= 41  
            Owned_Gem_Array[40].sprite.position = SF.vector2(1155, 310);
            ore_array_text_41 = Ore_amount_owned_text.dup
            ore_array_text_41.position = Owned_Gem_Array[40].sprite.position + SF.vector2(100, -5)
            ore_array_text_41.string = "x" + Owned_Gem_Array[40].amount_owned.to_s
            window.draw(Owned_Gem_Array[40].sprite); window.draw(ore_array_text_41)
           end
          when 4 
           if Owned_Gem_Array.size >= 59  
            Owned_Gem_Array[58].sprite.position = SF.vector2(1155, 310);
            ore_array_text_59 = Ore_amount_owned_text.dup
            ore_array_text_59.position = Owned_Gem_Array[58].sprite.position + SF.vector2(100, -5)
            ore_array_text_59.string = "x" + Owned_Gem_Array[58].amount_owned.to_s
            window.draw(Owned_Gem_Array[58].sprite); window.draw(ore_array_text_59)
           end
          when 5 
           if Owned_Gem_Array.size >= 77  
            Owned_Gem_Array[76].sprite.position = SF.vector2(1155, 310);
            ore_array_text_77 = Ore_amount_owned_text.dup
            ore_array_text_77.position = Owned_Gem_Array[76].sprite.position + SF.vector2(100, -5)
            ore_array_text_77.string = "x" + Owned_Gem_Array[76].amount_owned.to_s
            window.draw(Owned_Gem_Array[76].sprite); window.draw(ore_array_text_77)
           end
          end; end
      #----------------------------------------------------slot 6-------------------------------------------
       if Owned_Gem_Array.size >= 6
         case page
          when 1   
           Owned_Gem_Array[5].sprite.position = SF.vector2(1305, 310);
           ore_array_text_06 = Ore_amount_owned_text.dup
           ore_array_text_06.position = Owned_Gem_Array[5].sprite.position + SF.vector2(100, -5)
           ore_array_text_06.string = "x" + Owned_Gem_Array[5].amount_owned.to_s
           window.draw(Owned_Gem_Array[5].sprite); window.draw(ore_array_text_06)
          when 2 
           if Owned_Gem_Array.size >= 24  
            Owned_Gem_Array[23].sprite.position = SF.vector2(1305, 310);
            ore_array_text_24 = Ore_amount_owned_text.dup
            ore_array_text_24.position = Owned_Gem_Array[23].sprite.position + SF.vector2(100, -5)
            ore_array_text_24.string = "x" + Owned_Gem_Array[23].amount_owned.to_s
            window.draw(Owned_Gem_Array[23].sprite); window.draw(ore_array_text_24)
           end
          when 3 
            if Owned_Gem_Array.size >= 42  
             Owned_Gem_Array[41].sprite.position = SF.vector2(1305, 310);
             ore_array_text_42 = Ore_amount_owned_text.dup
             ore_array_text_42.position = Owned_Gem_Array[41].sprite.position + SF.vector2(100, -5)
             ore_array_text_42.string = "x" + Owned_Gem_Array[41].amount_owned.to_s
             window.draw(Owned_Gem_Array[41].sprite); window.draw(ore_array_text_42)
            end
          when 4 
           if Owned_Gem_Array.size >= 60  
            Owned_Gem_Array[59].sprite.position = SF.vector2(1305, 310);
            ore_array_text_60 = Ore_amount_owned_text.dup
            ore_array_text_60.position = Owned_Gem_Array[59].sprite.position + SF.vector2(100, -5)
            ore_array_text_60.string = "x" + Owned_Gem_Array[59].amount_owned.to_s
            window.draw(Owned_Gem_Array[59].sprite); window.draw(ore_array_text_60)
           end
          when 5 
            if Owned_Gem_Array.size >= 78  
             Owned_Gem_Array[77].sprite.position = SF.vector2(1305, 310);
             ore_array_text_78 = Ore_amount_owned_text.dup
             ore_array_text_78.position = Owned_Gem_Array[77].sprite.position + SF.vector2(100, -5)
             ore_array_text_78.string = "x" + Owned_Gem_Array[77].amount_owned.to_s
             window.draw(Owned_Gem_Array[77].sprite); window.draw(ore_array_text_78)
            end
          end; end
      #----------------------------------------------------slot 7-------------------------------------------
        if Owned_Gem_Array.size >= 7
          case page
           when 1   
            Owned_Gem_Array[6].sprite.position = SF.vector2(555, 460);
            ore_array_text_07 = Ore_amount_owned_text.dup
            ore_array_text_07.position = Owned_Gem_Array[6].sprite.position + SF.vector2(100, -5)
            ore_array_text_07.string = "x" + Owned_Gem_Array[6].amount_owned.to_s
            window.draw(Owned_Gem_Array[6].sprite); window.draw(ore_array_text_07)
           when 2 
            if Owned_Gem_Array.size >= 25  
             Owned_Gem_Array[24].sprite.position = SF.vector2(555, 460);
             ore_array_text_25 = Ore_amount_owned_text.dup
             ore_array_text_25.position = Owned_Gem_Array[24].sprite.position + SF.vector2(100, -5)
             ore_array_text_25.string = "x" + Owned_Gem_Array[24].amount_owned.to_s
             window.draw(Owned_Gem_Array[24].sprite); window.draw(ore_array_text_25)
            end
           when 3 
            if Owned_Gem_Array.size >= 43  
             Owned_Gem_Array[42].sprite.position = SF.vector2(555, 460);
             ore_array_text_43 = Ore_amount_owned_text.dup
             ore_array_text_43.position = Owned_Gem_Array[42].sprite.position + SF.vector2(100, -5)
             ore_array_text_43.string = "x" + Owned_Gem_Array[42].amount_owned.to_s
             window.draw(Owned_Gem_Array[42].sprite); window.draw(ore_array_text_43)
            end
           when 4 
            if Owned_Gem_Array.size >= 61  
             Owned_Gem_Array[60].sprite.position = SF.vector2(555, 460);
             ore_array_text_61 = Ore_amount_owned_text.dup
             ore_array_text_61.position = Owned_Gem_Array[60].sprite.position + SF.vector2(100, -5)
             ore_array_text_61.string = "x" + Owned_Gem_Array[60].amount_owned.to_s
             window.draw(Owned_Gem_Array[60].sprite); window.draw(ore_array_text_61)
            end
           when 5 
            if Owned_Gem_Array.size >= 79  
             Owned_Gem_Array[78].sprite.position = SF.vector2(555, 460);
             ore_array_text_79 = Ore_amount_owned_text.dup
             ore_array_text_79.position = Owned_Gem_Array[78].sprite.position + SF.vector2(100, -5)
             ore_array_text_79.string = "x" + Owned_Gem_Array[78].amount_owned.to_s
             window.draw(Owned_Gem_Array[78].sprite); window.draw(ore_array_text_79)
            end
          end; end
      #----------------------------------------------------slot 8-------------------------------------------
        if Owned_Gem_Array.size >= 8
          case page
           when 1   
            Owned_Gem_Array[7].sprite.position = SF.vector2(710, 460);
            ore_array_text_08 = Ore_amount_owned_text.dup
            ore_array_text_08.position = Owned_Gem_Array[7].sprite.position + SF.vector2(100, -5)
            ore_array_text_08.string = "x" + Owned_Gem_Array[7].amount_owned.to_s
            window.draw(Owned_Gem_Array[7].sprite); window.draw(ore_array_text_08)
           when 2 
            if Owned_Gem_Array.size >= 26  
             Owned_Gem_Array[25].sprite.position = SF.vector2(710, 460);
             ore_array_text_26 = Ore_amount_owned_text.dup
             ore_array_text_26.position = Owned_Gem_Array[25].sprite.position + SF.vector2(100, -5)
             ore_array_text_26.string = "x" + Owned_Gem_Array[25].amount_owned.to_s
             window.draw(Owned_Gem_Array[25].sprite); window.draw(ore_array_text_26)
            end
           when 3 
            if Owned_Gem_Array.size >= 44  
             Owned_Gem_Array[43].sprite.position = SF.vector2(710, 460);
             ore_array_text_44 = Ore_amount_owned_text.dup
             ore_array_text_44.position = Owned_Gem_Array[43].sprite.position + SF.vector2(100, -5)
             ore_array_text_44.string = "x" + Owned_Gem_Array[43].amount_owned.to_s
             window.draw(Owned_Gem_Array[43].sprite); window.draw(ore_array_text_44)
            end
           when 4 
            if Owned_Gem_Array.size >= 62  
             Owned_Gem_Array[61].sprite.position = SF.vector2(710, 460);
             ore_array_text_62 = Ore_amount_owned_text.dup
             ore_array_text_62.position = Owned_Gem_Array[61].sprite.position + SF.vector2(100, -5)
             ore_array_text_62.string = "x" + Owned_Gem_Array[61].amount_owned.to_s
             window.draw(Owned_Gem_Array[61].sprite); window.draw(ore_array_text_62)
            end
           when 5 
            if Owned_Gem_Array.size >= 80  
             Owned_Gem_Array[79].sprite.position = SF.vector2(710, 460);
             ore_array_text_80 = Ore_amount_owned_text.dup
             ore_array_text_80.position = Owned_Gem_Array[79].sprite.position + SF.vector2(100, -5)
             ore_array_text_80.string = "x" + Owned_Gem_Array[79].amount_owned.to_s
             window.draw(Owned_Gem_Array[79].sprite); window.draw(ore_array_text_80)
            end
           end; end
      #----------------------------------------------------slot 9-------------------------------------------
        if Owned_Gem_Array.size >= 9
          case page
           when 1   
            Owned_Gem_Array[8].sprite.position = SF.vector2(855, 460);
            ore_array_text_09 = Ore_amount_owned_text.dup
            ore_array_text_09.position = Owned_Gem_Array[8].sprite.position + SF.vector2(100, -5)
            ore_array_text_09.string = "x" + Owned_Gem_Array[8].amount_owned.to_s
            window.draw(Owned_Gem_Array[8].sprite); window.draw(ore_array_text_09)
           when 2 
            if Owned_Gem_Array.size >= 27  
             Owned_Gem_Array[26].sprite.position = SF.vector2(855, 460);
             ore_array_text_27 = Ore_amount_owned_text.dup
             ore_array_text_27.position = Owned_Gem_Array[26].sprite.position + SF.vector2(100, -5)
             ore_array_text_27.string = "x" + Owned_Gem_Array[26].amount_owned.to_s
             window.draw(Owned_Gem_Array[26].sprite); window.draw(ore_array_text_27)
            end
           when 3 
            if Owned_Gem_Array.size >= 45  
             Owned_Gem_Array[44].sprite.position = SF.vector2(855, 460);
             ore_array_text_45 = Ore_amount_owned_text.dup
             ore_array_text_45.position = Owned_Gem_Array[44].sprite.position + SF.vector2(100, -5)
             ore_array_text_45.string = "x" + Owned_Gem_Array[44].amount_owned.to_s
             window.draw(Owned_Gem_Array[44].sprite); window.draw(ore_array_text_45)
            end
           when 4 
            if Owned_Gem_Array.size >= 63  
             Owned_Gem_Array[62].sprite.position = SF.vector2(855, 460);
             ore_array_text_63 = Ore_amount_owned_text.dup
             ore_array_text_63.position = Owned_Gem_Array[62].sprite.position + SF.vector2(100, -5)
             ore_array_text_63.string = "x" + Owned_Gem_Array[62].amount_owned.to_s
             window.draw(Owned_Gem_Array[62].sprite); window.draw(ore_array_text_63)
            end
           end; end
      #----------------------------------------------------slot 10------------------------------------------
        if Owned_Gem_Array.size >= 10
          case page
           when 1   
            Owned_Gem_Array[9].sprite.position = SF.vector2(1005, 460);
            ore_array_text_10 = Ore_amount_owned_text.dup
            ore_array_text_10.position = Owned_Gem_Array[9].sprite.position + SF.vector2(100, -5)
            ore_array_text_10.string = "x" + Owned_Gem_Array[9].amount_owned.to_s
            window.draw(Owned_Gem_Array[9].sprite); window.draw(ore_array_text_10)
           when 2 
            if Owned_Gem_Array.size >= 28  
             Owned_Gem_Array[27].sprite.position = SF.vector2(1005, 460);
             ore_array_text_28 = Ore_amount_owned_text.dup
             ore_array_text_28.position = Owned_Gem_Array[27].sprite.position + SF.vector2(100, -5)
             ore_array_text_28.string = "x" + Owned_Gem_Array[27].amount_owned.to_s
             window.draw(Owned_Gem_Array[27].sprite); window.draw(ore_array_text_28)
            end
           when 3 
            if Owned_Gem_Array.size >= 46  
             Owned_Gem_Array[45].sprite.position = SF.vector2(1005, 460);
             ore_array_text_46 = Ore_amount_owned_text.dup
             ore_array_text_46.position = Owned_Gem_Array[45].sprite.position + SF.vector2(100, -5)
             ore_array_text_46.string = "x" + Owned_Gem_Array[45].amount_owned.to_s
             window.draw(Owned_Gem_Array[45].sprite); window.draw(ore_array_text_46)
            end
           when 4 
            if Owned_Gem_Array.size >= 64  
             Owned_Gem_Array[63].sprite.position = SF.vector2(1005, 460);
             ore_array_text_64 = Ore_amount_owned_text.dup
             ore_array_text_64.position = Owned_Gem_Array[63].sprite.position + SF.vector2(100, -5)
             ore_array_text_64.string = "x" + Owned_Gem_Array[63].amount_owned.to_s
             window.draw(Owned_Gem_Array[63].sprite); window.draw(ore_array_text_64)
            end
           end; end
      #----------------------------------------------------slot 11------------------------------------------
        if Owned_Gem_Array.size >= 11
          case page
           when 1   
            Owned_Gem_Array[10].sprite.position = SF.vector2(1155, 460);
            ore_array_text_11 = Ore_amount_owned_text.dup
            ore_array_text_11.position = Owned_Gem_Array[10].sprite.position + SF.vector2(100, -5)
            ore_array_text_11.string = "x" + Owned_Gem_Array[10].amount_owned.to_s
            window.draw(Owned_Gem_Array[10].sprite); window.draw(ore_array_text_11)
           when 2 
            if Owned_Gem_Array.size >= 29  
             Owned_Gem_Array[28].sprite.position = SF.vector2(1155, 460);
             ore_array_text_29 = Ore_amount_owned_text.dup
             ore_array_text_29.position = Owned_Gem_Array[28].sprite.position + SF.vector2(100, -5)
             ore_array_text_29.string = "x" + Owned_Gem_Array[28].amount_owned.to_s
             window.draw(Owned_Gem_Array[28].sprite); window.draw(ore_array_text_29)
            end
           when 3 
            if Owned_Gem_Array.size >= 47  
             Owned_Gem_Array[46].sprite.position = SF.vector2(1155, 460);
             ore_array_text_47 = Ore_amount_owned_text.dup
             ore_array_text_47.position = Owned_Gem_Array[46].sprite.position + SF.vector2(100, -5)
             ore_array_text_47.string = "x" + Owned_Gem_Array[46].amount_owned.to_s
             window.draw(Owned_Gem_Array[46].sprite); window.draw(ore_array_text_47)
            end
           when 4 
            if Owned_Gem_Array.size >= 65  
             Owned_Gem_Array[64].sprite.position = SF.vector2(1155, 460);
             ore_array_text_65 = Ore_amount_owned_text.dup
             ore_array_text_65.position = Owned_Gem_Array[64].sprite.position + SF.vector2(100, -5)
             ore_array_text_65.string = "x" + Owned_Gem_Array[64].amount_owned.to_s
             window.draw(Owned_Gem_Array[64].sprite); window.draw(ore_array_text_65)
            end
           end; end
      #----------------------------------------------------slot 12------------------------------------------
        if Owned_Gem_Array.size >= 12
          case page
           when 1   
            Owned_Gem_Array[11].sprite.position = SF.vector2(1305, 460);
            ore_array_text_12 = Ore_amount_owned_text.dup
            ore_array_text_12.position = Owned_Gem_Array[11].sprite.position + SF.vector2(100, -5)
            ore_array_text_12.string = "x" + Owned_Gem_Array[11].amount_owned.to_s
            window.draw(Owned_Gem_Array[11].sprite); window.draw(ore_array_text_12)
           when 2 
            if Owned_Gem_Array.size >= 30  
             Owned_Gem_Array[29].sprite.position = SF.vector2(1305, 460);
             ore_array_text_30 = Ore_amount_owned_text.dup
             ore_array_text_30.position = Owned_Gem_Array[29].sprite.position + SF.vector2(100, -5)
             ore_array_text_30.string = "x" + Owned_Gem_Array[29].amount_owned.to_s
             window.draw(Owned_Gem_Array[29].sprite); window.draw(ore_array_text_30)
            end
           when 3 
            if Owned_Gem_Array.size >= 48  
             Owned_Gem_Array[47].sprite.position = SF.vector2(1305, 460);
             ore_array_text_48 = Ore_amount_owned_text.dup
             ore_array_text_48.position = Owned_Gem_Array[47].sprite.position + SF.vector2(100, -5)
             ore_array_text_48.string = "x" + Owned_Gem_Array[47].amount_owned.to_s
             window.draw(Owned_Gem_Array[47].sprite); window.draw(ore_array_text_48)
            end
           when 4 
            if Owned_Gem_Array.size >= 66  
             Owned_Gem_Array[65].sprite.position = SF.vector2(1305, 460);
             ore_array_text_66 = Ore_amount_owned_text.dup
             ore_array_text_66.position = Owned_Gem_Array[65].sprite.position + SF.vector2(100, -5)
             ore_array_text_66.string = "x" + Owned_Gem_Array[65].amount_owned.to_s
             window.draw(Owned_Gem_Array[65].sprite); window.draw(ore_array_text_66)
            end
           end; end
      #----------------------------------------------------slot 13------------------------------------------
        if Owned_Gem_Array.size >= 13
          case page
           when 1   
            Owned_Gem_Array[12].sprite.position = SF.vector2(555, 610);
            ore_array_text_13 = Ore_amount_owned_text.dup
            ore_array_text_13.position = Owned_Gem_Array[12].sprite.position + SF.vector2(100, -5)
            ore_array_text_13.string = "x" + Owned_Gem_Array[12].amount_owned.to_s
            window.draw(Owned_Gem_Array[12].sprite); window.draw(ore_array_text_13)
           when 2 
            if Owned_Gem_Array.size >= 31  
             Owned_Gem_Array[30].sprite.position = SF.vector2(555, 610);
             ore_array_text_31 = Ore_amount_owned_text.dup
             ore_array_text_31.position = Owned_Gem_Array[30].sprite.position + SF.vector2(100, -5)
             ore_array_text_31.string = "x" + Owned_Gem_Array[30].amount_owned.to_s
             window.draw(Owned_Gem_Array[30].sprite); window.draw(ore_array_text_31)
            end
           when 3 
            if Owned_Gem_Array.size >= 49  
             Owned_Gem_Array[48].sprite.position = SF.vector2(555, 610);
             ore_array_text_49 = Ore_amount_owned_text.dup
             ore_array_text_49.position = Owned_Gem_Array[48].sprite.position + SF.vector2(100, -5)
             ore_array_text_49.string = "x" + Owned_Gem_Array[48].amount_owned.to_s
             window.draw(Owned_Gem_Array[48].sprite); window.draw(ore_array_text_49)
            end
           when 4 
            if Owned_Gem_Array.size >= 67  
             Owned_Gem_Array[66].sprite.position = SF.vector2(555, 610);
             ore_array_text_67 = Ore_amount_owned_text.dup
             ore_array_text_67.position = Owned_Gem_Array[66].sprite.position + SF.vector2(100, -5)
             ore_array_text_67.string = "x" + Owned_Gem_Array[66].amount_owned.to_s
             window.draw(Owned_Gem_Array[66].sprite); window.draw(ore_array_text_67)
            end
           end; end
      #----------------------------------------------------slot 14------------------------------------------
       if Owned_Gem_Array.size >= 14
         case page
          when 1   
           Owned_Gem_Array[13].sprite.position = SF.vector2(710, 610);
           ore_array_text_14 = Ore_amount_owned_text.dup
           ore_array_text_14.position = Owned_Gem_Array[13].sprite.position + SF.vector2(100, -5)
           ore_array_text_14.string = "x" + Owned_Gem_Array[13].amount_owned.to_s
           window.draw(Owned_Gem_Array[13].sprite); window.draw(ore_array_text_14)
          when 2 
           if Owned_Gem_Array.size >= 32  
            Owned_Gem_Array[31].sprite.position = SF.vector2(710, 610);
            ore_array_text_32 = Ore_amount_owned_text.dup
            ore_array_text_32.position = Owned_Gem_Array[31].sprite.position + SF.vector2(100, -5)
            ore_array_text_32.string = "x" + Owned_Gem_Array[31].amount_owned.to_s
            window.draw(Owned_Gem_Array[31].sprite); window.draw(ore_array_text_32)
           end
          when 3 
           if Owned_Gem_Array.size >= 50  
            Owned_Gem_Array[49].sprite.position = SF.vector2(710, 610);
            ore_array_text_50 = Ore_amount_owned_text.dup
            ore_array_text_50.position = Owned_Gem_Array[49].sprite.position + SF.vector2(100, -5)
            ore_array_text_50.string = "x" + Owned_Gem_Array[49].amount_owned.to_s
            window.draw(Owned_Gem_Array[49].sprite); window.draw(ore_array_text_50)
           end
          when 4 
           if Owned_Gem_Array.size >= 68  
            Owned_Gem_Array[67].sprite.position = SF.vector2(710, 610);
            ore_array_text_68 = Ore_amount_owned_text.dup
            ore_array_text_68.position = Owned_Gem_Array[67].sprite.position + SF.vector2(100, -5)
            ore_array_text_68.string = "x" + Owned_Gem_Array[67].amount_owned.to_s
            window.draw(Owned_Gem_Array[67].sprite); window.draw(ore_array_text_68)
           end
          end; end
      #----------------------------------------------------slot 15------------------------------------------
       if Owned_Gem_Array.size >= 15
         case page
          when 1   
           Owned_Gem_Array[14].sprite.position = SF.vector2(855, 610);
           ore_array_text_15 = Ore_amount_owned_text.dup
           ore_array_text_15.position = Owned_Gem_Array[14].sprite.position + SF.vector2(100, -5)
           ore_array_text_15.string = "x" + Owned_Gem_Array[14].amount_owned.to_s
           window.draw(Owned_Gem_Array[14].sprite); window.draw(ore_array_text_15)
          when 2 
           if Owned_Gem_Array.size >= 33  
            Owned_Gem_Array[32].sprite.position = SF.vector2(855, 610);
            ore_array_text_33 = Ore_amount_owned_text.dup
            ore_array_text_33.position = Owned_Gem_Array[32].sprite.position + SF.vector2(100, -5)
            ore_array_text_33.string = "x" + Owned_Gem_Array[32].amount_owned.to_s
            window.draw(Owned_Gem_Array[32].sprite); window.draw(ore_array_text_33)
           end
          when 3 
           if Owned_Gem_Array.size >= 51  
            Owned_Gem_Array[50].sprite.position = SF.vector2(855, 610);
            ore_array_text_51 = Ore_amount_owned_text.dup
            ore_array_text_51.position = Owned_Gem_Array[50].sprite.position + SF.vector2(100, -5)
            ore_array_text_51.string = "x" + Owned_Gem_Array[50].amount_owned.to_s
            window.draw(Owned_Gem_Array[50].sprite); window.draw(ore_array_text_51)
           end
          when 4 
           if Owned_Gem_Array.size >= 69  
            Owned_Gem_Array[68].sprite.position = SF.vector2(855, 610);
            ore_array_text_69 = Ore_amount_owned_text.dup
            ore_array_text_69.position = Owned_Gem_Array[68].sprite.position + SF.vector2(100, -5)
            ore_array_text_69.string = "x" + Owned_Gem_Array[68].amount_owned.to_s
            window.draw(Owned_Gem_Array[68].sprite); window.draw(ore_array_text_69)
           end
          end; end
      #----------------------------------------------------slot 16------------------------------------------
       if Owned_Gem_Array.size >= 16
         case page
          when 1   
           Owned_Gem_Array[15].sprite.position = SF.vector2(1005, 610);
           ore_array_text_16 = Ore_amount_owned_text.dup
           ore_array_text_16.position = Owned_Gem_Array[15].sprite.position + SF.vector2(100, -5)
           ore_array_text_16.string = "x" + Owned_Gem_Array[15].amount_owned.to_s
           window.draw(Owned_Gem_Array[15].sprite); window.draw(ore_array_text_16)
          when 2 
           if Owned_Gem_Array.size >= 34  
            Owned_Gem_Array[33].sprite.position = SF.vector2(1005, 610);
            ore_array_text_34 = Ore_amount_owned_text.dup
            ore_array_text_34.position = Owned_Gem_Array[33].sprite.position + SF.vector2(100, -5)
            ore_array_text_34.string = "x" + Owned_Gem_Array[33].amount_owned.to_s
            window.draw(Owned_Gem_Array[33].sprite); window.draw(ore_array_text_34)
           end
          when 3 
           if Owned_Gem_Array.size >= 52  
            Owned_Gem_Array[51].sprite.position = SF.vector2(1005, 610);
            ore_array_text_52 = Ore_amount_owned_text.dup
            ore_array_text_52.position = Owned_Gem_Array[51].sprite.position + SF.vector2(100, -5)
            ore_array_text_52.string = "x" + Owned_Gem_Array[51].amount_owned.to_s
            window.draw(Owned_Gem_Array[51].sprite); window.draw(ore_array_text_52)
           end
          when 4 
           if Owned_Gem_Array.size >= 70  
            Owned_Gem_Array[69].sprite.position = SF.vector2(1005, 610);
            ore_array_text_70 = Ore_amount_owned_text.dup
            ore_array_text_70.position = Owned_Gem_Array[69].sprite.position + SF.vector2(100, -5)
            ore_array_text_70.string = "x" + Owned_Gem_Array[69].amount_owned.to_s
            window.draw(Owned_Gem_Array[69].sprite); window.draw(ore_array_text_70)
           end
          end; end
      #----------------------------------------------------slot 17------------------------------------------
       if Owned_Gem_Array.size >= 17
         case page
          when 1   
           Owned_Gem_Array[16].sprite.position = SF.vector2(1155, 610);
           ore_array_text_17 = Ore_amount_owned_text.dup
           ore_array_text_17.position = Owned_Gem_Array[16].sprite.position + SF.vector2(100, -5)
           ore_array_text_17.string = "x" + Owned_Gem_Array[16].amount_owned.to_s
           window.draw(Owned_Gem_Array[16].sprite); window.draw(ore_array_text_17)
          when 2 
           if Owned_Gem_Array.size >= 35  
            Owned_Gem_Array[34].sprite.position = SF.vector2(1155, 610);
            ore_array_text_35 = Ore_amount_owned_text.dup
            ore_array_text_35.position = Owned_Gem_Array[34].sprite.position + SF.vector2(100, -5)
            ore_array_text_35.string = "x" + Owned_Gem_Array[34].amount_owned.to_s
            window.draw(Owned_Gem_Array[34].sprite); window.draw(ore_array_text_35)
           end
          when 3 
           if Owned_Gem_Array.size >= 53  
            Owned_Gem_Array[52].sprite.position = SF.vector2(1155, 610);
            ore_array_text_53 = Ore_amount_owned_text.dup
            ore_array_text_53.position = Owned_Gem_Array[52].sprite.position + SF.vector2(100, -5)
            ore_array_text_53.string = "x" + Owned_Gem_Array[52].amount_owned.to_s
            window.draw(Owned_Gem_Array[52].sprite); window.draw(ore_array_text_53)
           end
          when 4 
           if Owned_Gem_Array.size >= 71  
            Owned_Gem_Array[70].sprite.position = SF.vector2(1155, 610);
            ore_array_text_71 = Ore_amount_owned_text.dup
            ore_array_text_71.position = Owned_Gem_Array[70].sprite.position + SF.vector2(100, -5)
            ore_array_text_71.string = "x" + Owned_Gem_Array[70].amount_owned.to_s
            window.draw(Owned_Gem_Array[70].sprite); window.draw(ore_array_text_71)
           end
          end; end
      #----------------------------------------------------slot 18------------------------------------------
       if Owned_Gem_Array.size >= 18
         case page
          when 1   
           Owned_Gem_Array[17].sprite.position = SF.vector2(1305, 610);
           ore_array_text_18 = Ore_amount_owned_text.dup
           ore_array_text_18.position = Owned_Gem_Array[17].sprite.position + SF.vector2(100, -5)
           ore_array_text_18.string = "x" + Owned_Gem_Array[17].amount_owned.to_s
           window.draw(Owned_Gem_Array[17].sprite); window.draw(ore_array_text_18)
          when 2 
           if Owned_Gem_Array.size >= 36  
            Owned_Gem_Array[35].sprite.position = SF.vector2(1305, 610);
            ore_array_text_36 = Ore_amount_owned_text.dup
            ore_array_text_36.position = Owned_Gem_Array[35].sprite.position + SF.vector2(100, -5)
            ore_array_text_36.string = "x" + Owned_Gem_Array[35].amount_owned.to_s
            window.draw(Owned_Gem_Array[35].sprite); window.draw(ore_array_text_36)
           end
          when 3 
            if Owned_Gem_Array.size >= 54  
             Owned_Gem_Array[53].sprite.position = SF.vector2(1305, 610);
             ore_array_text_54 = Ore_amount_owned_text.dup
             ore_array_text_54.position = Owned_Gem_Array[53].sprite.position + SF.vector2(100, -5)
             ore_array_text_54.string = "x" + Owned_Gem_Array[53].amount_owned.to_s
             window.draw(Owned_Gem_Array[53].sprite); window.draw(ore_array_text_54)
            end
          when 4 
           if Owned_Gem_Array.size >= 72  
            Owned_Gem_Array[71].sprite.position = SF.vector2(1305, 610);
            ore_array_text_72 = Ore_amount_owned_text.dup
            ore_array_text_72.position = Owned_Gem_Array[71].sprite.position + SF.vector2(100, -5)
            ore_array_text_72.string = "x" + Owned_Gem_Array[71].amount_owned.to_s
            window.draw(Owned_Gem_Array[71].sprite); window.draw(ore_array_text_72)
           end
          end; end
     end
   #------------------------------------------------------------Select Gem---------------------------------------------------------------------------------
    def Gem.select_cutter_gem(gem)
      if Owned_Gem_Cutter_Ore_Array.size >= gem
        All_Audio::SFX.dig_01
       @@current_gem = Owned_Gem_Cutter_Ore_Array[gem]
       Gem.determine_preview_gem
      else
        All_Audio::SFX.light_bonk
      end
    end
   #------------------------------------------------------------Select Cut---------------------------------------------------------------------------------
      def Gem.select_cutter_cut(cut)
       if Known_Cut_Array.size >= cut
         All_Audio::SFX.metal_hit_01
        @@current_style = Known_Cut_Array[cut].name
        @@current_cut = Known_Cut_Array[cut].display_sprite
        Gem.determine_preview_gem
       else
         All_Audio::SFX.light_bonk
       end
     end
   #-------------------------------------------------------Initialize Gem Cutter---------------------------------------------------------------------------
    def Gem.initialize_gem_cutter
      Gem.initialize_gem_inventory
      @@current_gem = @@nil_inventory_ore
      @@current_style = "none"
      @@preview_gem = Smelter_Nil_Sprite
      @@current_cut = Smelter_Nil_Sprite
     end
   #------------------------------------------------------------Preview Gem--------------------------------------------------------------------------------
    def Gem.determine_preview_gem
      i = 0
     case @@current_style
      when "none"
        @@preview_gem = Smelter_Nil_Sprite
      when "Table Cut"
       case @@current_gem.name
        when "Bloodstone"
          @@preview_gem = Bloodstone_Inventory_Tablecut
        when "Moss Agate"
          @@preview_gem = Moss_Agate_Inventory_Tablecut
        when "Amber"
          @@preview_gem = Amber_Inventory_Tablecut
        when "Wavellite"
          @@preview_gem = Wavellite_Inventory_Tablecut
        when "Topaz"
          @@preview_gem = Topaz_Inventory_Tablecut
        when "Amethyst"
          @@preview_gem = Amethyst_Inventory_Tablecut
        when "Smoky Quartz"
          @@preview_gem = Smokey_Quartz_Inventory_Tablecut
        when "Sapphire"
          @@preview_gem = Sapphire_Inventory_Tablecut
        when "Black Opal"
          @@preview_gem = Black_Opal_Inventory_Tablecut
        when "Ajoite"
          @@preview_gem = Ajoite_Inventory_Tablecut
        when "Rhodolite"
          @@preview_gem = Rhodolite_Inventory_Tablecut
        when "Chalcanthite"
          @@preview_gem = Chalcanthite_Inventory_Tablecut
        when "Flourite"
          @@preview_gem = Flourite_Inventory_Tablecut
        when "Amorite"
          @@preview_gem = Amorite_Inventory_Tablecut
        when "Lapis Lazuli"
          @@preview_gem = Lapis_Lazuli_Inventory_Tablecut
        when "Moonstone"
          @@preview_gem = Moonstone_Inventory_Tablecut
        when "Blue Calcite"
          @@preview_gem = Blue_Calcite_Inventory_Tablecut
        when "Hiddenite"
          @@preview_gem = Hiddenite_Inventory_Tablecut
        when "Offretite"
          @@preview_gem = Offretite_Inventory_Tablecut
        when "Holly Blue Agate"
          @@preview_gem = Holly_Blue_Agate_Inventory_Tablecut
        when "Ametrine"
          @@preview_gem = Ametrine_Inventory_Tablecut
        when "Hemimorphite"
          @@preview_gem = Hemimorphite_Inventory_Tablecut
        when "Tiffany Stone"
          @@preview_gem = Tiffany_Stone_Inventory_Tablecut
        when "Azurite"
          @@preview_gem = Azurite_Inventory_Tablecut
        when "Howlite"
          @@preview_gem = Howlite_Inventory_Tablecut
        when "Angelite"
          @@preview_gem = Angelite_Inventory_Tablecut
        when "Blue Lace Agate"
          @@preview_gem = Blue_Lace_Agate_Inventory_Tablecut
        when "Iolite"
          @@preview_gem = Iolite_Inventory_Tablecut
        when "Sodalite"
          @@preview_gem = Sodalite_Inventory_Tablecut
        when "Kyanite"
          @@preview_gem = Kyanite_Inventory_Tablecut
        when "Sunstone"
          @@preview_gem = Sunstone_Inventory_Tablecut
        when "Bony Amber"
          @@preview_gem = Bony_Amber_Inventory_Tablecut
        when "Blue Amber"
          @@preview_gem = Blue_Amber_Inventory_Tablecut
        when "Blue Spinel"
          @@preview_gem = Blue_Spinel_Inventory_Tablecut
        when "Red Spinel"
          @@preview_gem = Red_Spinel_Inventory_Tablecut
        when "Fire Opal"
          @@preview_gem = Fire_Opal_Inventory_Tablecut
        when "Garnet"
          @@preview_gem = Garnet_Inventory_Tablecut
        when "Ruby"
          @@preview_gem = Ruby_Inventory_Tablecut
        when "Cherry Quartz"
          @@preview_gem = Cherry_Quartz_Inventory_Tablecut
        when "Lemon Quartz"
          @@preview_gem = Lemon_Quartz_Inventory_Tablecut
        when "Turquoise"
          @@preview_gem = Turquoise_Inventory_Tablecut
        when "Tiger's Eye"
          @@preview_gem = Tigers_eye_Inventory_Tablecut
        when "Orange Calcite"
          @@preview_gem = Orange_Calcite_Inventory_Tablecut
        when "Grape Agate"
          @@preview_gem = Grape_Agate_Inventory_Tablecut
        when "Jade"
          @@preview_gem = Jade_Inventory_Tablecut
        when "Diamond"
          @@preview_gem = Diamond_Inventory_Tablecut
        when "Emerald"
          @@preview_gem = Emerald_Inventory_Tablecut
        when "Painite"
          @@preview_gem = Painite_Inventory_Tablecut
        when "Bumblebee Jasper"
          @@preview_gem = Bumblebee_Jasper_Inventory_Tablecut
        when "Blood Jasper"
          @@preview_gem = Blood_Jasper_Inventory_Tablecut
        when "Mook Jasper"
          @@preview_gem = Mook_Jasper_Inventory_Tablecut
        when "Red Jasper"
          @@preview_gem = Red_Jasper_Inventory_Tablecut
        end
      when "Square Cut"
          case @@current_gem.name
           when "Bloodstone"
             @@preview_gem = Bloodstone_Inventory_Square
           when "Moss Agate"
             @@preview_gem = Moss_Agate_Inventory_Square
           when "Amber"
             @@preview_gem = Amber_Inventory_Square
           when "Wavellite"
             @@preview_gem = Wavellite_Inventory_Square
           when "Topaz"
             @@preview_gem = Topaz_Inventory_Square
           when "Amethyst"
             @@preview_gem = Amethyst_Inventory_Square
           when "Smoky Quartz"
             @@preview_gem = Smokey_Quartz_Inventory_Square
           when "Sapphire"
             @@preview_gem = Sapphire_Inventory_Square
           when "Black Opal"
             @@preview_gem = Black_Opal_Inventory_Square
           when "Ajoite"
             @@preview_gem = Ajoite_Inventory_Square
           when "Rhodolite"
             @@preview_gem = Rhodolite_Inventory_Square
           when "Chalcanthite"
             @@preview_gem = Chalcanthite_Inventory_Square
           when "Flourite"
             @@preview_gem = Flourite_Inventory_Square
           when "Amorite"
             @@preview_gem = Amorite_Inventory_Square
           when "Lapis Lazuli"
             @@preview_gem = Lapis_Lazuli_Inventory_Square
           when "Moonstone"
             @@preview_gem = Moonstone_Inventory_Square
           when "Blue Calcite"
             @@preview_gem = Blue_Calcite_Inventory_Square
           when "Hiddenite"
             @@preview_gem = Hiddenite_Inventory_Square
           when "Offretite"
             @@preview_gem = Offretite_Inventory_Square
           when "Holly Blue Agate"
             @@preview_gem = Holly_Blue_Agate_Inventory_Square
           when "Ametrine"
             @@preview_gem = Ametrine_Inventory_Square
           when "Hemimorphite"
             @@preview_gem = Hemimorphite_Inventory_Square
           when "Tiffany Stone"
             @@preview_gem = Tiffany_Stone_Inventory_Square
           when "Azurite"
             @@preview_gem = Azurite_Inventory_Square
           when "Howlite"
             @@preview_gem = Howlite_Inventory_Square
           when "Angelite"
             @@preview_gem = Angelite_Inventory_Square
           when "Blue Lace Agate"
             @@preview_gem = Blue_Lace_Agate_Inventory_Square
           when "Iolite"
             @@preview_gem = Iolite_Inventory_Square
           when "Sodalite"
             @@preview_gem = Sodalite_Inventory_Square
           when "Kyanite"
             @@preview_gem = Kyanite_Inventory_Square
           when "Sunstone"
             @@preview_gem = Sunstone_Inventory_Square
           when "Bony Amber"
             @@preview_gem = Bony_Amber_Inventory_Square
           when "Blue Amber"
             @@preview_gem = Blue_Amber_Inventory_Square
           when "Blue Spinel"
             @@preview_gem = Blue_Spinel_Inventory_Square
           when "Red Spinel"
             @@preview_gem = Red_Spinel_Inventory_Square
           when "Fire Opal"
             @@preview_gem = Fire_Opal_Inventory_Square
           when "Garnet"
             @@preview_gem = Garnet_Inventory_Square
           when "Ruby"
             @@preview_gem = Ruby_Inventory_Square
           when "Cherry Quartz"
             @@preview_gem = Cherry_Quartz_Inventory_Square
           when "Lemon Quartz"
             @@preview_gem = Lemon_Quartz_Inventory_Square
           when "Turquoise"
             @@preview_gem = Turquoise_Inventory_Square
           when "Tiger's Eye"
             @@preview_gem = Tigers_eye_Inventory_Square
           when "Orange Calcite"
             @@preview_gem = Orange_Calcite_Inventory_Square
           when "Grape Agate"
             @@preview_gem = Grape_Agate_Inventory_Square
           when "Jade"
             @@preview_gem = Jade_Inventory_Square
           when "Diamond"
             @@preview_gem = Diamond_Inventory_Square
           when "Emerald"
             @@preview_gem = Emerald_Inventory_Square
           when "Painite"
             @@preview_gem = Painite_Inventory_Square
           when "Bumblebee Jasper"
             @@preview_gem = Bumblebee_Jasper_Inventory_Square
           when "Blood Jasper"
             @@preview_gem = Blood_Jasper_Inventory_Square
           when "Mook Jasper"
             @@preview_gem = Mook_Jasper_Inventory_Square
           when "Red Jasper"
             @@preview_gem = Red_Jasper_Inventory_Square
         end
      when "Pear Cut"
       case @@current_gem.name
        when "Bloodstone"
          @@preview_gem = Bloodstone_Inventory_Pear
        when "Moss Agate"
          @@preview_gem = Moss_Agate_Inventory_Pear
        when "Amber"
          @@preview_gem = Amber_Inventory_Pear
        when "Wavellite"
          @@preview_gem = Wavellite_Inventory_Pear
        when "Topaz"
          @@preview_gem = Topaz_Inventory_Pear
        when "Amethyst"
          @@preview_gem = Amethyst_Inventory_Pear
        when "Smoky Quartz"
          @@preview_gem = Smokey_Quartz_Inventory_Pear
        when "Sapphire"
          @@preview_gem = Sapphire_Inventory_Pear
        when "Black Opal"
          @@preview_gem = Black_Opal_Inventory_Pear
        when "Ajoite"
          @@preview_gem = Ajoite_Inventory_Pear
        when "Rhodolite"
          @@preview_gem = Rhodolite_Inventory_Pear
        when "Chalcanthite"
          @@preview_gem = Chalcanthite_Inventory_Pear
        when "Flourite"
          @@preview_gem = Flourite_Inventory_Pear
        when "Amorite"
          @@preview_gem = Amorite_Inventory_Pear
        when "Lapis Lazuli"
          @@preview_gem = Lapis_Lazuli_Inventory_Pear
        when "Moonstone"
          @@preview_gem = Moonstone_Inventory_Pear
        when "Blue Calcite"
          @@preview_gem = Blue_Calcite_Inventory_Pear
        when "Hiddenite"
          @@preview_gem = Hiddenite_Inventory_Pear
        when "Offretite"
          @@preview_gem = Offretite_Inventory_Pear
        when "Holly Blue Agate"
          @@preview_gem = Holly_Blue_Agate_Inventory_Pear
        when "Ametrine"
          @@preview_gem = Ametrine_Inventory_Pear
        when "Hemimorphite"
          @@preview_gem = Hemimorphite_Inventory_Pear
        when "Tiffany Stone"
          @@preview_gem = Tiffany_Stone_Inventory_Pear
        when "Azurite"
          @@preview_gem = Azurite_Inventory_Pear
        when "Howlite"
          @@preview_gem = Howlite_Inventory_Pear
        when "Angelite"
          @@preview_gem = Angelite_Inventory_Pear
        when "Blue Lace Agate"
          @@preview_gem = Blue_Lace_Agate_Inventory_Pear
        when "Iolite"
          @@preview_gem = Iolite_Inventory_Pear
        when "Sodalite"
          @@preview_gem = Sodalite_Inventory_Pear
        when "Kyanite"
          @@preview_gem = Kyanite_Inventory_Pear
        when "Sunstone"
          @@preview_gem = Sunstone_Inventory_Pear
        when "Bony Amber"
          @@preview_gem = Bony_Amber_Inventory_Pear
        when "Blue Amber"
          @@preview_gem = Blue_Amber_Inventory_Pear
        when "Blue Spinel"
          @@preview_gem = Blue_Spinel_Inventory_Pear
        when "Red Spinel"
          @@preview_gem = Red_Spinel_Inventory_Pear
        when "Fire Opal"
          @@preview_gem = Fire_Opal_Inventory_Pear
        when "Garnet"
          @@preview_gem = Garnet_Inventory_Pear
        when "Ruby"
          @@preview_gem = Ruby_Inventory_Pear
        when "Cherry Quartz"
          @@preview_gem = Cherry_Quartz_Inventory_Pear
        when "Lemon Quartz"
          @@preview_gem = Lemon_Quartz_Inventory_Pear
        when "Turquoise"
          @@preview_gem = Turquoise_Inventory_Pear
        when "Tiger's Eye"
          @@preview_gem = Tigers_eye_Inventory_Pear
        when "Orange Calcite"
          @@preview_gem = Orange_Calcite_Inventory_Pear
        when "Grape Agate"
          @@preview_gem = Grape_Agate_Inventory_Pear
        when "Jade"
          @@preview_gem = Jade_Inventory_Pear
        when "Diamond"
          @@preview_gem = Diamond_Inventory_Pear
        when "Emerald"
          @@preview_gem = Emerald_Inventory_Pear
        when "Painite"
          @@preview_gem = Painite_Inventory_Pear
        when "Bumblebee Jasper"
          @@preview_gem = Bumblebee_Jasper_Inventory_Pear
        when "Blood Jasper"
          @@preview_gem = Blood_Jasper_Inventory_Pear
        when "Mook Jasper"
          @@preview_gem = Mook_Jasper_Inventory_Pear
        when "Red Jasper"
          @@preview_gem = Red_Jasper_Inventory_Pear
       end
      when "Drop Cut"
       case @@current_gem.name
        when "Bloodstone"
          @@preview_gem = Bloodstone_Inventory_Dropcut
        when "Moss Agate"
          @@preview_gem = Moss_Agate_Inventory_Dropcut
        when "Amber"
          @@preview_gem = Amber_Inventory_Dropcut
        when "Wavellite"
          @@preview_gem = Wavellite_Inventory_Dropcut
        when "Topaz"
          @@preview_gem = Topaz_Inventory_Dropcut
        when "Amethyst"
          @@preview_gem = Amethyst_Inventory_Dropcut
        when "Smoky Quartz"
          @@preview_gem = Smokey_Quartz_Inventory_Dropcut
        when "Sapphire"
          @@preview_gem = Sapphire_Inventory_Dropcut
        when "Black Opal"
          @@preview_gem = Black_Opal_Inventory_Dropcut
        when "Ajoite"
          @@preview_gem = Ajoite_Inventory_Dropcut
        when "Rhodolite"
          @@preview_gem = Rhodolite_Inventory_Dropcut
        when "Chalcanthite"
          @@preview_gem = Chalcanthite_Inventory_Dropcut
        when "Flourite"
          @@preview_gem = Flourite_Inventory_Dropcut
        when "Amorite"
          @@preview_gem = Amorite_Inventory_Dropcut
        when "Lapis Lazuli"
          @@preview_gem = Lapis_Lazuli_Inventory_Dropcut
        when "Moonstone"
          @@preview_gem = Moonstone_Inventory_Dropcut
        when "Blue Calcite"
          @@preview_gem = Blue_Calcite_Inventory_Dropcut
        when "Hiddenite"
          @@preview_gem = Hiddenite_Inventory_Dropcut
        when "Offretite"
          @@preview_gem = Offretite_Inventory_Dropcut
        when "Holly Blue Agate"
          @@preview_gem = Holly_Blue_Agate_Inventory_Dropcut
        when "Ametrine"
          @@preview_gem = Ametrine_Inventory_Dropcut
        when "Hemimorphite"
          @@preview_gem = Hemimorphite_Inventory_Dropcut
        when "Tiffany Stone"
          @@preview_gem = Tiffany_Stone_Inventory_Dropcut
        when "Azurite"
          @@preview_gem = Azurite_Inventory_Dropcut
        when "Howlite"
          @@preview_gem = Howlite_Inventory_Dropcut
        when "Angelite"
          @@preview_gem = Angelite_Inventory_Dropcut
        when "Blue Lace Agate"
          @@preview_gem = Blue_Lace_Agate_Inventory_Dropcut
        when "Iolite"
          @@preview_gem = Iolite_Inventory_Dropcut
        when "Sodalite"
          @@preview_gem = Sodalite_Inventory_Dropcut
        when "Kyanite"
          @@preview_gem = Kyanite_Inventory_Dropcut
        when "Sunstone"
          @@preview_gem = Sunstone_Inventory_Dropcut
        when "Bony Amber"
          @@preview_gem = Bony_Amber_Inventory_Dropcut
        when "Blue Amber"
          @@preview_gem = Blue_Amber_Inventory_Dropcut
        when "Blue Spinel"
          @@preview_gem = Blue_Spinel_Inventory_Dropcut
        when "Red Spinel"
          @@preview_gem = Red_Spinel_Inventory_Dropcut
        when "Fire Opal"
          @@preview_gem = Fire_Opal_Inventory_Dropcut
        when "Garnet"
          @@preview_gem = Garnet_Inventory_Dropcut
        when "Ruby"
          @@preview_gem = Ruby_Inventory_Dropcut
        when "Cherry Quartz"
          @@preview_gem = Cherry_Quartz_Inventory_Dropcut
        when "Lemon Quartz"
          @@preview_gem = Lemon_Quartz_Inventory_Dropcut
        when "Turquoise"
          @@preview_gem = Turquoise_Inventory_Dropcut
        when "Tiger's Eye"
          @@preview_gem = Tigers_eye_Inventory_Dropcut
        when "Orange Calcite"
          @@preview_gem = Orange_Calcite_Inventory_Dropcut
        when "Grape Agate"
          @@preview_gem = Grape_Agate_Inventory_Dropcut
        when "Jade"
          @@preview_gem = Jade_Inventory_Dropcut
        when "Diamond"
          @@preview_gem = Diamond_Inventory_Dropcut
        when "Emerald"
          @@preview_gem = Emerald_Inventory_Dropcut
        when "Painite"
          @@preview_gem = Painite_Inventory_Dropcut
        when "Bumblebee Jasper"
          @@preview_gem = Bumblebee_Jasper_Inventory_Dropcut
        when "Blood Jasper"
          @@preview_gem = Blood_Jasper_Inventory_Dropcut
        when "Mook Jasper"
          @@preview_gem = Mook_Jasper_Inventory_Dropcut
        when "Red Jasper"
          @@preview_gem = Red_Jasper_Inventory_Dropcut
        end 
      when "Brilliant Cut"
        case @@current_gem.name
         when "Bloodstone"
           @@preview_gem = Bloodstone_Inventory_Brilliant
         when "Moss Agate"
           @@preview_gem = Moss_Agate_Inventory_Brilliant
         when "Amber"
           @@preview_gem = Amber_Inventory_Brilliant
         when "Wavellite"
           @@preview_gem = Wavellite_Inventory_Brilliant
         when "Topaz"
           @@preview_gem = Topaz_Inventory_Brilliant
         when "Amethyst"
           @@preview_gem = Amethyst_Inventory_Brilliant
         when "Smoky Quartz"
           @@preview_gem = Smokey_Quartz_Inventory_Brilliant
         when "Sapphire"
           @@preview_gem = Sapphire_Inventory_Brilliant
         when "Black Opal"
           @@preview_gem = Black_Opal_Inventory_Brilliant
         when "Ajoite"
           @@preview_gem = Ajoite_Inventory_Brilliant
         when "Rhodolite"
           @@preview_gem = Rhodolite_Inventory_Brilliant
         when "Chalcanthite"
           @@preview_gem = Chalcanthite_Inventory_Brilliant
         when "Flourite"
           @@preview_gem = Flourite_Inventory_Brilliant
         when "Amorite"
           @@preview_gem = Amorite_Inventory_Brilliant
         when "Lapis Lazuli"
           @@preview_gem = Lapis_Lazuli_Inventory_Brilliant
         when "Moonstone"
           @@preview_gem = Moonstone_Inventory_Brilliant
         when "Blue Calcite"
           @@preview_gem = Blue_Calcite_Inventory_Brilliant
         when "Hiddenite"
           @@preview_gem = Hiddenite_Inventory_Brilliant
         when "Offretite"
           @@preview_gem = Offretite_Inventory_Brilliant
         when "Holly Blue Agate"
           @@preview_gem = Holly_Blue_Agate_Inventory_Brilliant
         when "Ametrine"
           @@preview_gem = Ametrine_Inventory_Brilliant
         when "Hemimorphite"
           @@preview_gem = Hemimorphite_Inventory_Brilliant
         when "Tiffany Stone"
           @@preview_gem = Tiffany_Stone_Inventory_Brilliant
         when "Azurite"
           @@preview_gem = Azurite_Inventory_Brilliant
         when "Howlite"
           @@preview_gem = Howlite_Inventory_Brilliant
         when "Angelite"
           @@preview_gem = Angelite_Inventory_Brilliant
         when "Blue Lace Agate"
           @@preview_gem = Blue_Lace_Agate_Inventory_Brilliant
         when "Iolite"
           @@preview_gem = Iolite_Inventory_Brilliant
         when "Sodalite"
           @@preview_gem = Sodalite_Inventory_Brilliant
         when "Kyanite"
           @@preview_gem = Kyanite_Inventory_Brilliant
         when "Sunstone"
           @@preview_gem = Sunstone_Inventory_Brilliant
         when "Bony Amber"
           @@preview_gem = Bony_Amber_Inventory_Brilliant
         when "Blue Amber"
           @@preview_gem = Blue_Amber_Inventory_Brilliant
         when "Blue Spinel"
           @@preview_gem = Blue_Spinel_Inventory_Brilliant
         when "Red Spinel"
           @@preview_gem = Red_Spinel_Inventory_Brilliant
         when "Fire Opal"
           @@preview_gem = Fire_Opal_Inventory_Brilliant
         when "Garnet"
           @@preview_gem = Garnet_Inventory_Brilliant
         when "Ruby"
           @@preview_gem = Ruby_Inventory_Brilliant
         when "Cherry Quartz"
           @@preview_gem = Cherry_Quartz_Inventory_Brilliant
         when "Lemon Quartz"
           @@preview_gem = Lemon_Quartz_Inventory_Brilliant
         when "Turquoise"
           @@preview_gem = Turquoise_Inventory_Brilliant
         when "Tiger's Eye"
           @@preview_gem = Tigers_eye_Inventory_Brilliant
         when "Orange Calcite"
           @@preview_gem = Orange_Calcite_Inventory_Brilliant
         when "Grape Agate"
           @@preview_gem = Grape_Agate_Inventory_Brilliant
         when "Jade"
           @@preview_gem = Jade_Inventory_Brilliant
         when "Diamond"
           @@preview_gem = Diamond_Inventory_Brilliant
         when "Emerald"
           @@preview_gem = Emerald_Inventory_Brilliant
         when "Painite"
           @@preview_gem = Painite_Inventory_Brilliant
         when "Bumblebee Jasper"
           @@preview_gem = Bumblebee_Jasper_Inventory_Brilliant
         when "Blood Jasper"
           @@preview_gem = Blood_Jasper_Inventory_Brilliant
         when "Mook Jasper"
           @@preview_gem = Mook_Jasper_Inventory_Brilliant
         when "Red Jasper"
           @@preview_gem = Red_Jasper_Inventory_Brilliant
         end 
      end
      @@preview_gem.position = SF.vector2(542, -15)
      @@preview_gem.scale  = SF.vector2(2.5, 2.5)
    end
   #---------------------------------------------------------Gem Cutter Cut!-------------------------------------------------------------------------------
     def Gem.cut_gem
      i = 0
      if Owned_Gem_Array.size < 80
      while i < GEM_ARRAY.size
        if @@current_gem.name == GEM_ARRAY[i].name 
         case @@current_style
          when "none"
           All_Audio::SFX.light_bonk
          when "Table Cut"
            if @@current_gem.amount_owned > 2
              All_Audio::SFX.metal_hit_01
              effect = GEM_ARRAY[i].effect
              element = GEM_ARRAY[i].element
              GEM_ARRAY[i].effect = GEM_ARRAY[i].effect
              GEM_ARRAY[i].element = GEM_ARRAY[i].element
              GEM_ARRAY[i].sprite = @@preview_gem.dup
              GEM_ARRAY[i].craft_sprite = @@preview_gem.dup
              GEM_ARRAY[i].sprite.scale  = SF.vector2(1, 1)
              GEM_ARRAY[i].cut = @@current_style
              GEM_ARRAY[i].amount_owned = 1
              GEM_ARRAY[i].dup
              Owned_Gem_Array.push(GEM_ARRAY[i].dup)
              GEM_ARRAY[i].amount_owned = 0
              @@current_gem.amount_owned -= 3
              GEM_ARRAY[i].effect = effect
              GEM_ARRAY[i].element = element
             end
          when "Square Cut"
            if @@current_gem.amount_owned > 4
              All_Audio::SFX.metal_hit_01
              effect = GEM_ARRAY[i].effect
              element = GEM_ARRAY[i].element
              GEM_ARRAY[i].effect = GEM_ARRAY[i].effect + "+"
              GEM_ARRAY[i].element = GEM_ARRAY[i].element + "+"
              GEM_ARRAY[i].sprite = @@preview_gem.dup
              GEM_ARRAY[i].craft_sprite = @@preview_gem.dup
              GEM_ARRAY[i].sprite.scale  = SF.vector2(1, 1)
              GEM_ARRAY[i].cut = @@current_style
              GEM_ARRAY[i].amount_owned = 1
              GEM_ARRAY[i].dup
              Owned_Gem_Array.push(GEM_ARRAY[i].dup)
              GEM_ARRAY[i].amount_owned = 0
              @@current_gem.amount_owned -= 5
              GEM_ARRAY[i].effect = effect
              GEM_ARRAY[i].element = element
             end
          when "Pear Cut"
            if @@current_gem.amount_owned > 7
              All_Audio::SFX.metal_hit_01
              effect = GEM_ARRAY[i].effect
              element = GEM_ARRAY[i].element
              GEM_ARRAY[i].effect = GEM_ARRAY[i].effect 
              GEM_ARRAY[i].element = GEM_ARRAY[i].element + "++"
              GEM_ARRAY[i].sprite = @@preview_gem.dup
              GEM_ARRAY[i].craft_sprite = @@preview_gem.dup
              GEM_ARRAY[i].sprite.scale  = SF.vector2(1, 1)
              GEM_ARRAY[i].cut = @@current_style
              GEM_ARRAY[i].amount_owned = 1
              GEM_ARRAY[i].dup
              Owned_Gem_Array.push(GEM_ARRAY[i].dup)
              GEM_ARRAY[i].amount_owned = 0
              @@current_gem.amount_owned -= 8
              GEM_ARRAY[i].effect = effect
              GEM_ARRAY[i].element = element
             end
          when "Drop Cut"
            if @@current_gem.amount_owned > 9
              All_Audio::SFX.metal_hit_01
              effect = GEM_ARRAY[i].effect
              element = GEM_ARRAY[i].element
              GEM_ARRAY[i].effect = GEM_ARRAY[i].effect + "++" 
              GEM_ARRAY[i].element = GEM_ARRAY[i].element
              GEM_ARRAY[i].sprite = @@preview_gem.dup
              GEM_ARRAY[i].craft_sprite = @@preview_gem.dup
              GEM_ARRAY[i].sprite.scale  = SF.vector2(1, 1)
              GEM_ARRAY[i].cut = @@current_style
              GEM_ARRAY[i].amount_owned = 1
              GEM_ARRAY[i].dup
              Owned_Gem_Array.push(GEM_ARRAY[i].dup)
              GEM_ARRAY[i].amount_owned = 0
              @@current_gem.amount_owned -= 10
              GEM_ARRAY[i].effect = effect
              GEM_ARRAY[i].element = element
             end
          when "Brilliant Cut"
            if @@current_gem.amount_owned > 14
              All_Audio::SFX.metal_hit_01
              effect = GEM_ARRAY[i].effect
              element = GEM_ARRAY[i].element
              GEM_ARRAY[i].effect = GEM_ARRAY[i].effect + "++" 
              GEM_ARRAY[i].element = GEM_ARRAY[i].element + "++" 
              GEM_ARRAY[i].sprite = @@preview_gem.dup
              GEM_ARRAY[i].craft_sprite = @@preview_gem.dup
              GEM_ARRAY[i].sprite.scale  = SF.vector2(1, 1)
              GEM_ARRAY[i].cut = @@current_style
              GEM_ARRAY[i].amount_owned = 1
              GEM_ARRAY[i].dup
              Owned_Gem_Array.push(GEM_ARRAY[i].dup)
              GEM_ARRAY[i].amount_owned = 0
              @@current_gem.amount_owned -= 15
              GEM_ARRAY[i].effect = effect
              GEM_ARRAY[i].element = element
             end
         end
        end
        i += 1
      end
    else
      All_Audio::SFX.char_create_up
     end
     end
   #-----------------------------------------------------------Gem Info Box--------------------------------------------------------------------------------
     def Gem.check_stats(slot)
      if Owned_Gem_Array.size > slot
        Gem_Info_Text.string = " Name: " + Owned_Gem_Array[slot].name + "\n Cut: " + Owned_Gem_Array[slot].cut + "\n Effect: " + Owned_Gem_Array[slot].effect + "\n Element: " + Owned_Gem_Array[slot].element
      else
        Gem_Info_Text.string = ""
      end
     end
   #--------------------------------------------------------Gem Cutter Display-----------------------------------------------------------------------------
    def Gem.display_gem_cutter(window, page, tab)
     Owned_Gem_Cutter_Ore_Array.uniq!
     current_gem_sprite = @@current_gem.craft_sprite.dup; current_gem_sprite.scale(SF.vector2(1.5, 1.5))
     current_gem_sprite.position = SF.vector2(550, 55)
     window.draw(Test_Gem_Cutter_Menu); window.draw(Inventory_arrow_up3); window.draw(Inventory_arrow_down3)
     window.draw(current_gem_sprite); window.draw(@@preview_gem); window.draw(@@current_cut)
     if tab == "cuts"
      window.draw(Cutter_Mold_Option_01)
      Gem.initialize_cutter_cut_display(window)
     end
     case page
      when 1
      #----------------------------------------row 1-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 1
          Owned_Gem_Cutter_Ore_Array[0].craft_sprite.position = SF.vector2(450, -150)
          ore_array_text_01 = Ore_amount_owned_text.dup
          ore_array_text_01.position = Owned_Gem_Cutter_Ore_Array[0].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_01.string = "x" + Owned_Gem_Cutter_Ore_Array[0].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[0].craft_sprite); window.draw(ore_array_text_01)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 2
          Owned_Gem_Cutter_Ore_Array[1].craft_sprite.position = SF.vector2(500, -150)
          ore_array_text_02 = Ore_amount_owned_text.dup
          ore_array_text_02.position = Owned_Gem_Cutter_Ore_Array[1].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_02.string = "x" + Owned_Gem_Cutter_Ore_Array[1].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[1].craft_sprite); window.draw(ore_array_text_02)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 3
          Owned_Gem_Cutter_Ore_Array[2].craft_sprite.position = SF.vector2(550, -150)
          ore_array_text_03 = Ore_amount_owned_text.dup
          ore_array_text_03.position = Owned_Gem_Cutter_Ore_Array[2].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_03.string = "x" + Owned_Gem_Cutter_Ore_Array[2].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[2].craft_sprite); window.draw(ore_array_text_03)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 4
          Owned_Gem_Cutter_Ore_Array[3].craft_sprite.position = SF.vector2(600, -150)
          ore_array_text_04 = Ore_amount_owned_text.dup
          ore_array_text_04.position = Owned_Gem_Cutter_Ore_Array[3].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_04.string = "x" + Owned_Gem_Cutter_Ore_Array[3].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[3].craft_sprite); window.draw(ore_array_text_04)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 5
          Owned_Gem_Cutter_Ore_Array[4].craft_sprite.position = SF.vector2(650, -150)
          ore_array_text_05 = Ore_amount_owned_text.dup
          ore_array_text_05.position = Owned_Gem_Cutter_Ore_Array[4].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_05.string = "x" + Owned_Gem_Cutter_Ore_Array[4].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[4].craft_sprite); window.draw(ore_array_text_05)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 6
          Owned_Gem_Cutter_Ore_Array[5].craft_sprite.position = SF.vector2(700, -150)
          ore_array_text_06 = Ore_amount_owned_text.dup
          ore_array_text_06.position = Owned_Gem_Cutter_Ore_Array[5].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_06.string = "x" + Owned_Gem_Cutter_Ore_Array[5].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[5].craft_sprite); window.draw(ore_array_text_06)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 7
          Owned_Gem_Cutter_Ore_Array[6].craft_sprite.position = SF.vector2(750, -150)
          ore_array_text_07 = Ore_amount_owned_text.dup
          ore_array_text_07.position = Owned_Gem_Cutter_Ore_Array[6].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_07.string = "x" + Owned_Gem_Cutter_Ore_Array[6].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[6].craft_sprite); window.draw(ore_array_text_07)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 8
          Owned_Gem_Cutter_Ore_Array[7].craft_sprite.position = SF.vector2(800, -150)
          ore_array_text_08 = Ore_amount_owned_text.dup
          ore_array_text_08.position = Owned_Gem_Cutter_Ore_Array[7].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_08.string = "x" + Owned_Gem_Cutter_Ore_Array[7].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[7].craft_sprite); window.draw(ore_array_text_08)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 9
          Owned_Gem_Cutter_Ore_Array[8].craft_sprite.position = SF.vector2(850, -150)
          ore_array_text_09 = Ore_amount_owned_text.dup
          ore_array_text_09.position = Owned_Gem_Cutter_Ore_Array[8].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_09.string = "x" + Owned_Gem_Cutter_Ore_Array[8].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[8].craft_sprite); window.draw(ore_array_text_09)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 10
          Owned_Gem_Cutter_Ore_Array[9].craft_sprite.position = SF.vector2(900, -150)
          ore_array_text_10 = Ore_amount_owned_text.dup
          ore_array_text_10.position = Owned_Gem_Cutter_Ore_Array[9].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_10.string = "x" + Owned_Gem_Cutter_Ore_Array[9].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[9].craft_sprite); window.draw(ore_array_text_10)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 11
          Owned_Gem_Cutter_Ore_Array[10].craft_sprite.position = SF.vector2(950, -150)
          ore_array_text_11 = Ore_amount_owned_text.dup
          ore_array_text_11.position = Owned_Gem_Cutter_Ore_Array[10].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_11.string = "x" + Owned_Gem_Cutter_Ore_Array[10].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[10].craft_sprite); window.draw(ore_array_text_11)
         end
      #----------------------------------------row 2-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 12
          Owned_Gem_Cutter_Ore_Array[11].craft_sprite.position = SF.vector2(450, -100)
          ore_array_text_12 = Ore_amount_owned_text.dup
          ore_array_text_12.position = Owned_Gem_Cutter_Ore_Array[11].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_12.string = "x" + Owned_Gem_Cutter_Ore_Array[11].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[11].craft_sprite); window.draw(ore_array_text_12)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 13
          Owned_Gem_Cutter_Ore_Array[12].craft_sprite.position = SF.vector2(500, -100)
          ore_array_text_13 = Ore_amount_owned_text.dup
          ore_array_text_13.position = Owned_Gem_Cutter_Ore_Array[12].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_13.string = "x" + Owned_Gem_Cutter_Ore_Array[12].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[12].craft_sprite); window.draw(ore_array_text_13)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 14
          Owned_Gem_Cutter_Ore_Array[13].craft_sprite.position = SF.vector2(550, -100)
          ore_array_text_14 = Ore_amount_owned_text.dup
          ore_array_text_14.position = Owned_Gem_Cutter_Ore_Array[13].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_14.string = "x" + Owned_Gem_Cutter_Ore_Array[13].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[13].craft_sprite); window.draw(ore_array_text_14)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 15
          Owned_Gem_Cutter_Ore_Array[14].craft_sprite.position = SF.vector2(600, -100)
          ore_array_text_15 = Ore_amount_owned_text.dup
          ore_array_text_15.position = Owned_Gem_Cutter_Ore_Array[14].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_15.string = "x" + Owned_Gem_Cutter_Ore_Array[14].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[14].craft_sprite); window.draw(ore_array_text_15)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 16
          Owned_Gem_Cutter_Ore_Array[15].craft_sprite.position = SF.vector2(650, -100)
          ore_array_text_16 = Ore_amount_owned_text.dup
          ore_array_text_16.position = Owned_Gem_Cutter_Ore_Array[15].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_16.string = "x" + Owned_Gem_Cutter_Ore_Array[15].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[15].craft_sprite); window.draw(ore_array_text_16)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 17
          Owned_Gem_Cutter_Ore_Array[16].craft_sprite.position = SF.vector2(700, -100)
          ore_array_text_17 = Ore_amount_owned_text.dup
          ore_array_text_17.position = Owned_Gem_Cutter_Ore_Array[16].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_17.string = "x" + Owned_Gem_Cutter_Ore_Array[16].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[16].craft_sprite); window.draw(ore_array_text_17)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 18
          Owned_Gem_Cutter_Ore_Array[17].craft_sprite.position = SF.vector2(750, -100)
          ore_array_text_18 = Ore_amount_owned_text.dup
          ore_array_text_18.position = Owned_Gem_Cutter_Ore_Array[17].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_18.string = "x" + Owned_Gem_Cutter_Ore_Array[17].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[17].craft_sprite); window.draw(ore_array_text_18)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 19
          Owned_Gem_Cutter_Ore_Array[18].craft_sprite.position = SF.vector2(800, -100)
          ore_array_text_19 = Ore_amount_owned_text.dup
          ore_array_text_19.position = Owned_Gem_Cutter_Ore_Array[18].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_19.string = "x" + Owned_Gem_Cutter_Ore_Array[18].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[18].craft_sprite); window.draw(ore_array_text_19)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 20
          Owned_Gem_Cutter_Ore_Array[19].craft_sprite.position = SF.vector2(850, -100)
          ore_array_text_20 = Ore_amount_owned_text.dup
          ore_array_text_20.position = Owned_Gem_Cutter_Ore_Array[19].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_20.string = "x" + Owned_Gem_Cutter_Ore_Array[19].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[19].craft_sprite); window.draw(ore_array_text_20)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 21
          Owned_Gem_Cutter_Ore_Array[20].craft_sprite.position = SF.vector2(900, -100)
          ore_array_text_21 = Ore_amount_owned_text.dup
          ore_array_text_21.position = Owned_Gem_Cutter_Ore_Array[20].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_21.string = "x" + Owned_Gem_Cutter_Ore_Array[20].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[20].craft_sprite); window.draw(ore_array_text_21)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 22
          Owned_Gem_Cutter_Ore_Array[21].craft_sprite.position = SF.vector2(950, -100)
          ore_array_text_22 = Ore_amount_owned_text.dup
          ore_array_text_22.position = Owned_Gem_Cutter_Ore_Array[21].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_22.string = "x" + Owned_Gem_Cutter_Ore_Array[21].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[21].craft_sprite); window.draw(ore_array_text_22)
         end
      #----------------------------------------row 3-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 23
          Owned_Gem_Cutter_Ore_Array[22].craft_sprite.position = SF.vector2(450, -50)
          ore_array_text_23 = Ore_amount_owned_text.dup
          ore_array_text_23.position = Owned_Gem_Cutter_Ore_Array[22].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_23.string = "x" + Owned_Gem_Cutter_Ore_Array[22].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[22].craft_sprite); window.draw(ore_array_text_23)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 24
          Owned_Gem_Cutter_Ore_Array[23].craft_sprite.position = SF.vector2(500, -50)
          ore_array_text_24 = Ore_amount_owned_text.dup
          ore_array_text_24.position = Owned_Gem_Cutter_Ore_Array[23].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_24.string = "x" + Owned_Gem_Cutter_Ore_Array[23].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[23].craft_sprite); window.draw(ore_array_text_24)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 25
          Owned_Gem_Cutter_Ore_Array[24].craft_sprite.position = SF.vector2(550, -50)
          ore_array_text_25 = Ore_amount_owned_text.dup
          ore_array_text_25.position = Owned_Gem_Cutter_Ore_Array[24].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_25.string = "x" + Owned_Gem_Cutter_Ore_Array[24].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[24].craft_sprite); window.draw(ore_array_text_25)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 26
          Owned_Gem_Cutter_Ore_Array[25].craft_sprite.position = SF.vector2(600, -50)
          ore_array_text_26 = Ore_amount_owned_text.dup
          ore_array_text_26.position = Owned_Gem_Cutter_Ore_Array[25].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_26.string = "x" + Owned_Gem_Cutter_Ore_Array[25].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[25].craft_sprite); window.draw(ore_array_text_26)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 27
          Owned_Gem_Cutter_Ore_Array[26].craft_sprite.position = SF.vector2(650, -50)
          ore_array_text_27 = Ore_amount_owned_text.dup
          ore_array_text_27.position = Owned_Gem_Cutter_Ore_Array[26].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_27.string = "x" + Owned_Gem_Cutter_Ore_Array[26].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[26].craft_sprite); window.draw(ore_array_text_27)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 28
          Owned_Gem_Cutter_Ore_Array[27].craft_sprite.position = SF.vector2(700, -50)
          ore_array_text_28 = Ore_amount_owned_text.dup
          ore_array_text_28.position = Owned_Gem_Cutter_Ore_Array[27].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_28.string = "x" + Owned_Gem_Cutter_Ore_Array[27].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[27].craft_sprite); window.draw(ore_array_text_28)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 29
          Owned_Gem_Cutter_Ore_Array[28].craft_sprite.position = SF.vector2(750, -50)
          ore_array_text_29 = Ore_amount_owned_text.dup
          ore_array_text_29.position = Owned_Gem_Cutter_Ore_Array[28].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_29.string = "x" + Owned_Gem_Cutter_Ore_Array[28].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[28].craft_sprite); window.draw(ore_array_text_29)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 30
          Owned_Gem_Cutter_Ore_Array[29].craft_sprite.position = SF.vector2(800, -50)
          ore_array_text_30 = Ore_amount_owned_text.dup
          ore_array_text_30.position = Owned_Gem_Cutter_Ore_Array[29].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_30.string = "x" + Owned_Gem_Cutter_Ore_Array[29].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[29].craft_sprite); window.draw(ore_array_text_30)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 31
          Owned_Gem_Cutter_Ore_Array[30].craft_sprite.position = SF.vector2(850, -50)
          ore_array_text_31 = Ore_amount_owned_text.dup
          ore_array_text_31.position = Owned_Gem_Cutter_Ore_Array[30].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_31.string = "x" + Owned_Gem_Cutter_Ore_Array[30].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[30].craft_sprite); window.draw(ore_array_text_31)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 32
          Owned_Gem_Cutter_Ore_Array[31].craft_sprite.position = SF.vector2(900, -50)
          ore_array_text_32 = Ore_amount_owned_text.dup
          ore_array_text_32.position = Owned_Gem_Cutter_Ore_Array[31].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_32.string = "x" + Owned_Gem_Cutter_Ore_Array[31].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[31].craft_sprite); window.draw(ore_array_text_32)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 33
          Owned_Gem_Cutter_Ore_Array[32].craft_sprite.position = SF.vector2(950, -50)
          ore_array_text_33 = Ore_amount_owned_text.dup
          ore_array_text_33.position = Owned_Gem_Cutter_Ore_Array[32].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_33.string = "x" + Owned_Gem_Cutter_Ore_Array[32].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[32].craft_sprite); window.draw(ore_array_text_33)
         end
      #----------------------------------------row 4-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 34
          Owned_Gem_Cutter_Ore_Array[33].craft_sprite.position = SF.vector2(450, 0)
          ore_array_text_34 = Ore_amount_owned_text.dup
          ore_array_text_34.position = Owned_Gem_Cutter_Ore_Array[33].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_34.string = "x" + Owned_Gem_Cutter_Ore_Array[33].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[33].craft_sprite); window.draw(ore_array_text_34)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 35
          Owned_Gem_Cutter_Ore_Array[34].craft_sprite.position = SF.vector2(500, 0)
          ore_array_text_35 = Ore_amount_owned_text.dup
          ore_array_text_35.position = Owned_Gem_Cutter_Ore_Array[34].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_35.string = "x" + Owned_Gem_Cutter_Ore_Array[34].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[34].craft_sprite); window.draw(ore_array_text_35)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 36
          Owned_Gem_Cutter_Ore_Array[35].craft_sprite.position = SF.vector2(550, 0)
          ore_array_text_36 = Ore_amount_owned_text.dup
          ore_array_text_36.position = Owned_Gem_Cutter_Ore_Array[35].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_36.string = "x" + Owned_Gem_Cutter_Ore_Array[35].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[35].craft_sprite); window.draw(ore_array_text_36)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 37
          Owned_Gem_Cutter_Ore_Array[36].craft_sprite.position = SF.vector2(600, 0)
          ore_array_text_37 = Ore_amount_owned_text.dup
          ore_array_text_37.position = Owned_Gem_Cutter_Ore_Array[36].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_37.string = "x" + Owned_Gem_Cutter_Ore_Array[36].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[36].craft_sprite); window.draw(ore_array_text_37)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 38
          Owned_Gem_Cutter_Ore_Array[37].craft_sprite.position = SF.vector2(650, 0)
          ore_array_text_38 = Ore_amount_owned_text.dup
          ore_array_text_38.position = Owned_Gem_Cutter_Ore_Array[37].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_38.string = "x" + Owned_Gem_Cutter_Ore_Array[37].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[37].craft_sprite); window.draw(ore_array_text_38)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 39
          Owned_Gem_Cutter_Ore_Array[38].craft_sprite.position = SF.vector2(700, 0)
          ore_array_text_39 = Ore_amount_owned_text.dup
          ore_array_text_39.position = Owned_Gem_Cutter_Ore_Array[38].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_39.string = "x" + Owned_Gem_Cutter_Ore_Array[38].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[38].craft_sprite); window.draw(ore_array_text_39)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 40
          Owned_Gem_Cutter_Ore_Array[39].craft_sprite.position = SF.vector2(750, 0)
          ore_array_text_40 = Ore_amount_owned_text.dup
          ore_array_text_40.position = Owned_Gem_Cutter_Ore_Array[39].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_40.string = "x" + Owned_Gem_Cutter_Ore_Array[39].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[39].craft_sprite); window.draw(ore_array_text_40)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 41
          Owned_Gem_Cutter_Ore_Array[40].craft_sprite.position = SF.vector2(800, 0)
          ore_array_text_41 = Ore_amount_owned_text.dup
          ore_array_text_41.position = Owned_Gem_Cutter_Ore_Array[40].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_41.string = "x" + Owned_Gem_Cutter_Ore_Array[40].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[40].craft_sprite); window.draw(ore_array_text_41)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 42
          Owned_Gem_Cutter_Ore_Array[41].craft_sprite.position = SF.vector2(850, 0)
          ore_array_text_42 = Ore_amount_owned_text.dup
          ore_array_text_42.position = Owned_Gem_Cutter_Ore_Array[41].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_42.string = "x" + Owned_Gem_Cutter_Ore_Array[41].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[41].craft_sprite); window.draw(ore_array_text_42)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 43
          Owned_Gem_Cutter_Ore_Array[42].craft_sprite.position = SF.vector2(900, 0)
          ore_array_text_43 = Ore_amount_owned_text.dup
          ore_array_text_43.position = Owned_Gem_Cutter_Ore_Array[42].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_43.string = "x" + Owned_Gem_Cutter_Ore_Array[42].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[42].craft_sprite); window.draw(ore_array_text_43)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 44
          Owned_Gem_Cutter_Ore_Array[43].craft_sprite.position = SF.vector2(950, 0)
          ore_array_text_44 = Ore_amount_owned_text.dup
          ore_array_text_44.position = Owned_Gem_Cutter_Ore_Array[43].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_44.string = "x" + Owned_Gem_Cutter_Ore_Array[43].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[43].craft_sprite); window.draw(ore_array_text_44)
         end
      when 2
      #----------------------------------------row 1-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 45
          Owned_Gem_Cutter_Ore_Array[44].craft_sprite.position = SF.vector2(450, -150)
          ore_array_text_45 = Ore_amount_owned_text.dup
          ore_array_text_45.position = Owned_Gem_Cutter_Ore_Array[44].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_45.string = "x" + Owned_Gem_Cutter_Ore_Array[44].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[44].craft_sprite); window.draw(ore_array_text_45)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 46
          Owned_Gem_Cutter_Ore_Array[45].craft_sprite.position = SF.vector2(500, -150)
          ore_array_text_46 = Ore_amount_owned_text.dup
          ore_array_text_46.position = Owned_Gem_Cutter_Ore_Array[45].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_46.string = "x" + Owned_Gem_Cutter_Ore_Array[45].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[45].craft_sprite); window.draw(ore_array_text_46)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 47
          Owned_Gem_Cutter_Ore_Array[46].craft_sprite.position = SF.vector2(550, -150)
          ore_array_text_47 = Ore_amount_owned_text.dup
          ore_array_text_47.position = Owned_Gem_Cutter_Ore_Array[46].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_47.string = "x" + Owned_Gem_Cutter_Ore_Array[46].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[46].craft_sprite); window.draw(ore_array_text_47)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 48
          Owned_Gem_Cutter_Ore_Array[47].craft_sprite.position = SF.vector2(600, -150)
          ore_array_text_48 = Ore_amount_owned_text.dup
          ore_array_text_48.position = Owned_Gem_Cutter_Ore_Array[47].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_48.string = "x" + Owned_Gem_Cutter_Ore_Array[47].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[47].craft_sprite); window.draw(ore_array_text_48)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 49
          Owned_Gem_Cutter_Ore_Array[48].craft_sprite.position = SF.vector2(650, -150)
          ore_array_text_49 = Ore_amount_owned_text.dup
          ore_array_text_49.position = Owned_Gem_Cutter_Ore_Array[48].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_49.string = "x" + Owned_Gem_Cutter_Ore_Array[48].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[48].craft_sprite); window.draw(ore_array_text_49)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 50
          Owned_Gem_Cutter_Ore_Array[49].craft_sprite.position = SF.vector2(700, -150)
          ore_array_text_50 = Ore_amount_owned_text.dup
          ore_array_text_50.position = Owned_Gem_Cutter_Ore_Array[49].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_50.string = "x" + Owned_Gem_Cutter_Ore_Array[49].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[49].craft_sprite); window.draw(ore_array_text_50)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 51
          Owned_Gem_Cutter_Ore_Array[50].craft_sprite.position = SF.vector2(750, -150)
          ore_array_text_51 = Ore_amount_owned_text.dup
          ore_array_text_51.position = Owned_Gem_Cutter_Ore_Array[50].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_51.string = "x" + Owned_Gem_Cutter_Ore_Array[50].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[50].craft_sprite); window.draw(ore_array_text_51)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 52
          Owned_Gem_Cutter_Ore_Array[51].craft_sprite.position = SF.vector2(800, -150)
          ore_array_text_52 = Ore_amount_owned_text.dup
          ore_array_text_52.position = Owned_Gem_Cutter_Ore_Array[51].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_52.string = "x" + Owned_Gem_Cutter_Ore_Array[51].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[51].craft_sprite); window.draw(ore_array_text_52)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 53
          Owned_Gem_Cutter_Ore_Array[52].craft_sprite.position = SF.vector2(850, -150)
          ore_array_text_53 = Ore_amount_owned_text.dup
          ore_array_text_53.position = Owned_Gem_Cutter_Ore_Array[52].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_53.string = "x" + Owned_Gem_Cutter_Ore_Array[52].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[52].craft_sprite); window.draw(ore_array_text_53)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 54
          Owned_Gem_Cutter_Ore_Array[53].craft_sprite.position = SF.vector2(900, -150)
          ore_array_text_54 = Ore_amount_owned_text.dup
          ore_array_text_54.position = Owned_Gem_Cutter_Ore_Array[53].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_54.string = "x" + Owned_Gem_Cutter_Ore_Array[53].amount_owned.to_s
           window.draw(Owned_Gem_Cutter_Ore_Array[53].craft_sprite); window.draw(ore_array_text_54)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 55
          Owned_Gem_Cutter_Ore_Array[54].craft_sprite.position = SF.vector2(950, -150)
          ore_array_text_55 = Ore_amount_owned_text.dup
          ore_array_text_55.position = Owned_Gem_Cutter_Ore_Array[54].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_55.string = "x" + Owned_Gem_Cutter_Ore_Array[54].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[54].craft_sprite); window.draw(ore_array_text_55)
         end
      #----------------------------------------row 2-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 56
          Owned_Gem_Cutter_Ore_Array[55].craft_sprite.position = SF.vector2(450, -100)
          ore_array_text_56 = Ore_amount_owned_text.dup
          ore_array_text_56.position = Owned_Gem_Cutter_Ore_Array[55].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_56.string = "x" + Owned_Gem_Cutter_Ore_Array[55].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[55].craft_sprite); window.draw(ore_array_text_56)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 57
          Owned_Gem_Cutter_Ore_Array[56].craft_sprite.position = SF.vector2(500, -100)
          ore_array_text_57 = Ore_amount_owned_text.dup
          ore_array_text_57.position = Owned_Gem_Cutter_Ore_Array[56].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_57.string = "x" + Owned_Gem_Cutter_Ore_Array[56].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[56].craft_sprite); window.draw(ore_array_text_57)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 58
          Owned_Gem_Cutter_Ore_Array[57].craft_sprite.position = SF.vector2(550, -100)
          ore_array_text_58 = Ore_amount_owned_text.dup
          ore_array_text_58.position = Owned_Gem_Cutter_Ore_Array[57].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_58.string = "x" + Owned_Gem_Cutter_Ore_Array[57].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[57].craft_sprite); window.draw(ore_array_text_58)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 59
          Owned_Gem_Cutter_Ore_Array[58].craft_sprite.position = SF.vector2(600, -100)
          ore_array_text_59 = Ore_amount_owned_text.dup
          ore_array_text_59.position = Owned_Gem_Cutter_Ore_Array[58].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_59.string = "x" + Owned_Gem_Cutter_Ore_Array[58].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[58].craft_sprite); window.draw(ore_array_text_59)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 60
          Owned_Gem_Cutter_Ore_Array[59].craft_sprite.position = SF.vector2(650, -100)
          ore_array_text_60 = Ore_amount_owned_text.dup
          ore_array_text_60.position = Owned_Gem_Cutter_Ore_Array[59].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_60.string = "x" + Owned_Gem_Cutter_Ore_Array[59].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[59].craft_sprite); window.draw(ore_array_text_60)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 61
          Owned_Gem_Cutter_Ore_Array[60].craft_sprite.position = SF.vector2(700, -100)
          ore_array_text_61 = Ore_amount_owned_text.dup
          ore_array_text_61.position = Owned_Gem_Cutter_Ore_Array[60].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_61.string = "x" + Owned_Gem_Cutter_Ore_Array[60].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[60].craft_sprite); window.draw(ore_array_text_61)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 62
          Owned_Gem_Cutter_Ore_Array[61].craft_sprite.position = SF.vector2(750, -100)
          ore_array_text_62 = Ore_amount_owned_text.dup
          ore_array_text_62.position = Owned_Gem_Cutter_Ore_Array[61].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_62.string = "x" + Owned_Gem_Cutter_Ore_Array[61].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[61].craft_sprite); window.draw(ore_array_text_62)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 63
          Owned_Gem_Cutter_Ore_Array[62].craft_sprite.position = SF.vector2(800, -100)
          ore_array_text_63 = Ore_amount_owned_text.dup
          ore_array_text_63.position = Owned_Gem_Cutter_Ore_Array[62].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_63.string = "x" + Owned_Gem_Cutter_Ore_Array[62].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[62].craft_sprite); window.draw(ore_array_text_63)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 64
          Owned_Gem_Cutter_Ore_Array[63].craft_sprite.position = SF.vector2(850, -100)
          ore_array_text_64 = Ore_amount_owned_text.dup
          ore_array_text_64.position = Owned_Gem_Cutter_Ore_Array[63].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_64.string = "x" + Owned_Gem_Cutter_Ore_Array[63].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[63].craft_sprite); window.draw(ore_array_text_64)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 65
          Owned_Gem_Cutter_Ore_Array[64].craft_sprite.position = SF.vector2(900, -100)
          ore_array_text_65 = Ore_amount_owned_text.dup
          ore_array_text_65.position = Owned_Gem_Cutter_Ore_Array[64].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_65.string = "x" + Owned_Gem_Cutter_Ore_Array[64].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[64].craft_sprite); window.draw(ore_array_text_65)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 66
          Owned_Gem_Cutter_Ore_Array[65].craft_sprite.position = SF.vector2(950, -100)
          ore_array_text_66 = Ore_amount_owned_text.dup
          ore_array_text_66.position = Owned_Gem_Cutter_Ore_Array[65].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_66.string = "x" + Owned_Gem_Cutter_Ore_Array[65].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[65].craft_sprite); window.draw(ore_array_text_66)
         end
      #----------------------------------------row 3-----------------------------------------------------------
        if Owned_Gem_Cutter_Ore_Array.size >= 67
          Owned_Gem_Cutter_Ore_Array[66].craft_sprite.position = SF.vector2(450, -50)
          ore_array_text_67 = Ore_amount_owned_text.dup
          ore_array_text_67.position = Owned_Gem_Cutter_Ore_Array[66].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_67.string = "x" + Owned_Gem_Cutter_Ore_Array[66].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[66].craft_sprite); window.draw(ore_array_text_67)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 68
          Owned_Gem_Cutter_Ore_Array[67].craft_sprite.position = SF.vector2(500, -50)
          ore_array_text_68 = Ore_amount_owned_text.dup
          ore_array_text_68.position = Owned_Gem_Cutter_Ore_Array[67].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_68.string = "x" + Owned_Gem_Cutter_Ore_Array[67].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[67].craft_sprite); window.draw(ore_array_text_68)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 69
          Owned_Gem_Cutter_Ore_Array[68].craft_sprite.position = SF.vector2(550, -50)
          ore_array_text_69 = Ore_amount_owned_text.dup
          ore_array_text_69.position = Owned_Gem_Cutter_Ore_Array[68].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_69.string = "x" + Owned_Gem_Cutter_Ore_Array[68].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[68].craft_sprite); window.draw(ore_array_text_69)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 70
          Owned_Gem_Cutter_Ore_Array[69].craft_sprite.position = SF.vector2(600, -50)
          ore_array_text_70 = Ore_amount_owned_text.dup
          ore_array_text_70.position = Owned_Gem_Cutter_Ore_Array[69].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_70.string = "x" + Owned_Gem_Cutter_Ore_Array[69].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[69].craft_sprite); window.draw(ore_array_text_70)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 71
          Owned_Gem_Cutter_Ore_Array[70].craft_sprite.position = SF.vector2(650, -50)
          ore_array_text_71 = Ore_amount_owned_text.dup
          ore_array_text_71.position = Owned_Gem_Cutter_Ore_Array[70].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_71.string = "x" + Owned_Gem_Cutter_Ore_Array[70].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[70].craft_sprite); window.draw(ore_array_text_71)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 72
          Owned_Gem_Cutter_Ore_Array[71].craft_sprite.position = SF.vector2(700, -50)
          ore_array_text_72 = Ore_amount_owned_text.dup
          ore_array_text_72.position = Owned_Gem_Cutter_Ore_Array[71].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_72.string = "x" + Owned_Gem_Cutter_Ore_Array[71].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[71].craft_sprite); window.draw(ore_array_text_72)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 73
          Owned_Gem_Cutter_Ore_Array[72].craft_sprite.position = SF.vector2(750, -50)
          ore_array_text_73 = Ore_amount_owned_text.dup
          ore_array_text_73.position = Owned_Gem_Cutter_Ore_Array[72].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_73.string = "x" + Owned_Gem_Cutter_Ore_Array[72].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[72].craft_sprite); window.draw(ore_array_text_73)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 74
          Owned_Gem_Cutter_Ore_Array[73].craft_sprite.position = SF.vector2(800, -50)
          ore_array_text_74 = Ore_amount_owned_text.dup
          ore_array_text_74.position = Owned_Gem_Cutter_Ore_Array[73].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_74.string = "x" + Owned_Gem_Cutter_Ore_Array[73].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[73].craft_sprite); window.draw(ore_array_text_74)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 75
          Owned_Gem_Cutter_Ore_Array[74].craft_sprite.position = SF.vector2(850, -50)
          ore_array_text_75 = Ore_amount_owned_text.dup
          ore_array_text_75.position = Owned_Gem_Cutter_Ore_Array[74].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_75.string = "x" + Owned_Gem_Cutter_Ore_Array[74].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[74].craft_sprite); window.draw(ore_array_text_75)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 76
          Owned_Gem_Cutter_Ore_Array[75].craft_sprite.position = SF.vector2(900, -50)
          ore_array_text_76 = Ore_amount_owned_text.dup
          ore_array_text_76.position = Owned_Gem_Cutter_Ore_Array[75].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_76.string = "x" + Owned_Gem_Cutter_Ore_Array[75].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[75].craft_sprite); window.draw(ore_array_text_76)
         end
        if Owned_Gem_Cutter_Ore_Array.size >= 77
          Owned_Gem_Cutter_Ore_Array[76].craft_sprite.position = SF.vector2(950, -50)
          ore_array_text_77 = Ore_amount_owned_text.dup
          ore_array_text_77.position = Owned_Gem_Cutter_Ore_Array[76].craft_sprite.position + SF.vector2(25, 25)
          ore_array_text_77.string = "x" + Owned_Gem_Cutter_Ore_Array[76].amount_owned.to_s
          window.draw(Owned_Gem_Cutter_Ore_Array[76].craft_sprite); window.draw(ore_array_text_77)
         end
      #----------------------------------------row 4-----------------------------------------------------------
       if Owned_Gem_Cutter_Ore_Array.size >= 78
         Owned_Gem_Cutter_Ore_Array[77].craft_sprite.position = SF.vector2(450, 0)
         ore_array_text_78 = Ore_amount_owned_text.dup
         ore_array_text_78.position = Owned_Gem_Cutter_Ore_Array[77].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_78.string = "x" + Owned_Gem_Cutter_Ore_Array[77].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[77].craft_sprite); window.draw(ore_array_text_78)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 79
         Owned_Gem_Cutter_Ore_Array[78].craft_sprite.position = SF.vector2(500, 0)
         ore_array_text_79 = Ore_amount_owned_text.dup
         ore_array_text_79.position = Owned_Gem_Cutter_Ore_Array[78].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_79.string = "x" + Owned_Gem_Cutter_Ore_Array[78].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[78].craft_sprite); window.draw(ore_array_text_79)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 80
         Owned_Gem_Cutter_Ore_Array[79].craft_sprite.position = SF.vector2(550, 0)
         ore_array_text_80 = Ore_amount_owned_text.dup
         ore_array_text_80.position = Owned_Gem_Cutter_Ore_Array[79].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_80.string = "x" + Owned_Gem_Cutter_Ore_Array[79].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[79].craft_sprite); window.draw(ore_array_text_80)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 81
         Owned_Gem_Cutter_Ore_Array[80].craft_sprite.position = SF.vector2(600, 0)
         ore_array_text_81 = Ore_amount_owned_text.dup
         ore_array_text_81.position = Owned_Gem_Cutter_Ore_Array[80].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_81.string = "x" + Owned_Gem_Cutter_Ore_Array[80].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[80].craft_sprite); window.draw(ore_array_text_81)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 82
         Owned_Gem_Cutter_Ore_Array[81].craft_sprite.position = SF.vector2(650, 0)
         ore_array_text_82 = Ore_amount_owned_text.dup
         ore_array_text_82.position = Owned_Gem_Cutter_Ore_Array[81].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_82.string = "x" + Owned_Gem_Cutter_Ore_Array[81].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[81].craft_sprite); window.draw(ore_array_text_82)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 83
         Owned_Gem_Cutter_Ore_Array[82].craft_sprite.position = SF.vector2(700, 0)
         ore_array_text_83 = Ore_amount_owned_text.dup
         ore_array_text_83.position = Owned_Gem_Cutter_Ore_Array[82].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_83.string = "x" + Owned_Gem_Cutter_Ore_Array[82].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[82].craft_sprite); window.draw(ore_array_text_83)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 84
         Owned_Gem_Cutter_Ore_Array[83].craft_sprite.position = SF.vector2(750, 0)
         ore_array_text_84 = Ore_amount_owned_text.dup
         ore_array_text_84.position = Owned_Gem_Cutter_Ore_Array[83].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_84.string = "x" + Owned_Gem_Cutter_Ore_Array[83].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[83].craft_sprite); window.draw(ore_array_text_84)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 85
         Owned_Gem_Cutter_Ore_Array[84].craft_sprite.position = SF.vector2(800, 0)
         ore_array_text_85 = Ore_amount_owned_text.dup
         ore_array_text_85.position = Owned_Gem_Cutter_Ore_Array[84].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_85.string = "x" + Owned_Gem_Cutter_Ore_Array[84].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[84].craft_sprite); window.draw(ore_array_text_85)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 86
         Owned_Gem_Cutter_Ore_Array[85].craft_sprite.position = SF.vector2(850, 0)
         ore_array_text_86 = Ore_amount_owned_text.dup
         ore_array_text_86.position = Owned_Gem_Cutter_Ore_Array[85].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_86.string = "x" + Owned_Gem_Cutter_Ore_Array[85].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[85].craft_sprite); window.draw(ore_array_text_86)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 87
         Owned_Gem_Cutter_Ore_Array[86].craft_sprite.position = SF.vector2(900, 0)
         ore_array_text_87 = Ore_amount_owned_text.dup
         ore_array_text_87.position = Owned_Gem_Cutter_Ore_Array[86].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_87.string = "x" + Owned_Gem_Cutter_Ore_Array[86].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[86].craft_sprite); window.draw(ore_array_text_87)
        end
       if Owned_Gem_Cutter_Ore_Array.size >= 88
         Owned_Gem_Cutter_Ore_Array[87].craft_sprite.position = SF.vector2(950, 0)
         ore_array_text_88 = Ore_amount_owned_text.dup
         ore_array_text_88.position = Owned_Gem_Cutter_Ore_Array[87].craft_sprite.position + SF.vector2(25, 25)
         ore_array_text_88.string = "x" + Owned_Gem_Cutter_Ore_Array[87].amount_owned.to_s
         window.draw(Owned_Gem_Cutter_Ore_Array[87].craft_sprite); window.draw(ore_array_text_88)
        end
      end
    end
   #----------------------------------------------------Upgrade Table Gem Display--------------------------------------------------------------------------
    def Gem.display_upgrade_gems(window, page_02)
     #-------Initialize---------
      gem1 = Smelter_Nil_Sprite
      gem2 = Smelter_Nil_Sprite
      gem3 = Smelter_Nil_Sprite
      gem4 = Smelter_Nil_Sprite
      gem5 = Smelter_Nil_Sprite
      gem6 = Smelter_Nil_Sprite
      gem7 = Smelter_Nil_Sprite
      gem8 = Smelter_Nil_Sprite
      gem9 = Smelter_Nil_Sprite
      gem10 = Smelter_Nil_Sprite
      gem11 = Smelter_Nil_Sprite
      gem12 = Smelter_Nil_Sprite
      gem13 = Smelter_Nil_Sprite
      gem14 = Smelter_Nil_Sprite
      gem15 = Smelter_Nil_Sprite
      gem16 = Smelter_Nil_Sprite
     #__________________________
      if Owned_Gem_Array.size >= 1
        case page_02
          when 1
            gem1 = Owned_Gem_Array[0].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 17
            gem1 = Owned_Gem_Array[16].sprite.dup
           end
          when 3
           if Owned_Gem_Array.size >= 33
             gem1 = Owned_Gem_Array[32].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 49
             gem1 = Owned_Gem_Array[48].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 65
             gem1 = Owned_Gem_Array[64].sprite.dup
            end
          end
           gem1.position = SF.vector2(902, -200);
           window.draw(gem1)
        end
      if Owned_Gem_Array.size >= 2
        case page_02
          when 1
           gem2 = Owned_Gem_Array[1].sprite.dup
          when 2
            if Owned_Gem_Array.size >= 18
             gem2 = Owned_Gem_Array[17].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 34
             gem2 = Owned_Gem_Array[33].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 50
             gem2 = Owned_Gem_Array[49].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 66
             gem2 = Owned_Gem_Array[65].sprite.dup
            end
          end
           gem2.position = SF.vector2(952, -200);
           window.draw(gem2)
        end
      if Owned_Gem_Array.size >= 3
        case page_02
          when 1
           gem3 = Owned_Gem_Array[2].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 19
             gem3 = Owned_Gem_Array[18].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 35
             gem3 = Owned_Gem_Array[34].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 51
             gem3 = Owned_Gem_Array[50].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 67
             gem3 = Owned_Gem_Array[66].sprite.dup
            end
          end
           gem3.position = SF.vector2(1002, -200);
           window.draw(gem3)
        end
      if Owned_Gem_Array.size >= 4
        case page_02
          when 1
           gem4 = Owned_Gem_Array[3].sprite.dup
          when 2
            if Owned_Gem_Array.size >= 20
             gem4 = Owned_Gem_Array[19].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 36
             gem4 = Owned_Gem_Array[35].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 52
             gem4 = Owned_Gem_Array[51].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 68
             gem4 = Owned_Gem_Array[67].sprite.dup
            end
          end
           gem4.position = SF.vector2(1052, -200);
           window.draw(gem4)
        end
      if Owned_Gem_Array.size >= 5
        case page_02
          when 1
           gem5 = Owned_Gem_Array[4].sprite.dup
          when 2
            if Owned_Gem_Array.size >= 21
             gem5 = Owned_Gem_Array[20].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 37
             gem5 = Owned_Gem_Array[36].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 53
             gem5 = Owned_Gem_Array[52].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 69
             gem5 = Owned_Gem_Array[68].sprite.dup
            end
          end
           gem5.position = SF.vector2(902, -150);
           window.draw(gem5)
        end
      if Owned_Gem_Array.size >= 6
        case page_02
          when 1
           gem6 = Owned_Gem_Array[5].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 22
            gem6 = Owned_Gem_Array[21].sprite.dup
           end
          when 3
           if Owned_Gem_Array.size >= 38
             gem6 = Owned_Gem_Array[37].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 54
             gem6 = Owned_Gem_Array[53].sprite.dup
            end
          when 5
            if Owned_Gem_Array.size >= 70
              gem6 = Owned_Gem_Array[69].sprite.dup
             end
          end
           gem6.position = SF.vector2(952, -150);
           window.draw(gem6)
        end
      if Owned_Gem_Array.size >= 7
        case page_02
          when 1
           gem7 = Owned_Gem_Array[6].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 23
            gem7 = Owned_Gem_Array[22].sprite.dup
           end
          when 3
           if Owned_Gem_Array.size >= 39
             gem7 = Owned_Gem_Array[38].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 55
             gem7 = Owned_Gem_Array[54].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 71
             gem7 = Owned_Gem_Array[70].sprite.dup
            end
          end
           gem7.position = SF.vector2(1002, -150);
           window.draw(gem7)
        end
      if Owned_Gem_Array.size >= 8
        case page_02
          when 1
           gem8 = Owned_Gem_Array[7].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 24
            gem8 = Owned_Gem_Array[23].sprite.dup
           end
          when 3
           if Owned_Gem_Array.size >= 40
             gem8 = Owned_Gem_Array[39].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 56
             gem8 = Owned_Gem_Array[55].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 72
             gem8 = Owned_Gem_Array[71].sprite.dup
            end
          end
           gem8.position = SF.vector2(1052, -150);
           window.draw(gem8)
        end
      if Owned_Gem_Array.size >= 9
        case page_02
          when 1
           gem9 = Owned_Gem_Array[8].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 25
            gem9 = Owned_Gem_Array[24].sprite.dup
           end
          when 3
           if Owned_Gem_Array.size >= 41
             gem9 = Owned_Gem_Array[40].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 57
             gem9 = Owned_Gem_Array[56].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 73
             gem9 = Owned_Gem_Array[72].sprite.dup
            end
          end
           gem9.position = SF.vector2(902, -100);
           window.draw(gem9)
        end
      if Owned_Gem_Array.size >= 10
        case page_02
          when 1
           gem10 = Owned_Gem_Array[9].sprite.dup
          when 2
            if Owned_Gem_Array.size >= 26
             gem10 = Owned_Gem_Array[25].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 42
             gem10 = Owned_Gem_Array[41].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 58
             gem10 = Owned_Gem_Array[57].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 74
             gem10 = Owned_Gem_Array[73].sprite.dup
            end
          end
           gem10.position = SF.vector2(952, -100);
           window.draw(gem10)
        end
      if Owned_Gem_Array.size >= 11
        case page_02
          when 1
           gem11 = Owned_Gem_Array[10].sprite.dup
          when 2
            if Owned_Gem_Array.size >= 27
             gem11 = Owned_Gem_Array[26].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 43
             gem11 = Owned_Gem_Array[42].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 59
             gem11 = Owned_Gem_Array[58].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 75
             gem11 = Owned_Gem_Array[74].sprite.dup
            end
          end
           gem11.position = SF.vector2(1002, -100);
           window.draw(gem11)
        end
      if Owned_Gem_Array.size >= 12
        case page_02
          when 1
           gem12 = Owned_Gem_Array[11].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 28
             gem12 = Owned_Gem_Array[27].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 44
             gem12 = Owned_Gem_Array[43].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 60
             gem12 = Owned_Gem_Array[59].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 76
             gem12 = Owned_Gem_Array[75].sprite.dup
            end
          end
           gem12.position = SF.vector2(1052, -100);
           window.draw(gem12)
        end
      if Owned_Gem_Array.size >= 13
        case page_02
          when 1
           gem13 = Owned_Gem_Array[12].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 29
             gem13 = Owned_Gem_Array[28].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 45
             gem13 = Owned_Gem_Array[44].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 61
             gem13 = Owned_Gem_Array[60].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 77
             gem13 = Owned_Gem_Array[76].sprite.dup
            end
          end
           gem13.position = SF.vector2(902, -50);
           window.draw(gem13)
        end
      if Owned_Gem_Array.size >= 14
        case page_02
          when 1
           gem14 = Owned_Gem_Array[13].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 30
             gem14 = Owned_Gem_Array[29].sprite.dup
            end
          when 3
           if Owned_Gem_Array.size >= 46
             gem14 = Owned_Gem_Array[45].sprite.dup
            end
          when 4
           if Owned_Gem_Array.size >= 62
             gem14 = Owned_Gem_Array[61].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 78
             gem14 = Owned_Gem_Array[77].sprite.dup
            end
          end
           gem14.position = SF.vector2(952, -50);
           window.draw(gem14)
        end
      if Owned_Gem_Array.size >= 15
        case page_02
          when 1
           gem15 = Owned_Gem_Array[14].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 31
             gem15 = Owned_Gem_Array[30].sprite.dup
            end
          when 3
            if Owned_Gem_Array.size >= 47
              gem15 = Owned_Gem_Array[46].sprite.dup
             end
          when 4
           if Owned_Gem_Array.size >= 63
             gem15 = Owned_Gem_Array[62].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 79
             gem15 = Owned_Gem_Array[78].sprite.dup
            end
          end
           gem15.position = SF.vector2(1002, -50);
           window.draw(gem15)
        end
      if Owned_Gem_Array.size >= 16
        case page_02
          when 1
           gem16 = Owned_Gem_Array[15].sprite.dup
          when 2
           if Owned_Gem_Array.size >= 32
             gem16 = Owned_Gem_Array[31].sprite.dup
            end
          when 3
            if Owned_Gem_Array.size >= 48
              gem16 = Owned_Gem_Array[47].sprite.dup
             end
          when 4
           if Owned_Gem_Array.size >= 64
             gem16 = Owned_Gem_Array[63].sprite.dup
            end
          when 5
           if Owned_Gem_Array.size >= 80
             gem16 = Owned_Gem_Array[79].sprite.dup
            end
          end
           gem16.position = SF.vector2(1052, -50);
           window.draw(gem16)
        end
     end
  #________________________________________________________________________________________________________________________________________________________
  #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  #/                                                               Entities                                                                               /
  #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #..................................................................Nil..................................................................................
    @@nil_gem = Gem.new("", 0, Smelter_Nil_Sprite, "", 0, "", 0, "", "", Smelter_Nil_Sprite)
    GEM_ARRAY.push(@@nil_gem)
   #..............................................................Bloodstone...............................................................................
    @@bloodstone_gem = Gem.new("Bloodstone", 1, Bloodstone_Inventory_Tablecut, "table", 0, "red", 60, "earth", "hp+", Bloodstone_Inventory_Tablecut)
    GEM_ARRAY.push(@@bloodstone_gem)
   #..............................................................Moss Agate...............................................................................
    @@moss_agate_gem = Gem.new("Moss Agate", 2, Moss_Agate_Inventory_Tablecut, "table", 0, "white", 60, "earth", "passive mp regen", Moss_Agate_Inventory_Tablecut)
    GEM_ARRAY.push(@@moss_agate_gem)
   #.................................................................Amber.................................................................................
    @@amber_gem = Gem.new("Amber", 3, Amber_Inventory_Tablecut, "table", 0, "yellow", 60, "fire", "passive hp regen", Amber_Inventory_Tablecut)
    GEM_ARRAY.push(@@amber_gem)
   #..............................................................Wavellite................................................................................
    @@wavellite_gem = Gem.new("Wavellite", 4, Wavellite_Inventory_Tablecut, "table", 0, "green", 60, "earth", "mp+", Wavellite_Inventory_Tablecut)
    GEM_ARRAY.push(@@wavellite_gem)
   #................................................................Topaz..................................................................................
    @@topaz_gem = Gem.new("Topaz", 5, Topaz_Inventory_Tablecut, "table", 0, "yellow", 60, "fire", "INT+", Topaz_Inventory_Tablecut)
    GEM_ARRAY.push(@@topaz_gem)
   #...............................................................Amethyst................................................................................
    @@amethyst_gem = Gem.new("Amethyst", 6, Amethyst_Inventory_Tablecut, "table", 0, "purple", 60, "air", "INT+", Amethyst_Inventory_Tablecut)
    GEM_ARRAY.push(@@amethyst_gem)
   #.............................................................Smoky Quartz..............................................................................
    @@smoky_quartz_gem = Gem.new("Smoky Quartz", 7, Smokey_Quartz_Inventory_Tablecut, "table", 0, "clear", 60, "earth", "STR+", Smokey_Quartz_Inventory_Tablecut)   
    GEM_ARRAY.push(@@smoky_quartz_gem)
   #...............................................................Sapphire................................................................................
    @@sapphire_gem = Gem.new("Sapphire", 8, Sapphire_Inventory_Tablecut, "table", 0, "blue", 60, "water", "EXP++", Sapphire_Inventory_Tablecut)   
    GEM_ARRAY.push(@@sapphire_gem)
   #..............................................................Black Opal...............................................................................
    @@black_opal_gem = Gem.new("Black Opal", 9, Black_Opal_Inventory_Tablecut, "table", 0, "black", 60, "water", "LUK+", Black_Opal_Inventory_Tablecut)   
    GEM_ARRAY.push(@@black_opal_gem)
   #................................................................Ajoite.................................................................................
    @@ajoite_gem = Gem.new("Ajoite", 10, Ajoite_Inventory_Tablecut, "table", 0, "clear", 60, "water", "DEX+", Ajoite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@ajoite_gem)
   #...............................................................Rhodolite...............................................................................
    @@rhodolite_gem = Gem.new("Rhodolite", 10, Rhodolite_Inventory_Tablecut, "table", 0, "pink", 60, "water", "STR+", Rhodolite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@rhodolite_gem)
   #.............................................................Chalcanthite..............................................................................
    @@chalcanthite_gem = Gem.new("Chalcanthite", 12, Chalcanthite_Inventory_Tablecut, "table", 0, "blue", 60, "water", "poison", Chalcanthite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@chalcanthite_gem)
   #...............................................................Flourite................................................................................
    @@flourite_gem = Gem.new("Flourite", 13, Flourite_Inventory_Tablecut, "table", 0, "clear", 60, "water", "INT+", Flourite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@flourite_gem)
   #...............................................................Amorite.................................................................................
    @@amorite_gem = Gem.new("Amorite", 14, Amorite_Inventory_Tablecut, "table", 0, "white", 60, "water", "INT+", Amorite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@amorite_gem)
   #.............................................................Lapis Lazuli..............................................................................
    @@lapis_lazuli_gem = Gem.new("Lapis Lazuli", 15, Lapis_Lazuli_Inventory_Tablecut, "table", 0, "blue", 60, "water", "STR+", Lapis_Lazuli_Inventory_Tablecut)   
    GEM_ARRAY.push(@@lapis_lazuli_gem)
   #...............................................................Moonstone...............................................................................
    @@moonstone_gem = Gem.new("Moonstone", 16, Moonstone_Inventory_Tablecut, "table", 0, "white", 60, "water", "DEX+", Moonstone_Inventory_Tablecut)   
    GEM_ARRAY.push(@@moonstone_gem)
   #..............................................................Blue Calcite.............................................................................
    @@blue_calcite_gem = Gem.new("Blue Calcite", 17, Blue_Calcite_Inventory_Tablecut, "table", 0, "blue", 60, "water", "DEX+", Blue_Calcite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@blue_calcite_gem)
   #...............................................................Hiddenite...............................................................................
    @@hiddenite_gem = Gem.new("Hiddenite", 18, Hiddenite_Inventory_Tablecut, "table", 0, "green", 60, "water", "passive_hp_regen", Hiddenite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@hiddenite_gem)
   #...............................................................Offretite...............................................................................
    @@offretite_gem = Gem.new("Offretite", 19, Offretite_Inventory_Tablecut, "table", 0, "clear", 60, "air", "INT+", Offretite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@offretite_gem)
   #............................................................Holly Blue Agate...........................................................................
    @@holly_blue_agate_gem = Gem.new("Holly Blue Agate", 20, Holly_Blue_Agate_Inventory_Tablecut, "table", 0, "blue", 60, "air", "STR+", Holly_Blue_Agate_Inventory_Tablecut)   
    GEM_ARRAY.push(@@holly_blue_agate_gem)
   #................................................................Ametrine...............................................................................
    @@ametrine_gem = Gem.new("Ametrine", 21, Ametrine_Inventory_Tablecut, "table", 0, "purple", 60, "air", "STR+", Ametrine_Inventory_Tablecut)   
    GEM_ARRAY.push(@@ametrine_gem)
   #..............................................................Hemimorphite.............................................................................
    @@hemimorphite_gem = Gem.new("Hemimorphite", 22, Hemimorphite_Inventory_Tablecut, "table", 0, "blue", 60, "air", "INT+", Hemimorphite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@hemimorphite_gem)
   #..............................................................Tiffany Stone............................................................................
    @@tiffany_stone_gem = Gem.new("Tiffany Stone", 23, Tiffany_Stone_Inventory_Tablecut, "table", 0, "purple", 60, "air", "LUK+", Tiffany_Stone_Inventory_Tablecut)   
    GEM_ARRAY.push(@@tiffany_stone_gem)
   #................................................................Azurite................................................................................
    @@azurite_gem = Gem.new("Azurite", 24, Azurite_Inventory_Tablecut, "table", 0, "blue", 60, "air", "DEX+", Azurite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@azurite_gem)
   #................................................................Howlite................................................................................
    @@howlite_gem = Gem.new("Howlite", 25, Howlite_Inventory_Tablecut, "table", 0, "white", 60, "air", "DEX+", Howlite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@howlite_gem)
   #................................................................Angelite...............................................................................
    @@angelite_gem = Gem.new("Angelite", 26, Angelite_Inventory_Tablecut, "table", 0, "blue", 60, "air", "LUK+", Angelite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@angelite_gem)
   #.............................................................Blue Lace Agate...........................................................................
    @@blue_lace_agate_gem = Gem.new("Blue Lace Agate", 27, Blue_Lace_Agate_Inventory_Tablecut, "table", 0, "blue", 60, "air", "INT+", Blue_Lace_Agate_Inventory_Tablecut)   
    GEM_ARRAY.push(@@blue_lace_agate_gem)
   #..................................................................Iolite...............................................................................
    @@iolite_gem = Gem.new("Iolite", 28, Iolite_Inventory_Tablecut, "table", 0, "blue", 60, "air", "INT+", Iolite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@iolite_gem)
   #.................................................................Sodalite..............................................................................
    @@sodalite_gem = Gem.new("Sodalite", 29, Sodalite_Inventory_Tablecut, "table", 0, "blue", 60, "air", "passive_mp_regen", Sodalite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@sodalite_gem)
   #.................................................................Kyanite...............................................................................
    @@kyanite_gem = Gem.new("Kyanite", 30, Kyanite_Inventory_Tablecut, "table", 0, "blue", 60, "air", "LUK+", Kyanite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@kyanite_gem)
   #.................................................................Sunstone..............................................................................
    @@sunstone_gem = Gem.new("Sunstone", 31, Sunstone_Inventory_Tablecut, "table", 0, "orange", 60, "fire", "LUK+", Sunstone_Inventory_Tablecut)   
    GEM_ARRAY.push(@@sunstone_gem)
   #................................................................Bony Amber.............................................................................
    @@bony_amber_gem = Gem.new("Bony Amber", 32, Bony_Amber_Inventory_Tablecut, "table", 0, "orange", 60, "fire", "passive_hp_regen", Bony_Amber_Inventory_Tablecut)   
    GEM_ARRAY.push(@@bony_amber_gem)
   #................................................................Blue Amber.............................................................................
    @@blue_amber_gem = Gem.new("Blue Amber", 33, Blue_Amber_Inventory_Tablecut, "table", 0, "blue", 60, "fire", "passive_mp_regen", Blue_Amber_Inventory_Tablecut)   
    GEM_ARRAY.push(@@blue_amber_gem)
   #................................................................Blue Spinel.............................................................................
    @@blue_spinel_gem = Gem.new("Blue Spinel", 34, Blue_Spinel_Inventory_Tablecut, "table", 0, "blue", 60, "fire", "DEX+", Blue_Spinel_Inventory_Tablecut)   
    GEM_ARRAY.push(@@blue_spinel_gem)
   #................................................................Red Spinel..............................................................................
    @@red_spinel_gem = Gem.new("Red Spinel", 35, Red_Spinel_Inventory_Tablecut, "table", 0, "red", 60, "fire", "STR+", Red_Spinel_Inventory_Tablecut)   
    GEM_ARRAY.push(@@red_spinel_gem)
   #.................................................................Fire Opal..............................................................................
    @@fire_opal_gem = Gem.new("Fire Opal", 36, Fire_Opal_Inventory_Tablecut, "table", 0, "orange", 60, "fire", "HP+", Fire_Opal_Inventory_Tablecut)   
    GEM_ARRAY.push(@@fire_opal_gem)
   #..................................................................Garnet................................................................................
    @@garnet_gem = Gem.new("Garnet", 37, Garnet_Inventory_Tablecut, "table", 0, "red", 60, "fire", "HP+", Garnet_Inventory_Tablecut)   
    GEM_ARRAY.push(@@garnet_gem)
   #...................................................................Ruby.................................................................................
    @@ruby_gem = Gem.new("Ruby", 38, Ruby_Inventory_Tablecut, "table", 0, "red", 60, "fire", "STR+", Ruby_Inventory_Tablecut)   
    GEM_ARRAY.push(@@ruby_gem)
   #...............................................................Cherry Quartz............................................................................
    @@cherry_quartz_gem = Gem.new("Cherry Quartz", 39, Cherry_Quartz_Inventory_Tablecut, "table", 0, "red", 60, "fire", "HP+", Cherry_Quartz_Inventory_Tablecut)   
    GEM_ARRAY.push(@@cherry_quartz_gem)
   #...............................................................Lemon Quartz.............................................................................
    @@lemon_quartz_gem = Gem.new("Lemon Quartz", 40, Lemon_Quartz_Inventory_Tablecut, "table", 0, "yellow", 60, "fire", "drop_rate+", Lemon_Quartz_Inventory_Tablecut)   
    GEM_ARRAY.push(@@lemon_quartz_gem)
   #.................................................................Turquoise..............................................................................
    @@turquoise_gem = Gem.new("Turquoise", 41, Turquoise_Inventory_Tablecut, "table", 0, "green", 60, "fire", "LUK+", Turquoise_Inventory_Tablecut)   
    GEM_ARRAY.push(@@turquoise_gem)
   #...............................................................Tiger's Eye..............................................................................
    @@tigers_eye_gem = Gem.new("Tiger's Eye", 42, Tigers_eye_Inventory_Tablecut, "table", 0, "orange", 60, "fire", "DEX+", Tigers_eye_Inventory_Tablecut)   
    GEM_ARRAY.push(@@tigers_eye_gem)
   #..............................................................Orange Calcite............................................................................
    @@orange_calcite_gem = Gem.new("Orange Calcite", 43, Orange_Calcite_Inventory_Tablecut, "table", 0, "orange", 60, "fire", "HP+", Orange_Calcite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@orange_calcite_gem)
   #...............................................................Grape Agate..............................................................................
    @@grape_agate_gem = Gem.new("Grape Agate", 44, Grape_Agate_Inventory_Tablecut, "table", 0, "purple", 60, "earth", "INT+", Grape_Agate_Inventory_Tablecut)   
    GEM_ARRAY.push(@@grape_agate_gem)
   #..................................................................Jade..................................................................................
    @@jade_gem = Gem.new("Jade", 45, Jade_Inventory_Tablecut, "table", 0, "green", 60, "earth", "LUK+", Jade_Inventory_Tablecut)   
    GEM_ARRAY.push(@@jade_gem)
   #.................................................................Diamond................................................................................
    @@diamond_gem = Gem.new("Diamond", 46, Diamond_Inventory_Tablecut, "table", 0, "white", 60, "earth", "DROP+++", Diamond_Inventory_Tablecut)   
    GEM_ARRAY.push(@@diamond_gem)
   #.................................................................Emerald................................................................................
    @@emerald_gem = Gem.new("Emerald", 47, Emerald_Inventory_Tablecut, "table", 0, "green", 60, "earth", "EXP++", Emerald_Inventory_Tablecut)   
    GEM_ARRAY.push(@@emerald_gem)
   #.................................................................Painite................................................................................
    @@painite_gem = Gem.new("Painite", 48, Painite_Inventory_Tablecut, "table", 0, "red", 60, "earth", "EXP+++", Painite_Inventory_Tablecut)   
    GEM_ARRAY.push(@@painite_gem)
   #.............................................................Bumblebee Jasper...........................................................................
    @@bumblebee_jasper_gem = Gem.new("Bumblebee Jasper", 49, Bumblebee_Jasper_Inventory_Tablecut, "table", 0, "yellow", 60, "earth", "DEX+", Bumblebee_Jasper_Inventory_Tablecut)   
    GEM_ARRAY.push(@@bumblebee_jasper_gem)
   #...............................................................Blood Jasper.............................................................................
    @@blood_jasper_gem = Gem.new("Blood Jasper", 50, Blood_Jasper_Inventory_Tablecut, "table", 0, "green", 60, "earth", "STR+", Blood_Jasper_Inventory_Tablecut)   
    GEM_ARRAY.push(@@blood_jasper_gem)
   #...............................................................Mook Jasper..............................................................................
    @@mook_jasper_gem = Gem.new("Mook Jasper", 51, Mook_Jasper_Inventory_Tablecut, "table", 0, "brown", 60, "earth", "LUK+", Mook_Jasper_Inventory_Tablecut)   
    GEM_ARRAY.push(@@mook_jasper_gem)
   #................................................................Red Jasper..............................................................................
    @@red_jasper_gem = Gem.new("Red Jasper", 52, Red_Jasper_Inventory_Tablecut, "table", 0, "red", 60, "earth", "INT+", Red_Jasper_Inventory_Tablecut)   
    GEM_ARRAY.push(@@red_jasper_gem)
  #________________________________________________________________________________________________________________________________________________________
 end
end   


module Harvestables
  extend self
  class Ore
    Test_Ore_Array = [@@bloodstone_01, @@bloodstone_02, @@bloodstone_03, @@moss_agate_01, @@amber01, @@wavellite01,  @@topaz01, @@amethyst01,
    @@smoky_quartz01, @@sapphire01, @@black_opal01, @@ajoite01, @@rhodolite01, @@chalcanthite01, @@flourite01, @@amorite01, @@lapis_lazuli01,
    @@moonstone01, @@blue_calcite01, @@hiddenite01, @@ofretite01, @@holly_blue_agate01, @@ametrine01, @@hemimorphite01, @@tiffany_stone01,
    @@azurite01, @@howlite01, @@angelite01, @@blue_lace_agate01, @@iolite01, @@sodalite01, @@kyanite01, @@sunstone01, @@bony_amber01, @@blue_amber01,
    @@blue_spinel01, @@red_spinel01, @@fire_opal01, @@garnet01, @@ruby01, @@cherry_quartz01, @@lemon_quartz01, @@turquoise01, @@tigers_eye01,
    @@orange_calcite01, @@grape_agate01, @@jade01, @@diamond01, @@emerald01, @@painite01, @@bumblebee_jasper01, @@blood_jasper01, @@mook_jasper01,
    @@red_jasper01, @@carbon01, @@copper01, @@tin01, @@zinc01, @@iron01]

    Test_Ore_Sprite_Array = [@@bloodstone_01.sprite, @@bloodstone_02.sprite, @@bloodstone_03.sprite, @@moss_agate_01.sprite, @@amber01.sprite, 
    @@wavellite01.sprite,  @@topaz01.sprite, @@amethyst01.sprite, @@smoky_quartz01.sprite, @@sapphire01.sprite, @@black_opal01.sprite,
    @@ajoite01.sprite, @@rhodolite01.sprite, @@chalcanthite01.sprite, @@flourite01.sprite, @@amorite01.sprite, @@lapis_lazuli01.sprite,
    @@moonstone01.sprite, @@blue_calcite01.sprite, @@hiddenite01.sprite, @@ofretite01.sprite, @@holly_blue_agate01.sprite, @@ametrine01.sprite,
    @@hemimorphite01.sprite, @@tiffany_stone01.sprite, @@azurite01.sprite, @@howlite01.sprite, @@angelite01.sprite, @@blue_lace_agate01.sprite,
    @@iolite01.sprite, @@sodalite01.sprite, @@kyanite01.sprite, @@sunstone01.sprite, @@bony_amber01.sprite, @@blue_amber01.sprite, @@blue_spinel01.sprite,
    @@red_spinel01.sprite, @@fire_opal01.sprite, @@garnet01.sprite, @@ruby01.sprite, @@cherry_quartz01.sprite, @@lemon_quartz01.sprite,
    @@turquoise01.sprite, @@tigers_eye01.sprite, @@orange_calcite01.sprite, @@grape_agate01.sprite, @@jade01.sprite, @@diamond01.sprite, @@emerald01.sprite,
    @@painite01.sprite, @@bumblebee_jasper01.sprite, @@blood_jasper01.sprite, @@mook_jasper01.sprite, @@red_jasper01.sprite, @@carbon01.sprite, 
    @@copper01.sprite, @@tin01.sprite, @@zinc01.sprite, @@iron01.sprite]
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   #+                                                              Variables                                                                               +
   #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@ore_animation_frame = 0; @@ore_reset = 0; @@ore_break_iterator = 0; @@is_smelting : Bool; @@is_smelting = false; @@attack_strength : Float64
   @@attack_strength = 10; @@ore_hit_animation_clock = SF::Clock.new; @@is_ore_attacked : Bool; @@is_ore_attacked = false; @@ore : Ore; @@ore = @@bloodstone_01
   #________________________________________________________________________________________________________________________________________________________
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, id : Int32, color : String, hardness : Int32, hp : Float64, drop_item : String, sprite : SF::Sprite, is_broke : Bool, max_hp : Int32)
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
     def Ore.set_attack_strength(attack_strength)
      @@attack_strength = attack_strength
     end 
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
          Crafted_Items::Weapon.play_hit_sound
         ore.hp_subtract(@@attack_strength)
         @@ore = ore
         @@is_ore_attacked = true
         @@ore_hit_animation_clock.restart
         #Ore.animation_harvest(this, ore)
         Ore_Clock_01.restart
        end; end; end


        end

    #_______________________________________________________________________________________________________________________________________________________
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    Ore_Clock_01 = SF::Clock.new; Ore_Clock_Break = SF::Clock.new

    def Ore.stop_attack
      @@is_ore_attacked = false
    end
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
        @@is_ore_attacked = false
    #    if broken.hp >= 0 && broken.is_broke == false
        if @@ore_reset == 0
          puts "broke"
          Etc::Inventory_Ore.add_ore(amount, ore)
          Etc::Inventory_Ore.update_ore_inventory
          Ore_Clock_Break.restart
          @@ore_reset = 1
        end;# end
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
      if @@is_ore_attacked == true
       if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.05) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.1) && @@ore.hp > @@ore.max_hp/2
         a = 100; b = 0; x = 100; y = 100
         @@ore.sprite_change_square(a, b, x, y)
       else if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.01) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.1) && @@ore.hp < @@ore.max_hp/2
        a = 100; b = 100; x = 100; y = 100
        @@ore.sprite_change_square(a, b, x, y)
        end; end
       if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.1) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.2) && @@ore.hp > @@ore.max_hp/2
         a = 200; b = 0; x = 100; y = 100
         @@ore.sprite_change_square(a, b, x, y)
       else if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.1) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.2) && @@ore.hp < @@ore.max_hp/2
        a = 200; b = 100; x = 100; y = 100
        @@ore.sprite_change_square(a, b, x, y)
        end; end
       if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.2) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.3) && @@ore.hp > @@ore.max_hp/2
         a = 300; b = 0; x = 100; y = 100
         @@ore.sprite_change_square(a, b, x, y)
       else if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.2) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.3) && @@ore.hp < @@ore.max_hp/2
        a = 300; b = 100; x = 100; y = 100
        @@ore.sprite_change_square(a, b, x, y)
        end; end
       if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.3) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.4) && @@ore.hp > @@ore.max_hp/2
         a = 400; b = 0; x = 100; y = 100
         @@ore.sprite_change_square(a, b, x, y)
       else if @@ore_hit_animation_clock.elapsed_time >= SF.seconds(0.3) && @@ore_hit_animation_clock.elapsed_time <= SF.seconds(0.4) && @@ore.hp < @@ore.max_hp/2
        a = 400; b = 100; x = 100; y = 100
        @@ore.sprite_change_square(a, b, x, y)
        end; end
      end
      if @@is_ore_attacked == false
        if @@ore.hp > @@ore.max_hp/2
          a = 0; b = 0; x = 100; y = 100
          @@ore.sprite_change_square(a, b, x, y)
        else if @@ore.hp < @@ore.max_hp/2 && @@ore.hp > 0
          a = 0; b = 100; x = 100; y = 100
          @@ore.sprite_change_square(a, b, x, y)
        end; end
      end
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
      Testing_Text.string = @@black_opal01.hp.to_s + Ore_Clock_Break.elapsed_time.to_s
      @@bloodstone_02.sprite.position = SF.vector2(4500, 702); @@bloodstone_01.sprite.position = SF.vector2(300, 702)
      window.draw(Testing_Text)
      window.draw(@@bloodstone_01.sprite); window.draw(@@bloodstone_02.sprite); window.draw(@@moss_agate_01.sprite); window.draw(@@amber01.sprite); 
      window.draw(@@wavellite01.sprite); window.draw(@@topaz01.sprite); window.draw(@@amethyst01.sprite); window.draw(@@smoky_quartz01.sprite); 
      window.draw(@@sapphire01.sprite); window.draw(@@black_opal01.sprite); window.draw(@@ajoite01.sprite); window.draw(@@rhodolite01.sprite); 
      window.draw(@@chalcanthite01.sprite); window.draw(@@flourite01.sprite); window.draw(@@amorite01.sprite); window.draw(@@lapis_lazuli01.sprite); 
      window.draw(@@moonstone01.sprite); window.draw(@@blue_calcite01.sprite); window.draw(@@hiddenite01.sprite); window.draw(@@ofretite01.sprite); 
      window.draw(@@holly_blue_agate01.sprite); window.draw(@@ametrine01.sprite); window.draw(@@hemimorphite01.sprite); window.draw(@@tiffany_stone01.sprite);
      window.draw(@@azurite01.sprite); window.draw(@@howlite01.sprite); window.draw(@@angelite01.sprite); window.draw(@@blue_lace_agate01.sprite)
      window.draw(@@iolite01.sprite); window.draw(@@sodalite01.sprite); window.draw(@@kyanite01.sprite); window.draw(@@sunstone01.sprite) 
      window.draw(@@bony_amber01.sprite); window.draw(@@blue_amber01.sprite); window.draw(@@blue_spinel01.sprite); window.draw(@@red_spinel01.sprite)
      window.draw(@@fire_opal01.sprite); window.draw(@@garnet01.sprite); window.draw(@@ruby01.sprite); window.draw(@@cherry_quartz01.sprite)
      window.draw(@@lemon_quartz01.sprite); window.draw(@@turquoise01.sprite); window.draw(@@tigers_eye01.sprite); window.draw(@@orange_calcite01.sprite)
      window.draw(@@grape_agate01.sprite); window.draw(@@jade01.sprite); window.draw(@@diamond01.sprite); window.draw(@@emerald01.sprite)
      window.draw(@@painite01.sprite); window.draw(@@bumblebee_jasper01.sprite); window.draw(@@blood_jasper01.sprite); window.draw(@@mook_jasper01.sprite)
      window.draw(@@red_jasper01.sprite); window.draw(@@carbon01.sprite); window.draw(@@copper01.sprite); window.draw(@@tin01.sprite)
      window.draw(@@zinc01.sprite); window.draw(@@iron01.sprite)
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
    #..............................................................Smoky Quartz...........................................................................
     @@smoky_quartz01 = Ore.new("Smoky Quartz", 27, "clear", 7, 500, "smoky_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smoky_quartz02 = Ore.new("Smoky Quartz", 28, "clear", 7, 500, "smoky_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smoky_quartz03 = Ore.new("Smoky Quartz", 29, "clear", 7, 500, "smoky_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smoky_quartz04 = Ore.new("Smoky Quartz", 30, "clear", 7, 500, "smoky_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smoky_quartz05 = Ore.new("Smoky Quartz", 31, "clear", 7, 500, "smoky_quartz", Smokey_Quartz_Ore.dup, false, 500)
     @@smoky_quartz06 = Ore.new("Smoky Quartz", 32, "clear", 7, 500, "smoky_quartz", Smokey_Quartz_Ore.dup, false, 500)
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
    #..............................................................Holly Blue Agate.........................................................................
     @@holly_blue_agate01 = Ore.new("Holly Blue Agate", 105, "blue", 7, 350, "holly_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holly_blue_agate02 = Ore.new("Holly Blue Agate", 106, "blue", 7, 350, "holly_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holly_blue_agate03 = Ore.new("Holly Blue Agate", 107, "blue", 7, 350, "holly_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holly_blue_agate04 = Ore.new("Holly Blue Agate", 108, "blue", 7, 350, "holly_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holly_blue_agate05 = Ore.new("Holly Blue Agate", 109, "blue", 7, 350, "holly_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
     @@holly_blue_agate06 = Ore.new("Holly Blue Agate", 110, "blue", 7, 350, "holly_blue_agate", Holley_Blue_Agate_Ore.dup, false, 350)
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
    #..................................................................Tin...................................................................................
     @@tin01 = Ore.new("Tin", 3024, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin02 = Ore.new("Tin", 3025, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin03 = Ore.new("Tin", 3026, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin04 = Ore.new("Tin", 3027, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin05 = Ore.new("Tin", 3028, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin06 = Ore.new("Tin", 3029, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin07 = Ore.new("Tin", 3030, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin08 = Ore.new("Tin", 3031, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin09 = Ore.new("Tin", 3032, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin10 = Ore.new("Tin", 3033, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin11 = Ore.new("Tin", 3034, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
     @@tin12 = Ore.new("Tin", 3035, "white", 0, 200, "tin", Tin_Ore.dup, false, 200)
    #........................................................................................................................................................
    #.................................................................Zinc...................................................................................
     @@zinc01 = Ore.new("Zinc", 3036, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc02 = Ore.new("Zinc", 3037, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc03 = Ore.new("Zinc", 3038, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc04 = Ore.new("Zinc", 3039, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc05 = Ore.new("Zinc", 3040, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc06 = Ore.new("Zinc", 3041, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc07 = Ore.new("Zinc", 3042, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc08 = Ore.new("Zinc", 3043, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc09 = Ore.new("Zinc", 3044, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc10 = Ore.new("Zinc", 3045, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc11 = Ore.new("Zinc", 3046, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
     @@zinc12 = Ore.new("Zinc", 3047, "white", 0, 100, "zinc", Zinc_Ore.dup, false, 100)
    #........................................................................................................................................................
    #.................................................................Iron...................................................................................
     @@iron01 = Ore.new("Iron", 3048, "grey", 0, 100, "iron", Iron_Ore.dup, false, 100)
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

module Crafted_Items
include Etc
 Weapon_Inventory_Array = [] of Weapon; Weapon_Template_Array = [] of Weapon
 class Weapon
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #+                                                              Variables                                                                               +
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   @@current_equipped_weapon : Weapon; @@current_equipped_weapon = @@nil_stick; @@current_upgrade_table_weapon : Weapon 
   @@current_upgrade_table_weapon = @@nil_stick
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #!                                                              Initialize                                                                              !
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   def initialize(@@weapon_name : String, @@weapon_id : Int32, @@weapon_type : String, @@weapon_atk : Float64, @@weapon_element : Array(String), 
     @weapon_effect : Array(String), @@weapon_sprite : SF::Sprite, @@weapon_inventory_sprite : SF::RectangleShape, @@weapon_swing_sound : SF::Sound, 
     @@weapon_hit_sound : SF::Sound, @@weapon_motion : String, @@weapon_upgrade_count : Int32, @@ingots_required : Int32)
     @weapon_name = weapon_name
     @weapon_id = weapon_id
     @weapon_type = weapon_type
     @weapon_atk = weapon_atk
     @weapon_element = weapon_element
     @weapon_effect = weapon_effect
     @weapon_sprite = weapon_sprite
     @weapon_inventory_sprite = weapon_inventory_sprite
     @weapon_swing_sound = weapon_swing_sound
     @weapon_hit_sound = weapon_hit_sound
     @weapon_motion = weapon_motion
     @weapon_upgrade_count = weapon_upgrade_count
     @ingots_required = ingots_required
    end
   def weapon_name
     @weapon_name
    end
   def weapon_id
     @weapon_id
    end
   def weapon_type
     @weapon_type
    end
   def weapon_atk
     @weapon_atk
    end
   def weapon_element
     @weapon_element
    end
   def weapon_effect
     @weapon_effect
    end
   def weapon_sprite
     @weapon_sprite
    end
   def weapon_inventory_sprite
     @weapon_inventory_sprite
    end
   def weapon_swing_sound
     @weapon_swing_sound
    end
   def weapon_hit_sound
      @weapon_hit_sound
    end
   def weapon_motion
     @weapon_motion
    end
   def weapon_upgrade_count
    @weapon_upgrade_count
    end
   def ingots_required
    @ingots_required
   end
  #________________________________________________________________________________________________________________________________________________________
  #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  #?                                                               Methods                                                                                ?
  #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #.............................................................Draw Weapon...............................................................................
    def Weapon.draw_current_weapon(player) #@note draw current weapon
      #Equipment.check_gem_element_current_weapon
      player.draw(@@current_equipped_weapon.weapon_sprite)
    end
   #.............................................................Equip Weapon...............................................................................
    def Weapon.equip_weapon(this)
      size = Weapon_Inventory_Array.size 
       if this > size
         All_Audio::SFX.light_bonk
        else 
       if @@current_equipped_weapon != Nil && @@current_equipped_weapon != @@nil_stick
         Weapon_Inventory_Array.push(@@current_equipped_weapon)
         @@current_equipped_weapon = Weapon_Inventory_Array[this]
         Weapon_Inventory_Array.delete(@@current_equipped_weapon)
         puts "equip" + this.to_s
       else
        @@current_equipped_weapon = Weapon_Inventory_Array[this]
        Weapon_Inventory_Array.delete(@@current_equipped_weapon)
        end
        end
      end
   #.............................................................Draw Weapon................................................................................
      def Weapon.display_equipment_inventory(window, page) #@note inventory max is 54 slots for now. may expand at some point
        #----------------------Slot 1--------------------------
         if Weapon_Inventory_Array.size >= 1
          case page
           when 1   
            Weapon_Inventory_Array[0].weapon_inventory_sprite.position = SF.vector2(555, 310);
            window.draw(Weapon_Inventory_Array[0].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 19
              Weapon_Inventory_Array[18].weapon_inventory_sprite.position = SF.vector2(555, 310);
              window.draw(Weapon_Inventory_Array[18].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 37
              Weapon_Inventory_Array[36].weapon_inventory_sprite.position = SF.vector2(555, 310);
              window.draw(Weapon_Inventory_Array[36].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 2--------------------------
         if Weapon_Inventory_Array.size >= 2
          case page
           when 1   
            Weapon_Inventory_Array[1].weapon_inventory_sprite.position = SF.vector2(710, 310);
            window.draw(Weapon_Inventory_Array[1].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 20
              Weapon_Inventory_Array[19].weapon_inventory_sprite.position = SF.vector2(710, 310);
              window.draw(Weapon_Inventory_Array[19].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 38
              Weapon_Inventory_Array[37].weapon_inventory_sprite.position = SF.vector2(710, 310);
              window.draw(Weapon_Inventory_Array[37].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 3--------------------------
         if Weapon_Inventory_Array.size >= 3
           case page
            when 1   
             Weapon_Inventory_Array[2].weapon_inventory_sprite.position = SF.vector2(855, 310);
             window.draw(Weapon_Inventory_Array[2].weapon_inventory_sprite)
            when 2   
             if Weapon_Inventory_Array.size >= 21
               Weapon_Inventory_Array[20].weapon_inventory_sprite.position = SF.vector2(855, 310);
               window.draw(Weapon_Inventory_Array[20].weapon_inventory_sprite)
              end
            when 3   
             if Weapon_Inventory_Array.size >= 39
               Weapon_Inventory_Array[38].weapon_inventory_sprite.position = SF.vector2(855, 310);
               window.draw(Weapon_Inventory_Array[38].weapon_inventory_sprite)
              end
           end
         end
        #----------------------Slot 4--------------------------
         if Weapon_Inventory_Array.size >= 4
           case page
           when 1   
            Weapon_Inventory_Array[3].weapon_inventory_sprite.position = SF.vector2(1005, 310);
            window.draw(Weapon_Inventory_Array[3].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 22
              Weapon_Inventory_Array[21].weapon_inventory_sprite.position = SF.vector2(1005, 310);
              window.draw(Weapon_Inventory_Array[21].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 40
              Weapon_Inventory_Array[39].weapon_inventory_sprite.position = SF.vector2(1005, 310);
              window.draw(Weapon_Inventory_Array[39].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 5--------------------------
         if Weapon_Inventory_Array.size >= 5
           case page
           when 1   
            Weapon_Inventory_Array[4].weapon_inventory_sprite.position = SF.vector2(1155, 310);
            window.draw(Weapon_Inventory_Array[4].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 23
              Weapon_Inventory_Array[22].weapon_inventory_sprite.position = SF.vector2(1155, 310);
              window.draw(Weapon_Inventory_Array[22].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 41
              Weapon_Inventory_Array[40].weapon_inventory_sprite.position = SF.vector2(1155, 310);
              window.draw(Weapon_Inventory_Array[40].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 6--------------------------
         if Weapon_Inventory_Array.size >= 6
           case page
           when 1   
            Weapon_Inventory_Array[5].weapon_inventory_sprite.position = SF.vector2(1305, 310);
            window.draw(Weapon_Inventory_Array[5].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 24
              Weapon_Inventory_Array[23].weapon_inventory_sprite.position = SF.vector2(1305, 310);
              window.draw(Weapon_Inventory_Array[23].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 42
              Weapon_Inventory_Array[41].weapon_inventory_sprite.position = SF.vector2(1305, 310);
              window.draw(Weapon_Inventory_Array[41].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 7--------------------------
         if Weapon_Inventory_Array.size >= 7
           case page
           when 1   
            Weapon_Inventory_Array[6].weapon_inventory_sprite.position = SF.vector2(555, 460);
            window.draw(Weapon_Inventory_Array[6].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 25
              Weapon_Inventory_Array[24].weapon_inventory_sprite.position = SF.vector2(555, 460);
              window.draw(Weapon_Inventory_Array[24].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 43
              Weapon_Inventory_Array[42].weapon_inventory_sprite.position = SF.vector2(555, 460);
              window.draw(Weapon_Inventory_Array[42].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 8--------------------------
         if Weapon_Inventory_Array.size >= 8
           case page
           when 1   
            Weapon_Inventory_Array[7].weapon_inventory_sprite.position = SF.vector2(710, 460);
            window.draw(Weapon_Inventory_Array[7].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 26
              Weapon_Inventory_Array[25].weapon_inventory_sprite.position = SF.vector2(710, 460);
              window.draw(Weapon_Inventory_Array[25].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 44
              Weapon_Inventory_Array[43].weapon_inventory_sprite.position = SF.vector2(710, 460);
              window.draw(Weapon_Inventory_Array[43].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 9--------------------------
         if Weapon_Inventory_Array.size >= 9
           case page
           when 1   
            Weapon_Inventory_Array[8].weapon_inventory_sprite.position = SF.vector2(855, 460);
            window.draw(Weapon_Inventory_Array[8].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 27
              Weapon_Inventory_Array[26].weapon_inventory_sprite.position = SF.vector2(855, 460);
              window.draw(Weapon_Inventory_Array[26].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 45
              Weapon_Inventory_Array[44].weapon_inventory_sprite.position = SF.vector2(855, 460);
              window.draw(Weapon_Inventory_Array[44].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 10-------------------------
         if Weapon_Inventory_Array.size >= 10
           case page
           when 1   
            Weapon_Inventory_Array[9].weapon_inventory_sprite.position = SF.vector2(1005, 460);
            window.draw(Weapon_Inventory_Array[9].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 28
              Weapon_Inventory_Array[27].weapon_inventory_sprite.position = SF.vector2(1005, 460);
              window.draw(Weapon_Inventory_Array[27].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 46
              Weapon_Inventory_Array[45].weapon_inventory_sprite.position = SF.vector2(1005, 460);
              window.draw(Weapon_Inventory_Array[45].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 11-------------------------
         if Weapon_Inventory_Array.size >= 11
           case page
           when 1   
            Weapon_Inventory_Array[10].weapon_inventory_sprite.position = SF.vector2(1155, 460);
            window.draw(Weapon_Inventory_Array[10].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 29
              Weapon_Inventory_Array[28].weapon_inventory_sprite.position = SF.vector2(1155, 460);
              window.draw(Weapon_Inventory_Array[28].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 47
              Weapon_Inventory_Array[46].weapon_inventory_sprite.position = SF.vector2(1155, 460);
              window.draw(Weapon_Inventory_Array[46].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 12-------------------------
         if Weapon_Inventory_Array.size >= 12
           case page
           when 1   
            Weapon_Inventory_Array[11].weapon_inventory_sprite.position = SF.vector2(1305, 460);
            window.draw(Weapon_Inventory_Array[11].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 30
              Weapon_Inventory_Array[29].weapon_inventory_sprite.position = SF.vector2(1305, 460);
              window.draw(Weapon_Inventory_Array[29].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 48
              Weapon_Inventory_Array[47].weapon_inventory_sprite.position = SF.vector2(1305, 460);
              window.draw(Weapon_Inventory_Array[47].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 13-------------------------
         if Weapon_Inventory_Array.size >= 13
           case page
           when 1   
            Weapon_Inventory_Array[12].weapon_inventory_sprite.position = SF.vector2(555, 610);
            window.draw(Weapon_Inventory_Array[12].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 31
              Weapon_Inventory_Array[30].weapon_inventory_sprite.position = SF.vector2(555, 610);
              window.draw(Weapon_Inventory_Array[30].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 49
              Weapon_Inventory_Array[48].weapon_inventory_sprite.position = SF.vector2(555, 610);
              window.draw(Weapon_Inventory_Array[48].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 14-------------------------
         if Weapon_Inventory_Array.size >= 14
           case page
           when 1   
            Weapon_Inventory_Array[13].weapon_inventory_sprite.position = SF.vector2(710, 610);
            window.draw(Weapon_Inventory_Array[13].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 32
              Weapon_Inventory_Array[31].weapon_inventory_sprite.position = SF.vector2(710, 610);
              window.draw(Weapon_Inventory_Array[31].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 50
              Weapon_Inventory_Array[49].weapon_inventory_sprite.position = SF.vector2(710, 610);
              window.draw(Weapon_Inventory_Array[49].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 15-------------------------
         if Weapon_Inventory_Array.size >= 15
           case page
           when 1   
            Weapon_Inventory_Array[14].weapon_inventory_sprite.position = SF.vector2(855, 610);
            window.draw(Weapon_Inventory_Array[14].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 33
              Weapon_Inventory_Array[32].weapon_inventory_sprite.position = SF.vector2(855, 610);
              window.draw(Weapon_Inventory_Array[32].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 51
              Weapon_Inventory_Array[50].weapon_inventory_sprite.position = SF.vector2(855, 610);
              window.draw(Weapon_Inventory_Array[50].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 16-------------------------
         if Weapon_Inventory_Array.size >= 16
           case page
           when 1   
            Weapon_Inventory_Array[15].weapon_inventory_sprite.position = SF.vector2(1005, 610);
            window.draw(Weapon_Inventory_Array[15].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 34
              Weapon_Inventory_Array[33].weapon_inventory_sprite.position = SF.vector2(1005, 610);
              window.draw(Weapon_Inventory_Array[33].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 52
              Weapon_Inventory_Array[51].weapon_inventory_sprite.position = SF.vector2(1005, 610);
              window.draw(Weapon_Inventory_Array[51].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 17-------------------------
         if Weapon_Inventory_Array.size >= 17
           case page
           when 1   
            Weapon_Inventory_Array[16].weapon_inventory_sprite.position = SF.vector2(1155, 610);
            window.draw(Weapon_Inventory_Array[16].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 35
              Weapon_Inventory_Array[34].weapon_inventory_sprite.position = SF.vector2(1155, 610);
              window.draw(Weapon_Inventory_Array[34].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 53
              Weapon_Inventory_Array[52].weapon_inventory_sprite.position = SF.vector2(1155, 610);
              window.draw(Weapon_Inventory_Array[52].weapon_inventory_sprite)
             end
           end
         end
        #----------------------Slot 18-------------------------
         if Weapon_Inventory_Array.size >= 18
           case page
           when 1   
            Weapon_Inventory_Array[17].weapon_inventory_sprite.position = SF.vector2(1305, 610);
            window.draw(Weapon_Inventory_Array[17].weapon_inventory_sprite)
           when 2   
            if Weapon_Inventory_Array.size >= 36
              Weapon_Inventory_Array[35].weapon_inventory_sprite.position = SF.vector2(1305, 610);
              window.draw(Weapon_Inventory_Array[35].weapon_inventory_sprite)
             end
           when 3   
            if Weapon_Inventory_Array.size >= 54
              Weapon_Inventory_Array[53].weapon_inventory_sprite.position = SF.vector2(1305, 610);
              window.draw(Weapon_Inventory_Array[53].weapon_inventory_sprite)
             end
           end
         end
       end
   #........................................................Draw Weapon Upgrade Table...........................................................................
     def Weapon.display_weapon_upgrade_table(window, page, page_02, page_03)
      #---------------------weapon init------------------------------
       weapon = Nil_Stick_Display
       weapon2 = Nil_Stick_Display
       weapon3 = Nil_Stick_Display
       weapon4 = Nil_Stick_Display
       weapon5 = Nil_Stick_Display
       weapon6 = Nil_Stick_Display
       weapon7 = Nil_Stick_Display
       weapon8 = Nil_Stick_Display
       weapon9 = Nil_Stick_Display
       weapon10 = Nil_Stick_Display
       weapon11 = Nil_Stick_Display
       weapon12 = Nil_Stick_Display
       weapon13 = Nil_Stick_Display
       weapon14 = Nil_Stick_Display
       weapon15 = Nil_Stick_Display
       weapon16 = Nil_Stick_Display
      #______________________________________________________________
      current_weapon_upgrade_display = @@current_upgrade_table_weapon.weapon_inventory_sprite.dup
      current_weapon_upgrade_display.position = SF.vector2(700, -175)
      current_weapon_upgrade_display.scale(SF.vector2(1.5, 1.5))
      window.draw(current_weapon_upgrade_display)
      if Weapon_Inventory_Array.size >= 1
       case page
         when 1
          weapon = Weapon_Inventory_Array[0].weapon_inventory_sprite.dup
         when 2
          if Weapon_Inventory_Array.size >= 17
          weapon = Weapon_Inventory_Array[16].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 33
          weapon = Weapon_Inventory_Array[32].weapon_inventory_sprite.dup
          end
        when 4
          if Weapon_Inventory_Array.size >= 49
          weapon = Weapon_Inventory_Array[48].weapon_inventory_sprite.dup
          end
         end
           weapon.scale(SF.vector2(0.5, 0.5))
           weapon.position = SF.vector2(440, -150);
           window.draw(weapon)
       end
      if Weapon_Inventory_Array.size >= 2
       case page
        when 1
          weapon2 = Weapon_Inventory_Array[1].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 18
          weapon2 = Weapon_Inventory_Array[17].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 34
          weapon2 = Weapon_Inventory_Array[33].weapon_inventory_sprite.dup
          end
        when 4
          if Weapon_Inventory_Array.size >= 50
          weapon2 = Weapon_Inventory_Array[49].weapon_inventory_sprite.dup
          end
         end
        weapon2.scale(SF.vector2(0.5, 0.5))
        weapon2.position = SF.vector2(490, -150);
        window.draw(weapon2)
       end
      if Weapon_Inventory_Array.size >= 3
       case page
        when 1
         weapon3 = Weapon_Inventory_Array[2].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 19
          weapon3 = Weapon_Inventory_Array[18].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 35
          weapon3 = Weapon_Inventory_Array[34].weapon_inventory_sprite.dup
          end
        when 4
          if Weapon_Inventory_Array.size >= 51
          weapon3 = Weapon_Inventory_Array[50].weapon_inventory_sprite.dup
          end
        end
        weapon3.scale(SF.vector2(0.5, 0.5))
        weapon3.position = SF.vector2(540, -150);
        window.draw(weapon3)
       end
      if Weapon_Inventory_Array.size >= 4
       case page
         when 1
          weapon4 = Weapon_Inventory_Array[3].weapon_inventory_sprite.dup
         when 2
          if Weapon_Inventory_Array.size >= 20
          weapon4 = Weapon_Inventory_Array[19].weapon_inventory_sprite.dup 
          end
         when 3
           if Weapon_Inventory_Array.size >= 36
           weapon4 = Weapon_Inventory_Array[35].weapon_inventory_sprite.dup
           end
         when 4
           if Weapon_Inventory_Array.size >= 52
           weapon4 = Weapon_Inventory_Array[51].weapon_inventory_sprite.dup
           end
        end
        weapon4.scale(SF.vector2(0.5, 0.5))
        weapon4.position = SF.vector2(590, -150);
        window.draw(weapon4)
       end
      if Weapon_Inventory_Array.size >= 5
       case page
         when 1
           weapon5 = Weapon_Inventory_Array[4].weapon_inventory_sprite.dup
         when 2
           if Weapon_Inventory_Array.size >= 21
           weapon5 = Weapon_Inventory_Array[20].weapon_inventory_sprite.dup
           end
         when 3
           if Weapon_Inventory_Array.size >= 37
           weapon5 = Weapon_Inventory_Array[36].weapon_inventory_sprite.dup
           end
         when 4
           if Weapon_Inventory_Array.size >= 53
           weapon5 = Weapon_Inventory_Array[52].weapon_inventory_sprite.dup
           end
        end
        weapon5.scale(SF.vector2(0.5, 0.5))
        weapon5.position = SF.vector2(440, -100);
        window.draw(weapon5)
       end
      if Weapon_Inventory_Array.size >= 6
       case page
        when 1
          weapon6 = Weapon_Inventory_Array[5].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 22
          weapon6 = Weapon_Inventory_Array[21].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 38
          weapon6 = Weapon_Inventory_Array[37].weapon_inventory_sprite.dup
          end
        when 4
          if Weapon_Inventory_Array.size >= 54
          weapon6 = Weapon_Inventory_Array[53].weapon_inventory_sprite.dup
          end
         end
        weapon6.scale(SF.vector2(0.5, 0.5))
        weapon6.position = SF.vector2(490, -100);
        window.draw(weapon6)
       end
      if Weapon_Inventory_Array.size >= 7
       case page
        when 1       
          weapon7 = Weapon_Inventory_Array[6].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 23
          weapon7 = Weapon_Inventory_Array[22].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 39
          weapon7 = Weapon_Inventory_Array[38].weapon_inventory_sprite.dup
          end
         end
        weapon7.scale(SF.vector2(0.5, 0.5))
        weapon7.position = SF.vector2(540, -100);
        window.draw(weapon7)
       end
      if Weapon_Inventory_Array.size >= 8
       case page
        when 1           
          weapon8 = Weapon_Inventory_Array[7].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 24
          weapon8 = Weapon_Inventory_Array[23].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 40
          weapon8 = Weapon_Inventory_Array[39].weapon_inventory_sprite.dup
          end
         end
        weapon8.scale(SF.vector2(0.5, 0.5))
        weapon8.position = SF.vector2(590, -100);
        window.draw(weapon8)
       end
      if Weapon_Inventory_Array.size >= 9
       case page
        when 1           
          weapon9 = Weapon_Inventory_Array[8].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 25
          weapon9 = Weapon_Inventory_Array[24].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 41
          weapon9 = Weapon_Inventory_Array[40].weapon_inventory_sprite.dup
          end
         end
        weapon9.scale(SF.vector2(0.5, 0.5))
        weapon9.position = SF.vector2(440, -50);
        window.draw(weapon9)
       end
      if Weapon_Inventory_Array.size >= 10
       case page
        when 1          
          weapon10 = Weapon_Inventory_Array[9].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 26
          weapon10 = Weapon_Inventory_Array[25].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 42
          weapon10 = Weapon_Inventory_Array[41].weapon_inventory_sprite.dup
          end
         end
        weapon10.scale(SF.vector2(0.5, 0.5))
        weapon10.position = SF.vector2(490, -50);
        window.draw(weapon10)
       end
      if Weapon_Inventory_Array.size >= 11
       case page
        when 1           
          weapon11 = Weapon_Inventory_Array[10].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 27
          weapon11 = Weapon_Inventory_Array[26].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 43
          weapon11 = Weapon_Inventory_Array[42].weapon_inventory_sprite.dup
          end
         end
        weapon11.scale(SF.vector2(0.5, 0.5))
        weapon11.position = SF.vector2(540, -50);
        window.draw(weapon11)
       end
      if Weapon_Inventory_Array.size >= 12
       case page
        when 1               
          weapon12 = Weapon_Inventory_Array[11].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 28
          weapon12 = Weapon_Inventory_Array[27].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 44
          weapon12 = Weapon_Inventory_Array[43].weapon_inventory_sprite.dup
          end
         end
        weapon12.scale(SF.vector2(0.5, 0.5))
        weapon12.position = SF.vector2(590, -50);
        window.draw(weapon12)
       end
      if Weapon_Inventory_Array.size >= 13
       case page
        when 1           
          weapon13 = Weapon_Inventory_Array[12].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 29
          weapon13 = Weapon_Inventory_Array[28].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 45
          weapon13 = Weapon_Inventory_Array[44].weapon_inventory_sprite.dup
          end
         end
        weapon13.scale(SF.vector2(0.5, 0.5))
        weapon13.position = SF.vector2(440, 0);
        window.draw(weapon13)
       end      
      if Weapon_Inventory_Array.size >= 14
       case page
        when 1           
          weapon14 = Weapon_Inventory_Array[13].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 30
          weapon14 = Weapon_Inventory_Array[29].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 46
          weapon14 = Weapon_Inventory_Array[45].weapon_inventory_sprite.dup
          end
         end
        weapon14.scale(SF.vector2(0.5, 0.5))
        weapon14.position = SF.vector2(490, 0);
        window.draw(weapon14)
       end     
      if Weapon_Inventory_Array.size >= 15
       case page
        when 1            
          weapon15 = Weapon_Inventory_Array[14].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 31
          weapon15 = Weapon_Inventory_Array[30].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 47
          weapon15 = Weapon_Inventory_Array[46].weapon_inventory_sprite.dup
          end
         end
        weapon15.scale(SF.vector2(0.5, 0.5))
        weapon15.position = SF.vector2(540, 0);
        window.draw(weapon15)
       end   
      if Weapon_Inventory_Array.size >= 16
       case page
        when 1     
          weapon16 = Weapon_Inventory_Array[15].weapon_inventory_sprite.dup
        when 2
          if Weapon_Inventory_Array.size >= 32
          weapon16 = Weapon_Inventory_Array[31].weapon_inventory_sprite.dup
          end
        when 3
          if Weapon_Inventory_Array.size >= 48
          weapon16 = Weapon_Inventory_Array[47].weapon_inventory_sprite.dup
          end
         end
        weapon16.scale(SF.vector2(0.5, 0.5))
        weapon16.position = SF.vector2(590, 0);
        window.draw(weapon16)
       end  
      end
   #.....................................................Initialize Weapon Upgrade Table........................................................................
    def Weapon.initialize_upgrade_table
      @@current_upgrade_table_weapon = @@nil_stick
     end
   #..........................................................Choose Upgrade Weapon.............................................................................
    def Weapon.choose_upgrade_weapon(weapon)
      if Weapon_Inventory_Array.size > weapon
        All_Audio::SFX.light_bonk
        @@current_upgrade_table_weapon = Weapon_Inventory_Array[weapon]
      else
        All_Audio::SFX.char_create_up
      end
    end
   #.............................................................Attack Strength................................................................................
       def Weapon.attack_strength(base_attack) #@note attack strength 
        attack_strength = base_attack * @@current_equipped_weapon.weapon_atk
        Harvestables::Ore.set_attack_strength(attack_strength)
       end

       def Crafted_Items::Weapon.check_stats(slot)
        if Weapon_Inventory_Array.size > slot
           Weapon_Info_Text.string = " Name: " + Weapon_Inventory_Array[slot].weapon_name + "\n Attack: " + 
           Weapon_Inventory_Array[slot].weapon_atk.to_s + "\n Elements: " + Weapon_Inventory_Array[slot].weapon_element[0] + ", " +
           Weapon_Inventory_Array[slot].weapon_element[1] + ", " + Weapon_Inventory_Array[slot].weapon_element[2] +
           "\n Effects: " + Weapon_Inventory_Array[slot].weapon_effect[0] + ", " + Weapon_Inventory_Array[slot].weapon_effect[1] +
           ", " + Weapon_Inventory_Array[slot].weapon_effect[2] + "\n Upgrade Count: " + Weapon_Inventory_Array[slot].weapon_upgrade_count.to_s
         else
          Weapon_Info_Text.string = ""
        end
       end
       def Weapon.play_swing_sound
          @@current_equipped_weapon.weapon_swing_sound.play
         end
       def Weapon.play_hit_sound
         @@current_equipped_weapon.weapon_hit_sound.play
        end
       def Weapon.stop_swing_sound
         @@current_equipped_weapon.swing_sound.stop
         @@current_equipped_weapon.hit_sound.play
        end
       def Weapon.forge_weapon(weapon)
        if Weapon_Inventory_Array.size < 54
        s = Weapon_Template_Array.size; i = 0
        while s > i
          if weapon == Weapon_Template_Array[i].weapon_id 
            Weapon_Inventory_Array.push(Weapon_Template_Array[i].dup)
          end
          i += 1
        end
      else
        All_Audio::SFX.char_create_up
      end
       end
  #________________________________________________________________________________________________________________________________________________________
  #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  #/                                                               Entities                                                                               /
  #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   @@nil_stick = Weapon.new("", -1, "", 0, [""], [""], Nil_Ingot_Ore, Weapon_Rectangle_01, SYSSOUND_6, SYSSOUND_6, "", 0, 0)
   @@stick = Weapon.new("Stick", 0, "stick", 1.25, ["none", "none", "none"], ["none", "none", "none"], Stick01, Weapon_Rectangle_01, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 0)
   @@zinc_stick = Weapon.new("Zinc Stick", 4, "stick", 1.5, ["empty", "none", "none"], ["empty", "none", "none"], Zinc_Stick, Zinc_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Inventory_Array.push(@@zinc_stick); Weapon_Template_Array.push(@@zinc_stick)
   @@tin_stick = Weapon.new("Tin Stick", 2, "stick", 1.75, ["empty", "none", "none"], ["empty", "none", "none"], Tin_Stick, Tin_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Template_Array.push(@@tin_stick)
   @@copper_stick = Weapon.new("Copper Stick", 1, "stick", 2.5, ["empty", "none", "none"], ["empty", "none", "none"], Copper_Stick, Copper_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Template_Array.push(@@copper_stick)
   @@brass_stick = Weapon.new("Brass Stick", 5, "stick", 2, ["empty", "empty", "none"], ["empty", "empty", "none"], Brass_Stick, Brass_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Template_Array.push(@@brass_stick)
   @@bronze_stick = Weapon.new("Bronze Stick", 3, "stick", 2.25, ["empty", "empty", "none"], ["empty", "empty", "none"], Bronze_Stick, Bronze_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Template_Array.push(@@bronze_stick)
   @@iron_stick = Weapon.new("Iron Stick", 6, "stick", 2.5, ["empty", "empty", "none"], ["empty", "empty", "none"], Iron_Stick, Iron_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Template_Array.push(@@iron_stick)
   @@steel_stick = Weapon.new("Steel Stick", 7, "stick", 3, ["empty", "empty", "empty"], ["empty", "empty", "empty"], Steel_Stick, Steel_Stick_Display, WEAPSOUND_01, WEAPSOUND_02, "Swing", 0, 2)
   Weapon_Template_Array.push(@@steel_stick)
  #________________________________________________________________________________________________________________________________________________________
  end
  Upgrade_Gem_Array = GEM_ARRAY.clone
 class Upgrade_Table
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #+                                                              Variables                                                                               +
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
   @@selected_gem_01 : Gem; @@selected_gem_01 = GEM_ARRAY[0]; @@selected_gem_01.craft_sprite.position = SF.vector2(650, -52)
   @@selected_gem_02 : Gem; @@selected_gem_02 = GEM_ARRAY[0]; @@selected_gem_02.craft_sprite.position = SF.vector2(725, -52)
   @@selected_gem_03 : Gem; @@selected_gem_03 = GEM_ARRAY[0]; @@selected_gem_03.craft_sprite.position = SF.vector2(805, -52)
   @@current_gem_slot : Int32; @@current_gem_slot = 1
  #________________________________________________________________________________________________________________________________________________________
  #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  #?                                                               Methods                                                                                ?
  #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    def Upgrade_Table.initialize_upgrade_table
      Crafted_Items::Weapon.initialize_upgrade_table
      if @@selected_gem_01 != GEM_ARRAY[0]
      Owned_Gem_Array.push(@@selected_gem_01)
      end
      if @@selected_gem_02 != GEM_ARRAY[0]
      Owned_Gem_Array.push(@@selected_gem_02)
      end
      if @@selected_gem_03 != GEM_ARRAY[0]
      Owned_Gem_Array.push(@@selected_gem_03)
      end
      @@selected_gem_01 = GEM_ARRAY[0]
      @@selected_gem_02 = GEM_ARRAY[0]
      @@selected_gem_03 = GEM_ARRAY[0]
      @@current_gem_slot = 1
     end
    def Upgrade_Table.select_gem(gem)
     if Owned_Gem_Array.size > gem
       case @@current_gem_slot
         when 1
          @@selected_gem_01 = Owned_Gem_Array[gem]
          @@selected_gem_01.craft_sprite.position = SF.vector2(670, -38)
          @@selected_gem_01.craft_sprite.scale = SF.vector2(0.85, 0.85)
          @@current_gem_slot = 2
          Owned_Gem_Array.delete(Owned_Gem_Array[gem])
         when 2
          @@selected_gem_02 = Owned_Gem_Array[gem]
          @@selected_gem_02.craft_sprite.position = SF.vector2(740, -38)
          @@selected_gem_02.craft_sprite.scale = SF.vector2(0.85, 0.85)
          @@current_gem_slot = 3
          Owned_Gem_Array.delete(Owned_Gem_Array[gem])
         when 3
          @@selected_gem_03 = Owned_Gem_Array[gem]
          @@selected_gem_03.craft_sprite.position = SF.vector2(810, -38)
          @@selected_gem_03.craft_sprite.scale = SF.vector2(0.85, 0.85)
          @@current_gem_slot = 4
          Owned_Gem_Array.delete(Owned_Gem_Array[gem])
         when 4
          All_Audio::SFX.char_create_up
        end
      end
    end
    def Upgrade_Table.display_upgrade_table(window)
      window.draw(Test_Upgrade_Table_Menu)
      up_arrow_01 = Up_Arrow_01.dup; up_arrow_01.position = Test_Upgrade_Table_Menu.position + SF.vector2(-75, 50)
      down_arrow_01 = Down_Arrow_01.dup; down_arrow_01.position = Test_Upgrade_Table_Menu.position + SF.vector2(-75, 175)
      up_arrow_02 = Up_Arrow_01.dup; up_arrow_02.position = Test_Upgrade_Table_Menu.position + SF.vector2(820, 50)
      down_arrow_02 = Down_Arrow_01.dup; down_arrow_02.position = Test_Upgrade_Table_Menu.position + SF.vector2(820, 175)
      window.draw(up_arrow_01); window.draw(down_arrow_01); window.draw(up_arrow_02); window.draw(down_arrow_02)
      window.draw(@@selected_gem_01.craft_sprite); window.draw(@@selected_gem_02.craft_sprite); window.draw(@@selected_gem_03.craft_sprite)
    end
  end
 class Mold
   def initialize(name : String, id : Int32, is_owned : Bool, material_cost : Int32)
     @name = name
     @id = id
     @is_owned = is_owned
     @material_cost = material_cost
    end
   def name
     @name
    end
   def id
     @id
    end
   def is_owned
     @is_owned
    end
   def material
     @material
    end
    @@stick_mold = Mold.new("Stick Mold", 0, true, 3)
  end
 class Forge<Mold
    @@chosen_ingot : Int32; @@chosen_ingot = 0; @@chosen_mold : Mold; @@chosen_mold = @@stick_mold
    @@craft_weapon : Int32; @@craft_weapon = 0
    def Forge.choose_ingot(ingot)
      @@chosen_ingot = ingot
    end 
    def Forge.forge_weapon  
      weapon = @@craft_weapon
      if Ingot_Array[weapon].amount_owned >= Weapon_Template_Array[weapon - 1].ingots_required
      Crafted_Items::Weapon.forge_weapon(weapon)
      ingot = Ingot_Array[weapon]
      amount = Weapon_Template_Array[weapon - 1].ingots_required
      Etc::Inventory_Ingot.subtract_amount_owned(ingot, amount)
      end
    end
    def Forge.diplay_forge(window)
        window.draw(Test_Forge_Menu)
        Etc::Inventory_Ingot.display_forge_ingots(window)
        Forge.current_mold(window)
    end
    def Forge.current_mold(window)
      weapon = Nil_Stick_Display.dup
      if  @@chosen_mold == @@stick_mold
        case @@chosen_ingot
         when 1
          weapon = Copper_Stick_Display.dup
          @@craft_weapon = 1      
         when 2
          weapon = Tin_Stick_Display.dup
          @@craft_weapon = 2
         when 3
          weapon = Bronze_Stick_Display.dup
          @@craft_weapon = 3
         when 4
          weapon = Zinc_Stick_Display.dup
          @@craft_weapon = 4
         when 5
          weapon = Brass_Stick_Display.dup
          @@craft_weapon = 5
        when 6
          weapon = Iron_Stick_Display.dup
          @@craft_weapon = 6
        when 7
          weapon = Steel_Stick_Display.dup
          @@craft_weapon = 7
       end; end
       weapon.position = SF.vector2(250, 150)
       window.draw(weapon)
    end
    def Forge.choose_mold(mold)
      if mold == 1
        @@chosen_mold = @@stick_mold
      end
  end
end
end

# if time >= SF.seconds(0.35) && @@attacking == true
#   Weapon.play_hit_sound
#  # this.current_hp - 10
#   Player_Attack_Clock.restart
