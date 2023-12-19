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

 module Player_Info
 include Crafted_Items
 extend self
 #PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
 #P                                                                 Player                                                                              P
 #PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
  class Player < Weapon
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, current_hp : Float64, max_hp : Float64, current_mp : Float64,
      max_mp : Float64, str : Int32, dex : Int32, int : Int32, luk : Int32, atk : Int32, m_atk : Int32, 
      speed : Float64, jump_height : Float64, exp : Float64, lvl : Int32, lvl_up_points : Int32,

      current_weapon : Weapon, @@weapon_name : String, @@weapon_id : Int32, @@weapon_type : String, @@weapon_atk : Float64, @@weapon_element : Array(String), 
      @weapon_effect : Array(String), @@weapon_sprite : SF::Sprite, @@weapon_inventory_sprite : SF::RectangleShape, @@weapon_swing_sound : SF::Sound, 
      @@weapon_hit_sound : SF::Sound, @@weapon_motion : String, @@weapon_upgrade_count : Int32, @@ingots_required : Int32)

      @name = name
      @current_hp = current_hp
      @max_hp = max_hp
      @current_mp = current_mp
      @max_mp = max_mp
      @str = str
      @dex = dex
      @int = int
      @luk = luk
      @atk = atk
      @m_atk = m_atk
      @speed = speed
      @jump_height = jump_height
      @exp = exp
      @lvl = lvl
      @lvl_up_points = lvl_up_points
      @current_weapon = current_weapon

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
    def name
        @name
     end
    def current_hp
        @current_hp
     end
    def max_hp
        @max_hp
     end
    def current_mp
        @current_mp
     end
    def max_mp
        @max_mp
     end
    def str 
        @str
     end
    def dex
        @dex
     end
    def int
        @int
     end
    def luk
        @luk
     end
    def atk
        @atk
     end
    def m_atk
        @m_atk
     end
    def speed    
        @speed
     end
    def jump_height
        @jump_height
     end
    def exp
        @exp
     end
    def lvl
        @lvl
     end
    def lvl_up_points
        @lvl_up_points
     end
    def current_weapon
        @current_weapon
     end
    def current_hp=(this)
        @current_hp = this
     end
    def exp=(this)
        @exp = this
     end
    def lvl=(this)
       @lvl = this
     end
    def lvl_up_points=(this)
       @lvl_up_points = this
     end
    def current_weapon=(this)
        @current_weapon = this
    end
    #----------------------------------------------------------------Weapon =--------------------------------------------------------------------------------
     def weapon_name=(this)
         @weapon_name = this
      end
     def weapon_id=(this)
         @weapon_id = this
      end
     def weapon_type=(this)
         @weapon_type = this
      end
     def weapon_atk=(this)
         @weapon_atk = this
      end
     def weapon_element=(this)
         @weapon_element = this
      end
     def weapon_effect=(this)
        @weapon_effect = this
      end
     def weapon_sprite=(this)
         @weapon_sprite = this
      end
     def weapon_inventory_sprite=(this)
         @weapon_inventory_sprite = this
      end
     def weapon_swing_sound=(this)
         @weapon_swing_sound = this
      end
     def weapon_hit_sound=(this)
         @weapon_hit_sound = this
      end
     def weapon_motion=(this)
         @weapon_motion = this
      end
     def weapon_upgrade_count=(this)
         @weapon_upgrade_count = this
      end
     def ingots_required=(this)
         @ingots_required = this
      end
    
   #________________________________________________________________________________________________________________________________________________________
   #********************************************************************************************************************************************************
   #*                                                              Variables                                                                               *
   #********************************************************************************************************************************************************
    #@@exp = 0; 
    @@exp_cap : Float64; @@exp_scale : Float64
    @@exp_cap = @@player.lvl * Math.sqrt(100) ; @@exp_scale = @@player.exp / @@exp_cap
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    def Player.get_atk(atk_type)
     case atk_type
      when "physical"
        return @@player.atk 
      when "magic"
        return @@player.m_atk 
      end
    end
    def Player.gain_exp(exp)
     @@player.exp += exp
     if @@player.exp >= @@exp_cap
        @@player.lvl += 1
        @@player.lvl_up_points += 3
        @@player.exp = 0
        @@exp_cap = @@player.lvl * Math.sqrt(100) 
        puts @@exp_cap
     end
    end
    def Player.take_damage(damage)
      @@player.current_hp -= damage
     end
    def Player.heal(heal)
        @@player.current_hp += heal
    end
    def Player.adjust_stat_bars(window)
      HP_Bar_Color.scale = SF.vector2(@@player.current_hp * 0.005, 1); HP_Bar.scale = SF.vector2(@@player.max_hp * 0.005, 1)
      LVL_Bar_Color.scale = SF.vector2(@@player.exp / 100, 1); LVL_Bar.scale = SF.vector2(@@exp_cap / 100, 1)
      MP_Bar_Color.scale = SF.vector2(@@player.current_mp * 0.005, 1); MP_Bar.scale = SF.vector2(@@player.max_mp * 0.005, 1)
     end
    def Player.calculate_stat_strings
      exp = @@player.exp.to_s + "/" + @@exp_cap.to_s; lvl = "Lvl: " + @@player.lvl.to_s;
      Stats_Window_LVL_Text.string = exp; Stats_Window_LVL_Text_02.string = lvl; 
      str = "STR: " + @@player.str.to_s; Stats_Window_Str_Text.string = str
      dex = "DEX: " + @@player.dex.to_s; Stats_Window_Dex_Text.string = dex
      luk = "LUK: " + @@player.luk.to_s; Stats_Window_Luk_Text.string = luk
      int = "INT: " + @@player.int.to_s; Stats_Window_Int_Text.string = int
      hp = "HP: " + @@player.current_hp.to_s + "/" + @@player.max_hp.to_s; Stats_Window_HP_Text.string = hp
      mp = "MP: " + @@player.current_mp.to_s + "/" + @@player.max_mp.to_s; Stats_Window_MP_Text.string = mp
      LVL_Label.string = @@player.lvl.to_s;
      Stats_Window_Name_Text.string = @@player.name
     end
    def Player.equip_weapon(weapon)
        @@player.current_weapon = weapon
        Player.update_equipped_weapon_stats
    end
    def Player.update_equipped_weapon_stats
     @@player.weapon_name = @@player.current_weapon.weapon_name; @@player.weapon_id = @@player.current_weapon.weapon_id; 
     @@player.weapon_type = @@player.current_weapon.weapon_type; @@player.weapon_atk = @@player.current_weapon.weapon_atk; 
     @@player.weapon_element = @@player.current_weapon.weapon_element; @@player.weapon_effect = @@player.current_weapon.weapon_effect; 
     @@player.weapon_sprite = @@player.current_weapon.weapon_sprite; 
     @@player.weapon_inventory_sprite = @@player.current_weapon.weapon_inventory_sprite; 
     @@player.weapon_swing_sound = @@player.current_weapon.weapon_swing_sound; 
     @@player.weapon_hit_sound = @@player.current_weapon.weapon_hit_sound; @@player.weapon_motion = @@player.current_weapon.weapon_motion;
     @@player.weapon_upgrade_count = @@player.current_weapon.weapon_upgrade_count; 
     @@player.ingots_required = @@player.current_weapon.ingots_required
    end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @@player = Player.new("Some Rando", 100, 100, 50, 50, 1, 1, 1, 1, 5, 5, 1, 1, 0, 1, 3, @@stick, @@stick.weapon_name,
    @@stick.weapon_id, @@stick.weapon_type, @@stick.weapon_atk, @@stick.weapon_element, 
    @@stick.weapon_effect, @@stick.weapon_sprite, @@stick.weapon_inventory_sprite, 
    @@stick.weapon_swing_sound, @@stick.weapon_hit_sound, @@stick.weapon_motion,
    @@stick.weapon_upgrade_count, @@stick.ingots_required)
   #________________________________________________________________________________________________________________________________________________________

   end
  class Skill
   end
 end