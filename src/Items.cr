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